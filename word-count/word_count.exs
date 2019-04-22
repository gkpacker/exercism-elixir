require IEx

defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words =
      sentence
      |> String.downcase()
      |> String.split(~r/([^-\w]|_)/u, trim: true)

    word_count = Map.new(words, &{&1, 0})

    Enum.reduce(words, word_count, fn word, acc ->
      Map.update!(acc, word, &(&1 + 1))
    end)
  end
end
