require "test_helper"

class StacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stack = stacks(:one)
  end

  test "should get index" do
    get stacks_url, as: :json
    assert_response :success
  end

  test "should create stack" do
    assert_difference('Stack.count') do
      post stacks_url, params: { stack: { name: @stack.name } }, as: :json
    end

    assert_response 201
  end

  test "should show stack" do
    get stack_url(@stack), as: :json
    assert_response :success
  end

  test "should update stack" do
    patch stack_url(@stack), params: { stack: { name: @stack.name } }, as: :json
    assert_response 200
  end

  test "should destroy stack" do
    assert_difference('Stack.count', -1) do
      delete stack_url(@stack), as: :json
    end

    assert_response 204
  end
end
