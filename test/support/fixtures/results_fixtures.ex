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
        step_one_left: 42,
        step_one_right: 42,
        step_two_left: 42,
        step_two_right: 42,
        step_three_left: 42,
        step_three_right: 42,
        step_four_left: 42,
        step_four_right: 42,
        step_five_left: 42,
        step_five_right: 42,
        step_six_left: 42,
        step_six_right: 42
      })
      |> SoundLift.Results.create_result()

    result
  end
end
