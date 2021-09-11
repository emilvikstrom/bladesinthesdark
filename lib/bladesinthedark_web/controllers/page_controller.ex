defmodule BladesinthedarkWeb.PageController do
  use BladesinthedarkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
