require "ruby2d"

module View
    class Ruby2dView
        def initialize
        end
        
        def render(state)
            extend Ruby2D::DSL #domain specific lenguage
            set(title: "Snake", width: 600, height: 400) #se configura la ventada de la app
            show
        end
    end
end