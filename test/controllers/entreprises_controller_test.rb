require "test_helper"

class EntreprisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entreprise = entreprises(:one)
  end

  test "should get index" do
    get entreprises_url, as: :json
    assert_response :success
  end

  test "should create entreprise" do
    assert_difference('Entreprise.count') do
      post entreprises_url, params: { entreprise: { description: @entreprise.description, github: @entreprise.github, is_it_recruiting: @entreprise.is_it_recruiting, name: @entreprise.name, stack: @entreprise.stack, staff_size: @entreprise.staff_size } }, as: :json
    end

    assert_response 201
  end

  test "should show entreprise" do
    get entreprise_url(@entreprise), as: :json
    assert_response :success
  end

  test "should update entreprise" do
    patch entreprise_url(@entreprise), params: { entreprise: { description: @entreprise.description, github: @entreprise.github, is_it_recruiting: @entreprise.is_it_recruiting, name: @entreprise.name, stack: @entreprise.stack, staff_size: @entreprise.staff_size } }, as: :json
    assert_response 200
  end

  test "should destroy entreprise" do
    assert_difference('Entreprise.count', -1) do
      delete entreprise_url(@entreprise), as: :json
    end

    assert_response 204
  end
end
