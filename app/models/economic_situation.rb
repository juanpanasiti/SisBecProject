class EconomicSituation < ActiveRecord::Base
  belongs_to :profile

  #validates :dwelling, :rent, :situation, :incomes, :vehicles, presence: true
end
