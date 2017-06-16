import Just

open class RentlioApi {
    
    var apikey: String
    let baseUrl = "https://api.rentl.io/v1/"
    
    public init(apikey: String = "") {
        self.apikey = apikey
    }
    
    // MARK: API Methods
    
    open func getUser(done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "users/me")) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getProperties(data: Dictionary<String, String> = [:], done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "properties", data: data)) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getUnitTypes(propertiesId: String, data: Dictionary<String, String> = [:], done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "properties/\(propertiesId)/unit-types", data: data)) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getUnits(propertiesId: String, data: Dictionary<String, String> = [:], done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "properties/\(propertiesId)/units", data: data)) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getUnitReservations(unitsId: String, data: Dictionary<String, String> = [:], done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "units/\(unitsId)/reservations/today", data: data)) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getReservations(data: Dictionary<String, String> = [:], done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "reservations", data: data)) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getServices(propertiesId: String, data: Dictionary<String, String> = [:], done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "properties/\(propertiesId)/services", data: data)) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func createInvoiceItem(reservationsId: String, data: Dictionary<String, Any> = [:], done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.post(endpoint(url: "reservations/\(reservationsId)/invoices/items"), data: data) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getServicePaymentTypesEnum(done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "enums/services/payment-types")) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getReservationStatusesEnum(done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "enums/reservations/statuses")) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    open func getCurrenciesEnum(done: ((_ res: HTTPResult) -> ())? = nil) {
        Just.get(endpoint(url: "enums/currencies")) {
            res in
            if let done = done {
                done(res)
            }
        }
    }
    
    // MARK: Helper Methods
    
    internal func endpoint(url: String = "", data: Dictionary<String, String> = [:]) -> String {
        return baseUrl + url + "?apikey=" + apikey + params(data: data)
    }
    
    internal func params(data: Dictionary<String, String> = [:]) -> String {
        var urlParams = ""
        
        for (_, object) in data.enumerated() {
            urlParams += "&\(object.key)=\(sanitizeParam(value: object.value))"
        }
        
        return urlParams
    }
    
    internal func sanitizeParam(value: String = "") -> String {
        var result = value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        result = result.replacingOccurrences(of: " ", with: "%20")
        
        return result
    }
    
}
