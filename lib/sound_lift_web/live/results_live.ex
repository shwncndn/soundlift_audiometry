defmodule SoundLiftWeb.ResultsLive do
  use SoundLiftWeb, :live_view

  alias SoundLift.Results

  def mount(params, _session, socket) do
    result = Results.get_result!(params["id"])
    {:ok, assign(socket, :result, result.id)}
    IO.inspect(result)

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
    <div>
      Test Results:
      <%= cond do %>
        <% @result.total_score >= 12 and @result.total_score <= 24 -> %>
          <p>Healthy</p>
        <% @result.total_score >= 25 and @result.total_score <= 37 -> %>
          <p>Mild</p>
        <% @result.total_score >= 38 and @result.total_score <= 50 -> %>
          <p>Moderate</p>
        <% @result.total_score >= 62 and @result.total_score <= 74 -> %>
          <p>Severe</p>
        <% @result.total_score >= 75 and @result.total_score <= 84 -> %>
          <p>Profound</p>
        <% true -> %>
          <p>default case</p>
      <% end %>
    </div>
    """
  end
end
