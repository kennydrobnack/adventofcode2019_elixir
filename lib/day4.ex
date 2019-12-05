defmodule Day4 do
  @moduledoc """
  Documentation for Day4 Advent of Code 2019.
  """

  def has_doubles(password) do
    String.graphemes(password) |> Enum.dedup() |> length < String.length(password)    
  end

  def has_descending(password) do
    smallest_number = String.graphemes(password) |> Enum.sort |> Enum.at(0)
    smallest_number != String.first(password)
  end

  def password_validator(password_number) do
    string_password = Integer.to_string(password_number)
    has_doubles(string_password) && has_descending(string_password) != true
  end

  def passwords_in_range(low, high) do
    range = low..high 
    Enum.filter(range, fn x -> password_validator(x) end) 
  end
end
