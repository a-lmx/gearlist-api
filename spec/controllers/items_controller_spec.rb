require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:item) { create :item }

    it "returns http success" do
      get :show, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

end
