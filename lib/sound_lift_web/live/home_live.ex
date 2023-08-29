defmodule SoundLiftWeb.HomeLive do
  use SoundLiftWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <body>
      <h1 class="flex flex-col items-center text-slate-50">Welcome!</h1>
      <h2 class="flex flex-col items-center text-slate-50">Please find a quiet place.</h2>
      <h2 class="flex flex-col items-center text-slate-50">
        Background noise will affect your results.
      </h2>
      <h2 class="flex flex-col items-center text-slate-50">When ready, click the button below.</h2>

      <button
        phx-click="go-to-page"
        class="inline-f items-center rounded-full text-blue-900 text-sm my-8 w-28 h-8 bg-yellow-400 hover:bg-yellow-300"
      >
        Take the Test!
      </button>
    </body>
    """
  end

  def handle_event("go-to-page", url, socket) do
    {:noreply, push_navigate(socket, to: ~p"/audiometry")}
  end
end
