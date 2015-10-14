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

      def create
        ListItem.create(list_item_params)

        render json: { message: "You created a list_item." }, status: 204
      end

      def destroy
        list_item = ListItem.find_by(id: params[:id])
        list_item.destroy

        render json: { message: "You destroyed a list_item.", status: 204 }
      end

      private

      def list_item_params
        params.require(:list_item).permit(:list_id, :item_id, :quantity)
      end
    end
  end
end