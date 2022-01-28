class PhoneNumber < ApplicationRecord
  EXPECTED_NUMBER_OF_DIGITS = 10
  before_validation :strip_value

  def strip_value
    self.value = strip_country_code(strip_non_numeric)
  end

  def strip_non_numeric
    self.value = self.value.gsub(/\D/, "")
  end

  def strip_country_code(value)
    value.split("").last(EXPECTED_NUMBER_OF_DIGITS).join
  end
end
