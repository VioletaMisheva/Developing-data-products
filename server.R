library(shiny)
library(ggplot2)
shinyServer(
    
    function(input, output){
       
        output$myplot<-renderPlot({
         colm<-as.numeric(input$var)
        
        if (input$type=="dot") {
            qplot(longley$Year, longley[,colm], stat="identity", 
                  , xlab="Year", ylab=names(longley[colm]), 
                  main="Change of selected variable across time") 
        } else if (input$type=="line"){
            qplot(longley$Year, longley[,colm], geom="line", stat="identity", 
                  , xlab="Year", ylab=names(longley[colm]),
                  main="Change of selected variable across time")
        }
        else  
        qplot(longley$Year, longley[,colm], geom="bar", stat="identity", 
             , xlab="Year", ylab=names(longley[colm]),
             main="Change of selected variable across time")
        
        })
       output$Summary=renderPrint({
           if (input$Variable=="GNP.deflator"){
               summary(longley$GNP.deflator)
           } else if(input$Variable=="Unemployed"){
               summary(longley$Unemployed)
           } else if (input$Variable=="Population"){
               summary(longley$Population)
           }  else if (input$Variable=="Employed"){
               summary(longley$Employed)
           }  else if (input$Variable=="Armed.Forces"){
               summary(longley$Armed.Forces)
           } else
               summary(longley$GNP) 
       })
        
        
    }
    
    )