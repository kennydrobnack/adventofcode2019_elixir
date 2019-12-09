defmodule Day8 do
  @moduledoc """
  Documentation for Day8 Advent of Code 2019.
  """

  def image_size(heigth, width) do
    heigth * width
  end

  def count_digits_in_layer(layer_code, digit) do
    String.graphemes(layer_code) 
      |> Enum.filter(fn(x) -> Integer.to_string(digit) == x end)
      |> length
  end
end