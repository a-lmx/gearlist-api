require 'rails_helper'

RSpec.describe ListItem, type: :model do
  let(:list_item) { build :list_item }

  describe "validations" do
    [
      :item_id, 
      :list_id,
      :section_id 
    ].each do |property|
      it "requires a #{property}" do
        list_item[property] = nil
        list_item.valid?
        expect(list_item.errors.keys).to include(property)
      end
    end
  end
end
