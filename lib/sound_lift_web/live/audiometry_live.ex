defmodule SoundLiftWeb.AudiometryLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Volume

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :volume, Volume.new())}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-4xl py-8">Volume: <%= Volume.show(@volume) %></h1>
    <.button
      class="rounded-lg bg-zinc-900 text-sm hover:bg-zinc-700
     mx-2 py-2 px-3 w-16 font-semibold text-white active:text-white/80"
      phx-click="dec"
    >
      -
    </.button>
    <.button
      class="rounded-lg bg-zinc-900 text-sm hover:bg-zinc-700
     py-2 px-3 w-16 font-semibold text-white active:text-white/80"
      phx-click="inc"
    >
      +
    </.button>
    """
  end

  # TODO how to limit count w/o crashing when limit reached?
  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, :volume, Volume.inc(socket.assigns.volume))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, assign(socket, :volume, Volume.dec(socket.assigns.volume))}
  end
end
