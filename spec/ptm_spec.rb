require 'spec_helper'

describe Ptm do
  it 'has a version number' do
    expect(Ptm::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(Ptm::Task.new.foo).to eq('test')
  end
end
