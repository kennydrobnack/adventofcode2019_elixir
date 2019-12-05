defmodule Day4Test do
  use ExUnit.Case

#Passwords 
#   It is a six-digit number.
#   The value is within the range given in your puzzle input.
#   Two adjacent digits are the same (like 22 in 122345).
#   Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).

# Other than the range rule, the following are true:

#   111111 meets these criteria (double 11, never decreases).
#   223450 does not meet these criteria (decreasing pair of digits 50).
#   123789 does not meet these criteria (no double).

  describe "password_validator" do
    test "it returns true if password is 111111" do
      assert Day4.password_validator(111111) == true      
    end

    test "it returns false if there are no doubles" do
      assert Day4.password_validator(123789) == false
    end

    test "it returns false if there are any decreases" do
      assert Day4.password_validator(223450) == false      
    end

    test "it returns true if password has doubles and no decreases like 122345" do
      assert Day4.password_validator(122345) == true      
    end

    test "it says 111123 is valid" do
      assert Day4.password_validator(111123) == true
    end

    test "it says 135679 is invalid - no double" do
      assert Day4.password_validator(135679) == false
    end

    test "it says 135449 is invalid - double with descending number in the middle" do
      assert Day4.password_validator(135449) == false
    end
  end
end
