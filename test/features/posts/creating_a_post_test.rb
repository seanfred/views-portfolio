require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do
    # Given an authorized user complets a new post form
    sign_in
    visit new_post_path

    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).title
    assert page.has_css? "#author"
    page.text.must_include "By: #{users(:author).email}"
  end

  scenario "authors can't publish" do
    # Given a new author's post
    sign_in(:author)
    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "unauthenticated site vistiors cannot see new post button" do
    # When I visit the blog index page
    visit posts_path
    # Then I should not see the "New Post" button
    page.wont_have_link "New Post"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

end
