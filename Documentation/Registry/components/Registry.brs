function init()
    registry = CreateObject("roRegistry")

    ' For Checking available Space in the registry 
    buffer = 512
    if (registry.GetSpaceAvailable() > buffer)
        print registry.GetSpaceAvailable()
    end if

    ' Setting Value
    SetSingleRegistry("Shahzaib")
    ' Getting and printing value
    print GetSingleRegistry()

    userInfo = {
        name : "Shahzaib",
        password : "12345678"
    }

    SetMultiRegistry(userInfo)
    keysArray = ["name","password"]
    print GetMultiRegistry(keysArray)
end function

function GetSingleRegistry() as dynamic
    registrySection = CreateObject("roRegistrySection","UserInfo")
    if registrySection.Exists("UserName")
        return registrySection.Read("UserName")
    end if
    return invalid
    
    ' Use to get all key values in the foam of list
    ' print registrySection.getKeyList()

end function

function SetSingleRegistry(userName as String) as void
    registrySection = CreateObject("roRegistrySection","UserInfo")
    registrySection.Write("UserName",userName)
    registrySection.Flush()

    ' Delete Key Value Pair From Registry
    ' registrySection.Delete("UserName")
end function

function SetMultiRegistry(userInfo as object) as void
    registrySection = CreateObject("roRegistrySection","Authentication")
    registrySection.WriteMulti(userInfo)
    registrySection.Flush()
end function

function GetMultiRegistry(keysArray as object) as dynamic
    registrySection = CreateObject("roRegistrySection","Authentication")
    
    existKey = true
    for each key in keysArray
        if not registrySection.Exists(key)
            existKey = false
            exit for
        end if
    end for
    
    if existKey
        return registrySection.ReadMulti(keysArray)
    end if
    return invalid
end function