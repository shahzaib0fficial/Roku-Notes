sub main()
    ' setting global key values
    m.keyValues = {
        "ok": 6,
        "up": 2,
        "down": 3,
        "left": 4,
        "right": 5,
        "back": 0,
        "okKeyReleased": 106
    }

    ' creating objects
    backgroundImage = CreateObject("roBitmap", "pkg:/images/bg.png")
    ' characterImage = CreateObject("roBitmap", "pkg:/images/character.png")

    ' Creating message ports
    port = CreateObject("roMessagePort")

    ' Creating Screen
    screen = CreateObject("roScreen", true, 1280, 720)
    ' removing background of png
    screen.SetAlphaEnable(true)
    ' setting black color to the background
    black = &hFF000000
    screen.Clear(black)
    ' attaching message port with screen
    screen.setPort(port)


    ' Displaying background image
    screen.DrawObject(0, 0, backgroundImage)
    ' screen.DrawObject(150,150,characterImage)

    ' perform operations like drawing,graphics etc
    screen.swapbuffers()


    ' Checking if any event triggers
    while(true)
        msg = wait(1, port)

        if type(msg) = "roUniversalControlEvent"
            keyCode = msg.getInt()
            if keyCode = m.keyValues.ok
                print "OK Pressed"
                Game(screen, port)
            else if keyCode = m.keyValues.back
                print "Back pressed"
            else if keyCode = m.keyValues.up
                print "UP pressed"
            else if keyCode = m.keyValues.down
                print "Down pressed"
            else if keyCode = m.keyValues.left
                print "Left pressed"
            else if keyCode = m.keyValues.right
                print "Right pressed"
            end if
        end if
    end while
end sub