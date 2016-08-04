defmodule ToyElbot.ControlSystem.Move do
  def forward(elbot) do
    move_one_space(elbot)
  end

  defp move_one_space(%{x_position: x, y_position: y, direction: :north}) do
    %{x_position: x, y_position: step(y, 1), direction: :north}
  end

  defp move_one_space(%{x_position: x, y_position: y, direction: :east}) do
    %{x_position: step(x, 1), y_position: y, direction: :east}
  end

  defp move_one_space(%{x_position: x, y_position: y, direction: :south}) do
    %{x_position: x, y_position: step(y, -1), direction: :south}
  end

  defp move_one_space(%{x_position: x, y_position: y, direction: :west}) do
    %{x_position: step(x, -1), y_position: y, direction: :west}
  end

  defp step(position, size) do
    position + size
  end
end
