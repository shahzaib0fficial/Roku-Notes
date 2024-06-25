function init()
  m.naturePoster = m.top.FindNode("naturePoster")
  m.naturePoster.uri = "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?cs=srgb&dl=pexels-souvenirpixels-417074.jpg&fm=jpg"
  m.naturePoster.failedBitmapUri = "pkg:/images/nature.bmp"
  m.naturePoster.loadingBitmapUri = "pkg:/images/nature.bmp"
  m.naturePoster.setFocus(true)
end function