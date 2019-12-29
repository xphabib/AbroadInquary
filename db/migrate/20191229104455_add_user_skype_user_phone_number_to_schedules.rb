class AddUserSkypeUserPhoneNumberToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :user_skype, :string
    add_column :schedules, :user_phone_no, :string
  end
end
