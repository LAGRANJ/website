module Products::TransferTypes::LocalTransfersHelper
	def GetPaymentType(payment_typeid)
		case payment_typeid
		when 1 
			'выдача через кассу'
		when 2 
			'на расчетный счет'
		when 3 
			'на погашение кредита'
		end 
	end
	def GetPayinType(payment_typeid)
		case payment_typeid
		when 1 
			'отправка через кассу'
		when 2 
			'отправка с расчетного счета'
		end 
	end
end
