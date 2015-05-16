


class World

    constructor: (scene) ->
        @scene = scene

        @tiles = []
        @tilesPP = []


        @WORLD_WIDTH = 14
        @WORLD_HEIGHT = 7

        @agentManager = new AgentManager(scene, this)
        @createWorld()


    createWorld: () ->

        # grid = worldGenerator.generateWorld()
        @tiles = @createArray(@WORLD_WIDTH, @WORLD_HEIGHT)

        x = 0
        while x < @WORLD_WIDTH

            y = 0
            while y < @WORLD_HEIGHT
                newTile = new Tile(this, x, y, 1, 1)
                @tiles[x][y] = newTile
                @tilesPP.push newTile
                y++
            x++


        @count = 0

        # console.log("233sdsd")
        # tilesD = @tiles
        # setInterval (@tiles) ->
        #     for tile in tilesD
        #         tile.update()
        #     # a = 0
        #     # while a < @WORLD_WIDTH
        #     #     b = 0
        #     #     while b < @WORLD_HEIGHT
        #     #         console.log("sdsd")
        #     #         @tiles[a][b].update()
        #     #         b++
        #     #     a++
        # , 100

        # for tile in @tiles
        #     newTile = new Tile(this, gridTile.x, gridTile.y, gridTile.value, gridTile.type)
        #     @tiles[gridTile.x][gridTile.y] = newTile
        #     @tilesPF.push newTile



    createArray: (length) ->
        arr = new Array(length or 0)
        i = length
        if arguments.length > 1
            args = Array::slice.call(arguments, 1)
            while i--
                arr[length - 1 - i] = @createArray.apply(this, args)
        return arr




    update: () ->
        for tile in @tilesPP
            tile.update()

        @agentManager.update()



    getTile: (x,y) ->
        if( x > 0) && ( x < @WORLD_WIDTH)
            if ( y > 0 ) && ( y < @WORLD_HEIGHT)
                return @tiles[x][y]
        return null

