defmodule SoundLiftWeb.Results.IndexLive do
  use SoundLiftWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
~H"""

"""
  end


end

# TODO: Use :total_score virtual field to sum average of a single user's results
# List all tests taken by user
