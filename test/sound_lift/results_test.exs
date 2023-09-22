defmodule SoundLift.ResultsTest do
  use SoundLift.DataCase

  alias SoundLift.Results

  describe "results" do
    alias SoundLift.Results.Result

    import SoundLift.ResultsFixtures
    import SoundLift.AccountsFixtures

    @invalid_attrs %{
      step_one_left: nil,
      step_1_right: nil,
      step_2_left: nil,
      step_2_right: nil,
      step_3_left: nil,
      step_3_right: nil,
      step_4_left: nil,
      step_4_right: nil,
      step_5_left: nil,
      step_5_right: nil,
      step_6_left: nil,
      step_6_right: nil
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
        step_6_right: 42,
        user_id: user.id
      }

      assert {:ok, %Result{} = result} = Results.create_result(valid_attrs)
      assert result.step_one_left == 42
      assert result.step_1_right == 42
      assert result.step_2_left == 42
      assert result.step_2_right == 42
      assert result.step_3_left == 42
      assert result.step_3_right == 42
      assert result.step_4_left == 42
      assert result.step_4_right == 42
      assert result.step_5_left == 42
      assert result.step_5_right == 42
      assert result.step_6_left == 42
      assert result.step_6_right == 42
    end

    test "create_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Results.create_result(@invalid_attrs)
    end

    test "update_result/2 with valid data updates the result" do
      result = result_fixture()

      update_attrs = %{
        step_one_left: 43,
        step_1_right: 43,
        step_2_left: 43,
        step_2_right: 43,
        step_3_left: 43,
        step_3_right: 43,
        step_4_left: 43,
        step_4_right: 43,
        step_5_left: 43,
        step_5_right: 43,
        step_6_left: 43,
        step_6_right: 43
      }

      assert {:ok, %Result{} = result} = Results.update_result(result, update_attrs)
      assert result.step_one_left == 43
      assert result.step_1_right == 43
      assert result.step_2_left == 43
      assert result.step_2_right == 43
      assert result.step_3_left == 43
      assert result.step_3_right == 43
      assert result.step_4_left == 43
      assert result.step_4_right == 43
      assert result.step_5_left == 43
      assert result.step_5_right == 43
      assert result.step_6_left == 43
      assert result.step_6_right == 43
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
