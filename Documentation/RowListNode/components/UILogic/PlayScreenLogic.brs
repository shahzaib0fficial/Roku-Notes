' Note that we need to import this file in MainScene.xml using relative path.

sub ShowPlayScreen()
    m.PlayScreen = CreateObject("roSGNode", "PlayScreen")
    ShowScreen(m.PlayScreen) ' show PlayScreen
end sub