defmodule ToyElbot.InstructionTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 1, y_position: 1, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end

  test "execute a report" do
    assert capture_io(fn -> ToyElbot.Instruction.execute(:report, []) end) == "1, 1, north\n"
  end

  test "execute a place" do
    assert ToyElbot.Instruction.execute(:place, ["3","2","west"]) == {:ok, "Successfully placed elbot"}
    assert capture_io(fn -> ToyElbot.Instruction.execute(:report, []) end) == "3, 2, west\n"
  end

  test "execute a right turn" do
    assert ToyElbot.Instruction.execute(:right, []) == {:ok, "Successfully turned the elbot right"}
    assert capture_io(fn -> ToyElbot.Instruction.execute(:report, []) end) == "1, 1, east\n"
  end

  test "execute a left turn" do
    assert ToyElbot.Instruction.execute(:left, []) == {:ok, "Successfully turned the elbot left"}
    assert capture_io(fn -> ToyElbot.Instruction.execute(:report, []) end) == "1, 1, west\n"
  end

  test "returns error for unknown commands" do
    assert ToyElbot.Instruction.execute(:fallover, []) == {:error, "Invalid Command"}
  end
end
