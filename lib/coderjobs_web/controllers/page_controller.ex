defmodule CoderjobsWeb.PageController do
  use CoderjobsWeb, :controller

  alias Coderjobs.DealCtx.DealActions
  alias Coderjobs.Others.Contact
  alias Coderjobs.Email
  alias Coderjobs.Mailer

  def index(conn, params \\ %{}) do
    page = DealActions.list(params)
    render(conn, "index.html",
      deals: page.entries,
      page: page,
      total: page.total_entries,
      q: Map.get(params, "q", ""),
     # ,location: Map.get(params, "location", ""),
    )
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  # https://hexdocs.pm/ecto/Ecto.Changeset.html#module-schemaless-changesets
  # Well implement this next time.
  def contact(conn, _params) do
    render conn, "contact.html",
      changeset: Contact.changeset(%Contact{}, %{})
  end

  def contact_send(conn, %{"email" => email, "name" => name, "message" => message}) do
    Email.contact(name, email, message) |> Mailer.deliver_now
    conn
  end

  def contact_post(conn, %{"contact" => params}) do
    changeset = Contact.changeset(%Contact{}, params)
    if changeset.valid? do
      conn 
      |> put_flash(:info, gettext "Message Sent.")
      |> contact_send(params)
      |> redirect(to: "/contact")
    else
      conn 
      |> render "contact.html", changeset: changeset
    end
  end

  def terms(conn, _params) do
    render conn, "terms.html"
  end
end
