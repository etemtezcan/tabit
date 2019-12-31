defmodule Indeals.Repo.Migrations.AddPoisExpiredField do
  use Ecto.Migration

  def change do
    alter table(:deals) do
      add :is_expired, :boolean
    end 
  end
end
