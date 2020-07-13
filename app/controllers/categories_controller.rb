class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @categories = policy_scope(Category)
    @jobs = Job.all
    PgSearch::Multisearch.rebuild(Job)
    PgSearch::Multisearch.rebuild(Category)
    @jobs = PgSearch.multisearch(params[:query]) if params[:query].present?
    
  end


end
