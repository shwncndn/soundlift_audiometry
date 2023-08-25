defmodule SoundLiftWeb.AudiometryLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(_params, _session, socket) do
    {:ok, result} = Results.create_result()

    {:ok,
     socket
     |> assign(:result, result)
     |> assign(:volume, 4)
     |> assign(:current_ear, :left)
     |> assign(:step, 1)}
  end

  def render(assigns) do
    ~H"""
    <h1 id="current-ear" class="text-4xl py-8">
      <%= String.capitalize(Atom.to_string(@current_ear)) %> Ear
    </h1>
    <h1 id="current-volume" class="text-4xl py-8">Volume: <%= @volume %></h1>
    <h1 id="current-step" class="text-4xl py-8">Step <%= @step %></h1>
    <p class="text-md py-8">Step <%= Kernel.inspect(@result) %></p>
    <div class="flex flex-col items-center">
      <.button
        id="inc"
        class="rounded-lg bg-yellow-400 hover:bg-yellow-300
     py-2 px-1 w-16"
        phx-click="inc"
      >
      </.button>
      <p>Louder</p>
    </div>
    <div class="border-b border-t border-gray-300"></div>
    <div class="flex flex-col items-center">
      <p>Softer</p>
      <.button
        id="dec"
        class="rounded-lg bg-yellow-400 hover:bg-yellow-300
      py-2 px-1 w-16
     "
        phx-click="dec"
      >
      </.button>
      <.button
        id="save-and-continue"
        class="my-4 bg-yellow-400 hover:bg-yellow-300 rounded-full"
        phx-click="save_and_continue"
      >
        Save and Continue
      </.button>
      <.button phx-hook="ToggleSound">Start | Stop</.button>
    </div>
    """
  end

  # TODO how to limit count w/o crashing when limit reached?
  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, :volume, min(socket.assigns.volume + 1, 7))}
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

    # assign(:result, Results.update_result(socket.assigns.result, %{step_one_left: 1}))
    # {:ok, result} = Results.update_result(socket.assigns.result, %{step_one_left: 1})

    field =
      case {socket.assigns.current_ear, socket.assigns.step} do
        {:left, 1} -> :step_one_left
        {:right, 1} -> :step_one_right
        {:left, 2} -> :step_two_left
        {:right, 2} -> :step_two_right
        {:left, 3} -> :step_three_left
        {:right, 3} -> :step_three_right
        {:left, 4} -> :step_four_left
        {:right, 4} -> :step_four_right
        {:left, 5} -> :step_five_left
        {:right, 5} -> :step_five_right
        {:left, 6} -> :step_six_left
        {:right, 6} -> :step_six_right
        _ -> "No match"
      end

    {:ok, result} =
      Results.update_result(IO.inspect(socket.assigns.result, label: "SOCKET RESULT"), Map.new([{field, socket.assigns.volume}]))

    socket =
      cond do
        socket.assigns.current_ear == :right and socket.assigns.step == 6 ->
          socket
          |> put_flash(:info, "Test Complete!")
          |> push_navigate(to: ~p"/results/#{result}")

        socket.assigns.current_ear == :left ->
          socket
          |> assign(:current_ear, :right)

        socket.assigns.current_ear == :right ->
          socket
          |> assign(:current_ear, :left)
          |> assign(:step, socket.assigns.step + 1)
      end

    {:noreply, assign(socket, result: result, volume: 4)}
  end

  # def handle_info(msg, socket) do
  #   case socket.assigns.step do
  #     1 ->
  #     2 ->
  #     3 ->
  #     4 ->
  #     5 ->
  #     6 ->
  #   end
end
