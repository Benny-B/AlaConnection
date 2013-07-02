class User < ActiveRecord::Base
  attr_accessible :education, :email, :firstname, :lastname, :password
end
