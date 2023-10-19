defmodule SoundLift.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :left_ear, :integer
      add :right_ear, :integer
      add :total_score, :integer
      add :published_on, :date

      timestamps()
    end
  end
end
