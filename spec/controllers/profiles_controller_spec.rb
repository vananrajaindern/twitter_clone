require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #show' do

    let!(:tweets) { create_list(:tweet, 3, user: user) }

    before { get :show, params: { id: user } }

    it { expect(assigns(:tweets)).to eq (tweets) }

  end

end
