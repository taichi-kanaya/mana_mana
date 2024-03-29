class UnsubscribeController < ApplicationController
  def index
  end

  def execute
    ActiveRecord::Base.transaction do
      
      # user_access_categories
      UserAccessCategory.where("user_id = ?", session[:id]).delete_all
      UserAccessCategory.where("created_user_id = ?", session[:id]).delete_all
      
      # good_categories
      GoodCategory.where("created_user_id = ?", session[:id]).delete_all
      
      # questions
      Question.where("created_user_id = ?", session[:id]).delete_all

      # categories
      Category.where("created_user_id = ?", session[:id]).delete_all
      
      # users
      User.where("id = ?", session[:id]).delete_all
      
    end
    redirect_to :controller => '/unsubscribe_comp'
  end
end
