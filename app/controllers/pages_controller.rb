class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    authorize @page
    @jobs = Job.all
    @new_user = User.new
  end
end
