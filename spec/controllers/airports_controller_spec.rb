require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AirportsController do

  # This should return the minimal set of attributes required to create a valid
  # Airport. As you add validations to Airport, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "ident" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AirportsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all airports as @airports" do
      airport = Airport.create! valid_attributes
      get :index, {}, valid_session
      assigns(:airports).should eq([airport])
    end
  end

  describe "GET show" do
    it "assigns the requested airport as @airport" do
      airport = Airport.create! valid_attributes
      get :show, {:id => airport.to_param}, valid_session
      assigns(:airport).should eq(airport)
    end
  end

  describe "GET new" do
    it "assigns a new airport as @airport" do
      get :new, {}, valid_session
      assigns(:airport).should be_a_new(Airport)
    end
  end

  describe "GET edit" do
    it "assigns the requested airport as @airport" do
      airport = Airport.create! valid_attributes
      get :edit, {:id => airport.to_param}, valid_session
      assigns(:airport).should eq(airport)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Airport" do
        expect {
          post :create, {:airport => valid_attributes}, valid_session
        }.to change(Airport, :count).by(1)
      end

      it "assigns a newly created airport as @airport" do
        post :create, {:airport => valid_attributes}, valid_session
        assigns(:airport).should be_a(Airport)
        assigns(:airport).should be_persisted
      end

      it "redirects to the created airport" do
        post :create, {:airport => valid_attributes}, valid_session
        response.should redirect_to(Airport.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved airport as @airport" do
        # Trigger the behavior that occurs when invalid params are submitted
        Airport.any_instance.stub(:save).and_return(false)
        post :create, {:airport => { "ident" => "invalid value" }}, valid_session
        assigns(:airport).should be_a_new(Airport)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Airport.any_instance.stub(:save).and_return(false)
        post :create, {:airport => { "ident" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested airport" do
        airport = Airport.create! valid_attributes
        # Assuming there are no other airports in the database, this
        # specifies that the Airport created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Airport.any_instance.should_receive(:update).with({ "ident" => "MyString" })
        put :update, {:id => airport.to_param, :airport => { "ident" => "MyString" }}, valid_session
      end

      it "assigns the requested airport as @airport" do
        airport = Airport.create! valid_attributes
        put :update, {:id => airport.to_param, :airport => valid_attributes}, valid_session
        assigns(:airport).should eq(airport)
      end

      it "redirects to the airport" do
        airport = Airport.create! valid_attributes
        put :update, {:id => airport.to_param, :airport => valid_attributes}, valid_session
        response.should redirect_to(airport)
      end
    end

    describe "with invalid params" do
      it "assigns the airport as @airport" do
        airport = Airport.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Airport.any_instance.stub(:save).and_return(false)
        put :update, {:id => airport.to_param, :airport => { "ident" => "invalid value" }}, valid_session
        assigns(:airport).should eq(airport)
      end

      it "re-renders the 'edit' template" do
        airport = Airport.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Airport.any_instance.stub(:save).and_return(false)
        put :update, {:id => airport.to_param, :airport => { "ident" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested airport" do
      airport = Airport.create! valid_attributes
      expect {
        delete :destroy, {:id => airport.to_param}, valid_session
      }.to change(Airport, :count).by(-1)
    end

    it "redirects to the airports list" do
      airport = Airport.create! valid_attributes
      delete :destroy, {:id => airport.to_param}, valid_session
      response.should redirect_to(airports_url)
    end
  end

end
