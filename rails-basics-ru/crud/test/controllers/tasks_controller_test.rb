require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'index' do
    get new_task_url
    assert_response :success
  end
end
