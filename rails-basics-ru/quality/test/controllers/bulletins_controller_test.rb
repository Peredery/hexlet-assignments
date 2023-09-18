# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'open index page' do
    get root_url

    assert_response :success
  end

  test 'open show page' do
    get bulletin_path(bulletins(:bulletin_1))
    assert_response :success
    assert_select 'h1', 'Title 1'
  end
end
