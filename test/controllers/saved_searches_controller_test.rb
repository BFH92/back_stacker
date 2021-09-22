require "test_helper"

class SavedSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_search = saved_searches(:one)
  end

  test "should get index" do
    get saved_searches_url, as: :json
    assert_response :success
  end

  test "should create saved_search" do
    assert_difference('SavedSearch.count') do
      post saved_searches_url, params: { saved_search: { company_category: @saved_search.company_category, stacks: @saved_search.stacks, staff_size: @saved_search.staff_size, user_id: @saved_search.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show saved_search" do
    get saved_search_url(@saved_search), as: :json
    assert_response :success
  end

  test "should update saved_search" do
    patch saved_search_url(@saved_search), params: { saved_search: { company_category: @saved_search.company_category, stacks: @saved_search.stacks, staff_size: @saved_search.staff_size, user_id: @saved_search.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy saved_search" do
    assert_difference('SavedSearch.count', -1) do
      delete saved_search_url(@saved_search), as: :json
    end

    assert_response 204
  end
end
