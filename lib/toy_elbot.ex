defmodule ToyElbot do
  alias ToyElbot.Interface

  defstruct x_position: nil, y_position: nil, direction: nil

  def main(_args) do
    initialize_elbot
    Interface.start
  end

  defp initialize_elbot do
    {:ok, _} = GenServer.start_link(ToyElbot.ControlSystem, %__MODULE__{}, name: :elbot)
  end
end
