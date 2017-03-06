defmodule FooServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def increment do
    GenServer.cast(__MODULE__, :increment)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def handle_cast(:increment, state) do
    {:noreply, state + 10}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end
end
