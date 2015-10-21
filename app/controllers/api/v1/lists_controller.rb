module Api
  module V1
    class ListsController < ApplicationController
      def index
        if params[:user_id]
          user = User.find(params[:user_id]) 
          @lists = user.lists
        else
          @lists = List.all
        end

        render json: @lists, status: :ok
      end

      def items_by_section
        @list = find_list

        render json: @list, serializer: CompleteListSerializer, status: :ok
      end

      def show
        @list = List.find(params[:id])
        render json: @list
      end

      def create
        List.create(list_params)

        render json: { message: "You created a list." }, status: 204
      end

      private

      def find_list
        List.find(params[:id] || params[:list_id])
      end

      def list_params
        params.require(:list).permit(:user_id, :name)
      end
    end
  end
end
