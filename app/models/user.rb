class User < ActiveRecord::Base
  set_primary_key "user_id"
  set_table_name "users"
  
  belongs_to :person

  def self.authenticate(username,password)
    user=self.find_by_username(username)
    user=nil unless user and user.password==User.encrypt_password(password,user.salt)
    user
  end

  def self.encrypt_password(password,salt)
    Digest::SHA1.hexdigest(password+"wibble"+salt)
  end

  def create_salt
    self.salt=self.object_id.to_s+rand.to_s
  end

  def before_create
    self.create_salt
    self.password=User.encrypt_password(self.password,self.salt)
  end
end
