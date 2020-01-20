# Flexo

[![GitHub release](https://img.shields.io/github/release/<YOUR-GITHUB-USERNAME>/<YOUR-REPOSITORY-NAME>.svg)](https://github.com/pschulze/flexo/releases)

For when you want to see if two images aren't quite the same.

<img src="https://i.redd.it/xm1h605lf5l01.jpg" alt="drawing" width="300"/>

## Interface

```crystal
Flexo.compare(
  image_a_path : String,
  image_b_path : String,
  threshold : Float32 = 0.0) : Result
```
Compares two images of the same size at the given file paths with an optional threshold for if they are considered a match. Returns a `Result`

```
Result#score
```
The ratio of pixels that are different between the two images and the total number of pixels of one of those images.

```
Result#match?
```
A boolean value that represents whether the two compared images are a match given the threshold provided when comparing them.

```
Result#save(path : String)
```
Saves the diff image between the two images to the given path. Differences appear as the colour `StumpyCore::RGBA::LIME` overlaid on the first image.

## Usage

### Install the `flexo` shard

1. `shards init`
2. Add the dependency to `shards.yml`

    ```yml
    ...
    dependencies:
    flexo:
      github: pschulze/flexo
      version: "~> 0.1"
    ...
    ```
3. `shards install`

### Comparing Images

```crystal
require "flexo"

result = Flexo.compare("path/to/first/image.png", "path/to/second/image.png")
puts result.score
puts result.match?
result.save("output/path/of/diff/image.png")
```

## Examples

1. [Install Crystal](https://crystal-lang.org/install/)
2. Run:

    ```
    git clone git@github.com:pschulze/flexo.git
    cd flexo
    shards install
    crystal examples/corgi_comparison.cr
    ```
