defmodule CastAssocReturnsStaleData do
  @moduledoc """
  Documentation for CastAssocReturnsStaleData.
  """
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(CastAssocReturnsStaleData.Repo, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CastAssocReturnsStaleData.Supervisor]
    with {:ok, pid } <- Supervisor.start_link(children, opts),
     do: {:ok, pid }
  end
  
end
