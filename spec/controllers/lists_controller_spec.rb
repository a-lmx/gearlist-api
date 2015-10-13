require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  describe "POST #create" do
    before :each do
      post 'create', :list => { name: "Foo", user_id: 1 }
    end
    # it "should be successful" do
    #   # request.env["HTTP_ACCEPT"] = "application/json"
    # end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
