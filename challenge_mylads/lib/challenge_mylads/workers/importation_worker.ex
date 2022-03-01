defmodule ChallengeMylads.ImportationWorker do
  use Oban.Worker, queue: :events

  alias ChallengeMylads.Player
  alias ChallengeMylads.Repo

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"chunk" => chunk}}) do
    chunk
    |> Enum.each(fn element ->
      if is_nil(check_if_player_exists(element["player_id"])) do
        create_basic_player_structure(element) |> Repo.insert()
      end
    end)

    :ok
  end

  defp create_basic_player_structure(element) do
    Player.changeset(%Player{}, element)
  end

  defp check_if_player_exists(player_id) do
    Repo.get_by(Player, %{player_id: player_id})
  end
end
