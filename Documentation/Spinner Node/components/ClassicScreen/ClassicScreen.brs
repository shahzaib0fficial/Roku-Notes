sub Init()
    m.optionSpinner = m.top.findNode("optionSpinner")
    m.optionSpinner.control = "stop"
    m.optionSpinner.poster.observeField("loadStatus", "optionsAnimation")
    m.optionSpinner.poster.uri = "pkg:/images/classicImages/options.png"
    m.optionSpinner.translation = [100, 100]
    m.optionSpinner.poster.width = "360"
    m.optionSpinner.poster.height = "360"

    m.rotationControlTimer = m.top.findNode("rotationControlTimer")
    m.rotationControlTimer.observeField("fire", "rotationControl")

    m.optionSelectorSpinner = m.top.findNode("optionSelectorSpinner")
    m.optionSelectorSpinner.control = "stop"
    m.optionSelectorSpinner.poster.observeField("loadStatus", "optionSelectorAnimation")
    m.optionSelectorSpinner.poster.uri = "pkg:/images/classicImages/arrow.png"
    m.optionSelectorSpinner.translation = [230, 230]
    m.optionSelectorSpinner.poster.width = "100"
    m.optionSelectorSpinner.poster.height = "100"

    m.stopRotationTimer = m.top.findNode("stopRotationTimer")
    m.stopRotationTimer.observeField("fire", "stopRotation")

    m.optionsRotatorBtn = m.top.findNode("optionsRotatorBtn")
    m.optionsRotatorBtn.ObserveField("buttonSelected", "startRotation")

end sub

sub optionsAnimation()
    if(m.optionSpinner.poster.loadStatus = "ready")
        m.optionSpinner.visible = true
    end if
end sub

sub optionSelectorAnimation()
    if(m.optionSelectorSpinner.poster.loadStatus = "ready")
        m.optionSelectorSpinner.visible = true
    end if
end sub

sub rotationControl()
    if m.optionSelectorSpinner.control = "start"
        m.optionSelectorSpinner.control = "stop"
        m.optionSelectorSpinner.control = "start"
    end if
end sub

sub startRotation()
    if m.optionSpinner.control = "stop" and m.optionSelectorSpinner.control = "stop"
        randomInterval = Rnd(0)+1
        ' print randomInterval.toStr()
        randomInterval = randomInterval.toStr().left(3)
        print randomInterval
        
        ' randomInterval = "1.1"

        if randomInterval = "1.1" or randomInterval = "1.4"
            print "World"
        else if randomInterval = "1.2"
            randomInterval = "1.55"
            print "Armor"
        else if randomInterval = "1.3" or randomInterval = "1.8"
            print "Pop Corns"
        else if randomInterval = "1.5"
            print "Test Tube"
        else if randomInterval = "1.6"
            print "Volly Ball"
        else if randomInterval = "1.7" or randomInterval = "1.0"
            print "Brush"
        else if randomInterval = "1.9"
            print "Crown"
        end if

        m.optionSpinner.spinInterval = randomInterval

        m.optionSpinner.control = "start"
        m.optionSelectorSpinner.control = "start"

        m.rotationControlTimer.control = "start"
        m.stopRotationTimer.control = "start"
    end if
end sub

sub stopRotation()
    m.optionSpinner.control = "stop"
    m.optionSelectorSpinner.control = "stop"

    m.stopRotationTimer.control = "stop"
    m.rotationControlTimer.control = "stop"

    m.top.goGameScreen = true
end sub