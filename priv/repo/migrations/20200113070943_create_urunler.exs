defmodule Indeals.Repo.Migrations.CreateUrunler do
  use Ecto.Migration

  def change do
    create table(:urunler) do
      add :cins, :string
      add :açıklama, :string
      add :yer, :string
      add :miktar_ton, :integer
      add :kilo_fiyat, :decimal
      add :uretim_tarihi, :date
      add :gecerlilik, :date
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:urunler, [:user_id])
  end
end
