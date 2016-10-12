module ApplicationHelper
  def MonthShortName(month_number)
    case month_number
    when 1
      'Янв'
    when 2
      'Фев'
    when 3
      'Мрт'
    when 4
      'Апр'
    when 5
      'Май'
    when 6
      'Июн'
    when 7
      'Июл'
    when 8
      'Авг'
    when 9
      'Сен'
    when 10
      'Окт'
    when 11
      'Нбр'
    when 12
      'Дек'
    end
  end
  def MonthLongName(month_number)
    case month_number
    when 1
      'Январь'
    when 2
      'Февраль'
    when 3
      'Март'
    when 4
      'Апрель'
    when 5
      'Май'
    when 6
      'Июнь'
    when 7
      'Июль'
    when 8
      'Август'
    when 9
      'Сентябрь'
    when 10
      'Октябрь'
    when 11
      'Ноябрь'
    when 12
      'Декабрь'
    end
  end
  def QuaterName(id)
    case id
    when 1
      '1-Квартал'
    when 2
      '2-Квартал'
    when 3
      '3-Квартал'
    when 4
      '4-Квартал'
    end
  end
  def GetCurrencyName(currency_id)
    case currency_id
    when 417
      'сом КР'
    when 840
      'долл.США'
    when 643
      'росс.рубли'
    when 978
      'евро'
    end
  end
  def trim_zero num
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end
end
