defmodule SoundLift.Repo.Migrations.AddUserIdToResults do
  use Ecto.Migration

  def change do
    alter table(:results) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
    end

    create index(:results, [:user_id])
  end
end
