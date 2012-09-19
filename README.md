# Ruby 101

This is a command line utility that will run the presentation through IRB.

## Setup

Use bundler to get any dependencies.

```bash
  bundle
```

## Usage

```bash
  ruby main.rb
```

This will drop you into an IRB session with an instance variable called `@deck`.

```ruby
  @deck.play
```

Keep calling `@deck.play` to traverse through the presentation.

## Tests
I have added a few rspec tests to ensure the presentation works as expected.

```bash
  rspec main.rb
```
