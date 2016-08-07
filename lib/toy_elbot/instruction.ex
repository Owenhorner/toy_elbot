defmodule ToyElbot.Instruction do
  alias ToyElbot.ControlSystem

  def execute(:place, coords) do
    valid_execution?(ControlSystem.place(coords))
  end

  def execute(:right, _) do
    valid_execution?(ControlSystem.turn_right)
  end

  def execute(:left, _) do
    valid_execution?(ControlSystem.turn_left)
  end

  def execute(:move, _) do
    valid_execution?(ControlSystem.move)
  end

  def execute(:report, _) do
    valid_execution?(ControlSystem.report)
  end

  def execute(:exit, _) do
    valid_execution?(ControlSystem.report)
    exit(:shutdown)
  end

  def execute(_args, _coords) do
    {:error, "Invalid Command"}
  end

  defp valid_execution?(:ok) do
    {:ok, "command execution successful"}
  end

  defp valid_execution?(_) do
    {:error, "Something went wrong"}
  end
end
