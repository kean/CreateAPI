// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct WorkflowRunUsage: Codable {
    public var billable: Billable
    public var runDurationMs: Int?

    public struct Billable: Codable {
        public var ubuntu: Ubuntu?
        public var macos: Macos?
        public var windows: Windows?

        public struct Ubuntu: Codable {
            public var totalMs: Int
            public var jobs: Int
            public var jobRuns: [JobRun]?

            public struct JobRun: Codable {
                public var jobID: Int
                public var durationMs: Int

                public init(jobID: Int, durationMs: Int) {
                    self.jobID = jobID
                    self.durationMs = durationMs
                }

                private enum CodingKeys: String, CodingKey {
                    case jobID = "job_id"
                    case durationMs = "duration_ms"
                }
            }

            public init(totalMs: Int, jobs: Int, jobRuns: [JobRun]? = nil) {
                self.totalMs = totalMs
                self.jobs = jobs
                self.jobRuns = jobRuns
            }

            private enum CodingKeys: String, CodingKey {
                case totalMs = "total_ms"
                case jobs
                case jobRuns = "job_runs"
            }
        }

        public struct Macos: Codable {
            public var totalMs: Int
            public var jobs: Int
            public var jobRuns: [JobRun]?

            public struct JobRun: Codable {
                public var jobID: Int
                public var durationMs: Int

                public init(jobID: Int, durationMs: Int) {
                    self.jobID = jobID
                    self.durationMs = durationMs
                }

                private enum CodingKeys: String, CodingKey {
                    case jobID = "job_id"
                    case durationMs = "duration_ms"
                }
            }

            public init(totalMs: Int, jobs: Int, jobRuns: [JobRun]? = nil) {
                self.totalMs = totalMs
                self.jobs = jobs
                self.jobRuns = jobRuns
            }

            private enum CodingKeys: String, CodingKey {
                case totalMs = "total_ms"
                case jobs
                case jobRuns = "job_runs"
            }
        }

        public struct Windows: Codable {
            public var totalMs: Int
            public var jobs: Int
            public var jobRuns: [JobRun]?

            public struct JobRun: Codable {
                public var jobID: Int
                public var durationMs: Int

                public init(jobID: Int, durationMs: Int) {
                    self.jobID = jobID
                    self.durationMs = durationMs
                }

                private enum CodingKeys: String, CodingKey {
                    case jobID = "job_id"
                    case durationMs = "duration_ms"
                }
            }

            public init(totalMs: Int, jobs: Int, jobRuns: [JobRun]? = nil) {
                self.totalMs = totalMs
                self.jobs = jobs
                self.jobRuns = jobRuns
            }

            private enum CodingKeys: String, CodingKey {
                case totalMs = "total_ms"
                case jobs
                case jobRuns = "job_runs"
            }
        }

        public init(ubuntu: Ubuntu? = nil, macos: Macos? = nil, windows: Windows? = nil) {
            self.ubuntu = ubuntu
            self.macos = macos
            self.windows = windows
        }

        private enum CodingKeys: String, CodingKey {
            case ubuntu = "UBUNTU"
            case macos = "MACOS"
            case windows = "WINDOWS"
        }
    }

    public init(billable: Billable, runDurationMs: Int? = nil) {
        self.billable = billable
        self.runDurationMs = runDurationMs
    }

    private enum CodingKeys: String, CodingKey {
        case billable
        case runDurationMs = "run_duration_ms"
    }
}