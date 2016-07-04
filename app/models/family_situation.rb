class FamilySituation < ActiveRecord::Base
  belongs_to :personal_data
  has_many :relatives

  accepts_nested_attributes_for :relatives,reject_if: :all_blank, allow_destroy: true
end
