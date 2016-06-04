class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    logout
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: t('.success'))
    else
      flash.notice = t('.failed')
      render(action: 'new')
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: t('.notice'))
  end
end
