defmodule ToyElbot.ControlSystem.TurnTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 2, y_position: 3, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end

  test "turn to the right" do
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 3, north\n"

    assert ToyElbot.ControlSystem.Turn.right == {:ok, "Successfully turned the elbot right"}
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 3, east\n"
  end

  test "turn to the left" do
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 3, north\n"

    assert ToyElbot.ControlSystem.Turn.left == {:ok, "Successfully turned the elbot left"}
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 3, west\n"
  end
end
