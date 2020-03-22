# == Schema Information
#
# Table name: student_applications
#
#  id                           :bigint           not null, primary key
#  country_id                   :integer
#  desire_program               :string
#  passport_file                :string
#  motivation_letter            :string
#  recommendation_letter        :string
#  cv                           :string
#  police_clearance_certificate :string
#  birth_certificate            :string
#  bank_statement               :string
#  bank_solvency_certificate    :string
#  student_id                   :integer
#  mentor_id                    :integer
#  university_name              :string
#  application_status           :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class StudentApplication < ApplicationRecord
  belongs_to :country
  belongs_to :mentor, class_name: 'User'
  belongs_to :student, class_name: 'User'
  mount_uploader :passport_file, ApplicationAttachmentUploader
  mount_uploader :motivation_letter, ApplicationAttachmentUploader
  mount_uploader :recommendation_letter, ApplicationAttachmentUploader
  mount_uploader :cv, ApplicationAttachmentUploader
  mount_uploader :police_clearance_certificate, ApplicationAttachmentUploader
  mount_uploader :birth_certificate, ApplicationAttachmentUploader
  mount_uploader :bank_statement, ApplicationAttachmentUploader
  mount_uploader :bank_solvency_certificate, ApplicationAttachmentUploader

  after_create :application_confirmation

  APPLICATION_STATUS = [
      'File Open',
      'Acceptence Later',
      'Visa Reject'
  ]

  def application_confirmation
    mentor_email = self.mentor.email
    student_email = self.student.email
    StudentApplicationMailer.mentor_confirmation(mentor_email).deliver if mentor_email.present?
    StudentApplicationMailer.student_confirmation(student_email).deliver if student_email.present?
  end
end
