defmodule ToyElbot.ControlSystemTest do
  use ExUnit.Case

  setup do
    {:ok, elbot} = GenServer.start_link(ToyElbot.ControlSystem, %{x_position: 1, y_position: 1, direction: :north}, name: :elbot)
    {:ok, elbot: elbot}
  end
end
