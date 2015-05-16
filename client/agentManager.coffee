class AgentManager

    constructor: (scene, world) ->
        console.log("Agent Manager Module Loaded")
        @world = world
        @agents = []


    update: () ->
        for agent in @agents
            agent.update()


    removeAgent: (removeAgent) ->
        removeAgentIndex = @agents.indexOf(removeAgent)
        @agents.splice(removeAgentIndex, 1)


    addAgent: ( x,y) ->
        agent = new Agent( x,y)
        @agents.push agent
        return agent

