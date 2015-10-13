module Api
  module V1
    class ListsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        lists = List.where(user: user)

        render json: { lists: lists }
      end

      def show
        list = List.find(params[:id])
        items = list.items

        render json: { list: list, items: items }
      end

      def create
        List.create(list_params)

        render json: { message: "You created a list." }
      end

      private

      def list_params
        params.require(:list).permit(:user_id, :name)
      end
    end
  end
end
