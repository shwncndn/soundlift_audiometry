defmodule SoundLift.Results do
  @moduledoc """
  The Results context.
"""

  import Ecto.Query, warn: false
  alias SoundLift.Repo

  alias SoundLift.Results.Result

  @doc """
  Returns the list of results.

  ## Examples

      iex> list_results()
      [%Result{}, ...]

  """
  def list_results do
    Repo.all(Result)
  end



  def results_count do
    Repo.one(
      from r in Result,
      select: count(r.id)
    )
  end

  @doc """
  Gets a single result.

  Raises `Ecto.NoResultsError` if the Result does not exist.

  ## Examples

      iex> get_result!(123)
      %Result{}

      iex> get_result!(456)
      ** (Ecto.NoResultsError)

  """
  def get_result!(id) do
    result = Repo.get!(Result, id)

    total_score =
      Map.take(result, [
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
        :step_six_right
      ])
      |> Map.values()
      |> Enum.sum()

    Map.put(result, :total_score, total_score)
  end

  @doc """
  Creates a result.

  ## Examples

      iex> create_result(%{field: value})
      {:ok, %Result{}}

      iex> create_result(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_result(attrs \\ %{}) do
    %Result{}
    |> Result.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a result.

  ## Examples

      iex> update_result(result, %{field: new_value})
      {:ok, %Result{}}

      iex> update_result(result, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_result(%Result{} = result, attrs) do
    result
    |> Result.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a result.

  ## Examples

      iex> delete_result(result)
      {:ok, %Result{}}

      iex> delete_result(result)
      {:error, %Ecto.Changeset{}}

  """
  def delete_result(%Result{} = result) do
    Repo.delete(result)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking result changes.

  ## Examples

      iex> change_result(result)
      %Ecto.Changeset{data: %Result{}}

  """
  def change_result(%Result{} = result, attrs \\ %{}) do
    Result.changeset(result, attrs)
  end
end
