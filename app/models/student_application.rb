class StudentApplication < ApplicationRecord
  mount_uploader :passport_file, ApplicationAttachmentUploader
  mount_uploader :motivation_letter, ApplicationAttachmentUploader
  mount_uploader :recommendation_letter, ApplicationAttachmentUploader
  mount_uploader :cv, ApplicationAttachmentUploader
  mount_uploader :police_clearance_certificate, ApplicationAttachmentUploader
  mount_uploader :birth_certificate, ApplicationAttachmentUploader
  mount_uploader :bank_statement, ApplicationAttachmentUploader
  mount_uploader :bank_solvency_certificate, ApplicationAttachmentUploader

end
