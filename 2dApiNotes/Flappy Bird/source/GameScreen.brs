sub Game(screen, port)
    ' Global variables
    m.this = {
        screen: screen,
        port: port,

        compositor: CreateObject("roCompositor"),
        background: CreateObject("roBitmap", "pkg:/images/gameBg.png"),
        character: CreateObject("roBitmap", "pkg:/images/character.png"),
        upperPipe: CreateObject("roBitmap", "pkg:/images/upperPipe.png"),
        lowerPipe: CreateObject("roBitmap", "pkg:/images/lowerPipe.png"),

        rg_background: "",
        rg_character: "",

        spr_background: "",
        spr_character: ""

        spr_upperPipe: []
        spr_lowerPipe: []

        characterX: 150,
        characterY: 250
        characterWidth: 111,
        characterHeight: 82

        upperPipeX: []
        upperPipeY: []
        lowerPipeX: []
        lowerPipeY: []
    }

    ' setting port to screen
    m.this.screen.setMessagePort(m.this.port)
    ' compositor setup
    m.this.compositor.setDrawTo(m.this.screen, 0)

    ' creating region of background and character
    m.this.rg_background = CreateObject("roRegion", m.this.background, 0, 0, 1280, 720)
    m.this.rg_character = CreateObject("roRegion", m.this.character, 0, 0, m.this.characterWidth, m.this.characterHeight)

    ' creating sprite of background and character
    m.this.spr_background = m.this.compositor.NewSprite(0, 0, m.this.rg_background)
    m.this.spr_character = m.this.compositor.NewSprite(m.this.characterX, m.this.characterY, m.this.rg_character)

    ' creating upperpipe
    m.this.upperPipeX[0] = 1280
    m.this.upperPipeY[0] = 40
    m.this.spr_upperPipe[0] = m.this.compositor.NewSprite(m.this.upperPipeX[0], m.this.upperPipeY[0], CreateObject("roRegion", m.this.upperPipe, 0, 0, 60, 182))

    ' creating Lower Pipe
    m.this.lowerPipeX[0] = 1280
    m.this.lowerPipeY[0] = 513
    m.this.spr_lowerPipe[0] = m.this.compositor.NewSprite(m.this.lowerPipeX[0], m.this.lowerPipeY[0], CreateObject("roRegion", m.this.lowerPipe, 0, 0, 56, 176))

    ' displaying all sprites
    m.this.compositor.drawAll()
    m.this.screen.swapbuffers()

    moveUpCharacter = false
    m.GameOver = false
    while(not m.GameOver)
        ' if m.GameOver
        '     return m.GameOver
        ' end if
        ' handling key events
        msg = wait(1, port)
        if Type(msg) = "roUniversalControlEvent"
            keyCode = msg.getInt()
            if keyCode = m.keyValues.ok
                moveUpCharacter = true
            else if keyCode = m.keyValues.okKeyReleased
                moveUpCharacter = false
            end if
        end if

        ' on ok key press or released changing charcters position
        if moveUpCharacter
            m.this.characterY = m.this.characterY - 4
        else
            m.this.characterY = m.this.characterY + 4
        end if

        checkCollision()

        ' removing previous sprite and generating new one
        if m.this.spr_character <> invalid
            m.this.spr_character.Remove()
            m.this.spr_character = m.this.compositor.NewSprite(m.this.characterX, m.this.characterY, m.this.rg_character)
        end if

        drawUpperPipe()
        drawLowerPipe()

        ' draw all the sprites
        m.this.compositor.drawAll()
        m.this.screen.swapbuffers()
    end while

    m.temp = 0
end sub

sub drawUpperPipe()

    for i = 0 to m.this.spr_upperPipe.count() - 1
        if m.this.spr_upperPipe[i] <> invalid
            m.this.upperPipeX[i] = m.this.upperPipeX[i] - 5
            if m.this.upperPipeX[i] = -400
                m.this.spr_upperPipe[i].Remove()
                m.this.spr_upperPipe.Delete(i)
                m.this.upperPipeX.Delete(i)
                m.this.upperPipeY.Delete(i)
            else if m.this.upperPipeX[i] = 1100
                randomValue = 1280 + Rnd(40) * 5
                m.this.upperPipeX[i + 1] = randomValue
                m.this.upperPipeY[i + 1] = 40
                m.this.spr_upperPipe[i + 1] = m.this.compositor.NewSprite(m.this.upperPipeX[i + 1], m.this.upperPipeY[i + 1], CreateObject("roRegion", m.this.upperPipe, 0, 0, 60, 182))
            end if
        end if
    end for

    for i = 0 to m.this.spr_upperPipe.count() - 1
        if m.this.spr_upperPipe[i] <> invalid
            ' print m.this.spr_upperPipe.count()
            m.this.spr_upperPipe[i].Remove()
            m.this.spr_upperPipe[i] = m.this.compositor.NewSprite(m.this.upperPipeX[i], m.this.upperPipeY[i], CreateObject("roRegion", m.this.upperPipe, 0, 0, 60, 182))
        end if
    end for
end sub

sub drawLowerPipe()
    for i = 0 to m.this.spr_lowerPipe.count() - 1
        if m.this.spr_lowerPipe[i] <> invalid
            m.this.lowerPipeX[i] = m.this.lowerPipeX[i] - 5
            if m.this.lowerPipeX[i] = -400
                m.this.spr_lowerPipe[i].Remove()
                m.this.spr_lowerPipe.Delete(i)
                m.this.lowerPipeX.Delete(i)
                m.this.lowerPipeY.Delete(i)
            else if m.this.lowerPipeX[i] = 1100
                randomValue = 1280 + Rnd(40) * 5
                m.this.lowerPipeX[i + 1] = randomValue
                m.this.lowerPipeY[i + 1] = 513
                m.this.spr_lowerPipe[i + 1] = m.this.compositor.NewSprite(m.this.lowerPipeX[i + 1], m.this.lowerPipeY[i + 1], CreateObject("roRegion", m.this.lowerPipe, 0, 0, 56, 176))
            end if
        end if
    end for

    for i = 0 to m.this.spr_lowerPipe.count() - 1
        if m.this.spr_lowerPipe[i] <> invalid
            m.this.spr_lowerPipe[i].Remove()
            m.this.spr_lowerPipe[i] = m.this.compositor.NewSprite(m.this.lowerPipeX[i], m.this.lowerPipeY[i], CreateObject("roRegion", m.this.lowerPipe, 0, 0, 56, 176))
        end if
    end for
end sub

sub checkCollision()
    ' print "Charcter Y: " m.this.characterY
    if m.this.characterY < 220
        for i = 0 to m.this.spr_upperPipe.count() - 1
            if m.this.upperPipeX[i] >= m.this.characterX and m.this.upperPipeX[i] <= m.this.characterX + m.this.characterWidth
                print "Collided Upper"
                m.GameOver = true
            end if
        end for
    else if m.this.characterY > 433
        for i = 0 to m.this.spr_lowerPipe.count() - 1
            if m.this.lowerPipeX[i] >= m.this.characterX and m.this.lowerPipeX[i] <= m.this.characterX + m.this.characterWidth
                print "Collided Lower"
                m.GameOver = true
            end if
        end for
    end if
    ' print "Charcter Y: "m.this.characterY
end sub