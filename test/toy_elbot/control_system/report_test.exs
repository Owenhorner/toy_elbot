defmodule ToyElbot.ControlSystem.ReportTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 2, y_position: 3, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end

  test "check if elbot is placed" do
    assert ToyElbot.ControlSystem.Report.elbot_placed? == {:ok, "ToyElbot is already placed"}
  end

  test "show current position of elbot" do
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 3, north\n"
  end
end
