defmodule ChallengeMylads.ImportationWorker do
  use Oban.Worker, queue: :events

  alias ChallengeMylads.Player
  alias ChallengeMylads.Player.CareerStats
  alias ChallengeMylads.Player.ClubSeniors
  alias ChallengeMylads.Player.ClubYouthHonours
  alias ChallengeMylads.Player.NationalTeamSeniors
  alias ChallengeMylads.Player.NationalTeamYouthHonours
  alias ChallengeMylads.Player.TotalSeniors
  alias ChallengeMylads.Repo

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"chunk" => chunk}}) do

    chunk
    |> Enum.each(
      fn element ->
        create_basic_player_structure(element)
      end
    )
    :ok
  end

  defp create_basic_player_structure (element) do

    player = Player.changeset(%Player{},element)
    career_stats = sanitize_career_stats(element)
    club_seniors = ClubSeniors.changeset(%ClubSeniors{},normalize_map(element["club_seniors"])) || nil
    club_youth_honours = ClubYouthHonours.changeset(%ClubYouthHonours{},normalize_map(element["club_youth_honours"])) || nil
    national_team_seniors = NationalTeamSeniors.changeset(%NationalTeamSeniors{},normalize_map(element["national_teams_seniors"])) || nil
    national_team_youth_honours = NationalTeamYouthHonours.changeset(%NationalTeamYouthHonours{},normalize_map(element["national_team_youth_honours"])) || nil
    ## total_seniors = TotalSeniors.changeset(%TotalSeniors{},normalize_map(element["total_seniors"])) || nil

    Player.add_stats(player, %{career_stats: career_stats, club_seniors: club_seniors, club_youth_honours: club_youth_honours,
     national_team_seniors: national_team_seniors, national_team_youth_honours: national_team_youth_honours}) |> Repo.insert()
  end

  defp sanitize_career_stats (element) do

    normalize_map(element["career_stats"])
    |> Enum.map(
      fn stat ->
        CareerStats.changeset(%CareerStats{}, stat)
      end
    )
  end

  defp normalize_map (map) do
    {:ok, new_map} = map
    |> String.replace("=>", ":")
    |> Jason.decode()

    new_map
  end

end
