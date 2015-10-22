class SessionsController < ApplicationController 
  def new
    render :new
  end
 
  def create
    @auth = request.env['omniauth.auth']['credentials']
  end
end
