defmodule SoundLift.Volume do
  defstruct [:volume]

  def new(string \\ "1") do
    %__MODULE__{volume: String.to_integer(string)}
  end

  def inc(%__MODULE__{volume: volume} = total_volume, volume_stage \\ 1)
      when volume + volume_stage <= 6 do
    %{total_volume | volume: volume + volume_stage}
  end

  def dec(%__MODULE__{volume: volume} = total_volume, volume_stage \\ 1)
      when volume - volume_stage >= 1 do
    %{total_volume | volume: volume - volume_stage}
  end

  def show(total_volume) do
    total_volume.volume
  end
end
