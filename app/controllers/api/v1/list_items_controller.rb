module Api
  module V1
    class ListItemsController < ApplicationController
      def index
        if params[:list_id]
          list = List.find(params[:list_id]) 
          list_items = list.list_items
        else
          list_items = ListItem.all
        end

        render json: list_items, status: :ok
      end

      def show
        list_item = ListItem.find(params[:id])
        render json: list_item
      end
    end
  end
end
