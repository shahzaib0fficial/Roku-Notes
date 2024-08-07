' Check that user have subscription or not
sub CheckSubscriptionFlow()
    print "Checking Subscriptions"
    ' Check subscription plans
    ' createLoaderDialog()
    m.global.channelStore.command = "getPurchases"
    m.global.channelStore.ObserveField("purchases", "onGetPurchases")

    ' m.global.channelStore.requesteduserdata = "email, first name, lastname, phone"

    ' m.global.channelStore.command = "getUserData"
end sub

sub OnGetPurchases(event as object) as boolean
    print "In OnGetPurchases"
    m.global.UnobserveField("purchases")
    purchases = event.getData()
    ' Check there exists
    ' retrieve current time in seconds
    datetime = CreateObject("roDateTime")
    timestamp = CreateObject("roDateTime")
    utimeNow = timestamp.AsSeconds()
    subscriptionDetails = {
        haveSubscription: false,
        productName: "Free Plan"
    }
    m.haveSubscription = false

    ' purchases are appended as children, so we need to check if there are some
    if purchases.GetChildCount() > 0
        ' there are some subscriptions
        print "There are some subscriptions"

        ' check if there are some active subscriptions among the purchases
        allPurchases = purchases.GetChildren(-1, 0)

        ' retrieve current time in seconds
        datetime = CreateObject("roDateTime")
        utimeNow = datetime.AsSeconds()

        ' check expiration date of each purchased subscription
        for each purchase in allPurchases
            print "Purchase: " purchase
                if purchase.code = "word-search-premium"
                ' retrieve expiration time in seconds from the string
                datetime.FromISO8601String(purchase.expirationDate)
                utimeExpire = datetime.AsSeconds()

                ' if user has active subscription then show content
                ' otherwise navigate to purchase option
                if utimeExpire > utimeNow
                    print "User has active subscription"
                    subscriptionDetails.haveSubscription = true
                    subscriptionDetails.productName = purchase.productName
                    m.haveSubscription = true
                end if
            end if
        end for
    end if
    WriteAsciiFile("tmp:/subscriptionDetails.txt", FormatJson(subscriptionDetails))
    ShowPlayScreen()
    m.loadingDialog.close = true
end sub