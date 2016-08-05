class CreateFunctionGetPrevCurrencyBuyRate < ActiveRecord::Migration[5.0]
  def up
  		connection.execute(%q{
    CREATE OR REPLACE FUNCTION public.get_prev_currency_buyrate(
    p_currencyid integer,
    p_date timestamp without time zone)
  RETURNS numeric AS
$BODY$
declare result numeric(10,4);

BEGIN
 select into result buyrate from 
 currency_rates cr
 WHERE
 ratedate = (SELECT max(cr2.ratedate)
 FROM
 currency_rates cr2
 WHERE
 cr2.currencyid= cr.currencyid and cr2.ratedate<p_date) and cr.currencyid = p_currencyid;

 return result;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.get_prev_currency_buyrate(integer, timestamp without time zone)
  OWNER TO deploy;
  })
	end

def down
  connection.execute(%q{
    DROP FUNCTION public.get_prev_currency_buyrate(integer, timestamp without time zone);
  })
end
end
