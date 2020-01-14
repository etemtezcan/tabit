defmodule Indeals.Tarim do
  @moduledoc """
  The Tarim context.
  """

  import Ecto.Query, warn: false
  alias Indeals.Repo
  alias Indeals.Account.User
  alias Indeals.Tarim.Urun

  @doc """
  Returns the list of urunler.

  ## Examples

      iex> list_urunler()
      [%Urun{}, ...]

  """
  def list_urunler do
    Repo.all(Urun)
  end
  def list_urunler(params) do
    search_term= get_in(params, ["query"])
    Urun
    |> Urun.search(search_term)
    |> Repo.all()
  end

  @doc """
  Gets a single urun.

  Raises `Ecto.NoResultsError` if the Urun does not exist.

  ## Examples

      iex> get_urun!(123)
      %Urun{}

      iex> get_urun!(456)
      ** (Ecto.NoResultsError)

  """
  def get_urun!(id), do: Repo.get!(Urun, id)

  @doc """
  Creates a urun.

  ## Examples

      iex> create_urun(%{field: value})
      {:ok, %Urun{}}

      iex> create_urun(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_urun(attrs \\ %{},%User{id: user_id}) do
    %Urun{user_id: user_id}
    |> Urun.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a urun.

  ## Examples

      iex> update_urun(urun, %{field: new_value})
      {:ok, %Urun{}}

      iex> update_urun(urun, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_urun(%Urun{} = urun, attrs) do
    urun
    |> Urun.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Urun.

  ## Examples

      iex> delete_urun(urun)
      {:ok, %Urun{}}

      iex> delete_urun(urun)
      {:error, %Ecto.Changeset{}}

  """
  def delete_urun(%Urun{} = urun) do
    Repo.delete(urun)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking urun changes.

  ## Examples

      iex> change_urun(urun)
      %Ecto.Changeset{source: %Urun{}}

  """
  def change_urun(%Urun{} = urun) do
    Urun.changeset(urun, %{})
  end

  alias Indeals.Tarim.Tohum

  @doc """
  Returns the list of tohumlar.

  ## Examples

      iex> list_tohumlar()
      [%Tohum{}, ...]

  """
  def list_tohumlar do
    Repo.all(Tohum)
  end

  def list_tohumlar(params) do
    search_term= get_in(params, ["query"])
    Tohum
    |>Tohum.search(search_term)
    |> Repo.all()
  end


  @doc """
  Gets a single tohum.

  Raises `Ecto.NoResultsError` if the Tohum does not exist.

  ## Examples

      iex> get_tohum!(123)
      %Tohum{}

      iex> get_tohum!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tohum!(id), do: Repo.get!(Tohum, id)

  @doc """
  Creates a tohum.

  ## Examples

      iex> create_tohum(%{field: value})
      {:ok, %Tohum{}}

      iex> create_tohum(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tohum(attrs \\ %{}, %User{id: user_id}) do
    %Tohum{user_id: user_id}
    |> Tohum.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tohum.

  ## Examples

      iex> update_tohum(tohum, %{field: new_value})
      {:ok, %Tohum{}}

      iex> update_tohum(tohum, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tohum(%Tohum{} = tohum, attrs) do
    tohum
    |> Tohum.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tohum.

  ## Examples

      iex> delete_tohum(tohum)
      {:ok, %Tohum{}}

      iex> delete_tohum(tohum)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tohum(%Tohum{} = tohum) do
    Repo.delete(tohum)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tohum changes.

  ## Examples

      iex> change_tohum(tohum)
      %Ecto.Changeset{source: %Tohum{}}

  """
  def change_tohum(%Tohum{} = tohum) do
    Tohum.changeset(tohum, %{})
  end

  alias Indeals.Tarim.Gubre

  @doc """
  Returns the list of gubreler.

  ## Examples

      iex> list_gubreler()
      [%Gubre{}, ...]

  """
  def list_gubreler do
    Repo.all(Gubre)
  end
  def list_gubreler(params) do
    search_term= get_in(params, ["query"])
    Gubre
    |> Gubre.search(search_term)
    |> Repo.all()
  end

  @doc """
  Gets a single gubre.

  Raises `Ecto.NoResultsError` if the Gubre does not exist.

  ## Examples

      iex> get_gubre!(123)
      %Gubre{}

      iex> get_gubre!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gubre!(id), do: Repo.get!(Gubre, id)

  @doc """
  Creates a gubre.

  ## Examples

      iex> create_gubre(%{field: value})
      {:ok, %Gubre{}}

      iex> create_gubre(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gubre(attrs \\ %{}, %User{id: user_id}) do
    %Gubre{user_id: user_id}
    |> Gubre.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gubre.

  ## Examples

      iex> update_gubre(gubre, %{field: new_value})
      {:ok, %Gubre{}}

      iex> update_gubre(gubre, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gubre(%Gubre{} = gubre, attrs) do
    gubre
    |> Gubre.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Gubre.

  ## Examples

      iex> delete_gubre(gubre)
      {:ok, %Gubre{}}

      iex> delete_gubre(gubre)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gubre(%Gubre{} = gubre) do
    Repo.delete(gubre)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gubre changes.

  ## Examples

      iex> change_gubre(gubre)
      %Ecto.Changeset{source: %Gubre{}}

  """
  def change_gubre(%Gubre{} = gubre) do
    Gubre.changeset(gubre, %{})
  end

  alias Indeals.Tarim.Ekipman

  @doc """
  Returns the list of ekipmanlar.

  ## Examples

      iex> list_ekipmanlar()
      [%Ekipman{}, ...]

  """
  def list_ekipmanlar do
    Repo.all(Ekipman)
  end
  def list_ekipmanlar(params) do
    search_term= get_in(params, ["query"])
    Ekipman
    |> Ekipman.search(search_term)
    |> Repo.all()
  end

  @doc """
  Gets a single ekipman.

  Raises `Ecto.NoResultsError` if the Ekipman does not exist.

  ## Examples

      iex> get_ekipman!(123)
      %Ekipman{}

      iex> get_ekipman!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ekipman!(id), do: Repo.get!(Ekipman, id)

  @doc """
  Creates a ekipman.

  ## Examples

      iex> create_ekipman(%{field: value})
      {:ok, %Ekipman{}}

      iex> create_ekipman(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ekipman(attrs \\ %{}, %User{id: user_id}) do
    %Ekipman{user_id: user_id}
    |> Ekipman.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ekipman.

  ## Examples

      iex> update_ekipman(ekipman, %{field: new_value})
      {:ok, %Ekipman{}}

      iex> update_ekipman(ekipman, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ekipman(%Ekipman{} = ekipman, attrs) do
    ekipman
    |> Ekipman.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Ekipman.

  ## Examples

      iex> delete_ekipman(ekipman)
      {:ok, %Ekipman{}}

      iex> delete_ekipman(ekipman)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ekipman(%Ekipman{} = ekipman) do
    Repo.delete(ekipman)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ekipman changes.

  ## Examples

      iex> change_ekipman(ekipman)
      %Ecto.Changeset{source: %Ekipman{}}

  """
  def change_ekipman(%Ekipman{} = ekipman) do
    Ekipman.changeset(ekipman, %{})
  end

  alias Indeals.Tarim.Arazi

  @doc """
  Returns the list of araziler.

  ## Examples

      iex> list_araziler()
      [%Arazi{}, ...]

  """
  def list_araziler() do
    Repo.all(Arazi)
  end

  def list_araziler(params) do
    search_term= get_in(params, ["query"])
    Arazi
    |> Arazi.search(search_term)
    |> Repo.all()
  end

  @doc """
  Gets a single arazi.

  Raises `Ecto.NoResultsError` if the Arazi does not exist.

  ## Examples

      iex> get_arazi!(123)
      %Arazi{}

      iex> get_arazi!(456)
      ** (Ecto.NoResultsError)

  """
  def get_arazi!(id), do: Repo.get!(Arazi, id)

  @doc """
  Creates a arazi.

  ## Examples

      iex> create_arazi(%{field: value})
      {:ok, %Arazi{}}

      iex> create_arazi(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_arazi(attrs \\ %{}, %User{id: user_id}) do
    %Arazi{user_id: user_id}
    |> Arazi.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a arazi.

  ## Examples

      iex> update_arazi(arazi, %{field: new_value})
      {:ok, %Arazi{}}

      iex> update_arazi(arazi, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_arazi(%Arazi{} = arazi, attrs) do
    arazi
    |> Arazi.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Arazi.

  ## Examples

      iex> delete_arazi(arazi)
      {:ok, %Arazi{}}

      iex> delete_arazi(arazi)
      {:error, %Ecto.Changeset{}}

  """
  def delete_arazi(%Arazi{} = arazi) do
    Repo.delete(arazi)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking arazi changes.

  ## Examples

      iex> change_arazi(arazi)
      %Ecto.Changeset{source: %Arazi{}}

  """
  def change_arazi(%Arazi{} = arazi) do
    Arazi.changeset(arazi, %{})
  end

  def deal_owner(user_id) do
    if not is_nil(user_id) do
      query = from u in Indeals.Account.User, where: u.id == ^user_id, select: u.mobile
        Repo.all(query)
    else
       "----"
    end  
  end

  def list_araziler_by_user(id) do
    query = from u in Indeals.Tarim.Arazi, where: u.user_id == ^id
    Repo.all(query)
  end
  def list_urunler_by_user(id) do
    query = from u in Indeals.Tarim.Urun, where: u.user_id == ^id
    Repo.all(query)
  end
  def list_tohumlar_by_user(id) do
    query = from u in Indeals.Tarim.Tohum, where: u.user_id == ^id
    Repo.all(query)
  end
  def list_ekipmanlar_by_user(id) do
    query = from u in Indeals.Tarim.Ekipman, where: u.user_id == ^id
    Repo.all(query)
  end
  def list_gubreler_by_user(id) do
    query = from u in Indeals.Tarim.Gubre, where: u.user_id == ^id
    Repo.all(query)
  end

  def scope_by_user(query, user) do
    if user.is_admin do
      query
    else
      where(query, user_id: ^user.id)
    end
  end

end
