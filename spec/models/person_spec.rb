require 'rails_helper'

RSpec.describe Person, :type => :model do
	describe "Person Validation" do
		it "has a valid person" do
    	expect(Person.create(name: "shree",dob: "01/07/1994", phone: 123123243,email: "shree@gmail.com", address: "asdfasdfasdf", gender: true, desg: "manager", salary: 65464.25)).to be_valid
 		end
 		it "is invalid without a name" do
 			expect(Person.create(dob: "01/07/1994", phone: 123123243,email: "shree@gmail.com", address: "asdfasdfasdf", gender: true, desg: "manager", salary: 65464.25)).to_not be_valid
 		end
 		it "is invalid without a dob" do
 			expect(Person.create(name: "shree", phone: 123123243,email: "shree@gmail.com", address: "asdfasdfasdf", gender: true, desg: "manager", salary: 65464.25)).to_not be_valid
 		end
 		it "is invalid without a phone" do
 			expect(Person.create(name: "shree",dob: "01/07/1994",email: "shree@gmail.com", address: "asdfasdfasdf", gender: true, desg: "manager", salary: 65464.25)).to_not be_valid
 		end
 		it "is invalid without a email" do
 			expect(Person.create(name: "shree",dob: "01/07/1994", phone: 123123243, address: "asdfasdfasdf", gender: true, desg: "manager", salary: 65464.25)).to_not be_valid
 		end
 		it "is invalid without a address" do
 			expect(Person.create(name: "shree",dob: "01/07/1994", phone: 123123243,email: "shree@gmail.com", gender: true, desg: "manager", salary: 65464.25)).to_not be_valid
 		end
 		it "is invalid without a gender" do
 			expect(Person.create(name: "shree",dob: "01/07/1994", phone: 123123243,email: "shree@gmail.com", address: "asdfasdfasdf", desg: "manager", salary: 65464.25)).to_not be_valid
 		end
 		it "is invalid without a desg" do
 			expect(Person.create(name: "shree",dob: "01/07/1994", phone: 123123243,email: "shree@gmail.com", address: "asdfasdfasdf", gender: true, salary: 65464.25)).to_not be_valid
 		end
 		it "is invalid without a salary" do
 			expect(Person.create(name: "shree",dob: "01/07/1994", phone: 123123243,email: "shree@gmail.com", address: "asdfasdfasdf", gender: true, desg: "manager")).to_not be_valid
 		end

	end

	describe "Person Callbacks" do
		it "do capitalize before saving the person name" do
			person=Person.new(name: "shree durga",dob: "01/07/1994", phone: 123123243,email: "shree@gmail.com", address: "asdfasdfasdf", gender: true, desg: "manager", salary: 65464.25)
			person_name=person.name
			person.save
			expect(person.name).to eq(person_name.split.collect(&:capitalize).join(' '))
		end
	end
end