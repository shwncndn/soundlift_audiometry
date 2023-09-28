defmodule SoundLiftWeb.AudiometryLiveTest do
  use SoundLiftWeb.ConnCase
  doctest SoundLiftWeb.AudiometryLive
  alias SoundLiftWeb.AudiometryLive
  import Phoenix.LiveViewTest
  import SoundLift.AccountsFixtures

  test "mount/1", %{conn: conn} do
    user = user_fixture(username: "MyUser")
    {:ok, view, _html} = conn |> log_in_user(user) |> live("/audiometry")
  end

  test "get_field_name/2" do
    assert AudiometryLive.get_field_name(:left, 1) == :step_1_left
    assert AudiometryLive.get_field_name(:right, 6) == :step_6_right
  end
end
