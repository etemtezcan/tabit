defmodule CoderjobsWeb.Auth.ForgotController do
  use CoderjobsWeb, :controller
  
  alias Coderjobs.Account.UserAuthActions

  def new(conn, _params) do
    render conn, "new.html", csrf_token: get_csrf_token()
  end

  def create(conn, %{"email" => email}) do
    case UserAuthActions.forgot_password(email) do
      {:error, _} ->
        conn
        |> put_flash(:error, "Geçersiz e-posta.")
        |> redirect(to: "/forgot")
      {:ok, user} ->
        conn
        |> put_flash(:info, "Şifre sıfırlama için gereken kod  #{user.email} adresine gönderilmiştir.")
        |> redirect(to: "/login")
    end
  end
end
