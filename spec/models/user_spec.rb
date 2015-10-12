require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }
  
  describe "validations" do
    [
      :uid, 
      :username
    ].each do |property|
      it "requires a #{property}" do
        user[property] = nil
        user.valid?
        expect(user.errors.keys).to include(property)
      end
    end
  end
end
