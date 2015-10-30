module Api
  module V1
    class ListSectionItemsController < ApplicationController
      before_action :find_section, only: [:index]

      def index
        list_section_items = @section ? @section.list_section_items : ListSectionItem.all
        
        render  json: list_section_items, 
                each_serializer: CompleteListSectionItemSerializer, 
                status: :ok
      end

      def show
        list_section_item = ListSectionItem.find(params[:id])
        render  json: list_section_item, 
                serializer: CompleteListSectionItemSerializer,
                status: :ok
      end

      def add_items
        item = params["item"]
        # find list
        list_id = params["list_id"]
        list = List.find_by(id: list_id)

        # verify list owner
        unless verify_access(list.user)
          render json: { failure: "You can only add items to your own lists." }, status: 401
        else
          # find section
          section_name = params["section"]
          section = Section.find_by(name: section_name)

          # find or create list_sections
          list_section = list.list_sections.find_by(section_id: section.id)
          unless list_section
            list_section = ListSection.create(
              list_id: list.id, 
              section_id: section.id
            )
          end

          new_item = Item.find_or_create_by(
            name: item["name"], 
            weight: item["weight"], 
            category: item["category"]
          )

          # create list_section_item
          list_section_item = ListSectionItem.create(
            list_section_id: list_section.id, 
            item_id: new_item.id, 
            quantity: params["quantity"]
          )
          if list_section_item.save
            list.update(updated_at: Time.now)
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

          # render response
          render  json: contents, 
                  status: code, 
                  location: location
        end
      end

      def update
        # retrieve data from params
        # find corresponding list_section_item (LSI)
        item = params['item']
        list_section_item = ListSectionItem.find(item['id'])

        # verify list_section_item owner
        unless verify_access(list_section_item.list.user)
          render json: { failure: "You can only update items in your own lists." }, status: 401
        else
          # check if quantity is the same
          # => if not, update quantity
          new_quantity = params['quantity']
          unless list_section_item.quantity == new_quantity
            list_section_item.quantity = new_quantity
          end

          # check if section is the same
          # => if not, update LSI's list_section_id
          new_section = Section.find_by(name: params['section'])
          unless list_section_item.section == new_section
            # snapshot count of items in old list_section
            old_list_section = list_section_item.list_section
            old_list_section_count = old_list_section.list_section_items.count

            # destroy old section if it only had the one item
            old_list_section.destroy if old_list_section_count == 1

            # create new list_section
            list_id = list_section_item.list.id
            new_list_section = ListSection.where(
              list_id: list_id, section_id: new_section.id
            ).first_or_initialize
            new_list_section.save
            list_section_item.list_section_id = new_list_section.id
          end


          # find corresponding Item
          # check if category, name, and weight are the same
          # => if not, create new item with those values
          # => and update LSI's item_id
          new_item = Item.where(
            name:     item['name'],
            category: item['category'],
            weight:   item['weight']
          ).first_or_initialize
          new_item.save
          list_section_item.item_id = new_item.id

          # save list_section_item
          if list_section_item.save
            list_section_item.list.update(updated_at: Time.now)
            code = 200
            contents = {
              success: "You updated this item in your list.",
              list_section_item_id: list_section_item.id
            }
            location = api_v1_items_path(list_section_item)
          else
            code = 400
            contents = { failure: "Something went wrong." }
          end
          # render response
          render  json: contents, 
                  status: code, 
                  location: location
        end
      end

      def destroy
        # find list_section_item
        id = params[:id]
        list_section_item = ListSectionItem.find_by(id: id)
        list_section = ListSection.find_by(id: list_section_item.list_section_id)
        list = list_section.list
        # verify list_section_item owner
        unless verify_access(list_section_item.list.user)
          render json: { failure: "You can only delete items in your own lists." }, status: 401
        else 
          if list_section_item
            # take snapshot of number of list_section_items in list_section
            list_section_count = list_section.list_section_items.count
            # delete list_section_item
            list_section_item.destroy
            # see if section only had the one item
            if list_section_count == 1
              list_section.destroy
            end

            list.update(updated_at: Time.now)
            code = 200
            contents = {
              success: 'You deleted this item from your list.',
              list_section_item_id: list_section_item.id
            }
          else
            code = 400
            contents = {
              failure: 'Something went wrong.'
            }
          end
          # render response
          render  json: contents,
                  status: code
        end
      end

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

      def list_section_item_params
        params.require(:list_section_item).permit(:list_section_id, :item_id, :quantity)
      end
    end
  end
end
