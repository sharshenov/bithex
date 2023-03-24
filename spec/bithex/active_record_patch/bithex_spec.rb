# frozen_string_literal: true

describe Bithex::ActiveRecord, '.bithex' do
  before do
    Upload.delete_all
  end

  it 'saves value' do
    upload = Upload.new
    upload.uid = '0fba'
    upload.save!

    expect(upload.uid).to eq('0fba')
    expect(upload.uid_before_type_cast).to eq('0000111110111010')
  end

  it 'loads value' do
    Upload.create!(uid: '0fba')
    upload = Upload.first!

    expect(upload.uid).to eq('0fba')
    expect(upload.uid_before_type_cast).to eq('0000111110111010')
  end
end
