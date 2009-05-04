describe User do
  before(:all) do
  end
  it 'salt should exist' do
    User.new.create_salt.should_not be_nil
  end
  it 'salt should be a string' do
    User.new.create_salt.should be_a String
  end
  it 'salt should be unique' do
    user1=User.new
    user2=User.new
    user1.create_salt.should_not equal user2.create_salt
  end
  it 'salt should start with object id' do
    user=User.new
    user.create_salt.should  be_starts_with(user.object_id.to_s)
  end
  it 'salt should contain a dot' do
    User.new.create_salt.should match /0\./
  end
  it 'should access person' do
    @person=Person.create(:date_created=>Time.now)
    @user=User.create(:username=>"test",:password=>"test",:creator=>1,:date_created=>Time.now)
    @user.person=@person
    @user.save
    @person.save
    @person.reload
    @user.reload
    
    @user.person.should be @person
    @person.user.should be @user
  end
  it 'should be accessible by person' do
  end

end

