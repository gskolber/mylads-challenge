defmodule ChallengeMylads.Player.NationalTeamSeniors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "national_teams_seniors" do
    field :games, :string
    field :goals, :integer
    belongs_to :player, ChallengeMylads.Player

    timestamps()
  end

  @doc false
  def changeset(national_team_seniors, attrs) do
    national_team_seniors
    |> cast(attrs, [:games, :goals])
  end
end
