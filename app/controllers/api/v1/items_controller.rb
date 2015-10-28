# module Api
#   module V1
#     class ItemsController < ApplicationController
#       # def index
#       #   if params[:list_id]
#       #     list = List.find(params[:list_id]) 
#       #     items = list.items
#       #   else
#       #     items = Item.all
#       #   end

#       #   render json: items, status: :ok
#       # end

#       def show
#         item = Item.find(params[:id])
#         render json: item
#       end

#       def create
#         Item.create(item_params)

#         render json: { message: "You created a item." }, status: 204
#       end

#       private

#       def item_params
#         params.require(:item).permit(:name, :category, :weight)
#       end
#     end
#   end
# end
