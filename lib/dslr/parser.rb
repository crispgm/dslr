module Dslr
  class Parser
    attr_reader :attributes, :file_content
    attr_reader :error

    def initialize(filename)
      @attributes = {}
      @file_content = File.read(filename)
    end

    def run
      self.instance_eval(@file_content)
    end

    def valid?
      true
    end

    def set(key, value)
      @attributes[key] = value
    end

    def get(key)
      if @attributes.key?(key)
        @attributes[key]
      end
    end

    def print(key)
      puts get(key)
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
