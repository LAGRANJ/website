module Products::DepositTypes::DepositsHelper
	def GetDepositPeriods(product_id)
		@deposit_interests = JSON.parse(Redis.current.get("deposit_interests_#{product_id}"));    
		@deposit_interests.uniq{|x| x["MonthPeriod"]}.map{|x| x["MonthPeriod"]}
	end
	def GetDepositCurrencies(product_id)
		@deposit_interests = JSON.parse(Redis.current.get("deposit_interests_#{product_id}"));    
		@deposit_interests.uniq{|x| x["CurrencyID"]}.map{|x| x["CurrencyID"]}
	end
end
