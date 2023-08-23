defmodule SoundLiftWeb.ResultsLive do
  use SoundLiftWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Test Results</h1>
    """
  end
end
