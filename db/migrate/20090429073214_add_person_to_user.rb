class AddPersonToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :person_id, :integer, :null=>"false", :default=>0
  end

  def self.down
    remove_column :users, :person_id
  end
end
