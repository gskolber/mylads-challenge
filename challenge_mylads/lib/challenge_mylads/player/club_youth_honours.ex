defmodule ChallengeMylads.Player.ClubYouthHonours do
  use Ecto.Schema
  import Ecto.Changeset

  schema "club_youth_honours" do
    field :games, :string
    field :goals, :integer
    belongs_to :player, ChallengeMylads.Player

    timestamps()
  end

  @doc false
  def changeset(club_youth_honours, attrs) do
    club_youth_honours
    |> cast(attrs, [:games, :goals])
  end
end
