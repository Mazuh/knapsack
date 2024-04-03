defmodule KnapsackTest do
  use ExUnit.Case
  doctest Knapsack

  import Knapsack

  describe "0/1 Knapsack Problem" do
    # https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/

    test "W = 4, profit[] = {1, 2, 3}, weight[] = {4, 5, 1}" do
      objects = [
        %{profit: 1, weight: 4},
        %{profit: 2, weight: 5},
        %{profit: 3, weight: 1}
      ]

      weight_limit = 4

      assert zero_one_knapsack(objects, weight_limit) == 3
    end

    test "W = 3, profit[] = {1, 2, 3}, weight[] = {4, 5, 6}" do
      objects = [
        %{profit: 1, weight: 4},
        %{profit: 2, weight: 5},
        %{profit: 3, weight: 6}
      ]

      weight_limit = 3

      assert zero_one_knapsack(objects, weight_limit) == 0
    end

    test "W = 50, profit[] = {60, 100, 120}, weight[] = {10, 20, 30}" do
      objects = [
        %{profit: 60, weight: 10},
        %{profit: 100, weight: 20},
        %{profit: 120, weight: 30}
      ]

      weight_limit = 50

      assert zero_one_knapsack(objects, weight_limit) == 220
    end
  end
end
