class SchoolWeek < ActiveRecord::Base
  belongs_to :school_situation

  after_create :check_school_week

  def check_school_week
    week = self
    week.monday = false if week.monday.nil?
    week.tuesday = false if week.tuesday.nil?
    week.wednesday = false if week.wednesday.nil?
    week.thursday = false if week.thursday.nil?
    week.friday = false if week.friday.nil?
    week.saturday = false if week.saturday.nil?
  end
end
