require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do

  context 'Individual Resource Represantation' do
    let(:resource) { create(:user) }
    let(:serialization) { "#{resource.class}Serializer".constantize.new(resource) }
    #let(:serialized_resource) { JSON.parse(serialization.to_json)[resource.class.to_s.downcase] }
    let(:serialized_resource) { JSON.parse(serialization.to_json) }

    context "with valid attributes" do
      it 'serializes the resource attributes' do
        resource.class.attribute_names.each do | attribute |
          klass = resource[attribute.to_sym].class
          case klass
          when Fixnum || TrueClass || FalseClass || NilClass
            expect( serialized_resource[attribute] ).to eql( resource[attribute.to_sym] )
          when ActiveSupport::TimeWithZone || DateTime
            expect( serialized_resource[attribute] ).to include String(Date.today.year)
          when String
            expect( serialized_resource[attribute] ).to eql( String(resource[attribute.to_sym]) )
          end
        end
      end
    end

    context "with invalid attribute" do
      it 'returns nil' do
        expect(serialized_resource['foo']).to eq nil
      end
    end
  end
end

