# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'create' do
    expect(Repository.count).must_equal 1
  end
  # END
end
