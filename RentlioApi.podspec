Pod::Spec.new do |s|
  s.name = "RentlioApi"
  s.version = "0.0.1"
  s.summary = "Swift client for consuming official Rentlio API"
  s.description  = <<-DESC
                   Swift client for consuming official [Rentlio API](https://docs.rentl.io/)
                   
                   Methods:
                   
                   -    getUser
                   -    getProperties
                   -    getUnitTypes
                   -    getUnits
                   -    getUnitReservations
                   -    getReservations
                   -    getServices
                   -    createInvoiceItem
                   -    getServicePaymentTypesEnum
                   -    getReservationStatusesEnum
                   -    getCurrenciesEnum
                   DESC
  s.homepage = "https://github.com/Rentlio/api.lib.swift"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.authors = { "Juraj Hilje" => "juraj.hilje@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "10.0"
  s.source = { :git => "https://github.com/Rentlio/api.lib.swift.git", :tag => s.version }
  s.source_files = "Source/*.swift"
  s.dependency 'Just', '~> 0.6.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
end