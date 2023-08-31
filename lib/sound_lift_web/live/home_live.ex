defmodule SoundLiftWeb.HomeLive do
  use SoundLiftWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      SoundLiftWeb.Endpoint.subscribe("stat_counter")
    end
    {:ok, socket}
  end

  def handle_info(%Phoenix.Socket.Broadcast{topic: "stat_counter", event: "inc_result"}, socket) do
    IO.inspect(%Phoenix.Socket.Broadcast{topic: "stat_counter", event: "inc_result"}, label: "broadcast")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <body>
      <h1 class="flex flex-col items-center text-slate-50 font-bold">Welcome!</h1>
      <h2 class="flex flex-col items-center text-slate-50 font-bold">Please find a quiet place.</h2>
      <h2 class="flex flex-col items-center text-slate-50 font-bold">
        Background noise will affect your results.
      </h2>
      <h2 class="flex flex-col items-center text-slate-50 mt-4">
        When ready, click the button below.
      </h2>
      <div class="flex justify-center items-center">
        <button
          phx-click="go-to-page"
          class="rounded-full text-blue-900 font-bold text-sm my-8 w-28 h-8 bg-yellow-400 hover:bg-yellow-300"
        >
          Take the Test!
        </button>
      </div>
    </body>
    """
  end

  def handle_event("go-to-page", url, socket) do
    {:noreply, push_navigate(socket, to: ~p"/audiometry")}
  end
end
