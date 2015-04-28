class RectangleShape extends g.RShape
	@Shape = paper.Path.Rectangle
	@rname = 'Rectangle'
	@rdescription = """Simple rectangle, square by default (use shift key to draw a rectangle) which can have rounded corners.
	Use special key (command on a mac, control otherwise) to center the shape on the first point."""
	@iconURL = 'static/images/icons/inverted/rectangle.png'
	@iconAlt = 'rectangle'

	@parameters: ()->
		parameters = super()
		parameters['Style'] ?= {}
		parameters['Style'].cornerRadius =
			type: 'slider'
			label: 'Corner radius'
			min: 0
			max: 100
			default: 0
		return parameters

	createShape: ()->
		@shape = @addPath(new @constructor.Shape(@rectangle, @data.cornerRadius)) 			# @constructor.Shape is a Path.Rectangle
		return

tool = new g.PathTool(RectangleShape, true)