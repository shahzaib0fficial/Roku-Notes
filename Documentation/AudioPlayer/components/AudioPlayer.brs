function init()
    m.songImages = ["pkg:/images/songImages/messageTune.jpg", "pkg:/images/songImages/message.jpeg","pkg:/images/songImages/backgroundSong.jpg"]
    m.songImagePoster = m.top.findNode("songImage")

    m.playPause = m.top.findNode("playPause")
    m.playPause.setFocus(true)
    m.playPause.text = "Play"
    m.playPause.observeField("buttonSelected","playPauseSub")
    m.playPause.iconUri = "pkg:/images/icons/play.png"
    m.playPause.focusedIconUri = "pkg:/images/icons/play.png"

    m.next = m.top.findNode("next")
    m.next.text = "Next"
    m.next.observeField("buttonSelected","nextSub")

    m.previous = m.top.findNode("previous")
    m.previous.text = "Previous"
    m.previous.observeField("buttonSelected","previousSub")

    m.songUrls = ["pkg:/source/songs/messageTune.mp3", "pkg:/source/songs/message.mp3","pkg:/source/songs/backgroundSong.mp3"]
    m.currentIndex = 0

    playSongs()
end function

sub playSongs()
    m.songContent = CreateObject("RoSGNode","ContentNode")
    m.audio = CreateObject("roSGNode","Audio")    

        m.songContent.url = m.songUrls[m.currentIndex]
        m.songImagePoster.uri = m.songImages[m.currentIndex]

        m.audio.content = m.songContent
        m.top.appendChild(m.audio)
        m.audio.control = "play"

        m.audio.observeField("state","nextSong")        
end sub

sub nextSong()
    if m.audio.state = "finished"
        if m.currentIndex < m.songUrls.count()
            m.currentIndex++
            playSongs()
        else
            print "here"
            m.currentIndex = 0
            playSongs()
        end if
    else if m.audio.state = "stopped"
        if m.currentIndex < m.songUrls.count()
            m.currentIndex++
            playSongs()
        else
            m.currentIndex = 0
            playSongs()
        end if
    end if
end sub

sub playPauseSub()
    if m.playPause.text = "Play"
        m.playPause.text = "Pause"
        m.audio.control = "pause"
        m.playPause.iconUri = "pkg:/images/icons/pause.png"
        m.playPause.focusedIconUri = "pkg:/images/icons/pause.png"
    else if m.playPause.text = "Pause"
        m.playPause.text = "Play"
        m.audio.control = "resume"
        m.playPause.iconUri = "pkg:/images/icons/play.png"
        m.playPause.focusedIconUri = "pkg:/images/icons/play.png"
    end if
end sub

sub nextSub()
    m.playPause.text = "Play"
    m.playPause.iconUri = "pkg:/images/icons/play.png"
    m.playPause.focusedIconUri = "pkg:/images/icons/play.png"
    m.audio.control = "stop"
end sub

sub previousSub()
    if m.currentIndex = 0
        m.currentIndex = m.songUrls.count() -2
    else
        m.currentIndex = m.currentIndex - 2
    end if
    m.playPause.text = "Play"
    m.playPause.iconUri = "pkg:/images/icons/play.png"
    m.playPause.focusedIconUri = "pkg:/images/icons/play.png"    
    m.audio.control = "stop"
end sub

function onKeyEvent(key as String,press as boolean) as boolean
    result = false

    if press
        if key = "right" and m.playPause.hasFocus()
            m.next.setFocus(true)
            result = true
        else if key = "left" and m.next.hasFocus()
            m.playPause.setFocus(true)
            result = true
        else if key = "left" and m.playPause.hasFocus()
            m.previous.setFocus(true)
            result = true
        else if key = "right" and m.previous.hasFocus()
            m.playPause.setFocus(true)
            result = true
        end if
    end if

    return result
end function