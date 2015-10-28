module Api
  module V1
    class ListsController < ApplicationController
      def index
        if params[:user_id]
          user = User.find(params[:user_id]) 
          @lists = user.lists.by_age
        else
          @lists = List.all.published
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
          contents = { 
            failure: "Something went wrong." 
          }
        end

        render json: contents, status: code, location: location
      end

      def update
        @list = List.find_by(id: list_params[:id])

        unless verify_access(@list.user)
          render json: { failure: "You can only add items to your own lists." }, status: 401
        else
          @list.update(list_params)

          if @list.save
            code = 200
            contents = {
              success: 'You updated this list.',
              list_id: @list.id
            }
          else
            code = 400,
            contents = {
              failure: 'Something went wrong.'
            }
          end

          render json: contents, status: code
        end
      end

      def destroy
        list = List.find_by(id: params[:id])
        list_id = list.id

        unless verify_access(list.user)
          render json: { failure: "You can only delete your own lists." }, status: 401
        else
          list.destroy

          if List.find_by(id: params[:id])
            code = 400,
            contents = {
              failure: 'Something went wrong.'
            }
          else
            code = 200
            contents = {
              success: 'You deleted that list.',
              list_id: list_id
            }
          end

          render json: contents, status: code
        end
      end

      private

      def find_list
        @list = List.find(params[:id] || params[:list_id])
      end

      def list_params
        params.require(:list).permit(:id, :user_id, :name, :description, :secret)
      end
    end
  end
end
