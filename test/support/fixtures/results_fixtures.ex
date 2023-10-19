defmodule SoundLift.ResultsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoundLift.Results` context.
  """

  @doc """
  Generate a result.
  """
  def result_fixture(attrs \\ %{}) do
    {:ok, result} =
      attrs
      |> Enum.into(%{
        step_1_left: 42,
        step_1_right: 42,
        step_2_left: 42,
        step_2_right: 42,
        step_3_left: 42,
        step_3_right: 42,
        step_4_left: 42,
        step_4_right: 42,
        step_5_left: 42,
        step_5_right: 42,
        step_6_left: 42,
        step_6_right: 42
      })
      |> SoundLift.Results.create_result()

    result
  end
end
