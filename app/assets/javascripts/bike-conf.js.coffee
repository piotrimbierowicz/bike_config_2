window.ConfLoadingNow = 0

class BikeConf

	constructor: ->
		@loadData()
		@dataSet
		@defaultBike = { 'base' : 1, 'lamp' : 1, 'nozk' : 1, 'siod' : 1, 'chwy' : 1 }
		@elementKinds = { 'base' : 1, 'lamp' : 2, 'nozk' : 2, 'siod' : 3, 'chwy' : 5 }
		@loaderIcon = $('#conf-loader')
		@configMenu = $('#conf-setup-menu ul')
		@secondaryMenu = $('#conf-setup-secondary-menu ul')
		@elementTypeLabel = $('#conf-element-type-desc .type')
		@colorSelector = $('#conf-element-colors ul')
		@images_path = 'images/parts/'
		@loadingNow = 0

	loadData: ->
		$.get('/data', (data) =>
			@dataSet = data
			@dataLoaded()
		)

	dataLoaded: ->
		@constructLeftMenu( @dataSet.left_elements )
		@constructRightMenu( @dataSet.right_elements )
		@initBike( @dataSet.left_elements )
		@initBike( @dataSet.right_elements )

	prepareColorSelector: (elementSet, index) ->
		element = elementSet.types[index]
		@elementTypeLabel.text( element.name )
		@colorSelector.html('')
		for color in element.colors
			@colorSelector.append @prepareColorButton(elementSet, color)

	prepareColorButton: (elementSet, color) ->
		selector = $('<li><a href="#"><img src="images/colors/'+color.name+'.png" /></a></li>')
		selector.click( (event) => 
			event.preventDefault()
			imageSrc = @images_path + color.file
			@changeImage( elementSet.sys_name, imageSrc )	
		)

	initBike: (elementsMap) ->
		for element in elementsMap
			imageSrc = @images_path + element.types[0].colors[0].file
			@createImage( element.sys_name, imageSrc )

	createImage: (elementName, imageSrc) ->
		console.log('f:createImage')
		@showLoader()
		image = $('<img src="'+imageSrc+'" />')
			.load (event) =>
				$(this).unbind(event)
				$('#conf-'+elementName).append(image)
				@hideLoader()

	changeImage: (elementName, imageSrc) ->
		console.log('f:changeImage')
		console.log(elementName)
		@showLoader()
		$('<img src="'+imageSrc+'" />')
				.load (event) =>
					$(this).unbind(event)
					$('#conf-'+elementName + ' img').attr('src', imageSrc)
					@hideLoader()


	constructLeftMenu: (elementKinds) ->
		for element in elementKinds
			kindSelector = @parseKindSelector(element)
			@configMenu.append(kindSelector)

	constructRightMenu: (elementKinds) ->
		for element in elementKinds
			kindSelector = @parseSecondarySelector(element)
			@secondaryMenu.append(kindSelector)

	createSelector: (elementName, elementIndex) ->
		elementSelector = $('<li><a href="#">'+elementIndex+'</a></li>')
		elementSelector.click =>
			imageSrc = @images_path + elementName + '_' + elementIndex + '.png'
			@changeImage( elementName, imageSrc )

	parseSecondarySelector: (element) ->
		elementName = element.full_name
		container = $('<div class="conf-row"></div>')
		if(elementName.search(' ') > 0)
			label = $('<a href="#" class="conf-btn conf-btn-dblline conf-btn-label" data-element="0" data-color="0">'+elementName+'</a>')
		else
			label = $('<a href="#" class="conf-btn conf-btn-label" data-element="0" data-color="0">'+elementName+'</a>')
		container.append label
		label.click( (event) =>
			event.preventDefault()
			$('.conf-btn.active').removeClass('active')
			label.addClass('active')
			@prepareColorSelector(element, 0)
		)
		return container
			
	parseKindSelector: (element) ->
		elementName = element.full_name
		container = $('<div class="conf-row"></div>')
		leftarrow = $('<a href="#" class="conf-btn conf-btn-arrow"><i class="conf-icon-arrow-left"></i></a>')
		rightarrow = $('<a href="#" class="conf-btn conf-btn-arrow"><i class="conf-icon-arrow-right"></i></a>')
		label = $('<a href="#" class="conf-btn conf-btn-label" data-element="0" data-color="0">'+elementName+'</a>')
		# label
		label.click( (event) =>
			event.preventDefault()
			$('.conf-btn.active').removeClass('active')
			label.addClass('active')
			@prepareColorSelector(element, 0)
		)
		# left arrow
		leftarrow.click( (event) =>
			event.preventDefault()
			currentIndex = parseInt(label.attr('data-element'))
			elementIndex = currentIndex - 1
			# index over
			if(elementIndex > element.types.length)
				elementIndex = 0
			if(elementIndex == -1)
				elementIndex = element.types.length - 1
			imageSrc = @images_path + element.types[elementIndex].colors[0].file
			label.attr('data-element', elementIndex)
			@changeImage( element.sys_name, imageSrc )
			$('.conf-btn.active').removeClass('active')
			label.addClass('active')
			@prepareColorSelector(element, elementIndex)
		)
		# right arrow
		rightarrow.click( (event) =>
			event.preventDefault()
			currentIndex = parseInt(label.attr('data-element'))
			elementIndex = currentIndex + 1
			# index over
			if(elementIndex > element.types.length - 1)
				elementIndex = 0
			if(elementIndex == -1)
				elementIndex = element.types.length - 1
			imageSrc = @images_path + element.types[elementIndex].colors[0].file
			label.attr('data-element', elementIndex)
			@changeImage( element.sys_name, imageSrc )
			$('.conf-btn.active').removeClass('active')
			label.addClass('active')
			@prepareColorSelector(element,elementIndex)
		)
		container.append leftarrow
		container.append label
		container.append rightarrow
		return container

	showLoader: ->
		window.ConfLoadingNow += 1
		console.log(window.ConfLoadingNow)
		@loaderIcon.css('visibility', 'visible')

	hideLoader: (loaderConut) ->
		window.ConfLoadingNow -= 1
		console.log(window.ConfLoadingNow)
		if window.ConfLoadingNow == 0
			@loaderIcon.css('visibility', 'hidden')

$ -> new BikeConf