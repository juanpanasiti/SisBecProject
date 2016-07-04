class Profile < ActiveRecord::Base
  belongs_to :user
  has_one :personal_datum
  has_one :economic_situation
  has_one :school_situation

  accepts_nested_attributes_for :personal_datum,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :economic_situation,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :school_situation,reject_if: :all_blank, allow_destroy: true

  after_create :check_profile

  #validates :personal_datum, :economic_situation, :school_situation, presence: true

  def check_profile
    if self.personal_datum.nil?
      self.personal_datum = PersonalDatum.create
    end
    if self.school_situation.nil?
      self.school_situation = SchoolSituation.create
    end
    if self.economic_situation.nil?
      self.economic_situation = EconomicSituation.create
    end
  end

  ######################## METODOS
  def get_full_name
    fullname = ''
    if self.personal_datum.lastname.present?
      fullname.concat("#{self.personal_datum.lastname.upcase}, ")
    end
    if personal_datum.name.present?
      fullname.concat(self.personal_datum.name.titleize)
    end
    return fullname
  end

  def get_dni
    self.personal_datum.document
  end
  def get_email
    self.user.email
  end
  def get_career
    self.school_situation.career
  end
  def get_last_login
    self.user.current_sign_in_at
  end
end
