class HomepageController < ApplicationController
  before_filter :require_user, :only => [:dashboard]

  def index
    redirect_to :dashboard if (current_user)
  end

  def dashboard
  end
end
