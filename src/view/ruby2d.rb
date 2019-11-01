require "ruby2d"

module View
    class Ruby2dView
        def initialize
        end
        
        def render(state)
            extend Ruby2D::DLS
            set(title: "Snake", width: 600, height: 400)
            shot
        end
    end
end