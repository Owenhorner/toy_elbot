defmodule ToyElbot.Instruction do
  def execute(:place, [x_position, y_position, direction]) do
  end

  def execute(:right, _) do
  end

  def execute(:left, _) do
  end

  def execute(:move, _) do
  end

  def execute(:report, _) do
  end

  def execute(:exit, _) do
  end

  def execute(_args, _coords) do
    {:error, "Invalid Command"}
  end
end
