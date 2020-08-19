defmodule YahtzeeTest do

  use ExUnit.Case
  doctest Yahtzee

  # test "greets the world" do
  #   assert Yahtzee.hello() == :world
  # end

  describe "chance" do
   	test "not" do
      assert Yahtzee.score(:chance, []) == 0
    end

    test "is" do
      assert Yahtzee.score(:chance, [1, 2, 3, 4, 5]) == 15
    end
  end

  describe "yahtzee" do
    test "not all matches" do
      assert Yahtzee.score(:yahtzee, [1, 5, 3, 2, 1]) == 0
    end

    test "all 6s" do
      assert Yahtzee.score(:yahtzee, [6, 6, 6, 6, 6]) == 50
    end

    test "all 5s" do
      assert Yahtzee.score(:yahtzee, [5, 5, 5, 5, 5]) == 50
    end

    test "all 4s" do
      assert Yahtzee.score(:yahtzee, [4, 4, 4, 4, 4]) == 50
    end

    test "all 3s" do
      assert Yahtzee.score(:yahtzee, [3, 3, 3, 3, 3]) == 50
    end

    test "all 2s" do
      assert Yahtzee.score(:yahtzee, [2, 2, 2, 2, 2]) == 50
    end

    test "all 1s" do
      assert Yahtzee.score(:yahtzee, [1, 1, 1, 1, 1]) == 50
    end
  end

  describe "placed" do
    test "on sixs matches" do
      assert Yahtzee.score(:sixs, [1, 1, 6, 6, 4]) == 12
    end

    test "on sixs not matches" do
      assert Yahtzee.score(:sixs, [1, 2, 3, 3, 4]) == 0
    end

    test "on fives matches" do
      assert Yahtzee.score(:fives, [5, 5, 2, 4, 5]) == 15
    end

    test "on fives not matches" do
      assert Yahtzee.score(:fives, [1, 2, 2, 4, 3]) == 0
    end

    test "on fours matches" do
      assert Yahtzee.score(:fours, [1, 1, 2, 3, 4]) == 4
    end

    test "on fours not matches" do
      assert Yahtzee.score(:fours, [1, 1, 2, 3, 2]) == 0
    end

    test "on threes matches" do
      assert Yahtzee.score(:threes, [1, 3, 3, 3, 4]) == 9
    end

    test "on threes not matches" do
      assert Yahtzee.score(:threes, [1, 2, 4, 1, 4]) == 0
    end

    test "on twos matches" do
      assert Yahtzee.score(:twos, [2, 3, 2, 5, 1]) == 4
    end

    test "on twos not matches" do
      assert Yahtzee.score(:twos, [1, 3, 6, 5, 1]) == 0
    end

    test "on ones matches" do
      assert Yahtzee.score(:ones, [3, 3, 1, 4, 5]) == 1
    end

    test "on ones not matches" do
      assert Yahtzee.score(:ones, [3, 3, 3, 4, 5]) == 0
    end
  end

  # describe "pair" do
  #   test "on pair 1" do
  #     assert Yahtzee.score(:pair, [3, 3, 3, 4, 4]) == 8
  #   end

  #   # test "on pair 2" do
  #   #   assert Yahtzee.score(:pair, [1, 1, 3, 2, 6 ]) = 2
  #   # end

  #   # test "on pair 3" do
  #   #   assert Yahtzee.score(:pair, [3, 3, 3, 4, 1]) = 0
  #   # end

  #   # test "on pair 4" do
  #   #   assert Yahtzee.score(:pair, [3, 3, 3, 3, 1]) = 0
  #   # end
  # end


  describe "two pairs" do
    test "two pair matches" do
      assert Yahtzee.score(:two_pair, [3, 3, 2, 4, 4]) == 14
    end

    # test "two pair not matches" do
    #   assert Yahtzee.score(:two_pair, [3, 3, 3, 4, 4]) == 0
    # end
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
end
