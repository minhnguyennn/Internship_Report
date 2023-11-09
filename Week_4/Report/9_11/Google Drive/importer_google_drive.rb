# frozen_string_literal: true

require 'google_drive'

# Google Upload
class GoogleDriveUploader
  def initialize
    @session = GoogleDrive::Session.from_service_account_key('config.json')
  end

  def add_user_to_folder_acl(folder_id, user_email)
    folder = @session.folder_by_id(folder_id)
    folder.acl.push(
      type: 'user',
      role: 'writer',
      email_address: user_email
    )
  end

  def upload_file_to_folder(local_file_path, folder_name, uploaded_file_name)
    new_folder = @session.create_collection(folder_name)
    uploaded_file = new_folder.upload_from_file(local_file_path, uploaded_file_name)
    puts "Tệp đã tải lên: #{uploaded_file.title}, ID: #{uploaded_file.id}"
  end

  def list_all_folders
    @session.folders do |folder|
      p folder
    end
  end
end

# Sử dụng lớp GoogleDriveUploader
uploader = GoogleDriveUploader.new
uploader.list_all_folders
uploader.upload_file_to_folder('example.docx', 'REPORT 9/11', 'example.docx')
uploader.add_user_to_folder_acl('1kB_hB5LCk0Tq3KWSfRoCS-Yn1jwNn7k7', 'minh842657913@gmail.com')
