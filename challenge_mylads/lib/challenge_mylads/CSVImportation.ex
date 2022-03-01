defmodule ChallengeMylads.CSVImportation do

  alias ChallengeMylads.ImportationWorker

  def import do
    "../../priv/static/imports/players_seasons.csv"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Enum.chunk_every(1000)
    |> Enum.each(
      fn chunk ->
        ImportationWorker.new(%{"chunk"=>chunk}) |> Oban.insert
      end
    )
  end

end
