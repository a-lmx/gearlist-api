require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do

    before :each do
      item1 = create :item, name: "circuit"
      item2 = create :item, name: "burn"

      get :index
      items_wrapper = JSON.parse response.body
      @items = items_wrapper["items"]
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    context "the returned JSON object" do
      it "is an array" do
        expect(@items).to be_an_instance_of Array
      end

      it "is equal in length to the number of Items in the db" do
        expect(@items.length).to eq(Item.count)
      end

      it "includes name, category, and weight" do
        expect(@items.first.keys).to eq [
          "id",
          "name", 
          "category", 
          "weight"
          ]
      end
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
