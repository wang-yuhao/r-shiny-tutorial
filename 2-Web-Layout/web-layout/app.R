library(shiny)

# Define the interactive interface of the histogram
ui = fluidPage(

	# Title
	titlePanel("My Shiny App"),
	# Sidebar, including the defination of the input and output
	sidebarLayout(
	
		# Sidebar of the input
		sidebarPanel(
			h1("Installation"),
			p("shiny is avaliable on CRAN, so you can install in the usual way from your R console:"),
			p("install.packages('shiny')", style="color: red"),
			div(),
			img(src = "https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/www/rstudio.png", width=100),
			p("Shiny is a product of RStudio")
		),
		mainPanel(
			h1("Introducing Shiny", align="left",
				style="font-family:'times'; font-size:32pt "
			),
			p("Shiny is a new package from RStudio that makes it increadibly easy to build interactive web applications with R."),

			div(),
			p("This images was download from", a(href="https://www.jianshu.com/p/e2495bbc7bd1", "here" )),
			h1("Features"),
			p("-Build useful web applications with only a few lines of code-no Javascript required."),
			p("-Shiny application are automatically 'live' in the same way that spreadsheets are live. Outputs change instantly as users modify input, without requiring a reload of the browser.")
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

