defmodule BladesInTheDark.Config do
  @spec read(module :: atom, key :: any, opts :: atom) :: list
  def read(module, key, opts \\ nil)

  def read(module, key, nil) do
    Application.get_env(:bladesinthedark, module)
    |> Keyword.get(key)
  end

  def read(module, key, :weighted) do
    read(module, key, nil)
    |> Enum.flat_map(&expand/1)
  end

  def read(module, key, :headlines) do
    {_, map} =
      read(module, key)
      |> Enum.reduce({nil, %{}}, &headline_map/2)

    map
  end

  defp expand(string), do: expand(string, <<>>)

  defp expand(":" <> rest, acc), do: expand(rest, String.to_integer(acc), [])
  @numbers_as_chars ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
  defp expand(<<head::binary-size(1), rest::binary>>, acc) when head in @numbers_as_chars,
    do: expand(rest, acc <> head)

  defp expand(anything, _), do: [anything]

  defp expand(_, 0, acc), do: acc
  defp expand(string, amount, acc), do: expand(string, amount - 1, [string | acc])

  defp headline_map(<<"##", key::binary>>, {_current_key, response}) do
    {key, Map.put(response, key, [])}
  end

  defp headline_map(value, {current_key, response}) do
    current_values = Map.get(response, current_key)

    {current_key, %{response | current_key => [value | current_values]}}
  end
end
