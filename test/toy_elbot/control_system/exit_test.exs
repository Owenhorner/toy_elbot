defmodule ToyElbot.ConstrolSystem.ExitTest do
  use ExUnit.Case

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 1, y_position: 1, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end

  test "stops the elbot" do
    assert ToyElbot.ControlSystem.Exit.now == {:ok, "Successfully killed elbot"}
  end
end
