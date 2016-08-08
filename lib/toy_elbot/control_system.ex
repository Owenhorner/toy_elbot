defmodule ToyElbot.ControlSystem do
  alias ToyElbot.ControlSystem
  alias ControlSystem.Move
  alias ControlSystem.Place
  alias ControlSystem.Turn
  alias ControlSystem.Report

  use GenServer

  def start_link(state, opts \\ []) do
    {:ok, _} = GenServer.start(__MODULE__, state, opts)
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
     Place.place_elbot(elbot,
      String.to_integer(x),
      String.to_integer(y),
      String.to_atom(String.downcase(direction)))}
  end

  def handle_cast({:place, _}, elbot) do
    {:noreply, elbot}
  end


  def handle_cast({:turn_right}, elbot) do
    {:noreply, Turn.turn_elbot(elbot, :right)}
  end

  def handle_cast({:turn_left}, elbot) do
    {:noreply, Turn.turn_elbot(elbot, :left)}
  end

  def handle_cast({:move}, elbot) do
    elbot = Move.one_space(elbot)
    {:noreply, elbot}
  end

  def handle_call({:report}, _from, elbot) do
    {:reply, elbot, elbot}
  end
end
