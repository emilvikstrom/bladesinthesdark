defmodule BladesInTheDark.NPC do
  alias BladesInTheDark.Config

  import BladesInTheDark.Tools

  @npc_keys [
    :name,
    :family_name,
    :nickname,
    :heritage,
    :looks,
    :style,
    :goals,
    :preferred_methods,
    :profession,
    :traits,
    :interests,
    :quirks
  ]

  defstruct @npc_keys

  @type t :: %__MODULE__{
          name: binary,
          family_name: binary,
          nickname: binary | nil,
          heritage: binary,
          looks: binary,
          style: binary,
          goals: binary,
          preferred_methods: binary,
          profession: binary,
          traits: binary,
          interests: binary,
          quirks: binary
        }

  @spec describe(person :: __MODULE__.t()) :: binary
  def describe(person) do
    full_name = person.name <> " " <> person.family_name

    """
    #{full_name} the #{person.profession} is a #{person.looks} of #{person.heritage} descandant
    #{full_name} wants to achieve #{person.goals} through #{person.preferred_methods}
    """
  end

  @spec new() :: __MODULE__.t()
  @callback new() :: __MODULE__.t()
  def new() do
    %__MODULE__{
      name: name(),
      family_name: family_name(),
      nickname: nickname(),
      heritage: heritage(),
      looks: looks(),
      style: style(),
      goals: goals(),
      preferred_methods: preferred_methods(),
      profession: profession(),
      traits: traits(),
      interests: interests(),
      quirks: quirks()
    }
  end

  @spec new(map()) :: __MODULE__.t()
  @callback new(map()) :: __MODULE__.t()
  def new(%{profession: :rare} = input_parameters),
    do: new(%{input_parameters | profession: rare_profession()})

  def new(%{profession: :common} = input_parameters),
    do: new(%{input_parameters | profession: common_profession()})

  def new(input_parameters) do
    new_npc = new()

    Map.keys(input_parameters)
    |> Enum.each(&validate_key/1)

    Map.merge(new_npc, input_parameters)
  end

  defp name() do
    Config.read(__MODULE__, :names)
    |> Enum.random()
  end

  defp family_name() do
    Config.read(__MODULE__, :family_names)
    |> Enum.random()
  end

  defp nickname() do
    case dice() do
      result when result > 4 -> Config.read(__MODULE__, :nicknames) |> Enum.random()
      _ -> nil
    end
  end

  defp heritage() do
    Config.read(__MODULE__, :heritage, :weighted)
    |> Enum.random()
  end

  defp looks() do
    physique() <> " " <> gender()
  end

  defp physique() do
    Config.read(__MODULE__, :physique)
    |> Enum.random()
  end

  defp gender() do
    Config.read(__MODULE__, :gender, :weighted)
    |> Enum.random()
  end

  defp goals() do
    Config.read(__MODULE__, :goals)
    |> Enum.random()
  end

  defp preferred_methods() do
    Config.read(__MODULE__, :preferred_methods)
    |> Enum.random()
  end

  defp profession() do
    case dice() do
      result when result > 4 -> rare_profession()
      _ -> common_profession()
    end
    |> Enum.random()
  end

  defp rare_profession, do: Config.read(__MODULE__, :rare_profession)
  defp common_profession, do: Config.read(__MODULE__, :common_profession)

  defp traits() do
    Config.read(__MODULE__, :traits)
    |> Enum.random()
  end

  def interests do
    Config.read(__MODULE__, :interests)
    |> Enum.random()
  end

  def quirks do
    Config.read(__MODULE__, :quirks)
    |> Enum.random()
  end

  defp style() do
    Config.read(__MODULE__, :styles)
    |> Enum.random()
  end

  defp validate_key(key) when key in @npc_keys, do: :ok
  defp validate_key(_), do: raise(KeyError)
end
