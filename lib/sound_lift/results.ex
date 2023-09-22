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

  def list_results_for_user(user_id) do
    Repo.all(
      from r in Result,
        where: r.user_id == ^user_id
    )
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
    IO.inspect(result, label: "RESULT")

    total_score =
      Map.take(result, [
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
        :step_6_right
      ])
      |> Map.values()
      |> IO.inspect(label: "TEST RESULT")
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
