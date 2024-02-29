# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  def setup
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
  end

  test 'showing a Post' do
    visit post_url(@post)

    assert_text "Body:#{@post.body}"
    assert_selector 'h1', text: @post.title
  end

  test 'creating a Post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Body', with: 'MyString'
    fill_in 'Title', with: 'MyString'
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'editing a Post' do
    visit edit_post_path(@post)

    fill_in 'Body', with: 'MyEditedString'
    click_on 'Update Post'

    assert_text 'Post was successfully updated.'
    click_on 'Back'
  end

  test 'destroying a Post' do
    visit posts_url

    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end
# END
