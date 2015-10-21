module Api
  module V1
    class ListSectionsController < ApplicationController
      def index
        list = find_list
        @list_sections = list.list_sections

        render json: @list_sections, status: :ok
      end
    end
  end
end
