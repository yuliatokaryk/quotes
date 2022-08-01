require 'rails_helper'

RSpec.describe Author, :type => :model do
  it "is not valid without a first_name" do
    author = Author.new(first_name: nil)
    expect(author).to_not be_valid
  end
end
