class Managements::ProfilesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_kind_of_scholarships
  layout "management"
  def index
    @students = Profile.all
  end
  def show
    @student = Profile.find(params[:id])
  end
end
