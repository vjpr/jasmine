require 'spec_helper.rb'

describe "JSHint task" do

  let(:tmp_dir) { "#{Dir.tmpdir}/jasmine_tasks_test" }
  let(:jasmine_dev) { JasmineDev.new }

  before do
    reset_dir tmp_dir
    jasmine_dev.should_receive(:`).with('which node').and_return('')
  end

  describe "when Node is not present" do
    before do
      @output = capture_output { jasmine_dev.js_hint }
    end

    it "should not tell the user that lint is running" do
      @output.should_not match(/Running JSHint/)
    end

    it "should prompt the user to install Node" do
      @output.should match(/Node\.js is required/)
    end

  end

  describe "when Node is present" do
    before do
      jasmine_dev.should_receive(:`).with('node jshint/run.js').and_return('Jasmine JSHint PASSED.')

      @output = capture_output { jasmine_dev.js_hint }
    end

    it "should tell the user that lint is running" do
      @output.should match(/Running JSHint/)
    end
  end
end