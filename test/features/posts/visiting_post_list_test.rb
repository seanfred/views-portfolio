require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts, non logged in user" do
    # Given existing posts (in fixtures)

    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include posts(:cf).title
    page.text.wont_include posts(:unpublished).title

    # And I should not see the edit link
  end


  scenario "with existing posts, editor" do
    # Given existing posts (in fixtures)
    # And an editor user
    sign_in(:editor)

    # When I visit /posts
    visit posts_path

    # Then both published and ubpublished posts should be there
    page.text.must_include posts(:cf).title
    page.text.must_include posts(:unpublished).title
    page.text.must_include posts(:written_by_editor).title
    page.text.must_include posts(:written_by_author2).title
  end

  scenario "with existing posts, author" do
    # Given existing posts (in fixtures)
    # And an editor user
    sign_in(:author)

    # When I visit /posts
    visit posts_path

    # Then both published and ubpublished posts should be there
    page.text.must_include posts(:cf).title
    page.text.must_include posts(:unpublished).title
  end
end
