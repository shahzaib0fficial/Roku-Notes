sub Init()
    ' set the name of the function in the Task node component to be executed when the state field changes to RUN
    ' in our case this method executed after the following cmd: m.contentTask.control = "run"(see Init method in MainScene)
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://rokutiktok-up-railway.up.railway.app/api/searchWord")

    gridLength = "8"
    difficulty = ReadAsciiFile("tmp:/difficulty.txt")
    ' print "Level number: " ReadAsciiFile("tmp:/Level.txt")
    level = ReadAsciiFile("tmp:/Level.txt")

    if difficulty = "easy"
        gridLength = "8"
        WriteAsciiFile("tmp:/lastDifficulty.txt", "easy")
    else if difficulty = "medium"
        gridLength = "10"
        WriteAsciiFile("tmp:/lastDifficulty.txt", "medium")
    else if difficulty = "hard"
        gridLength = "12"
        WriteAsciiFile("tmp:/lastDifficulty.txt", "hard")
    else if difficulty = "expert"
        gridLength = "16"
        WriteAsciiFile("tmp:/lastDifficulty.txt", "expert")
    end if

    xfer.AddHeader("gridlength",gridLength)
    xfer.AddHeader("levelnumber",level)
    rsp = xfer.GetToString()
    ' print rsp
    WriteAsciiFile("tmp:/data.txt", rsp)
    
    if rsp <> invalid and rsp <> ""
        m.top.onContentLoaded = true
    else
        m.top.onErrorOccurs = true
    end if
end sub