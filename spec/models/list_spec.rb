require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { build :list }
  
  describe "validations" do
    [
      :name, 
      :user_id
    ].each do |property|
      it "requires a #{property}" do
        list[property] = nil
        list.valid?
        expect(list.errors.keys).to include(property)
      end
    end
  end
end
