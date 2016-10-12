module Products::DepositTypesHelper
	def GetDepositTypeDetails type_id
		@details = @deposit_type_details.select{|details| details.type_id == type_id}.first		
		return @details
	end
end
