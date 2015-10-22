module Api
  module V1
    class ListSectionItemsController < ApplicationController
      before_action :find_section, only: [:index]

      # used by App
      def index
        list_section_items = @section ? @section.list_section_items : ListSectionItem.all
        
        render  json: list_section_items, 
                each_serializer: CompleteListSectionItemSerializer, 
                status: :ok
      end

      def add_items
        item = params["item"]
        # find list
        list_id = params["list_id"]
        list = List.find_by(id: list_id)

        # find section
        section_name = params["section"]
        section = Section.find_by(name: section_name)

        # find or create list_section
        list_section = list.list_sections.find_by(section_id: section.id)
        unless list_section
          list_section = ListSection.create(
            list_id: list.id, 
            section_id: section.id
          )
        end

        # find or create item
        new_item = Item.find_by(
          name: item["name"], 
          weight: item["weight"], 
          category: item["category"])
        unless new_item
          new_item = Item.create(
            name: item["name"], 
            weight: item["weight"], 
            category: item["category"])
        end

        # create list_section_item
        list_section_item = ListSectionItem.create(
          list_section_id: list_section.id, 
          item_id: new_item.id, 
          quantity: params["quantity"]
        )
        if list_section_item.save
          code = 201
          contents = {
            success: "You added an item to your list.",
            list_section_item_id: list_section_item.id
          }
          location = api_v1_list_section_item_path(list_section_item)
        else
          code = 400
          contents = { failure: "Something went wrong." }
        end
        ### check for pre-existing item?
        # render response
        render  json: contents, 
                status: code, 
                location: location
      end

      ### From ListsController
      # def create
      #   list = List.create(list_params)

      #   if list.save
      #     code = 201
      #     contents = { 
      #       success: "You created a list.",
      #       list_id: list.id
      #     }
      #     location = api_v1_list_path(list)
      #   else
      #     code = 400
      #     contents = { failure: "Something went wrong." }
      #   end

      #   render json: contents, status: code, location: location
      #   # get big object from client, parse into list object and list of item objects
      #   # => create necessary items, list_sections, list_section_items
      # end

      # def complete
      #   list = find_list
      #   list_items = list.list_items.order(:section_id)

      #   render json: list_items, each_serializer: CompleteListItemSerializer
      # end

      # def by_section
      #   list = find_list
      #   section = Section.find(params[:section_id])
      #   list_items = list.list_items.where(section: section)

      #   render json: list_items, each_serializer: CompleteListSectionItemSerializer, status: :ok
      # end

      # def show
      #   list_item = ListSectionItem.find(params[:id])
      #   render json: list_item
      # end

      # def create
      #   ListSectionItem.create(list_item_params)

      #   render json: { message: "You created a list_item." }, status: 204
      # end

      # def destroy
      #   list_item = ListSectionItem.find_by(id: params[:id])
      #   list_item.destroy

      #   render json: { message: "You destroyed a list_item.", status: 204 }
      # end

      private

      # def find_list
      #   List.find(params[:list_id])
      # end

      def list_section_item_params
        params.require(:list_section_item).permit(:list_section_id, :item_id, :quantity)
      end
    end
  end
end
