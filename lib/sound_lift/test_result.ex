defmodule SoundLift.TestResult do
  use Ecto.Schema
  import Ecto.Changeset

  schema "test_results" do
    field :left_ear, :integer
    field :right_ear, :integer
    field :published_on, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(test_result, attrs) do
    test_result
    |> cast(attrs, [:left_ear, :right_ear, :published_on])
    |> validate_required([:left_ear, :right_ear, :published_on])
  end
end
