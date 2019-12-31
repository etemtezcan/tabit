defmodule Indeals.Runner do
    import Ecto.Query
    use Timex
    def do_frequent() do
         expire_deal_update()
         IO.puts Timex.now
    end

    defp expire_deal_update() do
        datetime=Timex.today
        query_expire=from p in Indeals.DealCtx.Deal, 
            where: p.valid < ^datetime and p.is_expired == false
        query_extend=from p in Indeals.DealCtx.Deal, 
           where: p.valid > ^datetime and p.is_expired == true
        Indeals.Repo.update_all(query_expire, set: [is_expired: true  ] ) 
        Indeals.Repo.update_all(query_extend, set: [is_expired: false  ] ) 
    end
 
end
  