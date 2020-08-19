defmodule Yahtzee do
  @moduledoc """
  Documentation for `Yahtzee`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Yahtzee.hello()
      :world

  """
  def hello do
    :world
  end

  def score(:chance, dice) do
    Enum.sum(dice)
  end

  def score(:yahtzee, dice) do
    len = dice
    |> Enum.uniq()
    |> length()

    if len == 1 do 50 else 0 end
  end

  def score(:sixs, dice) do
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

  # def score(:pair, dice) do
  #   result = dice
  #   |> Enum.group_by(&(&1))
  #   |> Enum.filter(fn {_, list} -> length(list) == 1 end)

  #   sum_pair(result)
  # end

  def score(:two_pair, dice) do
    result = dice
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn {_, list} -> length(list) == 2 end)

    sum_pair(result)
  end

  # def score(:three_kind, dice) do

  # end

  # def score(:four_kind, dice) do

  # end

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

  # def score(:full_house, dice) do
  # end

  def sum_pair([{_x, list} | tail]) do
    Enum.sum(list) + sum_pair(tail)
  end

  def sum_pair(list) do
    Enum.sum(list)
  end

  # def score(:yahtzee, dice) do
  #   len = dice
  #   |> Enum.uniq()
  #   |> length()

  #   if len == 1 do 50 else 0 end
  # end

  # def score(:yahtzee, dice) do
  #   when List.len(Enum.unique(dice)) >= 1 do 0 end
  # end
end
