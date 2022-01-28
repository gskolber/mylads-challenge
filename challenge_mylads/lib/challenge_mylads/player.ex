defmodule ChallengeMylads.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "player" do
    field :club_id, :integer
    field :player_id, :integer

    has_many :career_stats, ChallengeMylads.Player.CareerStats
    has_one :club_senior, ChallengeMylads.Player.ClubSeniors
    has_one :club_youth_honours, ChallengeMylads.Player.ClubYouthHonours
    has_one :national_teams_seniors, ChallengeMylads.Player.NationalTeamSeniors
    has_one :national_team_youth_honours, ChallengeMylads.Player.NationalTeamYouthHonours
    has_one :total_seniors, ChallengeMylads.Player.TotalSeniors
    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:club_id, :player_id])
  end

  def add_stats(player, attrs) do
    player
    |> cast(attrs, [:carrer_stats, :club_senior ,:club_youth_honours, :national_teams_seniors,:national_team_youth_honours])
  end
end
