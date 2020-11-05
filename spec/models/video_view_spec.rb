require 'rails_helper'

RSpec.describe VideoView, type: :model do

  it "is not valid without a video_id" do
    subject.video_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a views" do
    subject.views = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:video).without_validating_presence }
  end

end
