defmodule Hangman.Runtime.Server do
  use GenServer

  alias Hangman.Impl.Game
  alias Hangman.Runtime.Watchdog

  @type t :: pid

  # 1 hour
  @idle_timeout 1 * 60 * 60 * 1000

  ### client

  def start_link(_init_arg) do
    GenServer.start_link(__MODULE__, nil)
  end

  ### server (callbacks)

  @impl true
  def init(_init_arg) do
    watcher = Watchdog.start(@idle_timeout)
    {:ok, {Game.new_game(), watcher}}
  end

  @impl true
  def handle_call({:make_move, guess}, _from, {game, watcher}) do
    Watchdog.im_alive(watcher)
    {updated_game, tally} = Game.make_move(game, guess)
    {:reply, tally, {updated_game, watcher}}
  end

  @impl true
  def handle_call({:tally}, _from, {game, watcher}) do
    Watchdog.im_alive(watcher)
    {:reply, Game.tally(game), {game, watcher}}
  end
end
