defmodule FooServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, get_state, name: __MODULE__)
  end

  defp get_state do
    case state_alive? do
      true -> DataStore.get_state
      false -> 0
    end
  end

  defp state_alive? do
    Enum.any?(Process.registered, fn(item) ->
      item == DataStore
    end)
  end

  def increment do
    GenServer.cast(__MODULE__, :increment)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def handle_cast(:increment, state) do
    {:noreply, state + 100}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_info(data, state) do
    IO.inspect data
    {:noreply, state}
  end

  def die do
    GenServer.call(__MODULE__, :die)
  end

  def handle_call(:die, _, _) do
    :ok = :not_ok
  end

  def terminate(reason, state) do
    IO.inspect reason
    DataStore.start(state)
  end
end

defmodule DataStore do
  use GenServer

  def start(old_state) do
    GenServer.start(__MODULE__, old_state, name: __MODULE__)
  end

  def get_state do
    GenServer.call(__MODULE__, :get)
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end 
end
