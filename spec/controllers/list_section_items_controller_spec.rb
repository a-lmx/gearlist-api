require 'rails_helper'

RSpec.describe Api::V1::ListSectionItemsController, type: :controller do
  describe "GET #index" do
    context "no list_id" do
      before :each do
        list_item1 = create :list_item, list_id: 1, item_id: 2, quantity: 1
        list_item2 = create :list_item, list_id: 2, item_id: 4, quantity: 3

        get :index
        @list_items = JSON.parse response.body
        # list_items_wrapper = JSON.parse response.body
        # @list_items = list_items_wrapper["list_items"]
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      context "the returned JSON object" do
        it "is an array" do
          expect(@list_items).to be_an_instance_of Array
        end

        it "includes name, category, and weight" do
          expect(@list_items.first.keys).to eq [
            "id",
            "list_id", 
            "item_id", 
            "quantity",
            "section"
            ]
        end
      end
    end

    context "has list_id" do
      let(:list) { create :list }

      before :each do
        list_item1 = create :list_item, list_id: list.id, item_id: 2, quantity: 1
        list_item2 = create :list_item, list_id: list.id + 1, item_id: 4, quantity: 3

        get :index, list_id: list.id
        @list_items = JSON.parse response.body
        # list_items_wrapper = JSON.parse response.body
        # @list_items = list_items_wrapper["list_items"]
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      context "the returned JSON object" do
        it "is equal in length to the number of Items in the List" do
          list_items_count = list.list_items.count
          expect(@list_items.length).to eq(list_items_count)
        end
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
      # it "has an `list_item` wrapper" do
      #   expect(@list_item.keys).to eq ["list_item"]
      # end

      it "includes id, name, category, and weight" do
        expect(@list_item.keys).to eq [
        # expect(@list_item["list_item"].keys).to eq [
          "id",
          "list_id", 
          "item_id", 
          "quantity",
          "section"
          ]
      end
    end
  end

  describe "POST #create" do
    let(:valid_params) { 
      {
        list_id: 1, 
        item_id: 3, 
        quantity: 10,
        section: "packing"
        } 
      }

    before :each do
      @old_count = ListItem.count
      post 'create', list_item: valid_params
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "adds 1 to the number of ListItems" do
      expect(ListItem.count).to eq(@old_count + 1)
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @list_item = create :list_item
      @old_count = ListItem.count

      delete 'destroy', id: @list_item.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "deletes 1 from the number of ListItems" do
      expect(ListItem.count).to eq(@old_count - 1)
    end
  end
end
