require_relative "view/ruby2d"
require_relative "model/state"
require_relative "actions/actions"



class App
    def initialize
        @state = Model::initial_state
    end


    def start
        #puts "esto funciona"
        @view = View::Ruby2dView.new(self)
        timer_thread = Thread.new { init_timer(@view) }
        @view.start(@state)
        timer_thread.join   
    end

    def init_timer(view)
        loop do
            if @state.game_finished
                puts "Juego Finalizado"
                puts "Juego Finalizado #{@state.snake.positions.length}"
                break
            end
            @state = Actions::move_snake(@state)
            #trigger, mover la serpiente
            view.render(@state)
            sleep 0.5
        end

    end

    def send_action(action, params)
        #metaprogramacion, llamar a un metodo de un modulo o una clase usando el nombre
        new_state = Actions.send(action, @state, params)#este metodo permite enviar un nombre de metodo y los parametros 
        if new_state.hash != @state #si el estado no ha cambiado, el hash es el mismo, para no hacer un render por cada accion
            @state = new_state
            @view.render(@state)
        end
        
        @view.render(@state)
    end


end



app = App.new
app.start