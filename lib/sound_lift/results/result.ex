defmodule SoundLift.Results.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :step_one_left, :integer
    field :step_one_right, :integer
    field :step_two_left, :integer
    field :step_two_right, :integer
    field :step_three_left, :integer
    field :step_three_right, :integer
    field :step_four_left, :integer
    field :step_four_right, :integer
    field :step_five_left, :integer
    field :step_five_right, :integer
    field :step_six_left, :integer
    field :step_six_right, :integer

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [
      :step_one_left,
      :step_one_right,
      :step_two_left,
      :step_two_right,
      :step_three_left,
      :step_three_right,
      :step_four_left,
      :step_four_right,
      :step_five_left,
      :step_five_right,
      :step_six_left,
      :step_six_right
    ])

  end
end
