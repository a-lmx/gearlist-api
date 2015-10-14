require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  describe "POST #create" do
    before :each do
      @old_count = List.count
      post 'create', :list => { name: "Foo", user_id: 1 }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "adds 1 to the number of Lists" do
      expect(List.count).to eq(@old_count + 1)
    end
  end
end
