defmodule BladesInTheDark.Tools do
  @spec dice() :: integer
  @callback dice() :: integer
  def dice() do
    :rand.uniform(6)
  end

  @spec dice(integer) :: integer
  @callback dice(integer) :: integer
  def dice(number) do
    rolls = for _ <- 1..number, do: dice()

    %{
      sum: Enum.sum(rolls),
      rolls: rolls
    }
  end
end
