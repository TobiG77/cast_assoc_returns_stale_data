defmodule CastAssocReturnsStaleData.Repo.Migrations.AddLeftLocationTable do
  use Ecto.Migration

  def change do
    create table(:left_locations) do
      add :address_id, references(:addresses, on_delete: :delete_all, on_update: :update_all)
    end
    alter table(:links) do
      add :left_location_id, references(:left_locations, on_delete: :delete_all, on_update: :update_all)
    end
  end
end
