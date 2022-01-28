defmodule ChallengeMylads.Repo.Migrations.CreateClubYouthHonours do
  use Ecto.Migration

  def change do
    create table(:club_youth_honours) do
      add :games, :string
      add :goals, :integer

      timestamps()
    end
  end
end
