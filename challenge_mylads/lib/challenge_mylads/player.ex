defmodule ChallengeMylads.Player do
  defstruct [
    :club_id,
    :player_id,
    :career_stats,
    :club_seniors,
    :club_youth_honours,
    :national_teams_seniors,
    :national_team_youth_honours,
    :total_seniors
  ]

  def bootstrap_player(params) do
    %ChallengeMylads.Player{
      player_id: Map.get(params, "player_id"),
      club_id: Map.get(params, "club_id"),
      club_seniors: normalize_map(Map.get(params, "club_seniors")),
      club_youth_honours: normalize_map(Map.get(params, "club_youth_honours")),
      national_teams_seniors: normalize_map(Map.get(params, "national_teams_seniors")),
      national_team_youth_honours: normalize_map(Map.get(params, "national_team_youth_honours")),
      total_seniors: normalize_map(Map.get(params, "\uFEFFtotal_seniors")),
      career_stats: normalize_map(Map.get(params, "career_stats"))
    }
  end

  def normalize_map(nil) do
    nil
  end

  def normalize_map(%{}) do
    nil
  end

  def normalize_map(map) do
    {:ok, new_map} =
      map
      |> String.replace("=>", ":")
      |> Jason.decode()

    new_map
  end
end
