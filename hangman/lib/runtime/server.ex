defmodule Hangman.Runtime.Server do
  use GenServer

  alias Hangman.Impl.Game

  @type t :: pid

  ### client

  def start_link do
    GenServer.start_link(__MODULE__, nil)
  end

  ### server (callbacks)

  @impl true
  def init(_init_arg) do
    {:ok, Game.new_game()}
  end

  @impl true
  def handle_call({:make_move, guess}, _from, game) do
    {updated_game, tally} = Game.make_move(game, guess)
    {:reply, tally, updated_game}
  end

  @impl true
  def handle_call({:tally}, _from, game) do
    {:reply, Game.tally(game), game}
  end
end
