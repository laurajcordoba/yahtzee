defmodule YahtzeeTest do

  use ExUnit.Case
  doctest Yahtzee

  describe "chance" do
    test "not match" do
      assert Yahtzee.score(:chance, []) == 0
    end

    test "match" do
      assert Yahtzee.score(:chance, [1, 2, 3, 4, 5]) == 15
    end
  end

  describe "yahtzee" do
    test "not all match" do
      assert Yahtzee.score(:yahtzee, [1, 5, 3, 2, 1]) == 0
    end

    test "all 6s match" do
      assert Yahtzee.score(:yahtzee, [6, 6, 6, 6, 6]) == 50
    end

    test "all 5s match" do
      assert Yahtzee.score(:yahtzee, [5, 5, 5, 5, 5]) == 50
    end

    test "all 4s match" do
      assert Yahtzee.score(:yahtzee, [4, 4, 4, 4, 4]) == 50
    end

    test "all 3s match" do
      assert Yahtzee.score(:yahtzee, [3, 3, 3, 3, 3]) == 50
    end

    test "all 2s match" do
      assert Yahtzee.score(:yahtzee, [2, 2, 2, 2, 2]) == 50
    end

    test "all 1s match" do
      assert Yahtzee.score(:yahtzee, [1, 1, 1, 1, 1]) == 50
    end
  end

  describe "placed" do
    test "on sixes match" do
      assert Yahtzee.score(6, [1, 1, 6, 6, 4]) == 12
    end

    test "on sixes not match" do
      assert Yahtzee.score(6, [1, 2, 3, 3, 4]) == 0
    end

    test "on fives match" do
      assert Yahtzee.score(5, [5, 5, 2, 4, 5]) == 15
    end

    test "on fives not match" do
      assert Yahtzee.score(5, [1, 2, 2, 4, 3]) == 0
    end

    test "on fours match" do
      assert Yahtzee.score(4, [1, 1, 2, 3, 4]) == 4
    end

    test "on fours not match" do
      assert Yahtzee.score(4, [1, 1, 2, 3, 2]) == 0
    end

    test "on threes match" do
      assert Yahtzee.score(3, [1, 3, 3, 3, 4]) == 9
    end

    test "on threes not match" do
      assert Yahtzee.score(3, [1, 2, 4, 1, 4]) == 0
    end

    test "on twos match" do
      assert Yahtzee.score(2, [2, 3, 2, 5, 1]) == 4
    end

    test "on twos not match" do
      assert Yahtzee.score(2, [1, 3, 6, 5, 1]) == 0
    end

    test "on ones match" do
      assert Yahtzee.score(1, [3, 3, 1, 4, 5]) == 1
    end

    test "on ones not match" do
      assert Yahtzee.score(1, [3, 3, 3, 4, 5]) == 0
    end
  end

  describe "pair" do
    test "pair match 1" do
      assert Yahtzee.score(:pair, [3, 3, 3, 4, 4]) == 8
    end

    test "pair match 2" do
      assert Yahtzee.score(:pair, [3, 3, 1, 2, 4]) == 6
    end

    test "pair match 3" do
      assert Yahtzee.score(:pair, [1, 1, 3, 2, 6 ]) == 2
    end

    test "pair not match 1" do
      assert Yahtzee.score(:pair, [3, 3, 3, 4, 1]) == 0
    end

    test "pair not match 2" do
      assert Yahtzee.score(:pair, [3, 3, 3, 3, 1]) == 0
    end
  end


  describe "two pairs" do
    test "match" do
      assert Yahtzee.score(:two_pair, [3, 3, 2, 4, 4]) == 14
    end

    test "not match" do
      assert Yahtzee.score(:two_pair, [3, 3, 3, 4, 4]) == 0
    end

    test "not match with no pair values" do
      assert Yahtzee.score(:two_pair, [1, 3, 2, 5, 4]) == 0
    end
  end

  describe "three of a kind" do
    test "match" do
      assert Yahtzee.score(:three_kind, [3, 3, 3, 4, 5]) == 9
    end

    test "match 2" do
      assert Yahtzee.score(:three_kind, [2, 1, 2, 4, 2]) == 6
    end

    test "not match" do
      assert Yahtzee.score(:three_kind, [3, 3, 4, 5, 6]) == 0
    end

    test "not match 2" do
      assert Yahtzee.score(:three_kind, [3, 3, 3, 3, 1]) == 0
    end
  end

  describe "four of a kind" do
    test "match" do
      assert Yahtzee.score(:four_kind, [2, 2, 2, 2, 5]) == 8
    end

    test "not match" do
      assert Yahtzee.score(:four_kind, [2, 2, 2, 5, 5]) == 0
    end

    test "not match 2" do
      assert Yahtzee.score(:four_kind, [2, 2, 2, 2, 2]) == 0
    end
  end

  describe "small straight" do
    test "match" do
      assert Yahtzee.score(:small_straight, [1, 2, 3, 4, 5]) == 15
    end

    test "not match" do
      assert Yahtzee.score(:small_straight, [2, 2, 2, 4, 5]) == 0
    end
  end

  describe "large straight" do
    test "match" do
      assert Yahtzee.score(:large_straight, [2, 3, 4, 5, 6]) == 20
    end

    test "not match" do
      assert Yahtzee.score(:large_straight, [2, 3, 3, 2, 6]) == 0
    end
  end

  describe "full house" do
    test "match" do
      assert Yahtzee.score(:full_house, [1, 1, 2, 2, 2]) == 8
    end

    test "not match 1" do
      assert Yahtzee.score(:full_house, [2, 2, 3, 3, 4]) == 0
    end

    test "not match 2" do
      assert Yahtzee.score(:full_house, [4, 4, 4, 4, 4]) == 0
    end
  end
end
