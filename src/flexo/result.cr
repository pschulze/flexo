require "stumpy_png"
require "stumpy_core"

module Flexo
  class Result
    getter score
    setter score
    getter difference_image
    setter difference_image

    def initialize(@threshold : Float32)
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
