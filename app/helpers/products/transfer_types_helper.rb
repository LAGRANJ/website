module Products::TransferTypesHelper
  def GetTransferTypeDetails typeid
    @details = @transfer_type_details.select{|details| details.typeid == typeid}.first
    return @details
  end
  def GetCommissionFees summa, currencyid, countryid
    commission_ids = CountriesofCommission.where(countryid: countryid).map{|commission| commission.transfer_commission_id}

    transfer_commissions = TransferCommission.where("id in (?) and currencyid = ? and minsum<=#{summa} and #{summa}<=maxsum", commission_ids, currencyid)
    return transfer_commissions
  end
  def GetCommissionFee typeid, summa, currencyid, countryid
    transfer_commissions = TransferCommission.where("typeid=? and countryid=? and currencyid = ? and minsum<=#{summa} and #{summa}<=maxsum", typeid,countryid, currencyid)
    if(transfer_commissions.count>0)
      return transfer_commissions.first
    else
        transfer_commissions = TransferCommission.where("typeid=? and countryid=? and currencyid = ? and minsum<=#{summa} and #{summa}<=maxsum", typeid,-1, currencyid)
        return transfer_commissions.first
    end
    return nil;
  end
end 