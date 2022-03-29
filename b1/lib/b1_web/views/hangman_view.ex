defmodule B1Web.HangmanView do
  use B1Web, :view

  alias B1Web.HangmanView.Helpers.FigureFor
  alias B1Web.HangmanView.Helpers.MoveStatus
  alias B1Web.HangmanView.Helpers.ContinueOrTryAgain

  defdelegate figure_for(turns_left), to: FigureFor
  defdelegate move_status(status), to: MoveStatus
  defdelegate continue_or_try_again(conn, status), to: ContinueOrTryAgain
end
