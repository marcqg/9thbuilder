require 'test_helper'

class Paint::PaintListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paint_paint_list = paint_paint_lists(:one)
  end

  test "should get index" do
    get paint_paint_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_paint_paint_list_url
    assert_response :success
  end

  test "should create paint_paint_list" do
    assert_difference('Paint::PaintList.count') do
      post paint_paint_lists_url, params: { paint_paint_list: { name: @paint_paint_list.name } }
    end

    assert_redirected_to paint_paint_list_url(Paint::PaintList.last)
  end

  test "should show paint_paint_list" do
    get paint_paint_list_url(@paint_paint_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_paint_paint_list_url(@paint_paint_list)
    assert_response :success
  end

  test "should update paint_paint_list" do
    patch paint_paint_list_url(@paint_paint_list), params: { paint_paint_list: { name: @paint_paint_list.name } }
    assert_redirected_to paint_paint_list_url(@paint_paint_list)
  end

  test "should destroy paint_paint_list" do
    assert_difference('Paint::PaintList.count', -1) do
      delete paint_paint_list_url(@paint_paint_list)
    end

    assert_redirected_to paint_paint_lists_url
  end
end
