require "spec_helper"

describe SmartTest::Project do
  let(:root) { "./spec/fixtures/sample_project" }
  let(:subject) { described_class.new root }

  describe "#using_bundle?" do
    it "checks Gemfile" do
      expect(subject.using_bundle?).to be true
    end
  end

  describe "#using_git?" do
    it "checks .git" do
      expect(subject.using_git?).to be true
    end
  end
end
