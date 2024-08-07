sub RunContentTask()
    m.ContentTask = CreateObject("roSGNode","MinLoaderTask") ' create task for feed retrieving
    ' observe content task so we can know feed content will be parsed
    m.ContentTask.observeField("content","onMainContentLoaded")
    m.ContentTask.control = "run" ' show Loading Indicator while

end sub
