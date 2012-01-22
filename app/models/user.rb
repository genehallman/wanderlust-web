class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  acts_as_authentic
  
  def self.create_from_hash(hash)
    require 'ruby-debug';debugger
    user = User.new(:username => hash['info']['name']..to_s.downcase)
    user.save(:validate => false) #create the user without performing validations. This is because most of the fields are not set.
    user.reset_persistence_token! #set persistence_token else sessions will not be created
    user
  end
  
end
