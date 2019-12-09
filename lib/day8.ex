defmodule Day8 do
  @moduledoc """
  Documentation for Day8 Advent of Code 2019.

  This splits an encoded image file into layers and then does a checksum of the image.
  The checksum is the layer with the least number of 0's and then takes the number of 
  ones in that layer and multiplies it by the number of twos in that layer.
  """

  def image_size(width, heigth) do
     width * heigth
  end

  def count_digits_in_layer(layer_code, digit) do
     #Skip too small layers so we don't get tripped up on newline at end of file
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
    Enum.find_index(layers, fn x -> x == best_layer end) + 1
  end

  def read_layers_from_file(filename, width, heigth) do
    File.stream!(filename, [], image_size(width, heigth))
      |> Enum.to_list()
  end

  def figure_it_out(filename, width, heigth) do
    layers = read_layers_from_file(filename, width, heigth)
    target_layer = Enum.at(layers, layer_with_least_of_digit(layers, 0) -1)
    ones = count_digits_in_layer(target_layer, 1) |> IO.inspect(label: "ones")
    twos = count_digits_in_layer(target_layer, 2) |> IO.inspect(label: "twos")
    ones * twos
  end
end