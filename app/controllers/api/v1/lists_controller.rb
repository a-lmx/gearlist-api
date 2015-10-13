module Api
  module V1
    class ListsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        lists = List.where(user: user)

        render json: { lists: lists }
      end
    end
  end
end
