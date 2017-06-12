require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  before { sign_in user1 }

  describe 'GET #show' do

    let!(:tweets) { create_list(:tweet, 3, user: user2) }
    let!(:following1) { create(:following, followee: user2, follower: user1) }
    let!(:following2) { create(:following, followee: user1, follower: user2) }

    before { get :show, params: { id: user2 } }

    it { expect(assigns(:tweets)).to eq(tweets) }
    it { expect(assigns(:following)).to eq(following1) }
    it { expect(assigns(:user_followers).first).to eq(following1) }
    it { expect(assigns(:user_followees).first).to eq(following2) }

  end

end
