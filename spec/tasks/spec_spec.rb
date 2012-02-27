require 'spec_helper.rb'

describe "Spec tasks" do

  let(:jasmine_dev) { JasmineDev.new }

  describe "spec_node" do
    describe "when Node.js is not present" do
      before do
        @output = capture_output { jasmine_dev.spec_node }
      end

      it "should prompt the user to install Node" do
        @output.should match(/Node\.js is required/)
      end
    end


    describe "when Node.js is present" do
      before do
        @output = capture_output { jasmine_dev.spec_node }
      end

      it "should build the distribution"

      it "should count the number of specs to be run"

      it "should tell the user tha the specs are running in Node.js"
    end
  end

  describe "spec_browser" do
    before do
      @output = capture_output { jasmine_dev.spec_node }
    end

    it "should build the distribution"

    it "should count the number of specs to be run"

    it "should tell the user tha the specs are running in Node.js"
  end
end

