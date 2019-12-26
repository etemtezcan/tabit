defmodule Coderjobs.Repo.Migrations.AddPoisExpiredField do
  use Ecto.Migration

  def change do
    alter table(:deals) do
      add :is_expired, :boolean, default: false, null: false
    end 
  end
end
