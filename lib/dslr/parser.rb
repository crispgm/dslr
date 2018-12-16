module Dslr
  class Parser
    attr_reader :attributes, :file_content
    attr_reader :result
    attr_reader :error

    def initialize(filename)
      @attributes = {}
      @file_content = File.read(filename)
      @result = 0
    end

    def run
      self.instance_eval(@file_content)
    end

    def valid?
      true
    end

    def set(key, value)
      @attributes[key] = value.to_f
    end

    def get(key)
      if @attributes.key?(key)
        @attributes[key]
      end
    end

    def print(key)
      puts get(key)
    end

    def add(val, *others)
      @result += val
      others.each do |v|
        @result += v
      end
    end

    def sub(val, *others)
      @result -= val
      others.each do |v|
        @result -= v
      end
    end

    def mul(val, *others)
      @result *= val
      others.each do |v|
        @result *= v
      end
    end

    def div(val, *others)
      @result /= val
      others.each do |v|
        @result /= v
      end
    end

    def sqrt
      @result = Math.sqrt(@result)
    end

    def exp(val)
      @result **= val
    end

    def PI
      Math::PI
    end

    def E
      Math::E
    end

    def to_s
      output = ""
      @attributes.each do |k, v|
        output << "Key: #{k} Value: #{v}"
      end
      output
    end

    def method_missing(sym, *args)
      @attributes[sym]
    end
  end
end
