def greet(stdin, stdout)
  name = (stdin.gets || "").chomp  # => "kristina", "Josh", "", "Kristina2", "Josh"
  stdout.puts "hello, #{name}"     # => nil, nil, nil, ["hello, Kristina2"], ["hello, Kristina2", "hello, Josh"]
end

require 'stringio'                # => true
stdin = StringIO.new("kristina\nJosh")  # => #<StringIO:0x007fbf6a06ba68>
stdout = StringIO.new             # => #<StringIO:0x007fbf6a06b950>
greet(stdin, stdout)              # => nil
greet(stdin, stdout)              # => nil
stdout.string                     # => "hello, kristina\nhello, Josh\n"

greet($stdin, $stdout)  # => nil

class Inputs
  def initialize(inputs)
    @inputs = inputs      # => ["Kristina2", "Josh"]
  end

  def gets
    @inputs.shift         # => "Kristina2", "Josh"
  end
end

class Outputs
  attr_reader :outputs   # => nil
  def initialize
    @outputs = []        # => []
  end

  def puts(message)
    @outputs << message  # => ["hello, Kristina2"], ["hello, Kristina2", "hello, Josh"]
  end
end

inputs  = Inputs.new ['Kristina2', 'Josh']  # => #<Inputs:0x007fbf6a06acf8 @inputs=["Kristina2", "Josh"]>
outputs = Outputs.new                       # => #<Outputs:0x007fbf6a06aa28 @outputs=[]>
greet inputs, outputs                       # => ["hello, Kristina2"]
greet inputs, outputs                       # => ["hello, Kristina2", "hello, Josh"]
outputs.outputs                             # => ["hello, Kristina2", "hello, Josh"]


# >> hello,
