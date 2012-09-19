#!/usr/bin/env ruby

$:.unshift('.')

require 'irb'
require 'artii'
require 'colorize'

module String::ToAscii
  def to_ascii
    @artii ||= Artii::Base.new
    @artii.asciify(self)
  end
end

String.send(:include, String::ToAscii)

class SlideDeck
  def initialize(slides)
    @played  = []
    @slides  = slides.dup
  end
  
  def play
    puts "\n#{self.next}\n"
  end

  def next
    slides.shift.tap { |slide| played.push(slide) }
  end

  def prev
    played.pop.tap { |slide| slides.unshift(slide) }
  end

  def peek
    slides.first
  end

  def rewind
    prev until played.empty?
    true
  end

  def fast_forward
    self.next until slides.one?
    true
  end
  alias :ff :fast_forward
  
  def inspect
    "#<SlideDeck @slides @played>"
  end

  private

  def slides
    @slides.compact!
    @slides
  end

  def played
    @played.compact!
    @played
  end
end

def reload!
  $stdout.puts "Loading Ruby 101 environment...\n\n"
  Object.send(:remove_const, :SLIDES) if Object.const_defined?(:SLIDES)
  $LOADED_FEATURES.delete(File.expand_path('./slides.rb'))
  require 'slides'
  @deck = SlideDeck.new(SLIDES)
end

reload!

unless defined?(RSpec)
  IRB.start

else
  describe "my presentation" do
    let(:sentence) { %[Why is Ruby Awesome?] }
    let(:ascii) do
      %[ __          ___             _       _____       _                                                         ___  \n \\ \\        / / |           (_)     |  __ \\     | |               /\\                                      |__ \\ \n  \\ \\  /\\  / /| |__  _   _   _ ___  | |__) |   _| |__  _   _     /  \\__      _____ ___  ___  _ __ ___   ___  ) |\n   \\ \\/  \\/ / | '_ \\| | | | | / __| |  _  / | | | '_ \\| | | |   / /\\ \\ \\ /\\ / / _ \\ __|/ _ \\| '_ ` _ \\ / _ \\/ / \n    \\  /\\  /  | | | | |_| | | \\__ \\ | | \\ \\ |_| | |_) | |_| |  / ____ \\ V  V /  __\\__ \\ (_) | | | | | |  __/_|  \n     \\/  \\/   |_| |_|\\__, | |_|___/ |_|  \\_\\__,_|_.__/ \\__, | /_/    \\_\\_/\\_/ \\___|___/\\___/|_| |_| |_|\\___(_)  \n                      __/ |                             __/ |                                                   \n                     |___/                             |___/                                                    ]
    end 

    it "monkey patches String to provide a to_ascii method" do
      sentence.should respond_to(:to_ascii)
    end

    it "outputs ascii text as expected" do
      sentence.to_ascii.should eq(ascii)
    end

    describe "SlideDeck" do
      let(:deck) { SlideDeck.new(SLIDES) }

      it "will iterate forward through the slides" do
        deck.next.should eq(SLIDES[0])
        deck.next.should eq(SLIDES[1])
      end

      it "will iterate backwards through the slides" do
        first  = deck.next
        second = deck.next
        deck.prev.should eq(second)
        deck.prev.should eq(first)
      end

      it "will rewind to the begining of the slides" do
        deck.next; deck.next; deck.next
        deck.rewind
        deck.next.should eq(SLIDES.first)
      end

      it "will not jam nils into the slide deck" do
        deck.prev
        deck.next.should_not be_nil
      end

      it "allows peeking at the next slide without moving forward" do
        deck.peek.should eq(deck.next)
      end

      it "will let you fast_foward to the end" do
        deck.fast_forward
        deck.peek.should eq(SLIDES.last)
      end
    end
  end
end


