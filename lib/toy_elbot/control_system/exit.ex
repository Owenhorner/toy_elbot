defmodule ToyElbot.ControlSystem.Exit do
  def now() do
    GenServer.stop(:elbot)
  end
end
