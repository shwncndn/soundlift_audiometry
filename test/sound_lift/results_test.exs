defmodule SoundLift.ResultsTest do
  use SoundLift.DataCase

  alias SoundLift.Results

  describe "results" do
    alias SoundLift.Results.Result

    import SoundLift.ResultsFixtures
    import SoundLift.AccountsFixtures

    @invalid_attrs %{
      step_one_left: nil,
      step_one_right: nil,
      step_two_left: nil,
      step_two_right: nil,
      step_three_left: nil,
      step_three_right: nil,
      step_four_left: nil,
      step_four_right: nil,
      step_five_left: nil,
      step_five_right: nil,
      step_six_left: nil,
      step_six_right: nil
    }

    test "list_results/0 returns all results" do
      result = result_fixture()
      assert Results.list_results() == [result]
    end

    test "get_result!/1 returns the result with given id" do
      result = result_fixture()
      assert Results.get_result!(result.id) == result
    end

    test "create_result/1 with valid data creates a result" do
      user = user_fixture(username: "MyUser")

      valid_attrs = %{
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
        step_six_right: 42,
        user_id: user.id
      }

      assert {:ok, %Result{} = result} = Results.create_result(valid_attrs)
      assert result.step_one_left == 42
      assert result.step_one_right == 42
      assert result.step_two_left == 42
      assert result.step_two_right == 42
      assert result.step_three_left == 42
      assert result.step_three_right == 42
      assert result.step_four_left == 42
      assert result.step_four_right == 42
      assert result.step_five_left == 42
      assert result.step_five_right == 42
      assert result.step_six_left == 42
      assert result.step_six_right == 42
    end

    test "create_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Results.create_result(@invalid_attrs)
    end

    test "update_result/2 with valid data updates the result" do
      result = result_fixture()

      update_attrs = %{
        step_one_left: 43,
        step_one_right: 43,
        step_two_left: 43,
        step_two_right: 43,
        step_three_left: 43,
        step_three_right: 43,
        step_four_left: 43,
        step_four_right: 43,
        step_five_left: 43,
        step_five_right: 43,
        step_six_left: 43,
        step_six_right: 43
      }

      assert {:ok, %Result{} = result} = Results.update_result(result, update_attrs)
      assert result.step_one_left == 43
      assert result.step_one_right == 43
      assert result.step_two_left == 43
      assert result.step_two_right == 43
      assert result.step_three_left == 43
      assert result.step_three_right == 43
      assert result.step_four_left == 43
      assert result.step_four_right == 43
      assert result.step_five_left == 43
      assert result.step_five_right == 43
      assert result.step_six_left == 43
      assert result.step_six_right == 43
    end

    test "update_result/2 with invalid data returns error changeset" do
      result = result_fixture()
      assert {:error, %Ecto.Changeset{}} = Results.update_result(result, @invalid_attrs)
      assert result == Results.get_result!(result.id)
    end

    test "delete_result/1 deletes the result" do
      result = result_fixture()
      assert {:ok, %Result{}} = Results.delete_result(result)
      assert_raise Ecto.NoResultsError, fn -> Results.get_result!(result.id) end
    end

    test "change_result/1 returns a result changeset" do
      result = result_fixture()
      assert %Ecto.Changeset{} = Results.change_result(result)
    end
  end
end
