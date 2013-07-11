class Resume < ActiveRecord::Base
  attr_accessible  :resume
  belongs_to :user

  has_attached_file :resume

 
  validates :user_id, presence: true

end
