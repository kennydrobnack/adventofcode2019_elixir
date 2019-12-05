defmodule Day4 do
  @moduledoc """
  Documentation for Day4 Advent of Code 2019.
  """

  def has_doubles?(password) do
    String.graphemes(password) |> Enum.dedup() |> length != String.length(password)
  end

  def has_ascending?(password) do
    digits = String.graphemes(password) |> Enum.map(&String.to_integer/1)
    Enum.reduce(digits, {true, 0}, fn x, acc ->
      if(elem(acc, 0) == true && elem(acc, 1) <= x) do
        acc = {true, x}
      else
        acc = {false, x}
      end
    end)
    |> elem(0)
  end

  def password_validator(password_number) do
    string_password = Integer.to_string(password_number)
    has_doubles?(string_password) && has_ascending?(string_password)
  end

  def passwords_in_range(low, high) do
    range = low..high 
    Enum.filter(range, fn x -> password_validator(x) end)
  end
end
