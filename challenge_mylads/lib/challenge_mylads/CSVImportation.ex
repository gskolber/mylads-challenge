defmodule ChallengeMylads.CSVImportation do

  alias ChallengeMylads.ImportationWorker

  @valid_keys ["career_stats", "club_id", "club_seniors", "club_youth_honours", "national_team_youth_honours", "national_teams_seniors", "player_id", "total_seniors"]

  def import do
    "../../priv/static/imports/players_seasons.csv"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Enum.take(5)
    |> Enum.chunk_every(1000)
    |> Enum.each(
      fn chunk ->
        ImportationWorker.new(%{"chunk"=>chunk}) |> Oban.insert
      end
    )
  end

end
