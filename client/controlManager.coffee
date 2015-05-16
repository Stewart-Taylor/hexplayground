

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
                # if event.which == 76
                #     #W

                #     console.log 'Camera X: ' + cameraManager.camera.position.x + ' Y: ' + cameraManager.camera.position.y + ' z: ' + cameraManager.camera.position.z
                #     console.log 'Camera ROT X: ' + cameraManager.camera.rotation.x + ' Y: ' + cameraManager.camera.rotation.y + ' z: ' + cameraManager.camera.rotation.z


                # if event.which == 75 #K
                    # levelManager.world.towns[0].population = levelManager.world.towns[0].population / 2
                    # levelManager.world.towns[0].food = levelManager.world.towns[0].food = 0

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
                            console.log("GOT IT m8")
                            tile.highlighted = true
                            $("#coords").html("X: " + tile.x + " Y: "  + tile.y)
                        else
                            tile.highlighted = false



                # console.log(intersects[ i ].object)
                i++


            # projector = new THREE.Projector()
            # mouseVector = new THREE.Vector3()

            # mouseVector.x = 2 * (e.clientX / containerWidth) - 1
            # mouseVector.y = 1 - 2 * ( e.clientY / containerHeight )

            # raycaster = projector.pickingRay( mouseVector.clone(), cameraManager.camera )

                # mouse3D = new THREE.Vector3( ( event.clientX / window.innerWidth ) * 2 - 1, -( event.clientY / window.innerHeight ) * 2 + 1, 0.5 )

            # raycaster = projector.pickingRay( mouse3D.clone(), camera )
            # intersects = raycaster.intersectObjects( objects )
            # // Change color if hit block
            # if ( intersects.length > 0 )
                # intersects[ 0 ].object.material.color.setHex( Math.random() * 0xffffff )


                # if event.which == 38 #up
                #     actorManager.player.position.z += 0.5

                # if event.which == 40 #down
                #     actorManager.player.position.z -= 0.5

                # if event.which == 39 #right
                #     actorManager.player.position.x -= 0.5

                # if event.which == 37 #left
                #     actorManager.player.position.x += 0.5
