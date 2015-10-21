class ApplicationController < ActionController::API
  private
  
  def find_list
    List.find(params[:id] || params[:list_id])
  end
end
