defmodule ToyElbot.Interface do
  alias ToyElbot.Instruction

  def start do
    IO.puts input_text
    read
  end

  def read do
    case IO.read(:stdio, :line) do
      :eof -> :ok
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
        send_command(data)
        read
    end
  end

  def send_command(data) do
    String.split(data, [" ", ",", "\n"])
    |> Enum.reject(fn(x) -> x == "" end)
    |> get_args
  end

  defp get_args(input) do
    Instruction.execute(
      String.to_atom(String.downcase(Enum.at(input, 0))),
      Enum.slice(input, 1, 3)
    )
  end

  defp input_text do
    "PLACE X,Y,F to begin,
RIGHT to turn your robot RIGHT,
LEFT to turn your robot LEFT,
MOVE to move your robot in the direction is facing,
REPORT to get the co-ordinates of your robot,
EXIT to turn off your robot."
  end
end
