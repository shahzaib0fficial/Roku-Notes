' Channel entry point
sub main()
    ShowChannelRSGScreen()
end sub

sub ShowChannelRSGScreen()
    ' The roSGScreen Object is a scene graph canvas that displays the contents of a Scene node Instance
    screen = CreateObject("roSGScreen")
    
    ' message port is a place where events are send
    m.port = CreateObject("roMessagePort")
    ' sets the message port which will be used for events from the screen
    screen.SetMessagePort(m.port)
    
    ' every screen object must have a Scene node, or a node that drives from the Scene node
    scene = screen.CreateScene("MainScene")
    screen.show() ' Init method in MainScene.brs is invoked

    ' event Loop
    while(true)
        ' waiting for events from screen
        msg = Wait(0, m.port)
        msgType = type(msg)

        if msgType = "roSGScreen"
            if msg.IsScreenClosed then return
        end if
    end while
end sub