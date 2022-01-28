defmodule ChallengeMylads.Repo.Migrations.CreateTotalSeniors do
  use Ecto.Migration

  def change do
    create table(:total_seniors) do
      add :games, :string
      add :goals, :integer
      add :player_id, references(:player)

      timestamps()
    end
  end
end
