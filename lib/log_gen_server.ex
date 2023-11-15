defmodule LogGenServer do
  use GenServer

  def init(state), do: {:ok, state}

  def handle_cast({:log, log_message}, _state) do
    Process.sleep(1000) 
    {:noreply, IO.puts(log_message)}
  end

  ### Client API/ Helper functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def log(log_message), do: GenServer.cast(__MODULE__, {:log, log_message})

end
