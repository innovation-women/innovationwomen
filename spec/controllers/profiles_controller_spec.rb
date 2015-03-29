require 'rails_helper'

describe ProfilesController do

  let(:valid_attributes) { {name: 'Susan Sue'} }

  let(:invalid_attributes) { {name: nil} }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all profiles as @profiles" do
      profile = Profile.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:profiles)).to eq([profile])
    end
  end

  describe "GET show" do
    it "assigns the requested profile as @profile" do
      profile = Profile.create! valid_attributes
      get :show, {:id => profile.to_param}, valid_session
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "GET new" do
    it "assigns a new profile as @profile" do
      get :new, {}, valid_session
      expect(assigns(:profile)).to be_a_new(Profile)
    end
  end

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      profile = Profile.create! valid_attributes
      get :edit, {:id => profile.to_param}, valid_session
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Profile" do
        expect {
          post :create, {:profile => valid_attributes}, valid_session
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        post :create, {:profile => valid_attributes}, valid_session
        expect(assigns(:profile)).to be_a(Profile)
        expect(assigns(:profile)).to be_persisted
      end

      it "redirects to the created profile" do
        post :create, {:profile => valid_attributes}, valid_session
        expect(response).to redirect_to(Profile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        post :create, {:profile => invalid_attributes}, valid_session
        expect(assigns(:profile)).to be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        post :create, {:profile => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe 'with profile information' do
      it 'creates a profile' do
        expect(Profile.count).to equal(0)

        post :create, { profile: valid_attributes }, valid_session

        expect(Profile.count).to eq(1)
        # expect(Profile.first.job_title).to eq('Example Exampley')
        expect(response).to redirect_to(profile_path(Profile.first))
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { location: 'here' } }

      it "updates the requested profile" do
        profile = Profile.create! valid_attributes
        put :update, {:id => profile.to_param, :profile => new_attributes}, valid_session
        profile.reload
        expect(profile.location).to eq 'here'
      end

      it "assigns the requested profile as @profile" do
        profile = Profile.create! valid_attributes
        put :update, {:id => profile.to_param, :profile => valid_attributes}, valid_session
        expect(assigns(:profile)).to eq(profile)
      end

      it "redirects to the profile" do
        profile = Profile.create! valid_attributes
        put :update, {:id => profile.to_param, :profile => valid_attributes}, valid_session
        expect(response).to redirect_to(profile)
      end
    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        profile = Profile.create! valid_attributes
        put :update, {:id => profile.to_param, :profile => invalid_attributes}, valid_session
        expect(assigns(:profile)).to eq(profile)
      end

      it "re-renders the 'edit' template" do
        profile = Profile.create! valid_attributes
        put :update, {:id => profile.to_param, :profile => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested profile" do
      profile = Profile.create! valid_attributes
      expect {
        delete :destroy, {:id => profile.to_param}, valid_session
      }.to change(Profile, :count).by(-1)
    end

    it "redirects to the profiles list" do
      profile = Profile.create! valid_attributes
      delete :destroy, {:id => profile.to_param}, valid_session
      expect(response).to redirect_to(profiles_url)
    end
  end

end
