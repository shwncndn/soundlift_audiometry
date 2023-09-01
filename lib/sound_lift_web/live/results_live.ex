defmodule SoundLiftWeb.ResultsLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(params, _session, socket) do
    result = Results.get_result!(params["id"])
    {:ok, assign(socket, :result, result.id)}
    IO.inspect(result, label: "populated Result struct")


    # acc_result =
    #   result
    #   |> Map.from_struct()
    #   |> Map.delete(:id)
    #   |> Map.delete(:user_id)
    #   |> Map.delete(:total_score)
    #   |> Enum.filter(fn {_key, value} -> is_integer(value) end)
    #   |> Enum.map(fn {_key, value} -> value end)
    #   |> Enum.sum()

    {:ok,
     socket
     |> assign(:result, result)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center text-slate-50 text-center">
      <h1 class="font-bold text-4xl mb-10">
        Your Results Indicate:
        <div class="mt-10">
          <%= cond do %>
            <% @result.total_score >= 12 and @result.total_score <= 24 -> %>
              <p class="text-yellow-500 font-bold flex justify-center items-center text-4xl">
                Healthy!
              </p>
            <% @result.total_score >= 25 and @result.total_score <= 37 -> %>
              <p class="text-yellow-500 font-bold flex justify-center items-center text-5xl">
                Mild Hearing Loss
              </p>
            <% @result.total_score >= 38 and @result.total_score <= 50 -> %>
              <p class="text-yellow-500 font-bold flex justify-center items-center text-5xl">
                Moderate Hearing Loss
              </p>
            <% @result.total_score >= 62 and @result.total_score <= 74 -> %>
              <p class="text-yellow-500 font-bold flex justify-center items-center text-5xl">
                Severe Hearing Loss
              </p>
            <% @result.total_score >= 75 and @result.total_score <= 84 -> %>
              <p class="text-yellow-500 font-bold flex justify-center items-center text-5xl">
                Profound Hearing Loss
              </p>
            <% true -> %>
              <p>default case</p>
          <% end %>
        </div>
      </h1>

      <div>
        <%= cond do %>
          <% @result.total_score >= 12 and @result.total_score <= 24 -> %>
            <p class="flex justify-center items-center font-bold mb-4">
              Your test results do not indicate a hearing loss.
            </p>
          <% @result.total_score >= 25 and @result.total_score <= 37 -> %>
            <p class="flex justify-center items-center font-bold mb-4">
              Hearing loss of 20 to 40 decibels
            </p>
            <p class="flex flex-col items-center text-slate-50 italic">
              A person with a mild hearing loss may hear some speech sounds but soft sounds are hard to hear.
            </p>
          <% @result.total_score >= 38 and @result.total_score <= 50 -> %>
            <p class="flex justify-center items-center font-bold mb-12 text-2xl">
              Hearing loss of 41 to 60 decibels
            </p>
            <p class="flex flex-col items-center text-slate-50 italic">
              A person with a moderate hearing loss may hear almost no speech when another person is talking at a normal level.
            </p>
          <% @result.total_score >= 62 and @result.total_score <= 74 -> %>
            <p class="flex justify-center items-center font-bold mb-4">
              Hearing loss of 61 to 80 decibels.
            </p>
            <p class="flex flex-col items-center text-slate-50 italic">
              A person with severe hearing loss will hear no speech of a person talking at a normal level and only some loud sounds.
            </p>
          <% @result.total_score >= 75 and @result.total_score <= 84 -> %>
            <p class="flex justify-center items-center font-bold mb-4">
              Hearing loss of more than 81 decibels
            </p>
            <p class="flex flex-col items-center text-slate-50 italic">
              A person with a profound hearing loss will not hear any speech and only very loud sounds.
            </p>
          <% true -> %>
            <p>default case</p>
        <% end %>
      </div>
      <div class="border-b w-[600px] mt-20 mx-auto border-slyellow"></div>
      <div class="mt-8 rounded-full px-10">
      <p class="mt-4 font-medium">Click below to see results history</p>
      <button class="bg-slyellow hover:bg-yellow-300 text-blue-900 rounded-full h-8 mt-6 w-[140px] font-semibold">View Log</button>
      </div>
    </div>
    """
  end
end
