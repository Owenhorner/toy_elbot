defmodule ToyElbot.ControlSystem.Turn do
  def right() do
    GenServer.cast(:elbot, {:turn_right})
  end

  def left() do
    GenServer.cast(:elbot, {:turn_left})
  end

  def turn_elbot(elbot, :right) do
    Map.put(elbot,
     :direction,
     Enum.at(Table.directions,
      get_direction_index(:left, elbot) + 1))
  end

  def turn_elbot(elbot, :left) do
    Map.put(elbot,
     :direction,
     Enum.at(Enum.reverse(Table.directions),
      get_direction_index(:right, elbot) + 1))
  end

  defp get_direction_index(:left, elbot) do
    Enum.find_index(Table.directions,
     fn(x) -> x == Map.get(elbot, :direction) end)
  end

  defp get_direction_index(:right, elbot) do
    Enum.find_index(Enum.reverse(Table.directions),
     fn(x) -> x == Map.get(elbot, :direction) end)
  end
end
