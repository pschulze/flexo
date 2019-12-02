require "stumpy_core"
require "stumpy_png"
require "./result"

module Flexo
  class Comparator
    class SizeComparisonException < Exception
    end

    def initialize(@threshold : Float32 = 0.0)
      @result = Result.new(@threshold)
    end

    def compare(image_a_path : String, image_b_path : String) : Result
      image_a = StumpyPNG.read(image_a_path)
      image_b = StumpyPNG.read(image_b_path)

      if image_a.pixels.size != image_b.pixels.size
        raise SizeComparisonException.new(
          "images being compared must be of the same size")
      end

      diff_pixels = 0
      comparison_canvas = StumpyCore::Canvas.new(image_a.width, image_a.height)

      (0...image_a.height).each do |y|
        (0...image_a.width).each do |x|
          # next unless x % 4 == 0
          if image_a[x, y] == image_b[x, y]
            pixel_to_write = image_a[x, y]
          else
            pixel_to_write = StumpyCore::RGBA::LIME
            diff_pixels += 1
          end
          comparison_canvas[x, y] = pixel_to_write
        end
      end

      @result.score = diff_pixels / image_a.pixels.size
      @result.difference_image = comparison_canvas
      @result
    end
  end
end
