function init()
    m.fullKeyboard = m.top.findNode("fullKeyboard")
    m.fullKeyboard.setFocus(true)

    m.submitButton = m.top.findNode("submit")
    m.submitButton.observeField("buttonSelected","callMe")

    m.displayLabel = m.top.findNode("displayLabel")

  end function

  sub callMe()
    userInput = m.fullKeyboard.text
    m.displayLabel.text = userInput
  end sub

  function OnkeyEvent(key as string, press as boolean) as boolean
    result = false
    if press
        if key = "down"
            m.submitButton.setFocus(true)
            result = true
        else if key = "up"
            m.fullKeyboard.setFocus(true)
            result = true
        end if
    end if
    return result
end function