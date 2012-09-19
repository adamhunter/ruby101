clear_screen = "\e[2J\e[100A\n"
blink_start  = "\e[5;32;40m"
blink_end    = "\e[m\n"

SLIDES = [
  clear_screen +
  "Welcome to Ruby 101! ".to_ascii.colorize(background: :blue),

  clear_screen +
  "Why is Ruby Awesome?".to_ascii.red,

  "IRB for one!".to_ascii,

  "A Handy Calculator (4 + 4)".to_ascii,

  "Word counter".to_ascii,

  clear_screen + 
  "Parabolic equations...".to_ascii,
    %Q[
    For example:
      
      (-10..10).to_a.map { |x| [x, (x**2) + x - 1] }
    ],

  clear_screen + 
  "Because of Methods".to_ascii.blue,
    %Q[
    Example:

      def say_hi
        puts "hi there"
      end

      # Note! Methods can end in ! or ?
    ],

  clear_screen +
  "Because of Variables".to_ascii.cyan,
    %Q[
    Examples:

      local_variable     (local_hello = 'hi')
      @instance_variable (@instance_hello = 'hello')
      $global_variable   ($global_hello = 'hello there sir')
      CONSTANT           (CONSTANT_HELLO = 'hello my good man, how are you today?')
    ],

  "Methods and Variables".to_ascii.colorize(color: :cyan, background: :blue),

  clear_screen +
  "Data Types".to_ascii.colorize(color: :black, background: :light_white),
    %Q[
    Examples:

      String   # => "Hello there sir"                                [length, reverse]
      Symbol   # => :immutable_string                                [swapcase, to_proc]
      Integer  # => 5_000                                            [public_methods, odd?]
      Range    # => 1..10                                            [to_a, include?]
      Boolean  # => true                                             [==, !=]
      Array    # => ['a list', 1, true, 'of stuff']                  [count, sample, [], last]
      Hash     # => {:key => "Value", :pairs => "Of Data"},          [values, []]
    ],

  clear_screen + 
  "Control Structures".to_ascii.light_magenta,

  "Conditionally Awesome".to_ascii.yellow,
    %Q[
    Conditional Examples:

      if true
        # do some stuff
      end

      if false
        # don't do some stuff
      end

      if condition_a?
        # some stuff
      elsif condition_b?
        # some other stuff
      else
        # some totally other stuff
      end

      unless false
        # do some stuff
      end

      unless true
        # dont do some stuff
      end

      awesome! if awesome?

      learn_me_some_engrish unless did_that_already?
    ],

  clear_screen + 
  "Truthyness and Falsyness".to_ascii.green,
    %Q[
    Examples:

      !!"string" # => true
      !!5_000    # => true
      !!true     # => true
      !!""       # => true
      !!0        # => true
      !![]       # => true
      !!{}       # => true
      !!false    # => false
      !!nil      # => false

      # Note! 
      #   Don't use `!!` in your code.
      #   Let ruby handle truthyness and falsyness for you.
    ],

  clear_screen + 
  "awesome! while true".to_ascii.light_red,
    %Q[
    Looping Examples:
      
      while true
        # do stuff
      end

      until false
        # do stuff
      end

      # NOTE! Like `if` and `unless`, `while` and `until` can "dangle" as well.
      
      awesome! while true
      awesome! until false
    ],

  clear_screen + 
  "Wherefore art thou?".to_ascii.light_red,
    %Q[
    Using for:

      for i in 0..5 do
        puts i
      end

      # NOTE! I literally had to Google how to do this.
    ],

  "To each his own".to_ascii.light_red,
    %Q[
      (0..5).each do
        puts i
      end

      # NOTE! I did not have to Google how to do this.
    ],

  clear_screen + 
  "Code Blocks".to_ascii.colorize(color: :yellow, background: :red),
    %q[
    Examples:

      people.each do |person|
        classify(person)
      end

      run_later do
        some_awesome_code or something
      end

      5.times { |i| puts "i is #{i}" }

      let(:yo_mamma) { FactoryGirl.create(:momma, child: you) }
    ],

  clear_screen + 
  "do / end vs. evil mustaches".to_ascii.colorize(background: :green),
    %Q[
    Use { } (evil mustachios) for single line blocks
      
      before_filter(:block_stuff) { block_some_stuff if should_block? }

      monsters.map { |monster| monster.attack }

      # NOTE! monsters.map could be rewritten as monsters.map(&:attack)
      
    Use do / end for multiline blocks

      group :mango_juice do
        gem "blender"
        gem "mango_mapper"
      end
      
      cats.each do |cat|
        cat.feed
        cat.pet
        cat.after(:scratches) { yell_at(cat) }
      end
    ],

  clear_screen + 
  "Objectify Me".to_ascii.light_magenta,
    %Q[#{blink_start} Everything, really, really, everything, is an object. #{blink_end}],
    %Q[

    - This means there are no primitives in ruby.
      - There is nothing special about strings or integers.

    - Everything in the system will behave as an object. 
      - There are no exceptions with certain types of data structures in ruby.

    - Everything can be sent a message
      - Every object can have a message sent to it, ie: `"hello".length`

    - Everything has a class.
      - Even the Class class has a class (it's Class)

    - Everything has a class lookup change (ancestory from inheritence).
      - Everything in ruby 1.9 decends from `BasicObject`.  
      - String.ancestors
    ],

  clear_screen +
  "Staying Classy".to_ascii.colorize(color: :light_yellow, background: :cyan),
    %q[
      # Can we encapsulate some code already?
      
      class Inbox
        def initialize(messages)
          @messages = messages
        end

        def read(limit = 5)
          @messages.first(limit).each do |message|
            format(message)
          end
        end

        def format(message)
          puts
          puts "From #{message.from}"
          puts "To   #{message.to}"
          puts
          puts message.body
          puts
        end
      end

      class Message
        attr_reader :body, :from, :to

        def initialize(options = {})
          @from = options.delete(:from)
          @to   = options.delete(:to)
          @body = options.delete(:content)
        end

        def reply(content)
          raise NotImplementedError.new("subclass of Message determines how to reply")
        end
      end

      class TerminalMessage < Message
        def reply(content)
          $stdout.puts content
        end
      end

      class EmailMessage < Message
        def reply(content)
          EmailClient.new(from, to, content).deliver
        end
      end
      
      class ChatMessage < Message
        def reply(content)
          ChatClient.session[from].send_message(to, content)
        end
      end
    ],

  clear_screen + 
  "In this instance...".to_ascii.colorize(color: :blue, background: :light_yellow),
    %Q[
      Some examples:

        messages = []
        messages << TerminalMessage.new(to: "Adam", from: "Ben", body: "This is quiet the message, eh?")
        messages << TerminalMessage.new(to: "Adam", from: "Jim", body: "Recent studies indicate that programming in ruby makes you more awesome.")
        messages << TerminalMessage.new(to: "Adam", from: "Ben", body: "Who is taking the first turn at driving tomorrow?")
        message = messages.first

        inbox   = Inbox.new([message])
        inbox.read

        message.reply("oh hey there")
    ],

  clear_screen + 
  "Getters and Setters".to_ascii.colorize(color: :light_yellow, background: :cyan),
    %q[
      class Person
        attr_accessor :name, :age, :address, :nickname, :gender
        
        def initialize(attributes = {})
          attributes.each do |attribute, value|
            public_send("#{attribute}=", value)
          end
        end

        def age=(value)
          @age = value.to_i
        end

        def gender
          @gender.to_s.upcase.first
        end
      end
    ],

  clear_screen + 
  "Class.methods".to_ascii.colorize(color: :black, background: :yellow),
    %Q[
      class Person
        def self.new_with_name(name)
          new name: name
        end
      end

      def Person.new_with_name_and_age(name, age)
        new name: name, age: age
      end
    ],

  clear_screen + 
  "Mo Modules mo problems".to_ascii.light_green,
    %q[
      module Vocal
        def speak(attribute)
          def "My #{attribute} is #{public_send(attribute)}"
        end
      end

      class Person
        include Vocal
      end

      module Explosive
        def explode
          puts split('').map { |c| c.rjust(rand(50) + 1, ' ') }.join("\n")
        end
      end

      String.send(:include, Explosive)
    ],

  clear_screen + 
  "Protoype Methods".to_ascii,
    %Q[
    Examples:
      
      person = Person.new

      def person.awesome?
        name == 'Adam'
      end

      person.awesome?
      person.name = 'Adam'
      person.awesome?

      ben = person.clone
      jim = person.dup
      ben.name = 'Ben'
      jim.name = 'Jim'

      ben.awesome?
      jim.awesome?
    ],

  clear_screen + 
  "Ruby Gems".to_ascii.red,
    %Q[
      gem install colorize
      irb
      require 'colorize'
      puts "Ruby Gems makes ruby awesome".red
    ],

  clear_screen + 
  "Bundler".to_ascii.light_blue,

  clear_screen + 
  "Rspec".to_ascii.green,
    %Q[
      # NOTE! in a new tab, I can run `rspec main.rb` to run all my specs
      
      describe "mommas" do
        it "is so fat" do
          # expects yo_momma.so_fat? to return true
          yo_momma.should be_so_fat
        end
      end

      # NOTE! 
      #   Rspec now lets you write yo momma jokes this way:
      #   expect(yo_momma).to be_so_fat
    ],

  clear_screen +
  "Thank you! ".to_ascii.colorize(background: :red)
  
].freeze

