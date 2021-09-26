require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "root_path links" do
    get root_path
    assert_template 'tasks/index'
    assert_select   "a[href=?]", root_path
    assert_select   "a[href=?]", new_task_path
  end

  test "new_task_path links" do
    get new_task_path
    assert_template 'tasks/new'
    assert_select   "a[href=?]", root_path, count: 2    
  end

  test "invalid create(new-btn)" do
    get new_task_path
    assert_no_difference 'Task.count' do
      post tasks_path, params: { task: {title:    "",
                                        content:  "testdata",
                                        deadlinw: Date.today}}
    end
    assert_template 'tasks/new'
    assert_select   "div#error_explanation"
  end

  test "valid create(new-btn)" do
    get new_task_path
    assert_difference 'Task.count', 1 do
      post tasks_path, params: { task: {title:    "test",
                                        content:  "testdata",
                                        deadline: Date.today}}
    end
    follow_redirect!
    assert_template 'tasks/index'
  end
end