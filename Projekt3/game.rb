require 'ruby2d'


set background: 'black', title: 'Space Invaders'
set width: 400, height: 550

$gamestatus = true
$enemies = []

class Projectile
    WIDTH = 6 * 3
    HEIGHT = 5 * 3
    SPEED = 12

    def initialize(x, y)

        @Image = Sprite.new(
            'Projekt3_Images/projectile.png',
            x: x,
            y: y,
            width: WIDTH,
            height: HEIGHT,
        )

        @y_velocity = VELOCITY_INCREASE_SPEED * (@speed / 100.0)
    end

    def move
        @image.y += @y_velocity
    end

end

class Player
    WIDTH = 32 * 3
    HEIGHT = 46 * 3

    def initialize(x, y)
        Sprite.new(
            "Projekt3_Images/SI_laser_cannon.webp", clip_width: 32,
            width: WIDTH,
            height: HEIGHT,
            x: x,
            y: y,
        )
    end

    def moveLeft
        $playerPosition -= 5
        updateBoard
    end
    
    def moveRight
        $playerPosition += 5
        updateBoard
    end

end


class Enemy
    attr_accessor :alive, :x_position, :y_position, :type
    WIDTH = 33.6
    HEIGHT = 33.6
    @@ship_x_position = [WIDTH, 2*WIDTH, 3*WIDTH, 4*WIDTH, 5*WIDTH, 6*WIDTH, 7*WIDTH, 8*WIDTH, 9*WIDTH, 10*WIDTH, 11*WIDTH]
    @@ship_y_position = [HEIGHT, 2*HEIGHT, 3*HEIGHT, 4*HEIGHT, 5*HEIGHT]
    @@ship_type = ["SI_squid", "SI_crab", "SI_octopus"]

    def initialize(alive = true, the_x_position, the_y_position)

        @alive = alive
        @x_position = @@ship_x_position[the_x_position]
        @y_position = @@ship_y_position[the_y_position]

        if the_y_position == 1
            @type = @@ship_type[0]  
        elsif the_y_position == 2 || the_y_position == 3
            @type = @@ship_type[1]
        elsif the_y_position == 4 || the_y_position == 5
            @type = @@ship_type[2]
        end
    end

    def type
        return @type
    end

    def image_path
        "Projekt3_Images/#{@type}.gif"
    end

end

def gamestatus
    if
        $gamestatus == dead
        gameEnd
    end
end

def gameEnd
    if $gamestatus == dead
        Text.new()
    elsif $gamestatus == alive
        Text.new()
    end
end

def initializeBoard
    for y_position in 1..5
        for x_position in 1..11
            $enemies << Enemy.new(x_position, y_position)
        end
    end
    Image.new("Projekt3_Images/SI_laser_cannon.webp", x: 176, y: 50, height: 30)
    for enemy in $enemies
        Image.new(enemy.image_path, x: @x_position, y: @y_position, width: 30, height: 30)
    end
end

$playerPosition = 0

def playerShoot

end

def collitiondetector(ship, bullet)
    #if ship.x == bullet.x && ship.y == bullet.y
    #removeShip
end

def removeShip(ship)
    #ship.state == false
end

def eventKeyHandler(event)
    on :key_held do |event|
        if event.key == 'left'
        Player.moveLeft
        elsif event.key == 'right'
        Player.moveRight
        elsif event.key == 'space'
        current_screen.player_fire_projectile
        end
    end
end



def main
    initializeBoard
    eventKeyHandler 
    show
end

main