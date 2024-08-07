sub Init()
    m.classicBtn = m.top.findNode("classicBtn")
    m.classicBtn.observeField("buttonSelected","classicClick")

    m.top.observeField("visible","setFocusToClassic")
end sub

sub classicClick()
    m.top.ClassicClicked = true
end sub

sub setFocusToClassic()
    m.classicBtn.setFocus(true)
end sub