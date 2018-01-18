class HoverAction < KineticAction
  def initialize(id, duration)
    super id, duration
    @concurrencies = Array.new
  end

  def add_concurrency(action)
    @concurrencies.push(action)
  end

  def execute
    if @subjects.empty?
      @concurrencies.each { |action| action.execute }
      execute_naively
    end
  end
end