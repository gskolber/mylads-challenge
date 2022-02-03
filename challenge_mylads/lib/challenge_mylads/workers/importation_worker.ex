defmodule ChallengeMylads.ImportationWorker do
  use Oban.Worker, queue: :events

  alias ChallengeMylads.Services.PlayerService

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"chunk" => chunk}}) do
    chunk
    |> Enum.each(fn element ->
      create_basic_player_structure(element)
    end)

    :ok
  end

  defp create_basic_player_structure(element) do
    ChallengeMylads.Player.bootstrap_player(element) |> IO.inspect() |> PlayerService.add_player()
  end
end
