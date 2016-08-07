defmodule TableTest do
  use ExUnit.Case

  test "default size is 5x5" do
    assert Table.size() == %{
     min_width: 0,
     max_width: 5,
     min_length: 0,
     max_length: 5
   }
  end
end
