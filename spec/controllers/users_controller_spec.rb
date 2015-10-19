require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "GET #show" do
    before :each do
      user1 = create :user
      get :show, id: user1.id

      @user = JSON.parse response.body
    end

    it "returns http success" do
      expect(response).to have_http_status :success
    end

    context "the returned JSON object" do
      # it "has an `user` wrapper" do
      #   expect(@user.keys).to eq ["user"]
      # end

      it "includes id, name, category, and weight" do
        expect(@user.keys).to eq [
        # expect(@user["user"].keys).to eq [
          "id",
          "username", 
          "uid"
          ]
      end
    end
  end
end
