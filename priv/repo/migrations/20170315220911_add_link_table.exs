defmodule CastAssocReturnsStaleData.Repo.Migrations.AddLinkTable do
  use Ecto.Migration

  def change do

    create table(:links) do
      add :name, :string
    end

  end

end
