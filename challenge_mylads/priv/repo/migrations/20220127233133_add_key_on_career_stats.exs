defmodule ChallengeMylads.Repo.Migrations.AddKeyOnCareerStats do
  use Ecto.Migration

  def change do
    alter table(:career_stats) do
      add :player_id, references(:player)
    end
  end
end
