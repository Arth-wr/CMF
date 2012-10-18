modules = {
    application {
        resource url:'js/application.js'
    }
	
	autocomplete {
		dependsOn 'jquery-ui'
		resource url:'js/autocomplete.js', disposition: 'head'
	}
}