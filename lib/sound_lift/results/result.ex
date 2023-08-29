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
    field :total_score, :integer, virtual: true
    belongs_to :user, SoundLift.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    IO.inspect(attrs)

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
      :step_six_right,
      :user_id
    ])
    # |> validate_required([:user_id])
    |> foreign_key_constraint(:user_id)
  end

  # defp calculate_total_score(changeset) do
  #   one_left = get_field(changeset, :step_one_left)
  #   one_right = get_field(changeset, :step_one_right)
  #   two_left = get_field(changeset, :step_two_left)
  #   two_right = get_field(changeset, :step_two_right)
  #   three_left = get_field(changeset, :step_three_left)
  #   three_right = get_field(changeset, :step_three_right)
  #   four_left = get_field(changeset, :step_four_left)
  #   four_right = get_field(changeset, :step_four_right)
  #   five_left = get_field(changeset, :step_five_left)
  #   five_right = get_field(changeset, :step_five_right)
  #   six_left = get_field(changeset, :step_six_left)
  #   six_right = get_field(changeset, :step_six_right)

  #   dbg()

  #   total_score =
  #     one_left + two_left + three_left + four_left + five_left + six_left +
  #       (one_right + two_right + three_right + four_right + five_right + six_right)

  #   put_change(changeset, :total_score, total_score)
end
