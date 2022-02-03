defmodule ChallengeMylads.Services.PlayerService do
  alias ChallengeMylads.Player
  alias ChallengeMylads.Repository.PlayerRepository

  def add_player(params) do
    params
    |> PlayerRepository.add() |> IO.inspect()
  end
end
