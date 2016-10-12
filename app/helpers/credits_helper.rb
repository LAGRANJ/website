#(B)/((1+B)^С-1) *-(Р*(1+B)^С) 
module CreditsHelper
	def calculate_credit_rate_payment product_id, summa, currency_id, period, mortrage_type, 
		credit_interests = JSON.parse(Redis.current.get("credit_interests_#{product_id}")) 
		rate = 0
		payment = 0
		interest = credit_interests.select{|inter| inter["PMortrageTypeID"]==mortrage_type && inter["CurrencyID"]==currency_id &&
			inter["MinSumm"]<=summa && summa<=inter["MaxSumm"] &&
			inter["MinPeriod"]<=period && period<=inter["MaxPeriod"]}.first
		rate = interest["Rate"] if interest!=nil
		mrate = rate/1200.0
		unit = case currency_id
		when 417 
			"сом"
		when 840
			"$"
		when 643
			"руб."
		when 978
			"€"
		end 
		payment = number_to_currency((mrate/((1+mrate)**period-1))*(summa* (1+mrate)**period), precision: 0, unit: '') if ((1+mrate)**period-1)!=0

		return {rate: rate, payment: payment, unit: unit}
	end

end
