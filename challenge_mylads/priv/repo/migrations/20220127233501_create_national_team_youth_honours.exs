defmodule ChallengeMylads.Repo.Migrations.CreateNationalTeamYouthHonours do
  use Ecto.Migration

  def change do
    create table(:national_team_youth_honours) do
      add :games, :string
      add :goals, :integer

      timestamps()
    end
  end
end
