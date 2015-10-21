module Api
  module V1
    class UsersController < ApplicationController
      def show
        user = User.find(params[:id])
        render json: user
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: { success: "Congrats, you signed up.", user_id: user.id }
        else
          render json: { error: "There was a problem with the signup." }
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
    end
  end
end
