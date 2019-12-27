defmodule Coderjobs.Runner do
    import Ecto.Query
    use Timex
    def do_frequent() do
         expire_deal_update()
         IO.puts Timex.now
    end

    defp expire_deal_update() do
        datetime=Timex.today
        query_expire=from p in Coderjobs.DealCtx.Deal, 
            where: p.valid < ^datetime and p.is_expired == false
        query_extend=from p in Coderjobs.DealCtx.Deal, 
           where: p.valid > ^datetime and p.is_expired == true
        Coderjobs.Repo.update_all(query_expire, set: [is_expired: true  ] ) 
        Coderjobs.Repo.update_all(query_extend, set: [is_expired: false  ] ) 
    end
 
end
  