require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

 let(:user) { create(:user) }

  describe 'GET #index' do

  
    let!(:tweets) { create_list(:tweet, 3, user: user) }

    before { get :index }

    it { expect(assigns(:tweets)).to eq(tweets) }

  end

  describe 'GET #new' do

    before do
      sign_in user

      get :new

    end

    it { expect(assigns(:tweet)).to be_a_new_record }

  end

  describe 'POST #create' do

    before do
      sign_in user

      post :create, params: { tweet: params }
      git
    end

    context 'when tweet#save passes' do

      let(:params) { attributes_for(:tweet) }

      it { expect(response).to redirect_to tweets_path }

    end

    context 'when tweet#save fails' do

      let(:params) { attributes_for(:tweet, :invalid) }

      it { expect(response).to render_template(:new) }

    end

  end

end
