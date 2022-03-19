defmodule Dictionary do
  alias Dictionary.Impl.WordList

  @spec start() :: list(String.t())
  defdelegate start(), to: WordList

  @spec random_word(list(String.t())) :: String.t()
  defdelegate random_word(words), to: WordList
end
