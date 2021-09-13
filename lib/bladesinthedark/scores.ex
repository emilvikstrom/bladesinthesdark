defmodule BladesInTheDark.Scores do
  alias BladesInTheDark.NPC

  @score_keys [
    :client,
    :work,
    :target
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
    List.flatten([])
  end
end
