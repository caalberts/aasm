module AASM
  class StateMachine

    # the following two methods provide the storage of all state machines
    def self.[](klass)
      (@machines ||= {})[klass.to_s]
    end

    def self.[]=(klass, machine)
      (@machines ||= {})[klass.to_s] = machine
    end

    attr_accessor :states, :events, :initial_state, :config
    attr_reader :name

    def initialize
      @initial_state = nil
      @states = []
      @events = {}
      @config = OpenStruct.new
    end

    # called internally by Ruby 1.9 after clone()
    def initialize_copy(orig)
      super
      @states = @states.dup
      @events = @events.dup
    end

    def add_state(name, klass, options)
      @states << AASM::State.new(name, klass, options) unless @states.include?(name)
    end

  end # StateMachine
end # AASM
