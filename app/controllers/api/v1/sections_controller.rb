module Api
  module V1
    class SectionsController < ApplicationController
      def index
        if params[:list_id]
          list = List.find(params[:list_id]) 
          @sections = list.sections.uniq
        else
          @sections = Sections.all
        end

        render json: @sections, each_serializer: SectionSerializer, status: :ok
      end
    end
  end
end
