class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @jobs = policy_scope(Job)
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
  end
end
