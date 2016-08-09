defmodule ToyElbot.ControlSystem.PlaceTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 1, y_position: 1, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end

  test "place the elbot successfully" do
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "1, 1, north\n"

    assert ToyElbot.ControlSystem.Place.at(["2", "2", "west"]) == {:ok, "Successfully placed elbot"}
    assert capture_io(fn -> ToyElbot.ControlSystem.Report.current_position end) == "2, 2, west\n"
  end
end
