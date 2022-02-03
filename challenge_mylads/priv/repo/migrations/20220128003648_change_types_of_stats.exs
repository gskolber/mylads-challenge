defmodule ChallengeMylads.Repo.Migrations.ChangeTypesOfStats do
  use Ecto.Migration

  def change do
    alter table(:career_stats) do
      modify :goals_scored, :string
      modify :games, :string
    end
  end
end
