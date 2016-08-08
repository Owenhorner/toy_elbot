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

  def send_command("\n") do
    IO.write("You must enter a command for elbot\n")
  end

  def send_command(data) do
    String.split(data, [" ", ",", "\n"])
    |> Enum.reject(fn(x) -> x == "" end)
    |> send_instruction_to_elbot
    |> assess_results
  end

  defp assess_results({:error, error_message}) do
    IO.write("#{error_message}\n")
  end

  defp assess_results(_) do
  end

  defp send_instruction_to_elbot(input) do
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
