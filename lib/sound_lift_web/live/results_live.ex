defmodule SoundLiftWeb.ResultsLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(params, _session, socket) do

    result = Results.get_result!(params["id"])
    {:ok, assign(socket, :result, result.id)}

    acc_result =
    result
    |> Map.from_struct()
    |> Enum.filter(fn {_key, value} -> is_integer(value) end)
    |> Enum.map(fn {_key, value} -> value end)
    |> Enum.sum()

    {:ok,
      socket
    |> assign(:result, result)
    |> assign(:acc_result, acc_result)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
    Test Results:
    <%= cond do %>
    <% @acc_result < 500 -> %>
    <p>Hearing Loss</p>
    <% @acc_result > 500 -> %>
    <p>No Hearing Loss</p>
    <% true -> %>
    <p>default case</p>
    <% end %>
       </div>
    """
  end
end
