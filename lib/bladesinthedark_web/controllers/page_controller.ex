defmodule BladesInTheDarkWeb.PageController do
  use BladesInTheDarkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
