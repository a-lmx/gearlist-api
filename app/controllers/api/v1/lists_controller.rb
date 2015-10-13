module Api
  module V1
    class ListsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        
        render json: List.where(user: user)
      end
    end
  end
end
