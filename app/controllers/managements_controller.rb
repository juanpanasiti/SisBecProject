class ManagementsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_kind_of_scholarships
  layout "management"
  def index
		@scholarships = KindOfScholarship.all.count
		@profiles = Profile.all.count
		@requests = ScholarshipRequest.all.count
  end


end
