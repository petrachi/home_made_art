require 'spec_helper'

describe Article do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:title) }
  
  context "if published" do
    before do
      subject.published = true
      subject.title = 'Title'
      subject.user_id = 1
    end

    it { should validate_presence_of(:brief) }
    it { should validate_presence_of(:content) }
  end
end
