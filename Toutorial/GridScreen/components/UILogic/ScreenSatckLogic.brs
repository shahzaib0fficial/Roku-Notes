sub InitScreenStack()
    m.screenStack = []
end sub

sub ShowScreen(node as Object)
    prev = m.screenStack.peek() ' take screen from screenStack but don't delete it
    if prev <> invalid
        prev.visible = fasle ' hide current screen if exist
    end if
    ' show new Screen
    m.top.AppendChild(node)
    node.visible = true
    node.setFocus(true)
    m.screenStack.push(node) ' add new screen to the screen stack
end sub

sub CloseScreen(node as Object)
    if node = invalid OR (m.screenStack.Peek() <> invalid and m.screenStack.Peek().IsSameNode(node))
        last = m.screenStack.Pop() ' remove screen from screenStack
        last.visible = false ' hide screen
        m.top.RemoveChild(node) ' remove screen from scene

        ' take previous screen and make it visible 
        prev = m.screenStack.Pop() ' remove screen from screen stack
        last.visible = false ' hide screen
        m.top.RemoveChild(node) ' remove screen from scene

        ' take previous screen and make it visible
        prev = m.screenStack.Peek()
        if prev <> invalid
            prev.visible = true
            prev.setFocus(true)
        end if
    end if
end sub