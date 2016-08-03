defmodule ToyElbot do
  alias ToyElbot.Interface

  def main(_args) do
    initialize_elbot
    Interface.start
  end

  defp initialize_elbot do
    {:ok, _} = GenServer.start_link(ToyElbot.ControlSystem, [], name: :elbot)
  end
end
