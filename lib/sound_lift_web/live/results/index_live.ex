defmodule SoundLiftWeb.Results.IndexLive do
  use SoundLiftWeb, :live_view
  alias SoundLift.Results
  alias SoundLiftWeb.Results.ShowLive
  alias SoundLift.Accounts
  alias SoundLift.Repo
  import Ecto

  @impl true

  def mount(_params, _session, socket) do
    results = Results.list_results_for_user(socket.assigns.current_user.id)

    {:ok,
     socket
     |> assign(:results, results)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <button
      phx-click="go-to-home"
      class="bg-slyellow hover:bg-yellow-300 text-blue-900 rounded-full h-8 mt-6 w-[140px] font-semibold"
    >
      Home Page
    </button>
    
    <.table id="results" rows={@results}>
      <%!-- <:col :let={result} label="id"><%= result.id %></:col> --%>
      <:col :let={result} label="TOTAL SCORE"><%= result.total_score %></:col>
    </.table>
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

  # TODO: Use :total_score virtual field to sum average of a single user's results
  # List all tests taken by user
  def handle_event("go-to-home", url, socket) do
    {:noreply, push_navigate(socket, to: ~p"/")}
  end
end
