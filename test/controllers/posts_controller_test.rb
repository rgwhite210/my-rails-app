require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @locale = I18n.default_locale
  end

  test "should get index" do
    get posts_url(locale: @locale)
    assert_response :success
  end

  test "should get new" do
    get new_post_url(locale: @locale)
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url(locale: @locale), params: { post: { body: @post.body, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last, locale: @locale)
  end

  test "should show post" do
    get post_url(@post, locale: @locale)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post, locale: @locale)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post, locale: @locale), params: { post: { body: @post.body, title: @post.title } }
    assert_redirected_to post_url(@post, locale: @locale)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post, locale: @locale)
    end

    assert_redirected_to posts_url(locale: @locale)
  end
end
