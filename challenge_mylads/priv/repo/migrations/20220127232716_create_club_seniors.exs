defmodule ChallengeMylads.Repo.Migrations.CreateClubSeniors do
  use Ecto.Migration

  def change do
    create table(:club_seniors) do
      add :games, :string
      add :goals, :integer
      add :player_id, references(:player)

      timestamps()
    end
  end
end
