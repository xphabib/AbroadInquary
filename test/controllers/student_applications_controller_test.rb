require 'test_helper'

class StudentApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_application = student_applications(:one)
  end

  test "should get index" do
    get student_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_student_application_url
    assert_response :success
  end

  test "should create student_application" do
    assert_difference('StudentApplication.count') do
      post student_applications_url, params: { student_application: { application_status: @student_application.application_status, bank_solvency_certificate: @student_application.bank_solvency_certificate, bank_statement: @student_application.bank_statement, birth_certificate: @student_application.birth_certificate, country_id: @student_application.country_id, cv: @student_application.cv, desire_program: @student_application.desire_program, mentor_id: @student_application.mentor_id, motivation_letter: @student_application.motivation_letter, passport_file: @student_application.passport_file, police_clearance_certificate: @student_application.police_clearance_certificate, recommendation_letter: @student_application.recommendation_letter, student_id: @student_application.student_id, university_name: @student_application.university_name } }
    end

    assert_redirected_to student_application_url(StudentApplication.last)
  end

  test "should show student_application" do
    get student_application_url(@student_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_application_url(@student_application)
    assert_response :success
  end

  test "should update student_application" do
    patch student_application_url(@student_application), params: { student_application: { application_status: @student_application.application_status, bank_solvency_certificate: @student_application.bank_solvency_certificate, bank_statement: @student_application.bank_statement, birth_certificate: @student_application.birth_certificate, country_id: @student_application.country_id, cv: @student_application.cv, desire_program: @student_application.desire_program, mentor_id: @student_application.mentor_id, motivation_letter: @student_application.motivation_letter, passport_file: @student_application.passport_file, police_clearance_certificate: @student_application.police_clearance_certificate, recommendation_letter: @student_application.recommendation_letter, student_id: @student_application.student_id, university_name: @student_application.university_name } }
    assert_redirected_to student_application_url(@student_application)
  end

  test "should destroy student_application" do
    assert_difference('StudentApplication.count', -1) do
      delete student_application_url(@student_application)
    end

    assert_redirected_to student_applications_url
  end
end
