class Tile

    constructor: (world, x, y, value, type) ->

        @x = x
        @y = y
        @value = value
        @world = world
        @hasFarm = false
        @hasBuilding = false

        @tileColor = new THREE.Color( 0, value, 0 )

        @hasOwner = false
        @owner = null

        TILE_SIZE = 10

        @highlighted = false
        @adjacentHighlighted = false

        if type == 1
            @landMaterial = new (THREE.MeshLambertMaterial)(color: @tileColor)
            #cube = new (THREE.Mesh)(new (THREE.BoxGeometry)(TILE_WIDTH - 1, 1, TILE_HEIGHT - 1), landMaterial)
            geometry = new THREE.CylinderGeometry(TILE_SIZE,TILE_SIZE,2,6)
            @cube  = new THREE.Mesh( geometry, @landMaterial )

        @cube.position.y = 1

        spacing = 2.0

        if y % 2
            @cube.position.x = (x * TILE_SIZE * spacing)
            @cube.position.z = (y * 8 * spacing) #- (TILE_SIZE / 2)
        else
            @cube.position.x = (x * TILE_SIZE * spacing) + (TILE_SIZE)
            @cube.position.z = (y * 8 * spacing) #- (TILE_SIZE / 2)
        @cube.castShadow = false
        @cube.receiveShadow = true
        world.scene.add @cube


    update: () ->
        if @highlighted == true
            @cube.material.color.set( 0xff0000 )
            @cube.position.y = 1.2
            @updateAdjacent()
        else if @adjacentHighlighted == true
            @cube.material.color.set( 0x3498db )
            @cube.position.y = 1
        else
            @cube.material.color.set( @tileColor )
            @cube.position.y = 1
        @adjacentHighlighted = false


    updateAdjacent: () ->

        adjacents = [ {x:0,y: - 1}, {x:1,y: - 1}, {x: - 1,y:0}, {x:1,y:0}, {x:0,y:1}, {x:1,y:1} ]


        for adjacent in adjacents
            tileTemp = @getTile(@x + adjacent.x, @y + adjacent.y)
            @setAdjacent(tileTemp)


    getTile:(x,y) ->
        return @world.getTile(x,y)

    setAdjacent: (tileTemp) ->
        if tileTemp != null
            tileTemp.adjacentHighlighted = true





