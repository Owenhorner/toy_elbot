defmodule ToyElbot.Instruction do
  alias ToyElbot.ControlSystem

  def execute(:place, coords) do
    ControlSystem.place(coords)
  end

  def execute(:right, _) do
    ControlSystem.turn_right
  end

  def execute(:left, _) do
    ControlSystem.turn_left
  end

  def execute(:move, _) do
  end

  def execute(:report, _) do
    ControlSystem.report
  end

  def execute(:exit, _) do
  end

  def execute(_args, _coords) do
    {:error, "Invalid Command"}
  end
end
