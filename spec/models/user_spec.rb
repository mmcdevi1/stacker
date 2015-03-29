require 'rails_helper'

describe User do
  describe "validations" do 
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "relationships" do 
    it { should have_many(:buildings) }
  end
end
