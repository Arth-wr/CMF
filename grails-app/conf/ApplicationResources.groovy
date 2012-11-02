modules = {
    application {
        resource url:'js/application.js'
    }
	
	autocomplete {
		dependsOn 'jquery-ui'
		resource url:'js/autocomplete.js', disposition: 'head'
	}
        
        jquerymouseover {
           dependsOn 'jquery-ui'
           resource url:'js/jquerymouseover.js', disposition: 'head'
        }
        
        fancybox{
            dependsOn 'jquery-ui'
            resource url: 'js/jquery.fancybox.js', disposition: 'head'
            resource '/css/jquery.fancybox.css'
       //     resource '/images/'
        }
}