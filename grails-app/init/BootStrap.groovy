import spygames.Agent
class BootStrap {

    def init = { servletContext ->
    	new File("./cc-maps-data-set.csv").splitEachLine(',') {fields ->
    		def agent = new Agent(
        		name: fields[0].trim(),
        		lat: fields[1].trim(),
        		lon: fields[2].trim(),
        		age: fields[3].trim(),
        		gender: fields[4].trim()
    		)		
    	if (agent.hasErrors() || agent.save(flush: true) == null) {
        	log.error("Could not import agent  ${agent.errors}")
    	}

    	log.debug("Importing agent  ${agent.toString()}")
		}
    }
    def destroy = {
    }
}
