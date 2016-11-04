defmodule GrafanaElixir do
	use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: GrafanaElixir.Worker.start_link(arg1, arg2, arg3)
      # worker(GrafanaElixir.Worker, [arg1, arg2, arg3]),
    ]

    opts = [strategy: :one_for_one, name: GrafanaElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
