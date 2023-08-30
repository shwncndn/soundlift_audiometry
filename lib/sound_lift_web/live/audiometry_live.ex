defmodule SoundLiftWeb.AudiometryLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(_params, session, socket) do
  
    {:ok, result} = Results.create_result(%{user_id: socket.assigns.current_user.id})

    {:ok,
     socket
     |> assign(:result, result)
     |> assign(:volume, 4)
     |> assign(:current_ear, :left)
     |> assign(:step, 1)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center">
      <h1 id="current-ear" class="text-5xl text-slate-50 py-8">
        <%= String.capitalize(Atom.to_string(@current_ear)) %> Ear
      </h1>
      <div class="inline-flex">
        <%!-- <h1 id="current-step" class="text-2xl text-slate-50 py-2 mr-2">Step <%= @step %></h1> --%>
        <%!-- <h1 id="current-volume" class="text-2xl text-slate-50 py-2 ml-2">Volume: <%= @volume %></h1> --%>
      </div>
      <div class="inline-flex">
        <element id="vol-meter" class="flex flex-col items-center">
          <element
            id="7"
            class={"bg-slyellow rounded-full border-[1px] border-yellow-500 w-28 h-[1.125rem] mt-1 #{if @volume == 7, do: "bg-slyellow", else: "bg-slyellow/60"}"}
          >
          </element>

          <element
            id="6"
            class={"bg-slyellow rounded-full border-[1px] border-yellow-500 w-24 h-[1.125rem] mt-1 #{if @volume >= 6, do: "bg-slyellow", else: "bg-slyellow/60"}"}
          >
          </element>

          <element
            id="5"
            class={"bg-slyellow rounded-full border-[1px] border-yellow-500 w-20 h-[1.125rem] mt-1 #{if @volume >= 5, do: "bg-slyellow", else: "bg-slyellow/60"}"}
          >
          </element>

          <element
            id="4"
            class={"bg-slyellow rounded-full border-[1px] border-yellow-500 w-16 h-[1.125rem] mt-1 #{if @volume >= 4, do: "bg-slyellow", else: "bg-slyellow/60"}"}
          >
          </element>

          <element
            id="3"
            class={"bg-slyellow rounded-full border-[1px] border-yellow-500 w-12 h-[1.125rem] mt-1 #{if @volume >= 3, do: "bg-slyellow", else: "bg-slyellow/60"}"}
          >
          </element>

          <element
            id="2"
            class={"bg-slyellow rounded-full border-[1px] border-yellow-500 w-8 h-[1.125rem] mt-1 #{if @volume >= 2, do: "bg-slyellow", else: "bg-slyellow/60"}"}
          >
          </element>

          <element
            id="1"
            class={"bg-slyellow rounded-full border-[1px]  border-yellow-500 w-[1.125rem] h-[1.125rem] mt-1 #{if @volume >= 1, do: "bg-slyellow", else: "bg-slyellow/60"}"}
          >
          </element>
        </element>
      </div>

      <%!-- <p class="text-md text-slate-50 py-8">Step <%= Kernel.inspect(@result) %></p> --%>
    </div>
    <div class="flex justify-around flex-col text-slate-50 items-center">
      <button
        id="inc"
        class=" mt-4 w-0 h-0
    border-l-[25px] border-l-transparent
    border-b-[25px] border-b-yellow-500
    border-r-[25px] border-r-transparent"
        phx-click="inc"
      >
      </button>
      <p>Louder</p>
    </div>
    <div class="border-b w-24 mx-auto border-gray-400"></div>
    <div class="flex flex-col text-slate-50 items-center">
      <p>Softer</p>
      <button
        id="dec"
        class="w-0 h-0
    border-l-[25px] border-l-transparent
    border-t-[25px] border-t-yellow-500
    border-r-[25px] border-r-transparent"
        phx-click="dec"
      >
      </button>

      <div>
        <button
          id="toggle-sound"
          phx-hook="ToggleSound"
          data-volume={@volume}
          class="bg-slyellow hover:bg-yellow-300 text-blue-900 rounded-full h-10 mt-4 mb-8 w-[120px] font-semibold"
        >
          Start | Stop
        </button>
        <button
          id="save-and-continue"
          class="w-44 h-10 bg-transparent border-2 border-slyellow hover:bg-yellow-300/40 rounded-full text-slate-50 font-semibold"
          phx-click="save_and_continue"
        >
          Save and Continue
        </button>
      </div>
      <%!-- TODO: cond or if statement for pill color relative to socket.assigns.step --%>
      <div class="flex justify-between inline-flex flex items-center">
        <element class={"flex items-center mx-2 border-2 bg-opacity-0 justify-center rounded-full #{if @step == 1, do: "border-yellow-500 w-24 h-24 text-6xl", else: "w-20 h-20 border-slate-500 text-5xl text-slate-500"}"}>
          1
        </element>
        <element class="bg-slyellow rounded-full w-4 h-4 mt-1"></element>
        <element class={"flex items-center mx-2 border-2 outline-slate-50 bg-opacity-0 justify-center rounded-full #{if @step == 2, do: "border-yellow-500 w-24 h-24 text-6xl", else: "w-20 h-20 border-slate-500 w-20 h-20 text-5xl text-slate-500"}"}>
          2
        </element>
        <element class="bg-slyellow rounded-full w-4 h-4 mt-1"></element>
        <element class={"flex items-center mx-2 w-16 h-16 text-slate-50 border-2 border-slate-50 outline-slate-50 bg-opacity-0 justify-center rounded-full #{if @step == 3, do: "border-yellow-500 w-24 h-24 text-6xl", else: "w-20 h-20 border-slate-500 w-20 h-20 text-5xl text-slate-500"}"}>
          3
        </element>
        <element class="bg-slyellow rounded-full w-4 h-4 mt-1"></element>
        <element class={"flex items-center mx-2 w-16 h-16 text-slate-50 border-2 border-slate-50 outline-slate-50 bg-opacity-0 justify-center rounded-full #{if @step == 4, do: "border-yellow-500 w-24 h-24 text-6xl", else: "w-20 h-20 border-slate-500 w-20 h-20 text-5xl text-slate-500"}"}>
          4
        </element>
        <element class="bg-slyellow rounded-full w-4 h-4 mt-1"></element>
        <element class={"flex items-center mx-2 w-16 h-16 text-slate-50 border-2 border-slate-50 outline-slate-50 bg-opacity-0 justify-center rounded-full #{if @step == 5, do: "border-yellow-500 w-24 h-24 text-6xl", else: "w-20 h-20 border-slate-500 w-20 h-20 text-5xl text-slate-500"}"}>
          5
        </element>
        <element class="bg-slyellow rounded-full w-4 h-4 mt-1"></element>
        <element class={"flex items-center mx-2 w-16 h-16 text-slate-50 border-2 border-slate-50 outline-slate-50 bg-opacity-0 justify-center rounded-full #{if @step == 6, do: "border-yellow-500 w-24 h-24 text-6xl", else: "w-20 h-20 border-slate-500 w-20 h-20 text-5xl text-slate-500"}"}>
          6
        </element>
      </div>
      <div class="flex justify-between inline-flex flex items-center"></div>
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
      Results.update_result(
        IO.inspect(socket.assigns.result, label: "SOCKET RESULT"),
        Map.new([{field, socket.assigns.volume}])
      )

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
