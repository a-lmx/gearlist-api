require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  describe "GET #index" do
    context "no user_id" do
      before :each do
        list1 = create :list, name: "JMT", user_id: 1
        list2 = create :list, name: "PCT", user_id: 1

        get :index
        @lists = JSON.parse response.body
        # lists_wrapper = JSON.parse response.body
        # @lists = lists_wrapper["lists"]
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      context "the returned JSON object" do
        it "is an array" do
          expect(@lists).to be_an_instance_of Array
        end

        it "is equal in length to the number of Items in the db" do
          expect(@lists.length).to eq(List.count)
        end

        it "includes name, category, and weight" do
          expect(@lists.first.keys).to eq [
            "id",
            "name", 
            "user_id"
            ]
        end
      end
    end

    context "has user_id" do
      let(:user) { create :user }

      before :each do
        list1 = create :list, name: "JMT", user_id: user.id
        list2 = create :list, name: "PCT", user_id: user.id + 1

        get :index, user_id: user.id
        @lists = JSON.parse response.body
        # lists_wrapper = JSON.parse response.body
        # @lists = lists_wrapper["lists"]
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      context "the returned JSON object" do
        it "only shows the lists for that user" do
          list_count = List.where(user_id: user.id).length
          expect(@lists.length).to eq(list_count)
        end
      end
    end
  end

  describe "GET #show" do
    before :each do
      list1 = create :list
      get :show, id: list1.id

      @list = JSON.parse response.body
    end

    it "returns http success" do
      expect(response).to have_http_status :success
    end

    context "the returned JSON object" do
      # it "has an `list` wrapper" do
      #   expect(@list.keys).to eq ["list"]
      # end

      it "includes id, name, category, and weight" do
        expect(@list.keys).to eq [
        # expect(@list["list"].keys).to eq [
          "id",
          "name", 
          "user_id"
          ]
      end
    end
  end

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
