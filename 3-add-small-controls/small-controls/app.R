library(shiny)

ui = fluidPage(
	titlePanel("censusVis"),

	sidebarLayout(
		sidebarPanel(
			helpText("Create demographic maps with information from the 2010 US census"),
			selectInput("checkBox1",
				label = "choose a variable to display",
				choices = list("A" = 1, "B" =2)
			),
			sliderInput("sliderInput", 
				label = "Range of interest",
				min = 0, max = 100, value = c(0, 100), step=10)
		),
		mainPanel()
	)
)


server = function(input,output){
}

shinyApp(ui = ui, server = server)
