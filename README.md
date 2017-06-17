Swift client for Rentlio API
==============

Swift wrapper for official [Rentlio API](https://docs.rentl.io). This lib is heavily inspired by official documentation, and follows REST methods listed there.

The Rentlio API is organized around REST. It has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. 

JSON is returned by all API responses, including errors. Also JSON is used in request body instead of form data. We don’t use sandbox version where you can test your integrations. Instead, you can use a **DEMO property** and its reservations to be sure no harm is done on real data. 

Please **read official docs** before consuming this lib [https://docs.rentl.io](https://docs.rentl.io)

## Dependencies

- [Just](https://github.com/JustHTTP/Just)

## Integration

You can use [CocoaPods](http://cocoapods.org) to install `RentlioApi` by adding it to your `Podfile`:
```ruby
platform :ios, '10.0'
use_frameworks!

target 'MyApp' do
    pod 'RentlioApi'
end
```

## Example Project

Grab the source code
```bash
$ git clone https://github.com/Rentlio/api.lib.swift.git api.lib.swift && cd $_
$ open api.lib.swift.xcworkspace
```

## Basic Usage

#### Making a Request
```swift
let rentlio = RentlioApi(apikey: "your_apikey")
rentlio.getUser()

// GET /users/me
```

#### Completion block
```swift
rentlio.getUser(
    done: {
        res in
        if let json = res.json {
            print(json)
        }
    }
)
```

## Methods
- getUser()
- getProperties()
- getUnitTypes()
- getUnits()
- getUnitReservations()
- getReservations()
- getServices()
- createInvoiceItem()
- getServicePaymentTypesEnum()
- getReservationStatusesEnum()
- getCurrenciesEnum()

## Branches

- master - The production branch. Clone or fork this repository for the latest copy.
- develop - The active development branch. Pull requests should be directed to this branch.

## Contribution

Ready to submit a fix or a feature? Submit a pull request! And _please_:

- If code changes, run the tests and make sure everything still works.
- Write new tests for new functionality.
- Update documentation comments where applicable.
- Maintain the existing style.

## Contact

- [Juraj Hilje](https://github.com/jurajhilje), [@juraj_hilje](https://twitter.com/juraj_hilje)

## License
See [LICENSE](https://github.com/Rentlio/api.lib.swift/blob/master/LICENSE).