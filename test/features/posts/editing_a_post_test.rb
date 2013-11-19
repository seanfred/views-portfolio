require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post and a logged in author
    sign_in
    visit post_path(posts(:cr))

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end

  scenario "Only editors can publish" do
    # Given an unpublished post (in fixtures)
    # And an editor signed in
    sign_in(:editor)
    visit edit_post_path(posts(:unpublished))
    # When I update the published checkbox to checked and save
    page.check('Published')
    click_button "Update Post"
    # Then the post will be published
    page.must_have_content "was successfully updated"
    visit posts_path
    page.must_have_content posts(:unpublished).title
  end

  scenario "Authors cannot publish" do
    # Given an unpublished post (in fixtures)
    # And an author signed in
    sign_in(:author)
    # When I visit the edit page
    visit edit_post_path(posts(:unpublished))
    # There is no checkbox for published
    page.wont_have_text "Published"
  end

end
