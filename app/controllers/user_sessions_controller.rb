class UserSessionsController < ApplicationController
include Filter


  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        redirect_to current_user, notice: 'User session was successfully created.' 
        filter
      else
        render action: "new" 
      end
  end

  def destroy
    @user_session = UserSession.find(current_user_session)
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :ok }
    end
  end
  
end
