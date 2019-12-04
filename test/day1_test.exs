defmodule Day1Test do
  use ExUnit.Case

  # For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
  # For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.
  # For a mass of 1969, the fuel required is 654.
  # For a mass of 100756, the fuel required is 33583.

  describe "fuel_checker" do
    test "it calculates fuel 2 required for mass of 12" do
      assert Day1.fuel_checker(12) == 2
    end

    test "it calculates fuel 2 required for mass of 14" do
      assert Day1.fuel_checker(14) == 2      
    end

    test "it calculates fuel 654 required for mass of 1969" do
      assert Day1.fuel_checker(1969) == 654      
    end

    test "it calculates fuel 33583 required for mass of 100756" do
      assert Day1.fuel_checker(100756) == 33583      
    end
  end

  describe "total_fuel_checker" do
    test "it calculates total fuel from all spacecraft" do
      assert Day1.total_fuel_checker([12, 14, 1969, 100756]) == 34241
    end
  end

  describe "total_fuel_check_from_file" do
    test "it calculates correct total fuel required given file with list of spacecraft masses" do
      assert Day1.total_fuel_check_from_file("#{current_folder}/day1_test_file1.txt") == 34241
    end
  end
end
