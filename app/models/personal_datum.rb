class PersonalDatum < ActiveRecord::Base
  belongs_to :profile
  has_one :family_situation
  has_many :document_files

  accepts_nested_attributes_for :family_situation,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :document_files,reject_if: :all_blank, allow_destroy: true

  after_create :check_personal_data
  #validates :name, :lastname, :document, :birthdate, :address, :city, presence: true

  def check_personal_data
    if self.family_situation.nil?
      self.family_situation = FamilySituation.create
    end
  end
end
