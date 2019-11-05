json.extract! student_application, :id, :country_id, :desire_program, :passport_file, :motivation_letter, :recommendation_letter, :cv, :police_clearance_certificate, :birth_certificate, :bank_statement, :bank_solvency_certificate, :student_id, :mentor_id, :university_name, :application_status, :created_at, :updated_at
json.url student_application_url(student_application, format: :json)
