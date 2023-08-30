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

  describe "Volume control" do
    test "displays current volume", %{conn: conn} do
      {:ok, view, html} = live(conn, "/audiometry")
      assert element(view, "#current-volume") |> render() =~ "4"
    end

    test "Louder button increments volume by 1", %{conn: conn} do
      {:ok, view, html} = live(conn, "/audiometry")
      element(view, "#inc") |> render_click()
      assert element(view, "#current-volume") |> render() =~ "5"
    end

    test "Softer button decrements volume by 1", %{conn: conn} do
      {:ok, view, html} = live(conn, "/audiometry")
      element(view, "#dec") |> render_click()
      assert element(view, "#current-volume") |> render() =~ "3"
    end
  end

  describe "Step control" do
    test "steps increment from left to right ear", %{conn: conn} do
      {:ok, view, html} = live(conn, "/audiometry")
      assert element(view, "#current-ear") |> render() =~ "Left"
      assert element(view, "#current-step") |> render() =~ "1"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Right"
      assert element(view, "#current-step") |> render() =~ "1"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Left"
      assert element(view, "#current-step") |> render() =~ "2"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Right"
      assert element(view, "#current-step") |> render() =~ "2"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Left"
      assert element(view, "#current-step") |> render() =~ "3"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Right"
      assert element(view, "#current-step") |> render() =~ "3"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Left"
      assert element(view, "#current-step") |> render() =~ "4"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Right"
      assert element(view, "#current-step") |> render() =~ "4"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Left"
      assert element(view, "#current-step") |> render() =~ "5"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Right"
      assert element(view, "#current-step") |> render() =~ "5"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Left"
      assert element(view, "#current-step") |> render() =~ "6"

      element(view, "#save-and-continue") |> render_click()
      assert element(view, "#current-ear") |> render() =~ "Right"
      assert element(view, "#current-step") |> render() =~ "6"

      element(view, "#save-and-continue") |> render_click()
      {path, _flash} = assert_redirect(view)
      assert "/results/" <> id = path
    end
  end
end
