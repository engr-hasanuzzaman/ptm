require 'spec_helper'

describe Ptm::Task do
  it 'has a version number' do
    expect(Ptm::VERSION).not_to be nil
  end

  it 'create task instance using passing data' do
    task = described_class.new({ title: "foo" })
    expect(task.title).to eq "foo"
  end
end
