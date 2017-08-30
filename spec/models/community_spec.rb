require 'rails_helper'

RSpec.describe Community, type: :model do

  it "should be valid when create proposal" do
    proposal = create(:proposal)

    expect(proposal.community).to be_valid
  end

  describe "#participants" do

    it "should return participants without duplicates" do
      proposal = create(:proposal)
      community = proposal.community
      user1 = create(:user)
      user2 = create(:user)

      topic1 = create(:topic, community: community, author: user1)
      create(:comment, commentable: topic1, author: user1)
      create(:comment, commentable: topic1, author: user2)
      topic2 = create(:topic, community: community, author: user2)

      expect(community.participants).to eq [user1, user2, proposal.author]
    end
  end
end
