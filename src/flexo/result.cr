require "stumpy_png"
require "stumpy_core"



module Flexo
  class Result
    class ThresholdValueException < Exception
    end

    getter score
    setter score
    getter difference_image
    setter difference_image

    def initialize(@threshold : Float32)
      if @threshold < 0.0
        raise ThresholdValueException.new(
          "threshold must be greater than or equal to 0.0")
      elsif @threshold > 1.0
        raise ThresholdValueException.new(
          "threshold can be no greater than 1.0")
      end

      @score = 1.0
      @difference_image = StumpyCore::Canvas.new(0, 0)
    end

    def match?
      @score <= @threshold
    end

    def save(path : String)
      StumpyPNG.write(@difference_image, path)
    end
  end
end
