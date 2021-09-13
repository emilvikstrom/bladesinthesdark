defmodule BladesInTheDark.Scores do
  alias BladesInTheDark.{Config, NPC}

  @score_keys [
    :client,
    :work,
    :target,
    :twist,
    :connection,
    :faction
  ]

  defstruct @score_keys

  @type t :: %__MODULE__{}

  @spec new() :: __MODULE__.t()
  def new() do
    %__MODULE__{
      client: NPC.new(),
      target: NPC.new(),
      work: work()
    }
  end

  defp work() do
    config = Config.read(__MODULE__, :work, :headlines)

    Map.keys(config)
    |> Enum.flat_map(fn key ->
      Map.get(config, key)
    end)
    |> Enum.random()
  end
end
