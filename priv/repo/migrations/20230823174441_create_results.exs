defmodule SoundLift.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :step_one_left, :integer
      add :step_one_right, :integer
      add :step_two_left, :integer
      add :step_two_right, :integer
      add :step_three_left, :integer
      add :step_three_right, :integer
      add :step_four_left, :integer
      add :step_four_right, :integer
      add :step_five_left, :integer
      add :step_five_right, :integer
      add :step_six_left, :integer
      add :step_six_right, :integer

      timestamps()
    end
  end
end
