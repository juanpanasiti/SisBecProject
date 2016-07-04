class SchoolSituation < ActiveRecord::Base
  belongs_to :profile
  has_one :school_week

  accepts_nested_attributes_for :school_week,reject_if: :all_blank, allow_destroy: true

  after_create :check_school_situation

  def check_school_situation
    if self.school_week.nil?
      self.school_week = SchoolWeek.create
    end
  end
end
