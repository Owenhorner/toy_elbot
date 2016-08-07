defmodule ToyElbot.ControlSystem do
  alias ToyElbot.ControlSystem
  alias ControlSystem.Move
  use GenServer

  def start_link(state, opts \\ []) do
    {:ok, _} = GenServer.start(__MODULE__, state, opts)
  end

  def place([x, y, direction]) do
    GenServer.cast(:elbot, {:place, x, y, direction})
  end

  def turn_right() do
    GenServer.cast(:elbot, {:turn_right})
  end

  def turn_left() do
    GenServer.cast(:elbot, {:turn_left})
  end

  def move() do
    GenServer.cast(:elbot, {:move})
  end

  def report() do
    display_position(GenServer.call(:elbot, {:report}))
  end

  def kill_elbot() do
    GenServer.stop(:elbot)
  end

  ### Server functions ###

  def init([]) do
    {:ok, %{x_position: nil, y_position: nil, direction: nil} }
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:place, x, y, direction}, elbot) do
    {:noreply,
     place_elbot(elbot,
      String.to_integer(x),
      String.to_integer(y),
      String.to_atom(String.downcase(direction)))}
  end


  def handle_cast({:place, _}, elbot) do
    {:noreply, elbot}
  end


  def handle_cast({:turn_right}, elbot) do
    {:noreply, turn_elbot(elbot, :right)}
  end

  def handle_cast({:turn_left}, elbot) do
    {:noreply, turn_elbot(elbot, :left)}
  end

  def handle_cast({:move}, elbot) do
    elbot = Move.forward(elbot)
    {:noreply, elbot}
  end

  def handle_call({:report}, _from, elbot) do
    {:reply, elbot, elbot}
  end

  defp turn_elbot(elbot, :right) do
    Map.put(elbot,
     :direction,
     Enum.at(directions,
      get_direction_index(:left, elbot) + 1))
  end

  defp turn_elbot(elbot, :left) do
    Map.put(elbot,
     :direction,
     Enum.at(Enum.reverse(directions),
      get_direction_index(:right, elbot) + 1))
  end

  defp get_direction_index(:left, elbot) do
    Enum.find_index(directions,
     fn(x) -> x == Map.get(elbot, :direction) end)
  end

  defp get_direction_index(:right, elbot) do
    Enum.find_index(Enum.reverse(directions),
     fn(x) -> x == Map.get(elbot, :direction) end)
  end

  defp place_elbot(elbot, x, y, direction) do
    elbot
    |> Map.put(:x_position, x)
    |> Map.put(:y_position, y)
    |> Map.put(:direction, direction)
  end

  defp directions() do
    [:north, :east, :south, :west, :north]
  end

  defp display_position(elbot) do
    IO.write("#{Map.get(elbot, :x_position)}, #{Map.get(elbot, :y_position)}, #{Map.get(elbot, :direction)}\n")
  end
end
