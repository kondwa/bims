class Person < ActiveRecord::Base
  set_primary_key "person_id"
  set_table_name "person"
  has_one :user
end
