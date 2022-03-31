defmodule B2Web.Live.Game do
  use B2Web, :live_view

  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)

    {:ok, assign(socket, %{game: game, tally: tally})}
  end

  def render(assigns) do
    ~H"""
    <div class="game-holder" phx-window-keyup="make_move">
      <%= live_component(__MODULE__.Figure, tally: assigns.tally, id: 1) %>
      <%= live_component(__MODULE__.Alphabet, tally: assigns.tally, id: 2) %>
      <%= live_component(__MODULE__.WordSoFar, tally: assigns.tally, id: 3) %>
    </div>
    """
  end

  def handle_event("make_move", %{"key" => key}, socket) do
    tally = Hangman.make_move(socket.assigns.game, key)
    {:noreply, assign(socket, :tally, tally)}
  end
end
