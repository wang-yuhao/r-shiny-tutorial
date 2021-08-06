library(shiny)

ui = fluidPage(
	titlePanel("censusVis"),
	sidebarLayout(
		sidebarPanel(
			helpText("Create demographic maps with information from the 2010 us Census."),
			selectInput("var",
				label = "Choose a variable to display",
				choices = c("Percent White", 
					"Percent Black",
					"Percent Hispanic",
					"Percent Asian"),
				selected = "Percent White"),

			sliderInput("range", 
				label = "Range of interest:",
				min = 0, 
				max = 100, value = c(0, 100))
		),

	mainPanel(
		textOutput(outputId = "selectVar1"),

		textOutput(outputId = "selectVar2")
		)
	)
)

# Define server logic required to draw a histogram

server = function(input, output){
	output$selectVar1 = renderText({
		sprintf("Your selection is %s\n", input$var)
	})

	output$selectVar2 = renderText({
		sprintf("Your selection is %s\n", input$range)
	})
}

shinyApp(ui = ui, server = server)
