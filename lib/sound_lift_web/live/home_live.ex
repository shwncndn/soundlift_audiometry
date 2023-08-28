defmodule SoundLiftWeb.HomeLive do
  use SoundLiftWeb, :live_view

  def mount(_params, _session, socket) do
  {:ok, socket}
  end

  def render(assigns) do
~H"""
<body>
  <h1></h1>
  <h2>Please find a quiet place.</h2>
  <h2>Background noise will affect your results.</h2>
  <h2>When ready, click the button below.</h2>

  <.button class="rounded-full text-sm my-8">Take the Test!</.button>
</body>

"""
  end
end
