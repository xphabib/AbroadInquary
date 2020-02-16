require "application_system_test_case"

class EditorImagesTest < ApplicationSystemTestCase
  setup do
    @editor_image = editor_images(:one)
  end

  test "visiting the index" do
    visit editor_images_url
    assert_selector "h1", text: "Editor Images"
  end

  test "creating a Editor image" do
    visit editor_images_url
    click_on "New Editor Image"

    fill_in "Image", with: @editor_image.image
    click_on "Create Editor image"

    assert_text "Editor image was successfully created"
    click_on "Back"
  end

  test "updating a Editor image" do
    visit editor_images_url
    click_on "Edit", match: :first

    fill_in "Image", with: @editor_image.image
    click_on "Update Editor image"

    assert_text "Editor image was successfully updated"
    click_on "Back"
  end

  test "destroying a Editor image" do
    visit editor_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Editor image was successfully destroyed"
  end
end
