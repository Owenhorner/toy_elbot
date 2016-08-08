defmodule ToyElbot.ConstrolSystem.Exit do
  def kill_elbot() do
    GenServer.stop(:elbot)
  end
end
