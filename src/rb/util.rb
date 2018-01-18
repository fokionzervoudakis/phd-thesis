autoload :YAML, 'yaml'

autoload :HoverAction, './hover_action'
autoload :KineticAction, './action'
autoload :LidarAction, './lidar_action'
autoload :Observer, './observer'
autoload :OpLoader, './op_loader'
autoload :Subject, './subject'

Dir['./core/*'].each { |file| require file }

def execute
  Dir['./operations/operation_*'].each { |file|
    yield(File.basename(file, '.yaml'))
  }
end