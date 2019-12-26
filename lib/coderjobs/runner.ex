defmodule Coderjobs.Runner do
    import Ecto.Query
    use Timex
    def do_frequent() do
         expire_deal_update()
    end

#    def expire_deal(code) do
 #       case Repo.get_by(User, verification_code: code) do
  #        nil ->
   #         {:error, "User not found."}
    #      user -> 
     #       expire_deal_update(user)
      #      {:ok, user}
 #       end
  #    end
    

    defp expire_deal_update() do
        datetime=Timex.today
        query_expire=from p in Coderjobs.DealCtx.Deal, 
            where: p.valid < ^datetime and p.is_expired == false
        query_extend=from p in Coderjobs.DealCtx.Deal, 
           where: p.valid > ^datetime and p.is_expired == true
        Coderjobs.Repo.update_all(query_expire, set: [is_expired: true  ] ) 
        Coderjobs.Repo.update_all(query_extend, set: [is_expired: false  ] ) 
    end
 

  # update_all kullan, queryable geçirmek gerekiyor, 
  # tarihi güncellenmiş olanları da revive et
  # all sayfasında expired olmayanlar gösterilecek
 # use Timex
#  datetime=Timex.today
 # qq=from p in Coderjobs.DealCtx.Deal, where: p.valid >= ^datetime
 # Coderjobs.Repo.all(qq)  
 
end
  