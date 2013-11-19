require "test_helper"

feature "As a developer I want a front-end framework so that I can easily modify the look and feel of my site" do
  scenario "check for bootstrap" do
    visit root_path
    page.has_css? "col-"
  end
end
