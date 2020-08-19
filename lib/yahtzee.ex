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
    dice
    |> Enum.reject(fn x -> x !== 6 end)
    |> Enum.sum()
  end

  def score(:fives, dice) do
    dice
    |> Enum.reject(fn x -> x !== 5 end)
    |> Enum.sum()
  end

  def score(:fours, dice) do
    dice
    |> Enum.reject(fn x -> x !== 4 end)
    |> Enum.sum()
  end

  def score(:threes, dice) do
    dice
    |> Enum.reject(fn x -> x !== 3 end)
    |> Enum.sum()
  end

  def score(:twos, dice) do
    dice
    |> Enum.reject(fn x -> x !== 2 end)
    |> Enum.sum()
  end

  def score(:ones, dice) do
    dice
    |> Enum.reject(fn x -> x !== 1 end)
    |> Enum.sum()
  end

  def score(:pair, dice) do
    result = dice
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn {_, list} -> length(list) == 2 end)

    if length(result) == 1 do sum_pair(result) else 0 end
  end

  def score(:two_pair, dice) do
    result = dice
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn {_, list} -> length(list) == 2 end)

    if length(result) == 2 do sum_pair(result) else 0 end
  end

  def score(:three_kind, dice) do
    result = dice
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn {_, list} -> length(list) == 3 end)

    if length(result) == 1 do sum_pair(result) else 0 end
  end

  def score(:four_kind, dice) do
    result = dice
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn {_, list} -> length(list) == 4 end)

      if length(result) == 1 do sum_pair(result) else 0 end
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
    pair = dice
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn {_, list} -> length(list) == 2 end)

    three_pair = dice
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn {_, list} -> length(list) == 3 end)

    if length(pair) == 1 and length(three_pair) == 1 do sum_pair(pair) + sum_pair(three_pair) else 0 end
  end

  # Internal Methods
  def sum_pair([{_x, list} | tail]) do
    Enum.sum(list) + sum_pair(tail)
  end

  def sum_pair(list) do
    Enum.sum(list)
  end

end
