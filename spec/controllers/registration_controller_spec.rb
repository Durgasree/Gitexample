require 'rails_helper'

RSpec.describe RegistrationController, :type => :controller do

	let(:valid_user_attributes) {
    {name: "shree",dob: "01/07/1994", phone: "123123243",email: "shrsadf2456@gmail.com", address: "vizag", gender: true, desg: "manager", salary: 65464.25}
  }

  let(:invalid_user_attributes) {
    {name: nil, dob: nil, phone: nil, email: nil, address: nil, gender: nil, desg: nil, salary: nil}
  }

  describe "GET index" do
    it "assigns all people as @people" do
      person=Person.create!(valid_user_attributes)
      person1=Person.create!(valid_user_attributes)
      get :index, {}
      expect(assigns(:people)).to eq([person,person1])
    end   
  end
  describe "GET new" do
  	it "creates a new person @person" do
  		get :new, {}
      expect(assigns(:person)).to be_a_new(Person)
  	end
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:person => valid_user_attributes}
        }.to change(Person, :count).by(1)
      end
      it "assigns a newly created person to @person" do 
        post :create, {:person => valid_user_attributes}
        expect(assigns(:person)).to be_a(Person)
        expect(assigns(:person)).to be_persisted
      end
      it "redirect to the index page" do
        post :create, {:person => valid_user_attributes}
        expect(response).to redirect_to(registration_index_path)
      end
    end
    describe "with invalid parmeters" do
      it "assigns a newly created but unsaved person as @person" do
        post :create, {:person => invalid_user_attributes}
        expect(assigns(:person)).to be_a_new(Person)
      end

      it "re-renders the 'new' template" do
        post :create, {:person => invalid_user_attributes}
        expect(response).to render_template("new")
      end
    end
  end
  describe "GET edit" do
    it "assigns the required person as @person" do
      person=Person.create!(valid_user_attributes)
      get :edit, {:id => person}
      expect(assigns(:person)).to eq(person)
    end
  end
  describe " DELETE destroy" do
    it "destroys the requested person" do
      person=Person.create!(valid_user_attributes)
      expect{
        delete :destroy, {:id => person}
        }.to change(Person, :count).by(0)
    end
    it "redirects to the index page" do
      person=Person.create!(valid_user_attributes)
      delete :destroy, {:id => person.to_param}
      expect(response).to redirect_to(registration_index_path)
    end
  end
  describe "GET show" do
    it "assigns the requested person as @person" do
      person = Person.create! valid_user_attributes
      get :show, {:id => person.to_param}
      expect(assigns(:person)).to eq(person)
    end
  end
describe "PUT update" do
    describe "with valid params" do
      let(:new_user_attributes) {
        {name: "shree",dob: "01/07/1994", phone: "123123243",email: "shree1499@gmail.com", address: "vizag", gender: true, desg: "developer", salary: 14546.25}}
      it "assigns the requested person as @person" do
        person = Person.create!(valid_user_attributes)
        put :update, {:id => person.to_param, :person => new_user_attributes}
        expect(assigns(:person)).to eq(person)
      end

      it "redirects to the person" do
       person = Person.create!(valid_user_attributes)
        put :update, {:id => person, :person => new_user_attributes}
        expect(response).to redirect_to(registration_index_path)
      end
    end

    describe "with invalid params" do
      it "assigns the person as @person" do
        person = Person.create!(valid_user_attributes)
        put :update, {:id => person, :person => invalid_user_attributes}
        expect(assigns(:person)).to eq(person)
      end

      it "re-renders the 'edit' template" do
        person = Person.create! valid_user_attributes
        put :update, {:id => person.to_param, :person => invalid_user_attributes}
        expect(response).to render_template("edit")
      end
    end
  end
end