class ControlManager



    constructor: (scene, cameraManager, levelManager) ->
        @scene = scene
        @gameManager = gameManager
        @cameraManager = cameraManager
        @levelManager = levelManager
        console.log("ControlManager Module Loaded")
        console.log(@cameraManager)



        $ ->
            $('body').on 'keydown', (event) ->
                console.log event.type + ': ' + event.which
                console.log(gameManager.cameraManager)
                if event.which == 87
                    #W
                    cameraManager.camera.position.z -= 1.6
                if event.which == 83
                    #s
                    cameraManager.camera.position.z += 1.6
                if event.which == 68 #D
                    #d
                    cameraManager.camera.position.x += 1.6
                if event.which == 65 #A
                    #W
                    cameraManager.camera.position.x -= 1.6
                if event.which == 69
                    #e
                    cameraManager.camera.position.y += 1.6
                if event.which == 81
                    #W
                    cameraManager.camera.position.y -= 1.6
                if event.which == 67
                    #W
                    cameraManager.camera.rotation.x -= 0.1
                    # plane.rotation.x += 0.1;
                    # console.log(plane.rotation.x);
                if event.which == 90
                    #W
                    cameraManager.camera.rotation.x += 0.1

                if event.which == 80
                    #Lets Pause

                    if levelManager.paused == false
                        levelManager.paused = true
                    else
                        levelManager.paused = false

        raycaster = new THREE.Raycaster()
        mouse = new THREE.Vector2()


        $('body').on "mousemove", (e) ->

            mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1
            mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1

            raycaster.setFromCamera( mouse, cameraManager.camera )

        # // calculate objects intersecting the picking ray
            intersects = raycaster.intersectObjects( scene.children )


            i= 0
            while i < intersects.length
                # intersects[ i ].object.material.color.set( 0xff0000 )

                id = intersects[ i ].object.uuid

                # console.log(levelManager)

                for tileL in levelManager.world.tiles
                    for tile in tileL
                        # console.log(tile)
                        if tile.cube.uuid == id
                            tile.highlighted = true
                            $("#coords").html("X: " + tile.x + " Y: "  + tile.y)
                        else
                            tile.highlighted = false


                i++


