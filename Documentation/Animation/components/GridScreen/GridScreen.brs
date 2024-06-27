sub init()
    ' m.fireButton = m.top.findNode("firebutton")
    ' m.fireButton.observeField("buttonSelected","fireNow")
    ' print m.fireButton
    
    m.fireButton = m.top.findNode("fireButton")
    m.fireButton.ObserveField("buttonSelected", "fireNow")
    ' m.fireButton.setFocus(true)

    m.arrowAnimation = m.top.findNode("arrowAnimation")
end sub

sub fireNow()
    if m.arrowAnimation.state = "stopped"
        m.arrowAnimation.control = "start"
    end if
end sub