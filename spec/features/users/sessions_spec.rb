require 'rails_helper' 

describe "Creating user sessions" do 
  let(:user) { Fabricate(:user) }

  it "logs the user in and redirects to the root path" do 
    visit login_path
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password 
    click_button "Log in"
    expect(page).to have_content(user.username)
    expect(page).to have_content("You are signed in, enjoy!")
  end

  it "does not log the user in with invalid params" do
    visit login_path
    fill_in "Email", with: user.email 
    fill_in "Password", with: "incorrect_password" 
    click_button "Log in" 
    expect(page).to have_content("Invalid email or password")
  end
end