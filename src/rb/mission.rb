require './util'

autoload :ARDrone, './asset'
autoload :TraversePathSegmentAction, './action'

module Mission
  def self.execute(assets)
    while !assets.empty?
      assets.each { |asset|
        asset.execute
        assets.delete(asset) if asset.completed?
      }
    end
  end
end

execute { |operation|
  puts "executing #{operation}..."
  Mission.execute(OpLoader.new(operation).assets)
}