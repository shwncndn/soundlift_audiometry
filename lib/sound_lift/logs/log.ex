defmodule SoundLift.Logs.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :left_ear, :integer
    field :right_ear, :integer
    field :total_score, :integer
    field :published_on, :date

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:left_ear, :right_ear, :total_score, :published_on])
    |> validate_required([:left_ear, :right_ear, :total_score, :published_on])
  end
end
