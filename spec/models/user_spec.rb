require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  
  context "on create" do
    it "should have password" do
      begin
        user = create(:user_without_password)
      rescue Exception => e
        message = e.message  
      end
      message.should be == 'Validation failed: Password can\'t be blank'
    end
  end
end