defmodule Knapsack do
  @moduledoc """
  Solution for Knapsack problem.
  """
  use TypeCheck

  @doc """
  0/1 Knapsack Problem.

  Given N items where each item has some weight and profit associated with it
  and also given a bag with capacity W, [i.e., the bag can hold at most W weight in it].

  The task is to put the items into the bag such that the sum of profits associated with
  them is the maximum possible.

  And then return the sum of stored profits.

  Items here are indivisible, their entire weight/profit is added or removed from the bag.
  """
  @spec! zero_one_knapsack([%{profit: integer(), weight: integer()}], integer()) :: integer()
  def zero_one_knapsack(items, weight_limit) do
    keep_packing(items, weight_limit)
    |> Enum.map(& &1.profit)
    |> Enum.sum()
  end

  defp keep_packing(items, weight_limit) do
    {biggest_item, items_remaining} =
      items
      |> Enum.filter(&(&1.weight <= weight_limit))
      |> pop_biggest_profit()

    if is_nil(biggest_item) do
      []
    else
      weight_remaining = weight_limit - biggest_item.weight
      [biggest_item | keep_packing(items_remaining, weight_remaining)]
    end
  end

  defp pop_biggest_profit([]), do: {nil, []}

  defp pop_biggest_profit(items) do
    biggest = Enum.max_by(items, & &1.profit)
    rest = List.delete(items, biggest)
    {biggest, rest}
  end
end
