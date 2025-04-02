require "application_system_test_case"

class MealPostsTest < ApplicationSystemTestCase
  setup do
    @meal_post = meal_posts(:one)
  end

  test "visiting the index" do
    visit meal_posts_url
    assert_selector "h1", text: "Meal posts"
  end

  test "should create meal post" do
    visit meal_posts_url
    click_on "New meal post"

    fill_in "Content", with: @meal_post.content
    fill_in "Meal source", with: @meal_post.meal_source
    fill_in "Meal type", with: @meal_post.meal_type
    fill_in "Title", with: @meal_post.title
    fill_in "User", with: @meal_post.user_id
    click_on "Create Meal post"

    assert_text "Meal post was successfully created"
    click_on "Back"
  end

  test "should update Meal post" do
    visit meal_post_url(@meal_post)
    click_on "Edit this meal post", match: :first

    fill_in "Content", with: @meal_post.content
    fill_in "Meal source", with: @meal_post.meal_source
    fill_in "Meal type", with: @meal_post.meal_type
    fill_in "Title", with: @meal_post.title
    fill_in "User", with: @meal_post.user_id
    click_on "Update Meal post"

    assert_text "Meal post was successfully updated"
    click_on "Back"
  end

  test "should destroy Meal post" do
    visit meal_post_url(@meal_post)
    click_on "Destroy this meal post", match: :first

    assert_text "Meal post was successfully destroyed"
  end
end
