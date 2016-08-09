defmodule ToyElbot.ControlSystem.MoveTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 2, y_position: 3, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end

  test "move elbot forward one space" do
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 3, north\n"

    assert ToyElbot.ControlSystem.Move.forward == {:ok, "Successfully moved elbot"}
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 4, north\n"
  end
end
