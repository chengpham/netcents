require 'rails_helper'
require 'spec_helper'
require 'rake'

RSpec.describe "Bitcoin API requests" do
    describe 'get data and update database' do
        let (:run_codes_rake_task) do
            Rake.application.invoke_task "batch:retrieve_bitcoins"
        end
        before do
            Rake.application.rake_require "tasks/batch"
            Rake::Task.define_task(:environment)
        end
        context 'when the retrieve_bitcoins task is invoked' do
            context 'get request to blockchain api' do
                it 'returns response' do
                    run_codes_rake_task
                    expect(Bitcoin).to_not receive(:create)
                end
                it 'creates new bitcoin' do
                    expect(Bitcoin).to_not receive(:new)
                    run_codes_rake_task
                end
                it 'creates new input' do
                    expect(Input).to_not receive(:new)
                    run_codes_rake_task
                end
                it 'creates new output' do
                    expect(Output).to_not receive(:new)
                    run_codes_rake_task
                end
            end
        end
    end
end