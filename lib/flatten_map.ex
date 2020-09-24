defmodule FlattenMap do
  @moduledoc """
  Documentation for `FlattenMap`.

  ## Motivation
  The motivating use case for this module is to flatten nested JSON data.  Thus,
  the library assumes all keys are strings and will convert any non-string keys
  to strings.  If the map key cannot be converted to a string, the function will
  fail.

  Maps are flattened by concatenating keys together.  

  """

  @doc """
  Flattens an arbitrarily deep map.

  ## Examples

    iex> %{a: 1} |> FlattenMap.flatten()
    %{"a" => 1}

    iex> %{a: %{b: 1, c: 2}} |> FlattenMap.flatten()
    %{"a.b" => 1, "a.c" => 2}

    iex> %{"a" => %{b: %{c: %{d: :end}}}} |> FlattenMap.flatten()
    %{"a.b.c.d" => :end}

  """
  def flatten(m, delimeter \\ ".")

  def flatten(m, delimeter) when is_map(m) do
    for {k, v} <- m, sk = to_string(k), fv <- flatten(v, delimeter), into: %{} do
      case fv do
        {key, val} -> {sk <> delimeter <> key, val}
        val -> {sk, val}
      end
    end
  end

  def flatten(v, _delimeter), do: [v]
end
