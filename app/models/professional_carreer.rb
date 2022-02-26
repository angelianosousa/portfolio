class ProfessionalCarreer < ApplicationRecord
  def period
    "#{I18n.l(self.start_date)} - #{I18n.l(self.end_date)}"
  end
end
