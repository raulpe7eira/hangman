defmodule B1Web.HangmanView.Helpers.ContinueOrTryAgain do
  use Phoenix.HTML

  alias B1Web.Router.Helpers, as: Routes

  def continue_or_try_again(conn, status) when status in [:won, :lost] do
    button("Try again", to: Routes.hangman_path(conn, :new))
  end

  def continue_or_try_again(conn, _status) do
    form_for(conn, Routes.hangman_path(conn, :update), [as: "make_move", method: :put], fn f ->
      [
        text_input(f, :guess),
        " ",
        submit("Make next guess")
      ]
    end)
  end
end
