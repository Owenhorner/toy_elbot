defmodule ToyElbot.Instruction do
  alias ToyElbot.ControlSystem
  alias ControlSystem.Move
  alias ControlSystem.Place
  alias ControlSystem.Turn
  alias ControlSystem.Report
  alias ControlSystem.Exit

  def execute(:place, coords) do
    Place.at(coords)
  end

  def execute(:right, _) do
    issue(&Turn.right/0)
  end

  def execute(:left, _) do
    issue(&Turn.left/0)
  end

  def execute(:move, _) do
    issue(&Move.forward/0)
  end

  def execute(:report, _) do
    issue(&Report.current_position/0)
  end

  def execute(:exit, _) do
    Exit.now
    exit(:shutdown)
  end

  def execute(_args, _coords) do
    {:error, "Invalid Command"}
  end

  defp issue(command) do
    with {:ok, _} <- Report.elbot_placed?,
    do: command.()
  end
end
