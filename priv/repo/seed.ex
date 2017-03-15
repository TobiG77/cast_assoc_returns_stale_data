defmodule CastAssocReturnsStaleData.Seed do

    alias CastAssocReturnsStaleData.Repo

    def insert(schema, params) do
      schema.changeset(schema.__struct__,params)
      |> Repo.insert!
    end

end

alias CastAssocReturnsStaleData.Link
alias CastAssocReturnsStaleData.Address
alias CastAssocReturnsStaleData.LeftAddress
