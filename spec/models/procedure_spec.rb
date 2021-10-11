require 'rails_helper'

RSpec.describe Procedure, type: :model do
  it { is_expected.to respond_to(:title, :url, :body) }
end
