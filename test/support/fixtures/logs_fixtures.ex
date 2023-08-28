defmodule SoundLift.LogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoundLift.Logs` context.
  """

  @doc """
  Generate a log.
  """
  def log_fixture(attrs \\ %{}) do
    {:ok, log} =
      attrs
      |> Enum.into(%{
        left_ear: 42,
        right_ear: 42,
        total_score: 42,
        published_on: ~D[2023-08-27]
      })
      |> SoundLift.Logs.create_log()

    log
  end
end
