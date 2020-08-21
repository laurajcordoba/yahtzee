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
      iex> Yahtzee.score(6, [1,6,2,6,3])
      12
      iex> Yahtzee.score(5, [1,5,2,5,3])
      10
      iex> Yahtzee.score(:full_house, [2,2,2,5,5])
      16
  """
  def score(:chance, dice) do
    Enum.sum(dice)
  end

  def score(:yahtzee, dice) do
    dice
    |> Enum.uniq()
    |> length()
    |> yahtzee_value()
  end

  def score(pair, dice) when is_integer(pair) and pair <= 6 and pair >= 1 do
    dice
    |> Enum.filter(&(&1 == pair))
    |> Enum.sum()
  end

  def score(:pair, dice) do
    dice
    |> group_values(2)
    |> score_pairs(1)
  end

  def score(:two_pair, dice) do
    dice
    |> group_values(2)
    |> score_pairs(2)
  end

  def score(:three_kind, dice) do
    dice
    |> group_values(3)
    |> score_pairs(1)
  end

  def score(:four_kind, dice) do
    dice
    |> group_values(4)
    |> score_pairs(1)
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
    pair = group_values(dice, 2)
    three_pair = group_values(dice, 3)

    full_house_calculation(pair, three_pair)
  end

  # Private Methods
  defp group_values(dice, lenght_list) do
    dice
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn {_, list} -> length(list) == lenght_list end)
  end

  defp sum_group_pairs([{_x, list} | tail]) do
    Enum.sum(list) + sum_group_pairs(tail)
  end

  defp sum_group_pairs(list) do
    Enum.sum(list)
  end

  defp yahtzee_value(value) when value == 1 do
    50
  end

  defp yahtzee_value(_value) do
    0
  end

  defp score_pairs(result, value) when length(result) == value do
    sum_group_pairs(result)
  end

  defp score_pairs(_result, _value) do
    0
  end

  defp full_house_calculation(pair, three_pair) when length(pair) == 1 and length(three_pair) == 1 do
    sum_group_pairs(pair) + sum_group_pairs(three_pair)
  end

  defp full_house_calculation(_pair, _three_pair) do
    0
  end

end
