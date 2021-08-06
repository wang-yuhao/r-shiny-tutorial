library(shiny)

# Define the interactive interface of the histogram
ui = fluidPage(

	# Title
	titlePanel("Hello Shiny"),
	# Sidebar, including the defination of the input and output
	sidebarLayout(
	
		# Sidebar of the input
		sidebarPanel(
			
			# input: the ymount of the bin
			sliderInput(inputId = "bins",
				label = "Number of bins:",
				min = 1,
				max = 50,
				value = 30
			)
		),
	# display the output interface
	mainPanel(
		# output: histogram
		plotOutput(outputId = "distPlot")
	)
	)


)


# Define the code logical of the histogram

server = function(input, output){
	# Code structure
	# User select the different bin, yield different histogram
	output$distPlot = renderPlot({
	
	x = faithful$waiting
	bins = seq(min(x), max(x), length.out = input$bins + 1)

	hist(x, breaks = bins, cols = "#75AADB", border = "white",
		xlab = "Waiting time to next eruption (in mins)",
		main = "Histogram of waiting times"
	)
	})
}


# Return a Shiny app object
shinyApp(ui = ui, server = server)
