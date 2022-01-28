defmodule ChallengeMylads.Player.TotalSeniors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "total_seniors" do
    field :games, :string
    field :goals, :integer
    belongs_to :player, ChallengeMylads.Player

    timestamps()
  end

  @doc false
  def changeset(total_seniors, attrs) do
    total_seniors
    |> cast(attrs, [:games, :goals])
  end
end
