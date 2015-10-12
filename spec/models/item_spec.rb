require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { build :item }

  describe "validations" do
    [
      :name,
      :category, 
      :weight
    ].each do |property|
      it "requires a #{property}" do
        item[property] = nil
        item.valid?
        expect(item.errors.keys).to include(property)
      end
    end

    it "doesn't allow a weight of 0" do
      item.weight = 0
      item.valid?
      expect(item.errors.keys).to include(:weight)
    end

    it "doesn't allow a negative weight" do
      item.weight = -10
      item.valid?
      expect(item.errors.keys).to include(:weight)
    end

    it "doesn't allow a decimal weight" do
      item.weight = 10.5
      item.valid?
      expect(item.errors.keys).to include(:weight)
    end
  end
end
