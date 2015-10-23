class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :restrict_access

  private

  def restrict_access
    # token = request.headers["Token"]

    # if token == nil || !User.find_by(token: token)
    #   render json: { error: 'Bad Token'}, status: 401
    # end

    authenticate_or_request_with_http_token do |token, options|
      User.exists?(token: token)
    end
  end

  def find_list
    @list = List.find_by(id: params[:id] || params[:list_id])
  end

  def find_section
    @section = ListSection.find_by(id: params[:id] || params[:list_section_id])
  end
end
