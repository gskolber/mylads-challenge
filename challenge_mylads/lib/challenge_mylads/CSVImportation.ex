defmodule ChallengeMylads.CSVImportation do
  alias ChallengeMylads.ImportationWorker


  def import do
    "../../priv/static/imports/players_seasons.csv"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Enum.chunk_every(100)
    |> Enum.each(
      fn chunk -> call_worker(chunk) end)
  end

  defp call_worker(chunk) do
    ImportationWorker.new(%{"chunk" => chunk}) |> Oban.insert()
  end
end
