class Settings < ActiveRecord::Base
  attr_accessible :username, :password, :default, :logo_title, :signature
end
