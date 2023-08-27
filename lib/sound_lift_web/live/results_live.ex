defmodule SoundLiftWeb.ResultsLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(params, _session, socket) do
    result = Results.get_result!(params["id"])
    {:ok, assign(socket, :result, result.id)}
    IO.inspect(result)

    acc_result =
      result
      |> Map.from_struct()
      |> Map.delete(:id)
      |> Enum.filter(fn {_key, value} -> is_integer(value) end)
      |> IO.inspect(label: "acc_result")
      |> Enum.map(fn {_key, value} -> value end)
      |> Enum.sum()

    {:ok,
     socket
     |> assign(:result, result)
     |> assign(:acc_result, acc_result)}
  end

  def render(assigns) do
    ~H"""
    <div>
      Test Results: <%= @acc_result %>
    </div>
    """
  end
end

# <%= cond do %>
# <% @acc_result >= 12 and @acc_result <= 24 -> %>
# <p>Healthy</p>
# <% @acc_result >= 25 and @acc_result <= 37 -> %>
# <p>Mild</p>
# <% @acc_result >= 38 and @acc_result <= 50 -> %>
# <p>Moderate</p>
# <% @acc_result >= 62 and @acc_result <= 74 -> %>
# <p>Severe</p>
# <% @acc_result >= 75 and @acc_result <= 84 -> %>
# <p>Profound</p>
# <% true -> %>
# <p>default case</p>
# <% end %>
