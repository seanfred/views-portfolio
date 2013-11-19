require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    # Given new project data entered in a form
    visit projects_path
    visit new_project_path
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

    # Then a confirmation page should show the new Project
    page.text.must_include "HTML5"
    page.text.must_include "Rails"
  end

  scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    visit new_project_path
    fill_in "Name", with: "Q"

    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"

    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "prohibited this project from being saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
