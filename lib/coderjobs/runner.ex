defmodule Coderjobs.Runner do
    def do_frequent() do
         IO.puts "dakka başı" 
    end

    def expire_deal(code) do
        case Repo.get_by(User, verification_code: code) do
          nil ->
            {:error, "User not found."}
          user -> 
            expire_deal_update(user)
            {:ok, user}
        end
      end
    

    defp expire_deal_update(user) do
        changeset = Ecto.Changeset.change deal, is_expired: true
        changeset |> Repo.update
      end

  # update_all kullan, queryable geçirmek gerekiyor, 
end
  