defmodule ChallengeMylads.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:player) do
      add :club_id, :integer
      add :player_id, :integer

      timestamps()
    end
  end
end
