require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @task = Task.new(id: 1, title: "test", content: "testdata", deadline: Date.today)
    @task.save
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get new" do
    get new_task_path
    assert_response :success    
  end

  test "should get edit" do
    get edit_task_path(@task)
    assert_response :success    
  end

  test "should get show" do
     get task_path(@task)
     assert_response :success    
   end
end