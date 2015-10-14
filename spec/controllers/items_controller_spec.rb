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
    before :each do
      item1 = create :item
      get :show, id: item1.id

      @item = JSON.parse response.body
    end

    it "returns http success" do
      expect(response).to have_http_status :success
    end

    context "the returned JSON object" do
      it "has an `item` wrapper" do
        expect(@item.keys).to eq ["item"]
      end

      it "includes id, name, category, and weight" do
        expect(@item["item"].keys).to eq [
          "id",
          "name", 
          "category", 
          "weight"
          ]
      end
    end
  end

  describe "POST #create" do
    let(:valid_params) { 
      {
        name: "Foo", 
        category: "bar", 
        weight: 10
        } 
      }

    before :each do
      @old_count = Item.count
      post 'create', item: valid_params
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "adds 1 to the number of Items" do
      expect(Item.count).to eq(@old_count + 1)
    end
  end

end
