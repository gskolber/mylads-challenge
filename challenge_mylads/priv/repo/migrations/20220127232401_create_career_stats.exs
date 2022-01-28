defmodule ChallengeMylads.Repo.Migrations.CreateCareerStats do
  use Ecto.Migration

  def change do
    create table(:career_stats) do
      add :season, :string
      add :club, :string
      add :club_id, :integer
      add :games, :integer
      add :goals_scored, :integer

      timestamps()
    end
  end
end
