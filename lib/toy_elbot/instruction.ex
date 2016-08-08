defmodule ToyElbot.Instruction do
  alias ToyElbot.ControlSystem
  alias ControlSystem.Move
  alias ControlSystem.Place
  alias ControlSystem.Turn
  alias ControlSystem.Report
  alias ControlSystem.Exit

  def execute(:place, coords) do
    valid_execution?(Place.at(coords))
  end

  def execute(:right, _) do
    valid_execution?(Turn.right)
  end

  def execute(:left, _) do
    valid_execution?(Turn.left)
  end

  def execute(:move, _) do
    valid_execution?(Move.forward)
  end

  def execute(:report, _) do
    valid_execution?(Report.current_position)
  end

  def execute(:exit, _) do
    valid_execution?(Exit.kill_elbot)
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
