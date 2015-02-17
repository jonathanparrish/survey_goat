class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  def author_email


  end


end
