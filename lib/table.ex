defmodule Table do
  def size(min_width \\ 0, max_width \\ 5, min_length \\ 0, max_length \\ 5) do
    %{min_width: min_width,
     max_width: max_width,
     min_length: min_length,
     max_length: max_length}
  end

  def directions() do
    [:north, :east, :south, :west, :north]
  end
end
