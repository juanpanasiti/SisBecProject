class HomeController < ApplicationController
  def index
    @scholarships = KindOfScholarship.all
  end

  def about
  end
end
