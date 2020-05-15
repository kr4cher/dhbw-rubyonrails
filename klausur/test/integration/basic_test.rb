require 'test_helper'

class BasicTest < ActionDispatch::IntegrationTest

  test "root points to patients#index" do
    get "/"
    assert_select "h1", "Patients"
  end

  test "basic layout" do
    get "/"
    assert_select "body > main.container"
  end

  test "navigation bar brand" do
    get "/"
    assert_select "body > nav.navbar.container.is-dark" do
      assert_select ".navbar-brand", "Klausur 2020"
    end
  end

  test "navigation bar items" do
    get "/"
    assert_select "body > nav.navbar > .navbar-menu > .navbar-start" do
      assert_select "a.navbar-item.is-active", text: "Patienten", href: "xx"
      assert_select "a.navbar-item", "Doktoren"
      assert_select "a.navbar-item", "Labore"
    end
  end

  test "nav bar is-active" do
    get patients_url
    assert_select "a.navbar-item.is-active", text: "Patienten"
    get root_url
    assert_select "a.navbar-item.is-active", text: "Patienten"

    get doctors_url
    assert_select "a.navbar-item.is-active", text: "Doktoren"

    get laboratories_url
    assert_select "a.navbar-item.is-active", text: "Labore"
  end

end