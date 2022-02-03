defmodule ChallengeMylads.Repo.Migrations.AddKeyOnNactionalTeamAndClubYouthStats do
  use Ecto.Migration

  def change do
    alter table(:national_team_youth_honours) do
      add :player_id, references(:player)
    end

    alter table(:club_youth_honours) do
      add :player_id, references(:player)
    end
  end
end
