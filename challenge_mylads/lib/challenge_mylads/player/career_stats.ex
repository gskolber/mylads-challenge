defmodule ChallengeMylads.Player.CareerStats do
  use Ecto.Schema
  import Ecto.Changeset

  schema "career_stats" do
    field :club, :string
    field :club_id, :integer
    field :games, :string
    field :goals_scored, :string
    field :season, :string
    belongs_to :player, ChallengeMylads.Player

    timestamps()
  end

  @doc false
  def changeset(career_stats, attrs) do
    career_stats
    |> cast(attrs, [:season, :club, :club_id, :games, :goals_scored])
  end
end
