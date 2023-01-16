package resources

type Profile struct {
	CpuCoresPercentage uint64
	MemoryBytes        int64
}

// NewResources
// cpuPercentage must between 0-100, represent use cpuPercentage% cpu resource
func NewResources(cpuPercentage uint64, memoryBytes int64) *Profile {
	return &Profile{
		CpuCoresPercentage: cpuPercentage,
		MemoryBytes:        memoryBytes,
	}
}
