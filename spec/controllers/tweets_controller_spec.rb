require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do

    let!(:tweets) { create_list(:tweet, 3, user: user) }
    let!(:users) { create_list(:user, 2) }

    before { get :index }

    it { expect(assigns(:tweets)).to eq(tweets) }
    it { expect(User.count).to eq(3) }
    it { expect(assigns(:tweet)).to be_a_new_record }

  end

  describe 'GET #show' do

    let(:tweet) { create(:tweet) }

    before { get :show, params: { id: tweet } }

    it { expect(assigns(:tweet)).to eq(tweet) }

  end

  describe 'POST #create' do

    context 'when format JS' do

      before { post :create, xhr: true, params: { tweet: params } }

      context 'when tweet#save passes' do

        let(:params) { attributes_for(:tweet) }

        it { expect(response).to render_template(:create) }
        it { expect(Tweet.count).to eq(1) }

      end

      context 'when tweet#save passes and tweet contains tag' do

        let(:params) { attributes_for(:tweet, :tagged) }

        it { expect(Tag.count).to eq(1) }

      end

      context 'when tweet#save fails' do

        let(:params) { attributes_for(:tweet, :invalid) }

        it { expect(response).to render_template(:create) }
        it { expect(Tweet.count).to eq(0) }

      end

    end

    context 'when format HTML' do

      before { post :create, params: { tweet: params } }

      context 'when tweet#save passes' do

        let(:params) { attributes_for(:tweet) }

        it { expect(response).to redirect_to tweets_path }
        it { expect(Tweet.count).to eq(1) }

      end

      context 'when tweet#save fails' do

        let(:params) { attributes_for(:tweet, :invalid) }

        it { expect(response).to render_template(:index) }
        it { expect(Tweet.count).to eq(0) }

      end

    end

  end

  describe 'GET #edit' do

    let(:owner) { create(:user) }
    let(:tweet) { create(:tweet, user: owner) }

    before { get :edit, params: { id: tweet } }

    context 'when nonowner accesses edit' do

      it { expect(response).to redirect_to tweets_path }

    end

  end

  describe 'PUT #update' do

    let(:tweet) { create(:tweet, user: user) }

    before { put :update, params: { id: tweet, tweet: { text: tweet.text + 'Edited' } } }

    it { expect(Tweet.find(tweet.id).text.last(6)).to eq('Edited') }
    it { expect(response).to redirect_to tweets_path }

  end

  describe 'DELETE #destroy' do

    let(:tweet) { create(:tweet, user: user) }

    before { delete :destroy, params: { id: tweet } }

    it { expect(Tweet.count).to eq(0) }
    it { expect(response).to redirect_to tweets_path }

  end

  describe 'GET #view_followers' do

    let(:user2) { create(:user) }
    let!(:following) { create(:following, follower: user, followee: user2) }

    before { get :view_followers }

    it { expect(assigns(:followers).first).to eq(following) }

  end

  describe 'GET #view_followees' do

    let(:user2) { create(:user) }
    let!(:following) { create(:following, follower: user2, followee: user) }

    before { get :view_followees }

    it { expect(assigns(:followees).first).to eq(following) }

  end

  # describe 'GET #search_tag' do
  #
  #   let(:tweet) { create(:tweet) }
  #   let(:tag) { create(:tag, tweet: tweet) }
  #
  #   before { get :search_tag, params: { format: 'tagged' } }
  #
  #   it { expect(assigns(:tweets).first).to eq(tweet) }
  #
  # end

end
