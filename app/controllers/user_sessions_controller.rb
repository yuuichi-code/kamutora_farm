class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(:users,notice: t('.success'))
    else
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('.success'), status: :see_other
  end
end
