class GameManager

    cameraManager = null
    controlManager = null
    levelManager = null
    lightManager = null
    stats = null


    constructor: (scene) ->


        renderer = new (THREE.WebGLRenderer)(antialias: true)
        renderer.setSize window.innerWidth, window.innerHeight
        renderer.setClearColor 0xffffff, 1
        document.body.appendChild renderer.domElement
        scene = new (THREE.Scene)

        cameraManager = new CameraManager(scene)
        levelManager = new LevelManager(scene)
        controlManager = new ControlManager(scene, cameraManager, levelManager) #TODO: only pass GameManager
        lightManager = new LightManager(scene)


        renderer.shadowMapEnabled = true
        renderer.shadowMapSoft = true
        renderer.shadowCameraNear = 3
        renderer.shadowCameraFar = cameraManager.camera.far
        renderer.shadowCameraFov = 50
        renderer.shadowMapBias = 0.0039
        renderer.shadowMapDarkness = 0.5
        renderer.shadowMapWidth = 1024
        renderer.shadowMapHeight = 1024


        render = ->
            requestAnimationFrame render
            renderer.render scene, cameraManager.camera
            return

        render()



    setUp: () ->
        levelManager.init()

        setInterval ()->
            update()
        ,10


        setInterval () ->
            htmlupdate()
        ,100


    update = () ->
        timestart = Date.now()
        levelManager.update()
        timeTaken = Date.now() - timestart

        # console.log(timeD , "ms")



    htmlupdate = () ->
        # console.log(levelManager)



