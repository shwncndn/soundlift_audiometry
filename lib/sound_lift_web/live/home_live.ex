defmodule SoundLiftWeb.HomeLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(_params, _session, socket) do
    if connected?(socket) do
      SoundLiftWeb.Endpoint.subscribe("stat_counter")
    end

    {:ok,
     socket
     |> assign(:stat_counter, Results.results_count())}
  end

  def handle_info(
        %Phoenix.Socket.Broadcast{topic: "stat_counter", event: "inc_result", payload: stat},
        socket
      ) do
    {:noreply, assign(socket, :stat_counter, socket.assigns.stat_counter + 1)}
  end

  def render(assigns) do
    ~H"""

    <body>
      <h1 class="flex flex-col items-center text-xl text-slate-50 mb-8 font-bold">Welcome!</h1>
      <h2 class="flex flex-col items-center text-slate-50 font-bold">Please find a quiet place.</h2>
      <h2 class="flex flex-col items-center text-slate-50 font-bold">
        Background noise will affect your results.
      </h2>
      <h2 class="flex flex-col items-center text-slate-50 font-bold">
        Use headphones for best accuracy.
      </h2>
      <h2 class="flex flex-col items-center text-slate-50 mt-4">
        When ready, click the button below.
      </h2>
      <div class="flex justify-center items-center">
        <button
          phx-click="go-to-test-page"
          class="rounded-full text-blue-900 font-bold text-sm my-8 w-28 h-8 bg-yellow-400 hover:bg-yellow-300"
        >
          Start
        </button>
      </div>
      <div>
        <h1 class="flex flex-col items-center text-slate-50 mt-12 font-bold">Over <%= @stat_counter %> people have used this exam to assess their hearing!</h1>
        </div>
    </body>
    """
  end

  def handle_event("go-to-test-page", url, socket) do
    {:noreply, push_navigate(socket, to: ~p"/audiometry")}
  end
end
