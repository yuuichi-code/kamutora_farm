class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render action: 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('.success'), status: :see_other
  end
end
