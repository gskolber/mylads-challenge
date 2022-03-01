defmodule ChallengeMylads.Player.NationalTeamYouthHonours do
  use Ecto.Schema
  import Ecto.Changeset

  schema "national_team_youth_honours" do
    field :games, :string
    field :goals, :integer
    belongs_to :player, ChallengeMylads.Player

    timestamps()
  end

  @doc false
  def changeset(national_team_youth_honours, attrs) do
    national_team_youth_honours
    |> cast(attrs, [:games, :goals])
  end
end
