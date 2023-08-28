defmodule SoundLift.LogsTest do
  use SoundLift.DataCase

  alias SoundLift.Logs

  describe "logs" do
    alias SoundLift.Logs.Log

    import SoundLift.LogsFixtures

    @invalid_attrs %{left_ear: nil, right_ear: nil, total_score: nil, published_on: nil}

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Logs.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Logs.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      valid_attrs = %{left_ear: 42, right_ear: 42, total_score: 42, published_on: ~D[2023-08-27]}

      assert {:ok, %Log{} = log} = Logs.create_log(valid_attrs)
      assert log.left_ear == 42
      assert log.right_ear == 42
      assert log.total_score == 42
      assert log.published_on == ~D[2023-08-27]
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logs.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      update_attrs = %{left_ear: 43, right_ear: 43, total_score: 43, published_on: ~D[2023-08-28]}

      assert {:ok, %Log{} = log} = Logs.update_log(log, update_attrs)
      assert log.left_ear == 43
      assert log.right_ear == 43
      assert log.total_score == 43
      assert log.published_on == ~D[2023-08-28]
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Logs.update_log(log, @invalid_attrs)
      assert log == Logs.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Logs.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Logs.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Logs.change_log(log)
    end
  end
end
