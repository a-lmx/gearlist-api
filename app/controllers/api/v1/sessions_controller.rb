module Api
  module V1
    class SessionsController < ApplicationController 
      def new
        render :new
      end
     
      def create
        raise
        # @auth = request.env['omniauth.auth']['credentials']
        # redirect_to root_path
        # render :create
      end
    end
  end
end
