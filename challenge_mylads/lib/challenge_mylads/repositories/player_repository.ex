defmodule ChallengeMylads.Repository.PlayerRepository do
  @collection "players"

  def add(data) do
    :database |> Mongo.insert_one(@collection, data)
  end
end
