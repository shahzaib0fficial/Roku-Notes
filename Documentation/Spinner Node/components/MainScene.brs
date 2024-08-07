' entry point of  MainScene
sub Init()
    ' creating global variable for channel store
    m.global.AddField("channelStore", "node", false)
    m.global.channelStore = CreateObject("roSGNode", "ChannelStore")
    ' CheckSubscriptionFlow()

    setColorScheme()
    ' set background color for scene. Applied only if backgroundUri has empty value
    ' m.top.backgroundColor = "0x662D91"
    m.top.backgroundUri= "pkg:/images/background.png"
    InitScreenStack()
    ' RunContentTask()
    ShowPlayScreen()
end sub

' sub RunContentTask()
'     m.contentTask = CreateObject("roSGNode", "MainLoaderTask") ' create task for feed retrieving
'     ' observe content so we can know when feed content will be parsed
'     ' m.contentTask.ObserveField("onContentLoaded", "ShowPlayScreen")
'     m.contentTask.control = "run" ' GetContent(see MainLoaderTask.brs) method is executed
' end sub

sub showExitDialog()
    m.dialog = CreateObject("roSGNode", "StandardMessageDialog")
    m.dialog.title = "Exit App"
    ' dialog.backgroundUri = "pkg:/images/dialogBg.png"
    m.dialog.buttons = ["Yes", "No"]
    m.dialog.ObserveField("buttonSelected", "exitDialogBox")
    m.top.dialog = m.dialog
end sub

sub exitDialogBox(event as object)
    m.dialogChoice =  event.getData()
    if m.dialogChoice = 0
        m.dialog.close = true
        m.top.exitApp = true
    else
        m.dialog.close = true
    end if
end sub

sub setColorScheme()
    colorPalette = createObject("roSGNode", "RSGPalette")
    colorPalette.colors = {
        DialogBackgroundColor: "#76350B",
        DialogItemColor: "#FFA31A",
        DialogTextColor: "#FFA31A",
        DialogFocusColor: "#FFA31A",
        DialogFocusItemColor: "0xFFFFFFFF",
        DialogSecondaryTextColor: "#8D8DFF",
        DialogSecondaryItemColor: "0xFFFFFFFF",
        DialogInputFieldColor: "0xFFFFFFFF",
        DialogKeyboardColor: "0xFFFFFFFF",
        DialogFootprintColor: "0xFFFFFFFF"
    }

    m.top.palette = colorPalette
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    result = false
    if press
    if key = "back"
            numberOfScreens = m.screenStack.Count()
            ' close top screen if there are two or more screens in the screen stack
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            else
                ' m.top.exitApp = true
                ' result = true
                showExitDialog()
                result = true
            end if
        end if
        return result
    end if
end function