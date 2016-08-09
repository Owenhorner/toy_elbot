defmodule ToyElbot.ControlSystem.Exit do
  def now() do
    {GenServer.stop(:elbot), "Successfully killed elbot"}
  end
end
