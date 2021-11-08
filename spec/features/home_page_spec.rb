require "rails_helper"
# this is to show the projects page, it is the process of loading the homepage
RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end
