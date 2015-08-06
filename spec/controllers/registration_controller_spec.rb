require 'rails_helper'

RSpec.describe RegistrationController, :type => :controller do

	let(:valid_user_attributes) {
    {name: "shree",dob: "01/07/1994", phone: 123123243,email: "shree12456@gmail.com", address: "asdfasdfasdf", gender: true, desg: "manager", salary: 65464.25}
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

end