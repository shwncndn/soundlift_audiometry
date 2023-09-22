defmodule SoundLift.Results.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :step_1_left, :integer
    field :step_1_right, :integer
    field :step_2_left, :integer
    field :step_2_right, :integer
    field :step_3_left, :integer
    field :step_3_right, :integer
    field :step_4_left, :integer
    field :step_4_right, :integer
    field :step_5_left, :integer
    field :step_5_right, :integer
    field :step_6_left, :integer
    field :step_6_right, :integer
    field :total_score, :integer, virtual: true
    belongs_to :user, SoundLift.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    IO.inspect(attrs, label: "attributes")

    result
    |> cast(attrs, [
      :step_1_left,
      :step_1_right,
      :step_2_left,
      :step_2_right,
      :step_3_left,
      :step_3_right,
      :step_4_left,
      :step_4_right,
      :step_5_left,
      :step_5_right,
      :step_6_left,
      :step_6_right,
      :user_id
    ])
    |> validate_required([:user_id])
  end

  # defp calculate_total_score(changeset) do
  #   one_left = get_field(changeset, :step_1_left)
  #   one_right = get_field(changeset, :step_1_right)
  #   two_left = get_field(changeset, :step_2_left)
  #   two_right = get_field(changeset, :step_2_right)
  #   three_left = get_field(changeset, :step_3_left)
  #   three_right = get_field(changeset, :step_3_right)
  #   four_left = get_field(changeset, :step_4_left)
  #   four_right = get_field(changeset, :step_4_right)
  #   five_left = get_field(changeset, :step_5_left)
  #   five_right = get_field(changeset, :step_5_right)
  #   six_left = get_field(changeset, :step_6_left)
  #   six_right = get_field(changeset, :step_6_right)

  #   dbg()

  #   total_score =
  #     one_left + two_left + three_left + four_left + five_left + six_left +
  #       (one_right + two_right + three_right + four_right + five_right + six_right)

  #   put_change(changeset, :total_score, total_score)
end
