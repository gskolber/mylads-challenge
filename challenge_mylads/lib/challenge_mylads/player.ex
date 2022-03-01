defmodule ChallengeMylads.Player do
  use Ecto.Schema
  import Ecto.Changeset

  alias ChallengeMylads.Player.{ClubSeniors, ClubYouthHonours, NationalTeamSeniors,
  NationalTeamYouthHonours, TotalSeniors, CareerStats}

  schema "player" do
    field :club_id, :integer
    field :player_id, :integer

    has_many :career_stats, CareerStats
    has_one :club_senior, ClubSeniors
    has_one :club_youth_honours, ClubYouthHonours
    has_one :national_teams_seniors, NationalTeamSeniors
    has_one :national_team_youth_honours, NationalTeamYouthHonours
    has_one :total_seniors, TotalSeniors
    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    attrs = Map.merge(attrs, normalize_attrs(attrs))
    player
    |> cast(attrs, [:club_id, :player_id])
    |> cast_assoc(:club_senior, with: &ClubSeniors.changeset/2)
    |> cast_assoc(:club_youth_honours, with: &ClubYouthHonours.changeset/2)
    |> cast_assoc(:national_teams_seniors, with: &NationalTeamSeniors.changeset/2)
    |> cast_assoc(:national_team_youth_honours, with: &NationalTeamYouthHonours.changeset/2)
    |> cast_assoc(:total_seniors, with: &TotalSeniors.changeset/2)
    |> cast_assoc(:career_stats, with: &CareerStats.changeset/2)
  end

  def normalize_attrs(attrs) do

    club_senior = normalize_map(attrs["club_seniors"])
    club_youth_honours = normalize_map(attrs["club_youth_honours"])
    national_teams_seniors = normalize_map(attrs["national_teams_seniors"])
    national_team_youth_honours = normalize_map(attrs["national_team_youth_honours"])
    total_seniors = normalize_map(attrs["\uFEFFtotal_seniors"])
    career_stats = normalize_map(attrs["career_stats"])

    %{
      "club_senior" => club_senior,
      "club_youth_honours" => club_youth_honours,
      "national_teams_seniors" => national_teams_seniors,
      "national_team_youth_honours" => national_team_youth_honours,
      "total_seniors" => total_seniors,
      "career_stats" => career_stats
    }

  end

  def normalize_map (map) do
    {:ok, new_map} = map
    |> String.replace("=>", ":")
    |> Jason.decode()

    IO.inspect(new_map)
    new_map
  end
end
