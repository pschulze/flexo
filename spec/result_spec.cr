require "./spec_helper"

describe Flexo::Result do
  describe ".new" do
    it "raises an error with a negative threshold" do
      expect_raises(Flexo::Result::ThresholdValueException) do
        Flexo::Result.new(-999.9)
      end
    end

    it "raises an error with a threshold greater than 1.0" do
      expect_raises(Flexo::Result::ThresholdValueException) do
        Flexo::Result.new(999.9)
      end
    end
  end

  describe "#match?" do
    it "returns false when score is greater than the threshold" do
      result = Flexo::Result.new(0.25)
      result.score = 0.50
      result.match?.should be_false
    end

    it "returns true when score is equal to the threshold" do
      result = Flexo::Result.new(0.25)
      result.score = 0.25
      result.match?.should be_true
    end

    it "returns true when score is less than the threshold" do
      result = Flexo::Result.new(0.25)
      result.score = 0.0
      result.match?.should be_true
    end
  end

  describe "#save?" do
    it "saves the difference image at the provided file path" do
      output_file_name = "test_output.png"
      File.delete(output_file_name) if File.exists?(output_file_name)

      begin
        Flexo::Result.new(0.0).save("test_output.png")
        File.exists?("test_output.png").should be_true
      ensure
        File.delete(output_file_name) if File.exists?(output_file_name)
      end
    end
  end
end
