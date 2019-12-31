defmodule Indeals.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Indeals.Repo, []),
      # Start the endpoint when the application starts
      supervisor(IndealsWeb.Endpoint, []),
      # Start your own worker by calling: Indeals.Worker.start_link(arg1, arg2, arg3)
      # worker(Indeals.Worker, [arg1, arg2, arg3]),
      # 5 dakkada bir çalışacak
      %{ id: "frequent", start: {SchedEx, :run_every, [Indeals.Runner, :do_frequent, [], "*/10 * * * *"]} }
     # ,%{ id: "freq2", start: {SchedEx, :run_every, [fn -> IO.puts "dakka başı" end, "*/1 * * * *"]} }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Indeals.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    IndealsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
