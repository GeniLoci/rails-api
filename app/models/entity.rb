class Entity < ActiveRecord::Base
  belongs_to :entry
  has_attached_file :file, :preserve_files => "false"
  do_not_validate_attachment_file_type :file
end
