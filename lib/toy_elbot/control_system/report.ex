defmodule ToyElbot.ControlSystem.Report do
  def current_position() do
    display_position(GenServer.call(:elbot, {:report}))
  end

  defp display_position(elbot) do
    IO.write("#{Map.get(elbot, :x_position)}, #{Map.get(elbot, :y_position)}, #{Map.get(elbot, :direction)}\n")
  end
end
