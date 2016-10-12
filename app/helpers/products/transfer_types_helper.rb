module Products::TransferTypesHelper
	def GetTransferTypeDetails typeid
		@details = @transfer_type_details.select{|details| details.typeid == typeid}.first		
		return @details
	end
	def GetCommissionFees summa, currencyid, countryid
		commission_ids = CountriesofCommission.where(countryid: countryid).map{|country| country.transfer_commission_id}
		transfer_commissions = TransferCommission.where("id in (?) and currencyid = ? and minsum<=#{summa} and #{summa}<=maxsum", commission_ids, currencyid)
		return transfer_commissions
	end
end
