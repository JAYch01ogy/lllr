require 'rails_helper'

RSpec.describe Quote, type: :model do
  subject do
    described_class.new(
      first: 'hee',
      last: 'hor',
      email: 'heehor@test.com',
      phone: '6149999999'
    )
  end

  context 'required fields' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without first' do
      subject.first = ' '
      expect(subject).to_not be_valid
    end

    it 'is not valid without last' do
      subject.last = ' '
      expect(subject).to_not be_valid
    end

    it 'is not valid without email' do
      subject.email = ' '
      expect(subject).to_not be_valid
    end

    it 'is not valid without phone' do
      subject.phone = ' '
      expect(subject).to_not be_valid
    end
  end

  context 'validates length' do
    it 'validates first is at least 1 character' do
      subject.first = ''
      expect(subject).to_not be_valid
    end

    it 'allows first as 1 character' do
      subject.first = 'a'
      expect(subject).to be_valid
    end

    it 'validates first is no more then 25 characters' do
      subject.first = 'a' * 26
      expect(subject).to_not be_valid
    end

    it 'allows 25 character first_name' do
      subject.first = 'a' * 25
      expect(subject).to be_valid
    end

    it 'validates last is at least 1 character' do
      subject.last = ''
      expect(subject).to_not be_valid
    end

    it 'allows last as 1 character' do
      subject.last = 'z'
      expect(subject).to be_valid
    end

    it 'validates last is no more then 25 characters' do
      subject.last = 'z' * 26
      expect(subject).to_not be_valid
    end

    it 'allows 25 character last' do
      subject.last = 'z' * 25
      expect(subject).to be_valid
    end

    it 'validates email is not more then 255 characters' do
      subject.email = 'z' * 247 + '@test.com'
      expect(subject).to_not be_valid
    end

    it 'allows 255 character email' do
      subject.email = 'z' * 246 + '@test.com'
      expect(subject).to be_valid
    end

    it 'validates phone is at least 10 digits' do
      subject.phone = '1' * 9
      expect(subject).to_not be_valid
    end

    it 'validates phone is no more then 10 digits' do
      subject.phone = '1' * 11
      expect(subject).to_not be_valid
    end

    it 'allows 10 digit phone' do
      subject.phone = '1' * 10
      expect(subject).to be_valid
    end
  end

  context 'validates format' do
    it 'validates first is characters only' do
      subject.first = 'ab12'
      expect(subject).to_not be_valid
    end

    it 'validates last is characters only' do
      subject.last = 'ab12'
      expect(subject).to_not be_valid
    end

    it 'validates email format' do
      invalid_emails = %w(foo @b.com foo.com)
      invalid_emails.each do |email|
        subject.email = email
        expect(subject).to_not be_valid
      end
    end

    it 'allows valid emails' do
      valid_emails = %w(test12@test.com test@gmail.co your_face@face.co)
      valid_emails.each do |email|
        subject.email = email
        expect(subject).to be_valid
      end
    end

    it 'validates phone is digits only' do
      subject.phone = '740aaa1234'
      expect(subject).to_not be_valid
    end
  end
end
