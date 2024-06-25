' Entry point of the MainScene
sub Init()
    ' set background color to the scene Applied only of backGroundUri has empty value
    m.top.backgroundColor = "0x6f1bb1"
    m.top.backGroundUri = ""
    m.loadingIndicator = m.top.FindNode("loadingIndicator") ' store loadingIndicator node to m
    InitScreenStack()
    ShowGridScreen()
    RunContentTask() ' retriving content
end sub