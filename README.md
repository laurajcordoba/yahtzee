# Yahtzee

**Yahtzee is a dice game made by Milton Bradley, which was first marketed as Yatzie by the National Association Service of Toledo, Ohio, in the early 1940s. The objective of the game is to score points by rolling five dice to make certain combinations.**

## Installation
This application was created using using Erlang Version 22.3.4.3 and Elixir Version  1.10.4-otp-22. Be sure you have installed both.

## How to run it
Pull the repository from git@github.com:laurajcordoba/yahtzee.git

In your root directory in "yahtzee" folder, run an Elixir terminal running:

```
iex -S mix
```
Inside the console you can play with Yahtzee module inserting a roll e.g 2,2,2,5,5

```
Yahtzee.score(:full_house, [2,2,2,5,5])
```
The module should return the score according the category matches for the inserted roll value, in above example should be 16 because it's a full_house.

## How to run tests
To run Tests in your root folder "yahtzee" run

```
mix test
```
And this should show you the Tests results. You should see something like

```
Finished in 0.1 seconds
1 doctest, 43 tests, 0 failures
```
