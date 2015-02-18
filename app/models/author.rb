class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  def author_email
    Author.where(:email => 'shakespeare@example.com').map(&:name)
  end

  def most_recent_author
    Author.order(:created_at => :desc).map(&:name).first
  end



end
