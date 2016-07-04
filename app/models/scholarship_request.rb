class ScholarshipRequest < ActiveRecord::Base
  belongs_to :school_situation
  belongs_to :kind_of_scholarship
end
