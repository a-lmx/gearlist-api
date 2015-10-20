require 'rails_helper'

RSpec.describe ListSectionItem, type: :model do
  let(:list_section_item) { build :list_section_item }

  describe "validations" do
    [
      :item_id, 
      :list_section_id
    ].each do |property|
      it "requires a #{property}" do
        list_section_item[property] = nil
        list_section_item.valid?
        expect(list_section_item.errors.keys).to include(property)
      end
    end
  end
end
