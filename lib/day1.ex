defmodule Day1 do
  @moduledoc """
  Documentation for Day1 Advent of Code 2019.
  """

  def fuel_checker(mass) do
      ((mass / 3)
      |> floor) -2
  end

  def total_fuel_checker(mass_list) do
    Enum.reduce(mass_list, 0, fn(x, acc) -> acc + fuel_checker(x) end) 
  end

  def total_fuel_check_from_file(file_path) do
    mass_of_strings = File.read!(file_path) 
        |> String.split("\n", trim: true)
    masses = Enum.map(mass_of_strings, fn(s) -> String.to_integer(s) end)
    total_fuel_checker(masses)
  end
end
