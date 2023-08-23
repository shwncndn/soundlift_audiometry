defmodule SoundLiftWeb.AudiometryLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:volume, 3)
     |> assign(:current_ear, :left)
     |> assign(:step, 1)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-4xl py-8"><%= String.capitalize(Atom.to_string(@current_ear)) %> Ear</h1>
    <h1 class="text-4xl py-8">Volume: <%= @volume %></h1>
    <h1 class="text-4xl py-8">Step <%= @step %></h1>
    <div class="flex flex-col items-center">
      <.button class="rounded-lg bg-yellow-400 hover:bg-yellow-300
     py-2 px-1 w-16" phx-click="inc">
      </.button>
      <p>Louder</p>
    </div>
    <div class="border-b border-t border-gray-300"></div>
    <div class="flex flex-col items-center">
      <p>Softer</p>
      <.button class="rounded-lg bg-yellow-400 hover:bg-yellow-300
      py-2 px-1 w-16
     " phx-click="dec">
      </.button>

      <.button
        class="my-4 bg-yellow-400 hover:bg-yellow-300 rounded-full"
        phx-click="save_and_continue"
      >
        Save and Continue
      </.button>
    </div>
    """
  end

  # TODO how to limit count w/o crashing when limit reached?
  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, :volume, min(socket.assigns.volume + 1, 6))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, assign(socket, :volume, max(socket.assigns.volume - 1, 1))}
  end

  def handle_event("save_and_continue", _params, socket) do
    # 1, left
    # 1, right
    # 2, left
    # 2, right
    # 3, left
    # 3, right
    # 4, left
    # 4, right
    # 5, left
    # 5, right
    # 6, left
    # 6, right

    valid_attrs = %{
      step_one_left: 42,
      step_one_right: 42,
      step_two_left: 42,
      step_two_right: 42,
      step_three_left: 42,
      step_three_right: 42,
      step_four_left: 42,
      step_four_right: 42,
      step_five_left: 42,
      step_five_right: 42,
      step_six_left: 42,
      step_six_right: 42
    }

    socket =
      cond do
        socket.assigns.current_ear == :right and socket.assigns.step == 6 ->
          Results.create_result(valid_attrs)
          socket
          |> put_flash(:info, "Test Complete!")
          |> push_navigate(to: "/results")

        socket.assigns.current_ear == :left ->
          assign(socket, :current_ear, :right)

        socket.assigns.current_ear == :right ->
          socket
          |> assign(:current_ear, :left)
          |> assign(:step, socket.assigns.step + 1)
      end

    {:noreply, socket}
  end

  # def handle_event("view_results", _params, socket) do

  # end
end
