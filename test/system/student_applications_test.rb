require "application_system_test_case"

class StudentApplicationsTest < ApplicationSystemTestCase
  setup do
    @student_application = student_applications(:one)
  end

  test "visiting the index" do
    visit student_applications_url
    assert_selector "h1", text: "Student Applications"
  end

  test "creating a Student application" do
    visit student_applications_url
    click_on "New Student Application"

    fill_in "Application status", with: @student_application.application_status
    fill_in "Bank solvency certificate", with: @student_application.bank_solvency_certificate
    fill_in "Bank statement", with: @student_application.bank_statement
    fill_in "Birth certificate", with: @student_application.birth_certificate
    fill_in "Country", with: @student_application.country_id
    fill_in "Cv", with: @student_application.cv
    fill_in "Desire program", with: @student_application.desire_program
    fill_in "Mentor", with: @student_application.mentor_id
    fill_in "Motivation letter", with: @student_application.motivation_letter
    fill_in "Passport file", with: @student_application.passport_file
    fill_in "Police clearance certificate", with: @student_application.police_clearance_certificate
    fill_in "Recommendation letter", with: @student_application.recommendation_letter
    fill_in "Student", with: @student_application.student_id
    fill_in "University name", with: @student_application.university_name
    click_on "Create Student application"

    assert_text "Student application was successfully created"
    click_on "Back"
  end

  test "updating a Student application" do
    visit student_applications_url
    click_on "Edit", match: :first

    fill_in "Application status", with: @student_application.application_status
    fill_in "Bank solvency certificate", with: @student_application.bank_solvency_certificate
    fill_in "Bank statement", with: @student_application.bank_statement
    fill_in "Birth certificate", with: @student_application.birth_certificate
    fill_in "Country", with: @student_application.country_id
    fill_in "Cv", with: @student_application.cv
    fill_in "Desire program", with: @student_application.desire_program
    fill_in "Mentor", with: @student_application.mentor_id
    fill_in "Motivation letter", with: @student_application.motivation_letter
    fill_in "Passport file", with: @student_application.passport_file
    fill_in "Police clearance certificate", with: @student_application.police_clearance_certificate
    fill_in "Recommendation letter", with: @student_application.recommendation_letter
    fill_in "Student", with: @student_application.student_id
    fill_in "University name", with: @student_application.university_name
    click_on "Update Student application"

    assert_text "Student application was successfully updated"
    click_on "Back"
  end

  test "destroying a Student application" do
    visit student_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student application was successfully destroyed"
  end
end
