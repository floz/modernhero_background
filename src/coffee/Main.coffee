$ ->
	new Main()

class Main

	_$background: null
	_$background_sky: null
	_$background_ground: null
	_$lines: null
	_heights: null

	_speeds: null
	_delays: null

	constructor: ->
		@_$background = $( "#background" )
		@_$background_sky = $( "#background_sky" )
		@_$background_ground = $( "#background_ground" )

		@_$lines = @_$background_sky.find( ".background__line" )

		@_heights = []
		for line in @_$lines
			$line = $( line )
			@_heights.push $line.height()
			$line.height( 0 )

		@_$background_ground.css "bottom", "-130px"
		@_$background_sky.css "bottom", "-300px"

		@_showLines()

	_showLines: ->
		@_speeds = [ 8, 4, 3, 2.8, 2.7, 2.5, 2.3 ]
		@_delays = [ 0, 2, 3, 3.5, 3.75, 3.9, 4.1 ]

		idx = 0
		speed = 1
		for line in @_$lines
			TweenLite.to line, @_speeds[ idx ] * .5, { height: @_heights[ idx ] + "px", delay: @_delays[ idx ], ease: Quad.easeOut }
			idx++
			# break if idx == 5

		TweenLite.to @_$background_sky, 5.5, { bottom: 0 }
		TweenLite.to @_$background_ground, 1, { bottom: 0, delay: 4.4, ease: Quad.easeOut }


