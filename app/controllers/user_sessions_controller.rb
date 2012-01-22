class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { render :json => @user_session.user.single_access_token }
      end
    else
      respond_to do |format|
        format.html { render :action => :new }
        format.json { render :json => nil, :status => 400 }
      end
    end
  end

  def destroy
    current_user_session.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
  
end
