defmodule ToyElbotTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 1, y_position: 1, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end

  test "test example one" do
    ToyElbot.Interface.send_command("place 0,0,north")
    ToyElbot.Interface.send_command("move")

    assert capture_io(fn -> ToyElbot.Interface.send_command("report") end) == "0, 1, north\n"
  end

  test "test example two" do
    ToyElbot.Interface.send_command("place 0,0,north")
    ToyElbot.Interface.send_command("left")

    assert capture_io(fn -> ToyElbot.Interface.send_command("report") end) == "0, 0, west\n"
  end

  test "test example three" do
    ToyElbot.Interface.send_command("place 1,2,east")
    ToyElbot.Interface.send_command("move")
    ToyElbot.Interface.send_command("move")
    ToyElbot.Interface.send_command("left")
    ToyElbot.Interface.send_command("move")

    assert capture_io(fn -> ToyElbot.Interface.send_command("report") end) == "3, 3, north\n"
  end
end
