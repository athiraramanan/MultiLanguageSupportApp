class User < ActiveRecord::Base
   ##
   #Form Validation
   validates_presence_of :first_name,:email,:last_name,:age
   validates_numericality_of :age, :on => :create
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
