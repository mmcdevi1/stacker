require 'rails_helper'

describe "Creating users" do 
  it "successfully creates a new user" do 
    visit register_path
    fill_in "Username", with: "mmcdevi1"
    fill_in "Email", with: "mmcdevi1@gmail.com"
    fill_in "Password", with: "password"
    click_button "Register"
    expect(page).to have_content("Successfully registered with Stacker.")
  end
end