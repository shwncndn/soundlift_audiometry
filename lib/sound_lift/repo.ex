defmodule SoundLift.Repo do
  use Ecto.Repo,
    otp_app: :sound_lift,
    adapter: Ecto.Adapters.Postgres
end
