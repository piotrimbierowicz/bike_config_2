window.ConfLoadingNow = 0

class BikeConf

	constructor: ->
		@hamulecBeben = false
		@orginalPartWidth = 1000
		@orginalPartHeight = 655
		@minPartWidth = @currentPartWidth = 500
		@minPartHeight = @currentPartHeight = 328
		@loadData()
		@dataSet
		@defaultBike = {'base': 0, 'wide': 0, 'oslo': 0, 'fblo' :0, 'rblo' :0, 'panc':0, 'ster' :0, 'fszp':0, 'rszp':0, 'ftyr' : 0, 'rtyr' : 0, 'rblo' : 0, 'rblo' : 0, 'chwy' : 0, 'siod': 0, 'nozk': 0, 'robr': 0, 'fobr': 0, 'korb': 0, 'lanc': 0, 'lamp': 1, 'most': 0, 'szty': 1, 'kier': 0, 'hamu': 0, 'bask': 0, 'peda':0 }
		@loaderIcon = $('#conf-loader')
		@configMenu = $('#conf-setup-menu ul')
		@secondaryMenu = $('#conf-setup-secondary-menu ul')
		@elementTypeLabel = $('#conf-element-type-desc .type')
		@colorSelector = $('#conf-element-colors ul')
		@colorBox = $('#conf-element-color-selector')
		@sumPrice = $('#conf-element-pricebox p.price span')
		@images_path = 'images/parts/'
		@loadingNow = 0
		@automatedScale()

	updateHamulec: ->
		if @hamulecBeben
			$('#conf-wide img').attr('src', $('#conf-wide img').attr('src').replace('v','q'))
		else
			$('#conf-wide img').attr('src', $('#conf-wide img').attr('src').replace('q','v'))

	updatePancerze: ->
		if @hamulecBeben
			$('#conf-panc img').attr('src', $('#conf-panc img').attr('src').replace('bialy','czarny'))

	restoreDefault: ->
		@initBike( @dataSet.left_elements )
		@initBike( @dataSet.right_elements )
		@calculatePrice()

	calculatePrice: ->
		sum = 0.0	
		$('.conf-element').each (element) ->
			sum += parseFloat($(this).attr('data-price'))
		@sumPrice.html(sum.toFixed(2).replace('.', ','))


	scaleApp: ->
		currentWidth = parseInt($(window).width())
		if currentWidth > 1010
			newWidth = currentWidth - 174 - 210
			if newWidth > 1000
				$('.conf-element img').css('width', @orginalPartWidth)
				$('.conf-element img').css('height', @orginalPartHeight)
				$('#conf-bike').css('height', @orginalPartHeight)
				@currentPartWidth = @minPartWidth
				@currentPartHeight = @minPartHeight
			else
				$('.conf-element img').css('width', newWidth)
				$('.conf-element img').css('height', @orginalPartHeight * (newWidth / @orginalPartWidth) )
				$('#conf-bike').css('height', @orginalPartHeight * (newWidth / @orginalPartWidth))
				@currentPartWidth = newWidth
				@currentPartHeight = @orginalPartHeight * (newWidth / @orginalPartWidth)
			#@colorBox.css('width', currentWidth-123-23-289-20-53)
		else
			$('.conf-element img').css('width', @minPartWidth)
			$('.conf-element img').css('height', @minPartHeight)
			$('#conf-bike').css('height', @minPartHeight)
			@currentPartWidth = @minPartWidth
			@currentPartHeight = @minPartHeight
			#@colorBox.css('width', 1000-123-23-289-20-53)

	automatedScale: ->
		$(window).resize =>
			@scaleApp()

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
		@scaleApp()
		@calculatePrice()
		$('#conf-submit-bar .clear').click (event) =>
			event.preventDefault()
			@restoreDefault()

	prepareColorSelector: (elementSet, index) ->
		element = elementSet.types[index]
		currentColor = parseInt($('#conf-'+elementSet.sys_name).attr('data-color'))
		@elementTypeLabel.text( element.name )
		@colorSelector.html('')
		i = 0
		if @hamulecBeben and elementSet.sys_name == 'panc'
			for color in element.colors
				if i == 1
					@colorSelector.append @prepareColorButton(elementSet, color, i, 'active')
				i++

		else
			for color in element.colors
				if i == currentColor
					@colorSelector.append @prepareColorButton(elementSet, color, i, 'active')
				else
					@colorSelector.append @prepareColorButton(elementSet, color, i, '')
				i++

	prepareColorButton: (elementSet, color, i, css_class) ->
		selector = $('<li class="'+css_class+'"><a href="#"><img src="images/colors/'+color.name+'.png" /></a></li>')
		selector.click( (event) => 
			event.preventDefault()
			imageSrc = @images_path + color.file
			@changeImage( elementSet.sys_name, imageSrc )
			$('#conf-'+elementSet.sys_name).attr('data-price', color.price)	
			$('#conf-'+elementSet.sys_name).attr('data-color', i)	
			$('#conf-element-color-selector li.active').removeClass('active')
			selector.addClass('active')
		)

	initBike: (elementsMap) ->
		for element in elementsMap
			console.log(element.sys_name)
			color = @defaultBike[element.sys_name]
			imageSrc = @images_path + element.types[0].colors[color].file
			$('#conf-'+element.sys_name).attr('data-price', element.types[0].colors[color].price)
			$('#conf-'+element.sys_name).attr('data-color', color)
			@createImage( element.sys_name, imageSrc )

	createImage: (elementName, imageSrc) ->
		if elementName == 'wide' and !@hamulecBeben
				imageSrc = imageSrc.replace('q', 'v')
		@showLoader()
		image = $('<img src="'+imageSrc+'" style="width: '+@currentPartWidth+'px; height: '+@currentPartHeight+'px" />')
			.load (event) =>
				$(this).unbind(event)
				$('#conf-'+elementName + ' img').attr('src', imageSrc)
				@hideLoader()

	changeImage: (elementName, imageSrc) ->
		if elementName == 'wide' and !@hamulecBeben
				imageSrc = imageSrc.replace('q', 'v')
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
			currentIndex = parseInt(label.attr('data-element'))
			$('.conf-btn.active').removeClass('active')
			label.addClass('active')
			@prepareColorSelector(element, currentIndex)
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

			if element.sys_name == 'hamu' and elementIndex == 1
				@hamulecBeben = true
				@updateHamulec()
				@updatePancerze()
			else if element.sys_name == 'hamu'
				@hamulecBeben = false
				@updateHamulec()
				@updatePancerze()	

			imageSrc = @images_path + element.types[elementIndex].colors[0].file
			$('#conf-'+element.sys_name).attr('data-price', element.types[elementIndex].colors[0].price)
			label.attr('data-element', elementIndex)
			@changeImage( element.sys_name, imageSrc )
			$('.conf-btn.active').removeClass('active')
			label.addClass('active')
			@prepareColorSelector(element, elementIndex)
			@calculatePrice()
			$('#conf-'+element.sys_name).attr('data-color', 0)
			$('#conf-element-color-selector li.active').removeClass('active')
			$('#conf-element-color-selector li:nth-child(1)').addClass('active')
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
			if element.sys_name == 'hamu' and elementIndex == 1
				@hamulecBeben = true
				@updateHamulec()
				@updatePancerze()
			else if element.sys_name == 'hamu' 
				@hamulecBeben = false
				@updateHamulec()
				@updatePancerze()

			imageSrc = @images_path + element.types[elementIndex].colors[0].file
			$('#conf-'+element.sys_name).attr('data-price', element.types[elementIndex].colors[0].price)
			label.attr('data-element', elementIndex)
			@changeImage( element.sys_name, imageSrc )
			$('.conf-btn.active').removeClass('active')
			label.addClass('active')
			@prepareColorSelector(element,elementIndex)
			@calculatePrice()
			$('#conf-'+element.sys_name).attr('data-color', 0)
			$('#conf-element-color-selector li.active').removeClass('active')
			$('#conf-element-color-selector li:nth-child(1)').addClass('active')
		)
		container.append leftarrow
		container.append label
		container.append rightarrow
		return container

	showLoader: ->
		window.ConfLoadingNow += 1
		@loaderIcon.css('visibility', 'visible')

	hideLoader: (loaderConut) ->
		window.ConfLoadingNow -= 1
		if window.ConfLoadingNow == 0
			@loaderIcon.css('visibility', 'hidden')

$ -> new BikeConf