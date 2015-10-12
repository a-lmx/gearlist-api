module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render json: Item.all, status: :ok
      end

      def show
        item = Item.find(params[:id])
        render json: item
      end
    end
  end
end
