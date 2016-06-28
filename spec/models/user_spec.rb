require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(create(:user)).to be_valid
  end

  it 'is not valid without a first name' do
    expect{
      create(:user,
             first_name: nil,
             last_name: Faker::Name.last_name,
             email: Faker::Internet.email,
             phone: Faker::PhoneNumber.cell_phone)
    }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: First name can't be blank")
  end

  it 'is not valid without a last name' do
    expect{
      create(:user,
             first_name: Faker::Name.first_name,
             last_name: '',
             email: Faker::Internet.email,
             phone: Faker::PhoneNumber.cell_phone)
    }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Last name can't be blank")
  end

  it 'is not valid without an email' do
    expect{
      create(:user,
             first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             email: '',
             phone: Faker::PhoneNumber.cell_phone)
    }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank")
  end

  it 'is not valid without a phone number' do
    expect{
      create(:user,
             first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             email: Faker::Internet.email,
             phone: '')
    }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Phone can't be blank")
  end
end
