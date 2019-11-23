require "../src/flexo"

# Path to image of Corgi with light pink ears
corgi_1_path = "examples/corgi-1.png"

# Path to image of Corgi with darker pink ears
corgi_2_path = "examples/corgi-2.png"

# Comparing two of the same image
same_image_result = Flexo.compare(corgi_1_path, corgi_1_path)
same_image_result.save("examples/output/same_corgi_comparison.png")
puts "Comparing #{corgi_1_path} to #{corgi_1_path}:"
puts "\tComparison Score: #{same_image_result.score}"
puts "\tImages match: #{same_image_result.match?}"
puts

# Comparing two different images
different_image_result = Flexo.compare(corgi_1_path, corgi_2_path)
different_image_result.save("examples/output/different_corgi_comparison.png")
puts "Comparing #{corgi_1_path} to #{corgi_2_path}:"
puts "\tComparison Score: #{different_image_result.score}"
puts "\tImages match: #{different_image_result.match?}"

# Comparing two images with a higher threshold

# Image can be up to 10% different and still be considered a match
different_image_high_threshold = Flexo.compare(corgi_1_path, corgi_2_path, 0.1)
puts "Comparing #{corgi_1_path} to #{corgi_2_path} with a threshold of 0.1:"
puts "\tComparison Score: #{different_image_high_threshold.score}"
puts "\tImages match: #{different_image_high_threshold.match?}"
