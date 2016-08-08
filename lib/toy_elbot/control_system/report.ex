defmodule ToyElbot.ControlSystem.Report do
  def current_position() do
    display_position(GenServer.call(:elbot, {:report}))
  end

  def elbot_placed? do
    check_placement(GenServer.call(:elbot, {:report}))
  end

  defp check_placement(%{x_position: nil, y_position: nil, direction: nil}) do
    {:error, "ToyElbot has not been placed"}
  end

  defp check_placement(%{x_position: _x, y_position: _y, direction: _direction}) do
    {:ok, "ToyElbot is already placed"}
  end

  defp display_position(elbot) do
    IO.write("#{Map.get(elbot, :x_position)}, #{Map.get(elbot, :y_position)}, #{Map.get(elbot, :direction)}\n")
  end
end
