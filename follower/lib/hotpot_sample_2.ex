defmodule HotpotSample2 do
  use Application

  alias Hotpot.LiveStart

  def start(_type, _args) do
    LiveStart.load_modules

    {:ok, self()}
  end
end
