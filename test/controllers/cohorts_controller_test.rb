require 'test_helper'

class CohortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cohort = cohorts(:one)
  end

  test "should get index" do
    get cohorts_url
    assert_response :success
  end

  test "should get new" do
    get new_cohort_url
    assert_response :success
  end

  test "should create cohort" do
    assert_difference('Cohort.count') do
      post cohorts_url, params: { cohort: { course_id: @cohort.course_id, end_day: @cohort.end_day, end_month: @cohort.end_month, end_year: @cohort.end_year, instructor_id: @cohort.instructor_id, name: @cohort.name, start_day: @cohort.start_day, start_month: @cohort.start_month, start_year: @cohort.start_year } }
    end

    assert_redirected_to cohort_url(Cohort.last)
  end

  test "should show cohort" do
    get cohort_url(@cohort)
    assert_response :success
  end

  test "should get edit" do
    get edit_cohort_url(@cohort)
    assert_response :success
  end

  test "should update cohort" do
    patch cohort_url(@cohort), params: { cohort: { course_id: @cohort.course_id, end_day: @cohort.end_day, end_month: @cohort.end_month, end_year: @cohort.end_year, instructor_id: @cohort.instructor_id, name: @cohort.name, start_day: @cohort.start_day, start_month: @cohort.start_month, start_year: @cohort.start_year } }
    assert_redirected_to cohort_url(@cohort)
  end

  test "should destroy cohort" do
    assert_difference('Cohort.count', -1) do
      delete cohort_url(@cohort)
    end

    assert_redirected_to cohorts_url
  end
end
