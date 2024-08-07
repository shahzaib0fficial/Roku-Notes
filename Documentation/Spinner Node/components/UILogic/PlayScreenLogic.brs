' Note that we need to import this file in MainScene.xml using relative path.

sub ShowPlayScreen()
    m.PlayScreen = CreateObject("roSGNode", "PlayScreen")
    m.PlayScreen.ObserveField("ClassicClicked","ShowClassicScreen")
    ShowScreen(m.PlayScreen) ' show PlayScreen
end sub

sub ShowClassicScreen()
    m.ClassicScreen = CreateObject("roSGNode","ClassicScreen")
    m.ClassicScreen.ObserveField("goGameScreen","ShowGameScreen")
    ShowScreen(m.ClassicScreen)
end sub

sub ShowGameScreen()
    m.GameScreen = CreateObject("roSGNode","GameScreen")
    ShowScreen(m.GameScreen)
end sub