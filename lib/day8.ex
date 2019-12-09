defmodule Day8 do
  @moduledoc """
  Documentation for Day8 Advent of Code 2019.
  """

  def image_size(width, heigth) do
     width * heigth
  end

  def count_digits_in_layer(layer_code, digit) do
    if String.length(layer_code) < 2 do
      500000000
    else 
      String.graphemes(layer_code)
        |> Enum.filter(fn(x) -> Integer.to_string(digit) == x end)
        |> length()
    end
  end

  def layer_with_least_of_digit(layers, digit) do
    best_layer =
      layers
        |> Enum.min_by(fn x -> count_digits_in_layer(x, digit) end)
    Enum.find_index(layers, fn x -> x == best_layer end) + 1 |> IO.inspect(label: "best layer")
  end

  def read_layers_from_file(filename, width, heigth) do
    File.stream!(filename, [], image_size(width, heigth))
      |> Enum.to_list()
  end

  def figure_it_out(filename, width, heigth) do
    layers = read_layers_from_file(filename, width, heigth)
    target_layer = Enum.at(layers, layer_with_least_of_digit(layers, 0) -1) |> IO.inspect(label: "target_layer")
    ones = count_digits_in_layer(target_layer, 1) |> IO.inspect(label: "ones")
    twos = count_digits_in_layer(target_layer, 2) |> IO.inspect(label: "twos")
    ones * twos
  end
end