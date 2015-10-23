module Api
  module V1
    class SessionsController < ApplicationController      
      def create
        id = params["id"]
        name = params["name"]
        provider = params["provider"]

        user = User.find_or_create_by_omniauth(id, name, provider)

        render  json: { userId: user.id, token: user.token },
                status: 200         
      end
    end
  end
end
