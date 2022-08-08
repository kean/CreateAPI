import protocol ArgumentParser.ExpressibleByArgument
import struct ConfigurationParser.OptionOverride

extension OptionOverride: ExpressibleByArgument {
    public init?(argument: String) {
        self.init(rawValue: argument)
    }
}
