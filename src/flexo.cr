require "./flexo/comparator"

module Flexo
  def self.compare(image_a_path : String, image_b_path : String, threshold : Float32 = 0.0)
    Comparator.new(threshold).compare(image_a_path, image_b_path)
  end
end
