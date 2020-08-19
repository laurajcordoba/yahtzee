defmodule Yahtzee do
  @moduledoc """
  Documentation for `Yahtzee`.
  """

  @doc """
  Scoring dice rolls per category of roll (i.e. yahtzee, chance)

  ## Examples

      iex> Yahtzee.score(:chance, [1,2,3,4,5])
      15
      iex> Yahtzee.score(:yahtzee, [2,2,2,2,2])
      50
      iex> Yahtzee.score(:sixes, [1,6,2,6,3])
      12
      iex> Yahtzee.score(:fives, [1,5,2,5,3])
      10
      iex> Yahtzee.score(:full_house, [2,2,2,5,5])
      16
  """
  def score(:chance, dice) do
    Enum.sum(dice)
  end

  def score(:yahtzee, dice) do
    len = dice
    |> Enum.uniq()
    |> length()

    if len == 1 do 50 else 0 end
  end

  def score(:sixes, dice) do
    sum_value_occurrencies(6, dice)
  end

  def score(:fives, dice) do
    sum_value_occurrencies(5, dice)
  end

  def score(:fours, dice) do
    sum_value_occurrencies(4, dice)
  end

  def score(:threes, dice) do
    sum_value_occurrencies(3, dice)
  end

  def score(:twos, dice) do
    sum_value_occurrencies(2, dice)
  end

  def score(:ones, dice) do
    sum_value_occurrencies(1, dice)
  end

  def score(:pair, dice) do
    result = group_values(2, dice)

    if length(result) == 1 do sum_group_pairs(result) else 0 end
  end

  def score(:two_pair, dice) do
    result = group_values(2, dice)

    if length(result) == 2 do sum_group_pairs(result) else 0 end
  end

  def score(:three_kind, dice) do
    result = group_values(3, dice)

    if length(result) == 1 do sum_group_pairs(result) else 0 end
  end

  def score(:four_kind, dice) do
    result = group_values(4, dice)

    if length(result) == 1 do sum_group_pairs(result) else 0 end
  end

  def score(:small_straight, [1, 2, 3, 4, 5]) do
    15
  end

  def score(:small_straight, _dice) do
    0
  end

  def score(:large_straight, [2, 3, 4, 5, 6]) do
    20
  end

  def score(:large_straight, _dice) do
    0
  end

  def score(:full_house, dice) do
    pair = group_values(2, dice)
    three_pair = group_values(3, dice)

    if length(pair) == 1 and length(three_pair) == 1 do sum_group_pairs(pair) + sum_group_pairs(three_pair) else 0 end
  end

  # Internal Methods
  def sum_value_occurrencies(value, dice) do
    dice
    |> Enum.reject(fn x -> x !== value end)
    |> Enum.sum()
  end

  def group_values(lenght_list, dice) do
    dice
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn {_, list} -> length(list) == lenght_list end)
  end

  def sum_group_pairs([{_x, list} | tail]) do
    Enum.sum(list) + sum_group_pairs(tail)
  end

  def sum_group_pairs(list) do
    Enum.sum(list)
  end

end
