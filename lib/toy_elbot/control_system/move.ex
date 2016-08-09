defmodule ToyElbot.ControlSystem.Move do
  def forward() do
    {GenServer.cast(:elbot, {:move}), "Successfully moved elbot"}
  end

  def one_space(%{x_position: x, y_position: y, direction: :north}) do
    %ToyElbot{x_position: x, y_position: step(y, 1, :max_length), direction: :north}
  end

  def one_space(%{x_position: x, y_position: y, direction: :east}) do
    %ToyElbot{x_position: step(x, 1, :max_width), y_position: y, direction: :east}
  end

  def one_space(%{x_position: x, y_position: y, direction: :south}) do
    %ToyElbot{x_position: x, y_position: step(y, -1, :min_length), direction: :south}
  end

  def one_space(%{x_position: x, y_position: y, direction: :west}) do
    %ToyElbot{x_position: step(x, -1, :min_width), y_position: y, direction: :west}
  end

  defp step(position, size, edge) do
    new_position(position != table_edge(edge), position, size)
  end

  defp new_position(true, position, size) do
    position + size
  end

  defp new_position(false, position, size) do
    position
  end

  defp table_edge(table_size \\ &Table.size/0, edge) do
    Map.get(table_size.(), edge)
  end
end
