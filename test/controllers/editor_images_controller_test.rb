require 'test_helper'

class EditorImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @editor_image = editor_images(:one)
  end

  test "should get index" do
    get editor_images_url
    assert_response :success
  end

  test "should get new" do
    get new_editor_image_url
    assert_response :success
  end

  test "should create editor_image" do
    assert_difference('EditorImage.count') do
      post editor_images_url, params: { editor_image: { image: @editor_image.image } }
    end

    assert_redirected_to editor_image_url(EditorImage.last)
  end

  test "should show editor_image" do
    get editor_image_url(@editor_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_editor_image_url(@editor_image)
    assert_response :success
  end

  test "should update editor_image" do
    patch editor_image_url(@editor_image), params: { editor_image: { image: @editor_image.image } }
    assert_redirected_to editor_image_url(@editor_image)
  end

  test "should destroy editor_image" do
    assert_difference('EditorImage.count', -1) do
      delete editor_image_url(@editor_image)
    end

    assert_redirected_to editor_images_url
  end
end
