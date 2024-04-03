defmodule Knapsack do
  @moduledoc """
  Knapsack solution.
  """

  @doc """
  0/1 Knapsack Problem.

  Given N items where each item has some weight and profit associated with it
  and also given a bag with capacity W, [i.e., the bag can hold at most W weight in it].

  The task is to put the items into the bag such that the sum of profits associated with
  them is the maximum possible.

  And then return the sum of stored profits.

  Items here are indivisible, their entire weight/profit is added or removed from the bag.
  """
  def zero_one_knapsack(items, weight_limit) do
    keep_packing(items, weight_limit)
    |> Enum.map(& &1.profit)
    |> Enum.sum()
  end

  defp keep_packing([], _weight_limit) do
    []
  end

  defp keep_packing(items, weight_limit) do
    {biggest_item, items_remaining} =
      items
      |> Enum.filter(&(&1.weight <= weight_limit))
      |> pop_biggest_profit()

    weight_remaining =
      unless is_nil(biggest_item) do
        weight_limit - biggest_item.weight
      end

    if weight_remaining do
      [biggest_item | keep_packing(items_remaining, weight_remaining)]
    else
      keep_packing(items_remaining, weight_limit)
    end
  end

  defp pop_biggest_profit(items) when length(items) == 0 do
    {nil, []}
  end

  defp pop_biggest_profit(items) do
    biggest = Enum.max_by(items, & &1.profit)
    rest = List.delete(items, biggest)
    {biggest, rest}
  end
end