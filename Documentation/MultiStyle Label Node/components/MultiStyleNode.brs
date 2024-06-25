function init()
    m.multiStyleLabel = m.top.findNode("multiStyleLabel")
    m.multiStyleLabel.drawingStyles = {
        "GothamPurpleBold": {
            "fontUri": "pkg:/components/fonts/Gotham-Bold.otf"
            "fontSize":36
            "color": "#662d91"
        }
        "GothamBoldWhite": {
            "fontUri": "pkg:/components/fonts/Gotham-Bold.otf"
            "fontSize":36
            "color": "#FFFAFA"
        }
        "GothamPurple": {
            "fontUri": "pkg:/components/fonts/Gotham-Medium.otf"
            "fontSize":36
            "color": "#662d91"
        }
        	"GothamPurpleLarge": {
            "fontUri": "pkg:/components/fonts/Gotham-Medium.otf"
            "fontSize":54
            "color": "#662d91"
        }
         "GothamWhite": {
            "fontUri": "pkg:/components/fonts/Gotham-Medium.otf"
            "fontSize":36
            "color": "#FFFAFA"
        }
        "HandprintedWhite": {
            "fontUri": "pkg:/components/fonts/vSHandprinted.otf"
            "fontSize":36
            "color": "#FFFAFA"
        }
        "HandprintedGreen": {
            "fontUri": "pkg:/components/fonts/vSHandprinted.otf"
            "fontSize": 36 
            "color": "#00FF00FF"
        }
        "Noto": {
            "fontUri": "pkg:/components/fonts/OpenSansEmoji.ttf"
            "fontSize": 36
            "color": "#662d91FF"
        }
        "default": {
            "fontSize": 12
            "fontUri": "font:LargeSystemFont"
            "color": "#DDDDDDFF"
        }              
    }

    m.multiStyleLabel.text = "<GothamWhite>Developers can use the new </GothamWhite><GothamBoldWhite>MultiStyleLabel </GothamBoldWhite><GothamWhite>node class to create labels with multiple </GothamWhite><HandprintedWhite>fonts,</HandprintedWhite><GothamPurple>colors, and </GothamPurple><GothamPurpleLarge>sizes.</GothamPurpleLarge>" 
  
end function