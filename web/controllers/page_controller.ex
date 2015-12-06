defmodule Patricia.PageController do
  use Patricia.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
