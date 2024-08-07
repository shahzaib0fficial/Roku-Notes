sub Init()
    ' set the name of the function in the Task node component to be executed when the state field changes to RUN
    ' in our case this method executed after the following cmd: m.contentTask.control = "run"(see Init method in MainScene)
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://emojipuzzledata.netlify.app/data.json")
    rsp = xfer.GetToString()
    ' print rsp
    WriteAsciiFile("tmp:/data.txt", rsp)
    
    if rsp <> invalid and rsp <> ""
        m.top.onContentLoaded = true
    else
        m.top.onErrorOccurs = true
    end if
end sub