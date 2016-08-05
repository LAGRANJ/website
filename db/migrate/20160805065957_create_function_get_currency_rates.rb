class CreateFunctionGetCurrencyRates < ActiveRecord::Migration[5.0]
  	def up
  		connection.execute(%q{
    CREATE OR REPLACE FUNCTION public.get_currency_rates(IN p_currencyid integer)
  RETURNS TABLE(rdate timestamp without time zone, curid integer, sell_rate numeric, buy_rate numeric, last_sell_rate numeric, last_buy_rate numeric) AS
$BODY$
declare l_maxdate timestamp without time zone;

BEGIN
 select into l_maxdate max(ratedate) from 
 currency_rates
 WHERE
 currencyid= p_currencyid ;
 
 RETURN QUERY SELECT ratedate, currencyid, sellrate,buyrate, get_prev_currency_sellrate (cr.currencyid,cr.ratedate),get_prev_currency_buyrate (cr.currencyid,cr.ratedate) 
 FROM
 currency_rates cr
 WHERE
 ratedate = (SELECT max(cr2.ratedate)
 FROM
 currency_rates cr2
 WHERE
 cr2.currencyid= cr.currencyid);
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.get_currency_rates(integer)
  OWNER TO timur;
  })
	end

def down
  connection.execute(%q{
    DROP FUNCTION public.get_currency_rates(integer); 
  })
end
end
