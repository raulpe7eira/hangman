defmodule Dictionary.Impl.WordList do
  @spec start() :: list(String.t())
  def start() do
    "./assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  @spec random_word(list(String.t())) :: String.t()
  def random_word(words), do: words |> Enum.random()
end
