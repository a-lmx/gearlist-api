module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render json: Item.all, status: :ok
      end
    end
  end
end
