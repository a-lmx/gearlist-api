require 'rails_helper'

RSpec.describe Api::V1::ListItemsController, type: :controller do
  describe "GET #index" do
    let(:list) { create :list }

    before :each do
      list_item1 = create :list_item, list_id: list.id, item_id: 2, quantity: 1
      list_item2 = create :list_item, list_id: list.id, item_id: 4, quantity: 3

      get :index
      list_items_wrapper = JSON.parse response.body
      @list_items = list_items_wrapper["list_items"]
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    context "the returned JSON object" do
      it "is an array" do
        expect(@list_items).to be_an_instance_of Array
      end

      it "is equal in length to the number of Items in the List" do
        list_items_count = list.list_items.count
        expect(@list_items.length).to eq(list_items_count)
      end

      it "includes name, category, and weight" do
        expect(@list_items.first.keys).to eq [
          "id",
          "list_id", 
          "item_id", 
          "quantity"
          ]
      end
    end
  end

  describe "GET #show" do
    before :each do
      list_item1 = create :list_item
      get :show, id: list_item1.id

      @list_item = JSON.parse response.body
    end

    it "returns http success" do
      expect(response).to have_http_status :success
    end

    context "the returned JSON object" do
      it "has an `list_item` wrapper" do
        expect(@list_item.keys).to eq ["list_item"]
      end

      it "includes id, name, category, and weight" do
        expect(@list_item["list_item"].keys).to eq [
          "id",
          "list_id", 
          "item_id", 
          "quantity"
          ]
      end
    end
  end
end
