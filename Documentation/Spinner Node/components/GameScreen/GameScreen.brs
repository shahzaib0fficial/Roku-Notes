sub Init()
    question = m.top.findNode("question")
    

    m.optionsRowList = m.top.findNode("optionsRowList")
    m.optionsRowList.content = CreateObject("roSGNode", "Content")
    m.optionsRowList.observeField("itemSelected", "Selected")
end sub

sub Selected()
    print "Hello World"
end sub