require 'spec_helper'

describe Ptm::Task do
  describe 'test task instance behaviour' do
    before do
      @task = Ptm::Task.new({ title: 'test title', complete: true })
    end

    it 'has id 1' do
      expect(@task.id).to eq 1
    end

    it 'has title "test title"' do
      expect(@task.title).to eq('test title')
    end

    it 'is completed task' do
      expect(@task.complete).to be_truthy
    end

    describe 'call to_hash method on task instance' do
      it 'return hash of private variables' do
        expect(@task.to_hash).to eq({
                                      title: @task.title,
                                      category: @task.category,
                                      created_at: @task.created_at,
                                      complete: @task.complete,
                                      completed_at: @task.completed_at
                                    })
      end

      it 'should not return id ' do
        expect(@task.to_hash[:id]).to be_nil
        expect(@task.to_hash['id']).to be_nil
      end
    end
  end
end
