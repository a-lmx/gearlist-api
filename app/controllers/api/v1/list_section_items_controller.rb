module Api
  module V1
    class ListSectionItemsController < ApplicationController
      before_action :find_section, only: [:index]

      def index
        list_section_items = @section ? @section.list_section_items : ListSectionItem.all
        
        render json: list_section_items, each_serializer: CompleteListSectionItemSerializer, status: :ok
      end

      def complete
        list = find_list
        list_items = list.list_items.order(:section_id)

        render json: list_items, each_serializer: CompleteListItemSerializer
      end

      def by_section
        list = find_list
        section = Section.find(params[:section_id])
        list_items = list.list_items.where(section: section)

        render json: list_items, each_serializer: CompleteListSectionItemSerializer, status: :ok
      end

      def show
        list_item = ListSectionItem.find(params[:id])
        render json: list_item
      end

      def create
        ListSectionItem.create(list_item_params)

        render json: { message: "You created a list_item." }, status: 204
      end

      def destroy
        list_item = ListSectionItem.find_by(id: params[:id])
        list_item.destroy

        render json: { message: "You destroyed a list_item.", status: 204 }
      end

      private

      # def find_list
      #   List.find(params[:list_id])
      # end

      def list_item_params
        params.require(:list_section_item).permit(:list_section_id, :item_id, :quantity)
      end
    end
  end
end
