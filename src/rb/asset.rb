class Asset
  class << self; attr_accessor :endurance end

  def initialize(id)
    @id = id.to_s
    @endurance = self.class.endurance
    @actions = Array.new
  end

  def add_action(action)
    @actions.push(action)
  end

  def execute
    @actions.each { |action|
      action.execute
      @actions.delete(action) if action.completed?
    }
    @endurance -= 1
  end

  def completed?
    @endurance == 0 || @actions.empty?
  end
end

class ARDrone < Asset; end
class Hummingbird < Asset; end