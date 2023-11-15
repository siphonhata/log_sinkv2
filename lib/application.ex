defmodule LogGenServer.Application do

  use Application

  def start(_type, _args) do
    children = [
      LogGenServer
    ]

    opts = [strategy: :one_for_one, name: LogGenServer.Supervisor]
    Supervisor.start_link(children, opts)

  end
end
