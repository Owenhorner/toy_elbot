defmodule ToyElbot.ControlSystem.Report do
  alias ToyElbot.ControlSystem

  def current_position() do
    display_position(ControlSystem.report)
  end

  def elbot_placed? do
    check_placement(ControlSystem.report)
  end

  defp check_placement(%{x_position: nil, y_position: nil, direction: nil}) do
    {:error, "ToyElbot has not been placed"}
  end

  defp check_placement(%{x_position: _x, y_position: _y, direction: _direction}) do
    {:ok, "ToyElbot is already placed"}
  end

  defp display_position(elbot) do
    IO.write("#{elbot.x_position}, #{elbot.y_position}, #{elbot.direction}\n")
  end
end
