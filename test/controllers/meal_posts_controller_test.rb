require "test_helper"

class MealPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_post = meal_posts(:one)
  end

  test "should get index" do
    get meal_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_post_url
    assert_response :success
  end

  test "should create meal_post" do
    assert_difference("MealPost.count") do
      post meal_posts_url, params: { meal_post: { content: @meal_post.content, meal_source: @meal_post.meal_source, meal_type: @meal_post.meal_type, title: @meal_post.title, user_id: @meal_post.user_id } }
    end

    assert_redirected_to meal_post_url(MealPost.last)
  end

  test "should show meal_post" do
    get meal_post_url(@meal_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_post_url(@meal_post)
    assert_response :success
  end

  test "should update meal_post" do
    patch meal_post_url(@meal_post), params: { meal_post: { content: @meal_post.content, meal_source: @meal_post.meal_source, meal_type: @meal_post.meal_type, title: @meal_post.title, user_id: @meal_post.user_id } }
    assert_redirected_to meal_post_url(@meal_post)
  end

  test "should destroy meal_post" do
    assert_difference("MealPost.count", -1) do
      delete meal_post_url(@meal_post)
    end

    assert_redirected_to meal_posts_url
  end
end
