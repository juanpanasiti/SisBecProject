class KindOfScholarship < ActiveRecord::Base
  has_many :scholarship_requests
  has_attached_file :cover, :styles => { :cover => "500x300" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  #validates :name, :description, :short_description, :state, :starting_date, :ending_date, presence: true
  #validates :name, uniqueness: true
  ################# OBJECTS METHODS


end
