module Api
  module V1
    class SectionsController < ApplicationController
      def index
        @sections = Section.all

        render json: @sections, each_serializer: SectionSerializer, status: :ok
      end
    end
  end
end
