defmodule IndealsWeb.Auth.AuthHandler  do
  
  use IndealsWeb , :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, gettext "You must be signed in to access this page")
    |> redirect(to: "/login")
  end

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, gettext "You must be signed in to access this page")
    |> redirect(to: "/login")
  end
end
