' entry point of  MainScene
sub Init()
    ' setColorScheme()
    ' set background color for scene. Applied only if backgroundUri has empty value
    ' m.top.backgroundColor = "0x662D91"
    ' m.top.backgroundUri= "pkg:/images/background.png"
    InitScreenStack()
    ' RunContentTask()
    ShowPlayScreen()
end sub

sub RunContentTask()
    m.contentTask = CreateObject("roSGNode", "MainLoaderTask") ' create task for feed retrieving
    ' observe content so we can know when feed content will be parsed
    m.contentTask.ObserveField("onContentLoaded", "ShowPlayScreen")
    m.contentTask.control = "run" ' GetContent(see MainLoaderTask.brs) method is executed
end sub