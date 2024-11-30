# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should_create' do
    stubbed_data = load_fixture('files/response.json')

    repo_link = 'https://github.com/rails/rails'

    stub_request(
      :get, 'https://api.github.com/repos/rails/rails'
    ).with(
      headers: {
        'Accept'=>'application/vnd.github.v3+json',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'User-Agent'=>'Octokit Ruby Gem 9.1.0'
        }).
    to_return(status: 200, body: stubbed_data,  headers: { 'Content-Type': 'application/json' })

    post repositories_path, params: { repository: { link: repo_link } }

    assert_response :redirect
  end
  # END
end
