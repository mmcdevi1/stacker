require 'rails_helper'

describe Building do
  describe "validations" do 

  end

  describe "relationships" do 
    it { should belong_to(:user) }
  end
end
