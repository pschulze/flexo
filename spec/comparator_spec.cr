require "./spec_helper"

describe Flexo::Comparator do
  describe "compare" do
    it "returns a Flexo::Result" do
      baseline_path = "spec/fixtures/baseline.png"
      Flexo::Comparator.new
        .compare(baseline_path, baseline_path)
        .should be_a(Flexo::Result)
    end

    it "returns a result with a score of 0.0 when comparing two images that are the same" do
      baseline_path = "spec/fixtures/baseline.png"
      Flexo::Comparator.new
        .compare(baseline_path, baseline_path)
        .score
        .should eq(0.0)
    end

    it "returns a result with a score of 0.1 when comparing two images that are 10% different" do
      baseline_path = "spec/fixtures/baseline.png"
      ten_percent_different_path = "spec/fixtures/different-10.png"
      Flexo::Comparator.new
        .compare(baseline_path, ten_percent_different_path)
        .score
        .should eq(0.1)
    end

    it "returns a result with a score of 1.0 when comparing two images that are completely different" do
      baseline_path = "spec/fixtures/baseline.png"
      one_hundred_percent_different_path = "spec/fixtures/different-100.png"
      Flexo::Comparator.new
        .compare(baseline_path, one_hundred_percent_different_path)
        .score
        .should eq(1.0)
    end

    it "raises an error when attempting to compare images that are not of the same size" do
      baseline_path = "spec/fixtures/baseline.png"
      different_size_path = "spec/fixtures/different_size.png"
      expect_raises(Flexo::Comparator::SizeComparisonException) do
        Flexo::Comparator.new.compare(baseline_path, different_size_path)
      end
    end

    it "raises an error when attempting to compare a file that is not a png" do
      baseline_path = "spec/fixtures/baseline.png"
      baseline_jpg_path = "spec/fixtures/baseline.jpg"
      expect_raises(Exception) do
        Flexo::Comparator.new.compare(baseline_path, baseline_jpg_path)
      end
    end
  end
end
