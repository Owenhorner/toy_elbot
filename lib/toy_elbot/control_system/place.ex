defmodule ToyElbot.ControlSystem.Place do
  alias ToyElbot.ControlSystem

  use GenServer

  def at([x, y, direction]) do
    cond do
      valid_placement?(x, y, direction) ->
        {ControlSystem.place(x, y, direction), "Successfully placed elbot"}
      true -> :placement_error
    end
  end

  def at(_) do
    :placement_error
  end

  def place_elbot(elbot, x, y, direction) do
    elbot
    |> Map.put(:x_position, x)
    |> Map.put(:y_position, y)
    |> Map.put(:direction, direction)
  end

  def valid_placement?(x,y,direction) do
    String.match?(x, ~r/\d/) &&
    String.match?(y, ~r/\d/) &&
    Enum.member?(Table.directions, String.to_atom(String.downcase(direction)))
  end
end
