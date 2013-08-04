# Use the default kernel version if the Makefile doesn't override it

LINUX_RELEASE?=1

ifeq ($(LINUX_VERSION),3.3.8)
  LINUX_KERNEL_MD5SUM:=f1058f64eed085deb44f10cee8541d50
endif
ifeq ($(LINUX_VERSION),3.6.11)
  LINUX_KERNEL_MD5SUM:=3d602ad7f7984509c3e923a5ae90bc54
endif
ifeq ($(LINUX_VERSION),3.7.10)
  LINUX_KERNEL_MD5SUM:=09624c3702107076efcac5e1cd8a18ec
endif
ifeq ($(LINUX_VERSION),3.8.13)
  LINUX_KERNEL_MD5SUM:=2af19d06cd47ec459519159cdd10542d
endif
ifeq ($(LINUX_VERSION),3.9.11)
  LINUX_KERNEL_MD5SUM:=edbf88eb7f7d34dbd5d3887726790755
endif
ifeq ($(LINUX_VERSION),3.10.2)
  LINUX_KERNEL_MD5SUM:=06d6bf3218c8f37d6320473b93382fe2
endif
ifeq ($(LINUX_VERSION),3.10.3)
  LINUX_KERNEL_MD5SUM:=30d2f96003778d03fa102b319f46b0c9
endif
ifeq ($(LINUX_VERSION),3.10.5)
  LINUX_KERNEL_MD5SUM:=853d4bca2752a7ec6ca11a14d557d691
endif

# disable the md5sum check for unknown kernel versions
LINUX_KERNEL_MD5SUM?=x

split_version=$(subst ., ,$(1))
merge_version=$(subst $(space),.,$(1))
KERNEL_BASE=$(firstword $(subst -, ,$(LINUX_VERSION)))
KERNEL=$(call merge_version,$(wordlist 1,2,$(call split_version,$(KERNEL_BASE))))
ifeq ($(firstword $(call split_version,$(KERNEL_BASE))),2)
  KERNEL_PATCHVER=$(call merge_version,$(wordlist 1,3,$(call split_version,$(KERNEL_BASE))))
else
  KERNEL_PATCHVER=$(KERNEL)
endif

