package spygames

class AgentController {

    def index() {
    	def agents = Agent.list()
    	[agents:agents]
    }
}
