require "spec_helper"

require_relative "../../../libraries/pacemaker/alert"
require_relative "../../fixtures/alert"
require_relative "../../helpers/cib_object"
require_relative "../../helpers/meta_examples"

describe Pacemaker::Alert do
  let(:fixture) { Chef::RSpec::Pacemaker::Config::ALERT.dup }
  let(:fixture_definition) do
    Chef::RSpec::Pacemaker::Config::ALERT_DEFINITION
  end

  def object_type
    "alert"
  end

  def pacemaker_object_class
    Pacemaker::Alert
  end

  def fields
    %w(name handler receiver)
  end

  it_should_behave_like "a CIB object"

  describe "#definition" do
    it "should return the definition string" do
      expect(fixture.definition).to eq(fixture_definition)
    end

    it "should return a short definition string" do
      alert = pacemaker_object_class.new("foo")
      alert.definition = \
        %(alert alert1 handler.sh to receiver-id)
      expect(alert.definition).to eq(<<'PMCK'.chomp)
alert alert1 handler.sh \
         to receiver-id
PMCK
    end
  end

  describe "#parse_definition" do
    before(:each) do
      @parsed = pacemaker_object_class.new(fixture.name)
      @parsed.definition = fixture_definition
    end

    it "should parse the handler" do
      expect(@parsed.handler).to eq(fixture.handler)
    end

    it "should parse the receiver" do
      expect(@parsed.receiver).to eq(fixture.receiver)
    end
  end
end
