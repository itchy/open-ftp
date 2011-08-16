class User < ActiveRecord::Base
  has_many :box_files
  
  has_secure_password
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :email, :uniqueness => true 
  validates :sms_number, :format => { :with => /\A[(]*([0-9]){3}[)-\. ]*([0-9]{3})[-\.]*([0-9]{4})\Z/i, :on => :create }
  validates :password, :presence => true, :on => :create
  

end
