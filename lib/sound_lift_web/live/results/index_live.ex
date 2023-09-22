defmodule SoundLiftWeb.Results.IndexLive do
  use SoundLiftWeb, :live_view
  alias SoundLift.Results
  alias SoundLift.Accounts
  alias SoundLift.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :results, Results.list_results_for_user(socket.assigns.current_user.id))}
    IO.inspect(socket, label: "SESSION INSPECT")
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, stream(socket, socket.assigns.current_user.id, params)}
  end

  def render(assigns) do
    ~H"""

    """
  end

  # def handle_params(params, _url, socket) do
  #   {:noreply, apply_action(socket, socket.assigns.current_user.id, params)}
  # end

  # defp apply_action(socket, :index, _params) do
  #   socket
  #   |> assign(:page, nil)
  #   |> assign(:page_title, "Listing Pages")
  # end

  defp list_results(user) do
    Results.list_results_for_user(user)
  end

  # TODO: Use :total_score virtual field to sum average of a single user's results
  # List all tests taken by user
end
