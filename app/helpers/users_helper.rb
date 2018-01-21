module UsersHelper

  def agecalc(birthday)
    date_format = "%Y%m%d"
    age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

end
