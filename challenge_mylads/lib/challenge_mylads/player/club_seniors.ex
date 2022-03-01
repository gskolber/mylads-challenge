defmodule ChallengeMylads.Player.ClubSeniors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "club_seniors" do
    field :games, :string
    field :goals, :integer
    belongs_to :player, ChallengeMylads.Player

    timestamps()
  end

  @doc false
  def changeset(club_seniors, attrs) do
    club_seniors
    |> cast(attrs, [:games, :goals])
  end
end
