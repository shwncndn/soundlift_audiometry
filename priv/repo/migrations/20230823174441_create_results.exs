defmodule SoundLift.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :step_1_left, :integer
      add :step_1_right, :integer
      add :step_2_left, :integer
      add :step_2_right, :integer
      add :step_3_left, :integer
      add :step_3_right, :integer
      add :step_4_left, :integer
      add :step_4_right, :integer
      add :step_5_left, :integer
      add :step_5_right, :integer
      add :step_6_left, :integer
      add :step_6_right, :integer

      timestamps()
    end
  end
end
