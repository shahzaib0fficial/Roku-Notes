sub Init()
    rowList = m.top.findNode("rowList")
    rowList.content = CreateObject("roSGNode","ListContent")

    m.top.setFocus(true)

end sub