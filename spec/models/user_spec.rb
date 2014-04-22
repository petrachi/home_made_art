require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
 
  it "should require password confirmation" do
    user = build(:user)
    user.password = '123456'
    user.password_confirmation = '1234567'
    user.invalid?
    user.errors[:password_confirmation].join.should == 'doesn\'t match Password'
  end
end