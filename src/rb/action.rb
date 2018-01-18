class Action
  include Subject
  include Observer

  def initialize(id, duration)
    super()
    @id = id.to_s
    @duration = duration
  end

  def add_precondition(action)
    add_subject(action)
  end

  def execute
    execute_naively if @subjects.empty?
  end

  def completed?
    @duration == 0
  end

  private
    def execute_naively
      @duration -= 1
      notify if completed?
    end
end

class KineticAction < Action; end
class SensorAction < Action; end
class PhotoSurveillanceAction < SensorAction; end
class TraversePathSegmentAction < KineticAction; end