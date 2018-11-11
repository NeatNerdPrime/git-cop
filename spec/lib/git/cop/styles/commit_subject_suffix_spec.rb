# frozen_string_literal: true

require "spec_helper"

RSpec.describe Git::Cop::Styles::CommitSubjectSuffix do
  subject(:commit_subject_suffix_style) { described_class.new commit: commit, settings: settings }

  let(:content) { "Added test subject." }
  let(:status) { double "status", success?: true }
  let(:shell) { class_spy Open3, capture2e: ["", status] }

  let :commit do
    object_double Git::Cop::Commits::Saved.new(sha: "1", shell: shell), subject: content
  end

  let(:enabled) { true }
  let(:settings) { {enabled: enabled, includes: ["\\.", "\\[✓\\]", "\\#skip"]} }

  describe ".id" do
    it "answers class ID" do
      expect(described_class.id).to eq(:commit_subject_suffix)
    end
  end

  describe ".label" do
    it "answers class label" do
      expect(described_class.label).to eq("Commit Subject Suffix")
    end
  end

  describe ".defaults" do
    it "answers defaults" do
      expect(described_class.defaults).to eq(
        enabled: true,
        severity: :error,
        includes: ["\\."]
      )
    end
  end

  describe "#valid?" do
    context "when valid" do
      it "answers true" do
        expect(commit_subject_suffix_style.valid?).to eq(true)
      end
    end

    context "with empty include list" do
      let(:suffixes) { [] }

      it "answers true" do
        expect(commit_subject_suffix_style.valid?).to eq(true)
      end
    end

    context "with invalid suffix" do
      let(:content) { "Added bad subject" }

      it "answers false" do
        expect(commit_subject_suffix_style.valid?).to eq(false)
      end
    end
  end

  describe "#issue" do
    let(:issue) { commit_subject_suffix_style.issue }

    context "when valid" do
      it "answers empty hash" do
        expect(issue).to eq({})
      end
    end

    context "when invalid" do
      let(:content) { "Added bad subject" }

      it "answers issue hint" do
        expect(issue[:hint]).to eq("Use: /\\./, /\\[✓\\]/, /\\#skip/.")
      end
    end
  end
end
