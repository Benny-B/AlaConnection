class AddAttachmentResumeToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :resume
    end
  end

  def self.down
    drop_attached_file :resumes, :resume
  end
end
