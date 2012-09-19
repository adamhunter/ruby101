clear_screen ="\e[2J\e[100A"

SLIDES = [

  "Why is Ruby Awesome?".to_ascii.red,

  "IRB for one!".to_ascii,

  "A Handy Calculator (4 + 4)".to_ascii,

  "Word counter".to_ascii,

  clear_screen + "Parabolic equations...".to_ascii,

  %Q[
  For example:
    
    (-10..10).to_a.map { |x| [x, (x**2) + x - 1] }
  ],

  clear_screen + "Because of Methods".to_ascii.blue,

  %Q[
  Example:

    def say_hi
      puts "hi there"
    end

    # Note! Methods can end in ! or ?
  ],

  clear_screen + "Because of Variables".to_ascii.cyan,

  %Q[
  Examples:

    local_variable     (local_hello = 'hi')
    @instance_variable (@instance_hello = 'hello')
    $global_variable   ($global_hello = 'hello there sir')
    CONSTANT           (CONSTANT_HELLO = 'hello my good man, how are you today?')
  ],

  "Methods and Variables".to_ascii.colorize(color: :cyan, background: :blue),

  clear_screen + "Data Types".to_ascii.colorize(color: :black, background: :light_white),

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

  clear_screen + "Control Structures".to_ascii.light_magenta,

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

  clear_screen + "Truthyness and Falsyness".to_ascii.green,

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

  clear_screen + "awesome! while true".to_ascii.light_red,

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

  clear_screen + "Wherefore art thou?".to_ascii.light_red,

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
  ]

].freeze

