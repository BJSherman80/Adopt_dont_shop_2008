require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  it "can see all users info" do
    user_1 = User.create!(name: "Elizabeth", address: "56774 FLower Ave.", city: "Smallville", state: "Alaska", zip: 87645 )

    visit "/users/#{user_1.id}"

    expect(page).to have_content(user_1.name)
    expect(page).to have_content(user_1.address)
    expect(page).to have_content(user_1.city)
    expect(page).to have_content(user_1.state)
    expect(page).to have_content(user_1.zip)
  end
end
