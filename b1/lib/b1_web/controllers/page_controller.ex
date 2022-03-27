defmodule B1Web.PageController do
  use B1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
