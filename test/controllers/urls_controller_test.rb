require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one)
  end

  test "should get index" do
    get urls_url
    assert_response :success
  end

  test "should get new" do
    get new_url_url
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post urls_url, params: { url: { autoup: @url.autoup, captime: @url.captime, h: @url.h, hour: @url.hour, minute: @url.minute, name: @url.name, ph: @url.ph, pw: @url.pw, px: @url.px, py: @url.py, url: @url.url, user_id: @url.user_id, visible: @url.visible, w: @url.w, x: @url.x, y: @url.y, zoom: @url.zoom } }
    end

    assert_redirected_to url_url(Url.last)
  end

  test "should show url" do
    get url_url(@url)
    assert_response :success
  end

  test "should get edit" do
    get edit_url_url(@url)
    assert_response :success
  end

  test "should update url" do
    patch url_url(@url), params: { url: { autoup: @url.autoup, captime: @url.captime, h: @url.h, hour: @url.hour, minute: @url.minute, name: @url.name, ph: @url.ph, pw: @url.pw, px: @url.px, py: @url.py, url: @url.url, user_id: @url.user_id, visible: @url.visible, w: @url.w, x: @url.x, y: @url.y, zoom: @url.zoom } }
    assert_redirected_to url_url(@url)
  end

  test "should destroy url" do
    assert_difference('Url.count', -1) do
      delete url_url(@url)
    end

    assert_redirected_to urls_url
  end
end
