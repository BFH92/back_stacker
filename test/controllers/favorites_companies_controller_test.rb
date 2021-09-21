require "test_helper"

class FavoritesCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorites_company = favorites_companies(:one)
  end

  test "should get index" do
    get favorites_companies_url, as: :json
    assert_response :success
  end

  test "should create favorites_company" do
    assert_difference('FavoritesCompany.count') do
      post favorites_companies_url, params: { favorites_company: { company_id: @favorites_company.company_id, user_id: @favorites_company.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show favorites_company" do
    get favorites_company_url(@favorites_company), as: :json
    assert_response :success
  end

  test "should update favorites_company" do
    patch favorites_company_url(@favorites_company), params: { favorites_company: { company_id: @favorites_company.company_id, user_id: @favorites_company.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy favorites_company" do
    assert_difference('FavoritesCompany.count', -1) do
      delete favorites_company_url(@favorites_company), as: :json
    end

    assert_response 204
  end
end
