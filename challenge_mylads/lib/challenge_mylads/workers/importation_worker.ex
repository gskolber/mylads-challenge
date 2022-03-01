defmodule ChallengeMylads.ImportationWorker do
  use Oban.Worker, queue: :events

  alias ChallengeMylads.Player
  alias ChallengeMylads.Repo

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"chunk" => chunk}}) do
    chunk
    |> Enum.each(fn element ->
      create_basic_player_structure(element) |> Repo.insert()
    end)

    :ok
  end

  defp create_basic_player_structure(element) do
    Player.changeset(%Player{}, element)
  end
end
