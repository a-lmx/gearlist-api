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
        list = List.create(list_params)

        if list.save
          code = 201
          contents = { 
            success: "You created a list.",
            list_id: list.id
          }
          location = api_v1_list_path(list)
        else
          code = 400
          contents = { failure: "Something went wrong." }
        end

        render json: contents, status: code, location: location
        # get big object from client, parse into list object and list of item objects
        # => create necessary items, list_sections, list_section_items
      end

      private

      def find_list
        List.find(params[:id] || params[:list_id])
      end

      def list_params
        params.require(:list).permit(:user_id, :name, :description)
      end
    end
  end
end
