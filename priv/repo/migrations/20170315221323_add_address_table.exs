defmodule CastAssocReturnsStaleData.Repo.Migrations.AddAddressTable do
  use Ecto.Migration

  def change do

    create table(:addresses) do
      add :name, :string
      add :link_id, references(:links), on_update: :update_all
    end

  end
end
