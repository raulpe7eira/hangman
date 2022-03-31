defmodule B2Web.Live.Game.Alphabet do
  use B2Web, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <p>alphabet</p>
    """
  end
end
