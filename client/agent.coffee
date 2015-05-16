
class Agent

    constructor: (world, x, y) ->
        @x = x
        @y = y

        @town = town
        @pathfinder = pathfinder

        @path = []

        @healthBar = new HealthBar(this)

        material = new (THREE.MeshLambertMaterial)(color: @town.color)
        @cube = new (THREE.Mesh)(new (THREE.BoxGeometry)(1, 3, 1), material)
        @cube.position.y = 3
        @cube.position.x = x * 5
        @cube.position.z = y * 5
        @cube.castShadow = false
        @cube.receiveShadow = false
        @town.world.scene.add @cube



        #check for closest attackable object






    update: () ->
      #








