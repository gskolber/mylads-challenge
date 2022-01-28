defmodule ChallengeMylads.Repo.Migrations.CreateNationalTeamsSeniors do
  use Ecto.Migration

  def change do
    create table(:national_teams_seniors) do
      add :games, :string
      add :goals, :integer
      add :player_id, references(:player)

      timestamps()
    end
  end
end
