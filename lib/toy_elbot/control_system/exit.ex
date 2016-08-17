defmodule ToyElbot.ControlSystem.Exit do
  alias ToyElbot.ControlSystem

  def now() do
    {ControlSystem.kill, "Successfully killed elbot"}
  end
end
