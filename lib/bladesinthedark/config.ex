defmodule BladesInTheDark.Config do
  @spec read(module :: atom, key :: any, opts :: atom) :: list
  def read(module, key, opts \\ nil)
  def read(module, key, nil), do: read(module_key)
  def read(module, key, :weighted) do
    read(module, key)
    |> Enum.flat_map(&expand/1)
  end


  defp expand(string), do: expand(string, <<>>)

  defp expand(to_expand, amount) when is_integer(amount), do: expand(to_expand, amount, [])
  defp expand(":" <> rest, acc), do: expand(rest, Integer.to_string(acc))
  @numbers_as_chars [?1,?2,?3,?4,?5,?6,?7,?8,?9,?0]
  defp expand(<<head::utf8, rest::binary>>, acc), when head in @numbers_as_chars do: expand(rest, acc <> head)
  
  defp expand(_,0,acc), do: acc
  defp expand(string, amount, acc), do: expand(string, amount - 1, [string | acc])

  defp read(module, key) do
    Application.get_env(:bladesinthedark, module)
    |> Keyword.get(key)
  end
end
