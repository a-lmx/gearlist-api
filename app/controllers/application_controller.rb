class ApplicationController < ActionController::API
  
  private

  def find_list
    @list = List.find_by(id: params[:id] || params[:list_id])
  end

  def find_section
    @section = ListSection.find_by(id: params[:id] || params[:list_section_id])
  end
end
