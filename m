Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSNRSXZAKGQESSLFQSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82815C016
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:10:17 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id u8sf2373282wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:10:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581603017; cv=pass;
        d=google.com; s=arc-20160816;
        b=r9/rAK6DQPh11mDQf4s1q+rFAkJ+XaftSyZt8tGh2sf+UqxT+Uzbds/6JFHTnhdl8P
         x5vXe4TDunSD0bZ/0OMIsQyB6Rm02PdMF27X+FkljwvQAbLIbNNuffmb+rnp3Quhc3Wx
         yDczmU663XdhuowG2tpWSyFBsjGmyea46Nl1oq7m3mwhULh57beYtedHGpoMAbJa3UU1
         +9i9tp3HIlLqNNw6F9D0++KIqiTNM1280AxhPryEAQ65G7GYOSGXMTTYSTdz1NewXSu7
         6kngYVmenHWfxWsQaSEXu/SrzQ/7wV4z1LI7GifY+sl7TZQZHP/KnGqXd6A1F7VvDKiA
         MXFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=eZFYTJGAH/lqjLHtcjgmIndKoBkWHraVxvraloKk0Dk=;
        b=bslvdwAvROqiDkz5V6q217IWD/VrLcKnSLn5Xeh/z+IN2IyJKe/7diakNwOF2Gcjhp
         Z+PncAzRJV5M3lmsSquKWVX+96Md537z5kznXoiZGsY9Rs2IwFOwn3+T6E3/dt0ciDN4
         3E+fRwRz6up6fv6KMWTnK+0XcTF0TKnAVnuukyqz9b8V+z4dfGPJ/WXY72JC2iYMXy5h
         zsW4vwmNMnK0oMs2q6DpOJReKpzy7ISl6DuRMdWMzod8HEaN/MmnPs1qjTiwhvh7FPDm
         XNAidPSgFi4bNnsY22thA3v3hZNwqoHb8dyl5sZh+njywPXV1TX/mNCBMEbgG9NLAGEP
         qL8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eZFYTJGAH/lqjLHtcjgmIndKoBkWHraVxvraloKk0Dk=;
        b=kDg1qw+x9J8ZB0VaimUW8YuR1WzwUMvJkhw2pwTd/QIByrsprGq7O392NsC/pFzYbk
         R+OkSaQkpNq3mLOgW0uScINBfOoeNibftsRgFMySYcXnDn4Bxpt2UcLgpq7JeOcn51Xj
         Bpl4HMsxE0+6FhraVhNqgxhOXkb22hjUCAafEz/PsoJ+yiWzpCuxo6bpOHeeKLjOmMm/
         cwvJxh0o45xdExfGOF1b+EaII7duolrNG+LM3MROp1ekYi6ZAJXltHPxTd+kyZBkCKIK
         9v9H32fAOsqrNXrvpbxTFlxCbf666EYhMZXLAq68lGvf7HlLWhI+V5ZyUbfpMmSxv5bP
         G7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eZFYTJGAH/lqjLHtcjgmIndKoBkWHraVxvraloKk0Dk=;
        b=rKvi58H6fo34cEibRYk1Ig6iosQel3kLfutrYpjm/Dtvi5APZbJsImwPKGnWy28CmA
         z3iRBHGLGUe98i6omykSNK7FoLzbHMIytukmRonJU8f7dV4Oax8G/SYMsCAmO2xSuGcn
         RVMF0jZN2IbELpLRs5Y1TiCTgyLLqcTean545CpW6/ev1+t/zL8mGmpgA3W8U2vM7be4
         59H1d5I5YVj46LuNdWh9E5kBeIyfqJlRUqaTAn9ZZjM/WBsNhLJX+ipFJzy9cnceyVbK
         aSdtHmK+hnmEdEZ6fsS9bJNJFQCTU9IuFVRIPGpP2KyAOiUASBPZswkU+ttXI7fRzq9A
         Lu7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUSlO2NmArIvBu0gfuNxGtMWpHmX8YSXk72qY1EY4xInJIlIGn5
	D5GXZrC0GbDlFJF1daULF7M=
X-Google-Smtp-Source: APXvYqxDU+teC9RzX8v5V++FezF9oOP1dIIm1l3u8A04rcbMtClVvWQ57UoX5y8Qq3cczUO2NRvpWA==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr6343185wmf.189.1581603017512;
        Thu, 13 Feb 2020 06:10:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82aa:: with SMTP id 39ls13392355wrc.3.gmail; Thu, 13 Feb
 2020 06:10:16 -0800 (PST)
X-Received: by 2002:a5d:4d04:: with SMTP id z4mr23792982wrt.157.1581603016664;
        Thu, 13 Feb 2020 06:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581603016; cv=none;
        d=google.com; s=arc-20160816;
        b=peseqYHNLhKvjV/BZgmXxPcvyf01wDkk8SrRZARYU700l3jp8kzr7aoQLSYiVhx0a9
         lub/wXWsXnJQZDzkQUZ/ZXegDwYfz44UP0It82LMTJAmyFUFPaLCLPcWaOwPNvjoyJLW
         wBHDS2zWSBw8t8mMgTFjOWFVqx5BOCYWOJHWNF68oBv/+5JkAbfYaiQHRCr7t7alPvHR
         YshIsZ4m8dE4fa07LrSMmoVc0N+k7hbR6kOuiaVkSCq0aFMEskevdh9I02P+bgYJQU8B
         un5a95rcTiZtNbsceNgDeFQIL0jxYmmDj8EIGgrmklxBy1N17lBVhwWP8SjxrDrgHuH+
         gFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=EsUi+Jp/bbCxJBSVCzkYM+7XFMqIyA/YWgoLi2Ql4YQ=;
        b=VWxsCAgjDlfcuItN5eq7HlXTCjmgUBQn6tyakp6HTx3bRVgbqoWGLnEVuJLJJYTg7A
         gcsJl8q0X024sAKe0kazcUhYpIsdtLbY7KVUZxUzWBlTPw2iOabK4TYbY7b99Jg7pRwn
         ywH1pKjbbUt+B/gmMSMK/PTyutzMjPSuNLG32Hjt7QvVxjGJ5dHYs2hjzkyLar0k0JwP
         7jb0lr0KPss9mRKXlWV7DbQENatiZBEnr1lVwR4nPpj4TaUKGzhkggXrRvA1dnokSHuf
         ZAdkdtQejajvuM+Xio0qImefnk8FUlkb8JtudkoKNWP2Z9RlUlfR1jyJP5kXHd8msgR+
         L4EQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id i18si113799wrn.0.2020.02.13.06.10.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 06:10:16 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01DEAFgB021823
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2020 15:10:15 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01DEAFO5018760;
	Thu, 13 Feb 2020 15:10:15 +0100
Subject: Re: [PATCH 1/4] recipes-kernel: Add support to build pine64plus
 kernel
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b17e4dc3-8e4f-2521-c8f9-d3476c03e739@siemens.com>
Date: Thu, 13 Feb 2020 15:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On 13.02.20 14:44, Vijai Kumar K wrote:
> Add defconfig for pine64-plus development board.
> 

Can we add the missing switches to the arm64_defconfig instead? If not, 
you would have to provide a different kernel (recipe) for this target, 
just like for the rpi4. But I don't think that should be needed.

Jan

> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>   .../linux/files/pine64-plus_defconfig_5.4     | 849 ++++++++++++++++++
>   recipes-kernel/linux/linux-jailhouse_5.4.inc  |   1 +
>   2 files changed, 850 insertions(+)
>   create mode 100644 recipes-kernel/linux/files/pine64-plus_defconfig_5.4
> 
> diff --git a/recipes-kernel/linux/files/pine64-plus_defconfig_5.4 b/recipes-kernel/linux/files/pine64-plus_defconfig_5.4
> new file mode 100644
> index 0000000..44a01f6
> --- /dev/null
> +++ b/recipes-kernel/linux/files/pine64-plus_defconfig_5.4
> @@ -0,0 +1,849 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_AUDIT=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_PREEMPT=y
> +CONFIG_IRQ_TIME_ACCOUNTING=y
> +CONFIG_BSD_PROCESS_ACCT=y
> +CONFIG_BSD_PROCESS_ACCT_V3=y
> +CONFIG_TASKSTATS=y
> +CONFIG_TASK_DELAY_ACCT=y
> +CONFIG_TASK_XACCT=y
> +CONFIG_TASK_IO_ACCOUNTING=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_NUMA_BALANCING=y
> +CONFIG_MEMCG=y
> +CONFIG_MEMCG_SWAP=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_CGROUP_HUGETLB=y
> +CONFIG_CPUSETS=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_CGROUP_PERF=y
> +CONFIG_USER_NS=y
> +CONFIG_SCHED_AUTOGROUP=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_KALLSYMS_ALL=y
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_PROFILING=y
> +CONFIG_ARCH_AGILEX=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_ARCH_ALPINE=y
> +CONFIG_ARCH_BCM2835=y
> +CONFIG_ARCH_BCM_IPROC=y
> +CONFIG_ARCH_BERLIN=y
> +CONFIG_ARCH_BRCMSTB=y
> +CONFIG_ARCH_EXYNOS=y
> +CONFIG_ARCH_K3=y
> +CONFIG_ARCH_LAYERSCAPE=y
> +CONFIG_ARCH_LG1K=y
> +CONFIG_ARCH_HISI=y
> +CONFIG_ARCH_MEDIATEK=y
> +CONFIG_ARCH_MESON=y
> +CONFIG_ARCH_MVEBU=y
> +CONFIG_ARCH_MXC=y
> +CONFIG_ARCH_QCOM=y
> +CONFIG_ARCH_RENESAS=y
> +CONFIG_ARCH_ROCKCHIP=y
> +CONFIG_ARCH_SEATTLE=y
> +CONFIG_ARCH_STRATIX10=y
> +CONFIG_ARCH_SYNQUACER=y
> +CONFIG_ARCH_TEGRA=y
> +CONFIG_ARCH_SPRD=y
> +CONFIG_ARCH_THUNDER=y
> +CONFIG_ARCH_THUNDER2=y
> +CONFIG_ARCH_UNIPHIER=y
> +CONFIG_ARCH_VEXPRESS=y
> +CONFIG_ARCH_XGENE=y
> +CONFIG_ARCH_ZX=y
> +CONFIG_ARCH_ZYNQMP=y
> +CONFIG_ARM64_VA_BITS_48=y
> +CONFIG_SCHED_MC=y
> +CONFIG_NUMA=y
> +CONFIG_SECCOMP=y
> +CONFIG_KEXEC=y
> +CONFIG_CRASH_DUMP=y
> +CONFIG_XEN=y
> +CONFIG_COMPAT=y
> +CONFIG_RANDOMIZE_BASE=y
> +CONFIG_HIBERNATION=y
> +CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
> +CONFIG_ARM_CPUIDLE=y
> +CONFIG_ARM_PSCI_CPUIDLE=y
> +CONFIG_CPU_FREQ=y
> +CONFIG_CPU_FREQ_STAT=y
> +CONFIG_CPU_FREQ_GOV_POWERSAVE=m
> +CONFIG_CPU_FREQ_GOV_USERSPACE=y
> +CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> +CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
> +CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
> +CONFIG_CPUFREQ_DT=y
> +CONFIG_ACPI_CPPC_CPUFREQ=m
> +CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
> +CONFIG_ARM_SCPI_CPUFREQ=y
> +CONFIG_ARM_IMX_CPUFREQ_DT=m
> +CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
> +CONFIG_ARM_TEGRA186_CPUFREQ=y
> +CONFIG_ARM_SCPI_PROTOCOL=y
> +CONFIG_RASPBERRYPI_FIRMWARE=y
> +CONFIG_INTEL_STRATIX10_SERVICE=y
> +CONFIG_EFI_CAPSULE_LOADER=y
> +CONFIG_IMX_SCU=y
> +CONFIG_IMX_SCU_PD=y
> +CONFIG_ACPI=y
> +CONFIG_ACPI_APEI=y
> +CONFIG_ACPI_APEI_GHES=y
> +CONFIG_ACPI_APEI_PCIEAER=y
> +CONFIG_ACPI_APEI_MEMORY_FAILURE=y
> +CONFIG_ACPI_APEI_EINJ=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=y
> +CONFIG_ARM64_CRYPTO=y
> +CONFIG_CRYPTO_SHA1_ARM64_CE=y
> +CONFIG_CRYPTO_SHA2_ARM64_CE=y
> +CONFIG_CRYPTO_SHA512_ARM64_CE=m
> +CONFIG_CRYPTO_SHA3_ARM64=m
> +CONFIG_CRYPTO_SM3_ARM64_CE=m
> +CONFIG_CRYPTO_GHASH_ARM64_CE=y
> +CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
> +CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
> +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
> +CONFIG_CRYPTO_CHACHA20_NEON=m
> +CONFIG_CRYPTO_AES_ARM64_BS=m
> +CONFIG_JUMP_LABEL=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_KSM=y
> +CONFIG_MEMORY_FAILURE=y
> +CONFIG_TRANSPARENT_HUGEPAGE=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_IP_PNP_BOOTP=y
> +CONFIG_IPV6=m
> +CONFIG_NETFILTER=y
> +CONFIG_NF_CONNTRACK=m
> +CONFIG_NF_CONNTRACK_EVENTS=y
> +CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
> +CONFIG_NETFILTER_XT_TARGET_LOG=m
> +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
> +CONFIG_IP_NF_IPTABLES=m
> +CONFIG_IP_NF_FILTER=m
> +CONFIG_IP_NF_TARGET_REJECT=m
> +CONFIG_IP_NF_NAT=m
> +CONFIG_IP_NF_TARGET_MASQUERADE=m
> +CONFIG_IP_NF_MANGLE=m
> +CONFIG_IP6_NF_IPTABLES=m
> +CONFIG_IP6_NF_FILTER=m
> +CONFIG_IP6_NF_TARGET_REJECT=m
> +CONFIG_IP6_NF_MANGLE=m
> +CONFIG_IP6_NF_NAT=m
> +CONFIG_IP6_NF_TARGET_MASQUERADE=m
> +CONFIG_BRIDGE=m
> +CONFIG_BRIDGE_VLAN_FILTERING=y
> +CONFIG_VLAN_8021Q=m
> +CONFIG_VLAN_8021Q_GVRP=y
> +CONFIG_VLAN_8021Q_MVRP=y
> +CONFIG_QRTR=m
> +CONFIG_QRTR_SMD=m
> +CONFIG_QRTR_TUN=m
> +CONFIG_BPF_JIT=y
> +CONFIG_BT=m
> +CONFIG_BT_HIDP=m
> +# CONFIG_BT_HS is not set
> +# CONFIG_BT_LE is not set
> +CONFIG_BT_LEDS=y
> +# CONFIG_BT_DEBUGFS is not set
> +CONFIG_BT_HCIBTUSB=m
> +CONFIG_BT_HCIUART=m
> +CONFIG_BT_HCIUART_LL=y
> +CONFIG_BT_HCIUART_BCM=y
> +CONFIG_CFG80211=m
> +CONFIG_MAC80211=m
> +CONFIG_MAC80211_LEDS=y
> +CONFIG_RFKILL=m
> +CONFIG_NET_9P=y
> +CONFIG_NET_9P_VIRTIO=y
> +CONFIG_PCI=y
> +CONFIG_PCIEPORTBUS=y
> +CONFIG_PCI_IOV=y
> +CONFIG_HOTPLUG_PCI=y
> +CONFIG_HOTPLUG_PCI_ACPI=y
> +CONFIG_PCI_AARDVARK=y
> +CONFIG_PCI_TEGRA=y
> +CONFIG_PCIE_RCAR=y
> +CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_PCI_XGENE=y
> +CONFIG_PCIE_ALTERA=y
> +CONFIG_PCIE_ALTERA_MSI=y
> +CONFIG_PCI_HOST_THUNDER_PEM=y
> +CONFIG_PCI_HOST_THUNDER_ECAM=y
> +CONFIG_PCIE_ROCKCHIP_HOST=m
> +CONFIG_PCI_LAYERSCAPE=y
> +CONFIG_PCI_HISI=y
> +CONFIG_PCIE_QCOM=y
> +CONFIG_PCIE_ARMADA_8K=y
> +CONFIG_PCIE_KIRIN=y
> +CONFIG_PCIE_HISI_STB=y
> +CONFIG_PCIE_TEGRA194=m
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_FW_LOADER_USER_HELPER=y
> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> +CONFIG_HISILICON_LPC=y
> +CONFIG_SIMPLE_PM_BUS=y
> +CONFIG_MTD=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_RAW_NAND=y
> +CONFIG_MTD_NAND_DENALI_DT=y
> +CONFIG_MTD_NAND_MARVELL=y
> +CONFIG_MTD_NAND_QCOM=y
> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_NBD=m
> +CONFIG_VIRTIO_BLK=y
> +CONFIG_BLK_DEV_NVME=m
> +CONFIG_SRAM=y
> +CONFIG_EEPROM_AT25=m
> +# CONFIG_SCSI_PROC_FS is not set
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_SCSI_SAS_ATA=y
> +CONFIG_SCSI_HISI_SAS=y
> +CONFIG_SCSI_HISI_SAS_PCI=y
> +CONFIG_SCSI_MPT3SAS=m
> +CONFIG_SCSI_UFSHCD=y
> +CONFIG_SCSI_UFSHCD_PLATFORM=y
> +CONFIG_SCSI_UFS_QCOM=m
> +CONFIG_SCSI_UFS_HISI=y
> +CONFIG_ATA=y
> +CONFIG_SATA_AHCI=y
> +CONFIG_SATA_AHCI_PLATFORM=y
> +CONFIG_AHCI_CEVA=y
> +CONFIG_AHCI_MVEBU=y
> +CONFIG_AHCI_XGENE=y
> +CONFIG_AHCI_QORIQ=y
> +CONFIG_SATA_SIL24=y
> +CONFIG_SATA_RCAR=y
> +CONFIG_PATA_PLATFORM=y
> +CONFIG_PATA_OF_PLATFORM=y
> +CONFIG_MD=y
> +CONFIG_BLK_DEV_MD=m
> +CONFIG_BLK_DEV_DM=m
> +CONFIG_DM_MIRROR=m
> +CONFIG_DM_ZERO=m
> +CONFIG_NETDEVICES=y
> +CONFIG_MACVLAN=m
> +CONFIG_MACVTAP=m
> +CONFIG_TUN=y
> +CONFIG_VETH=m
> +CONFIG_VIRTIO_NET=y
> +CONFIG_AMD_XGBE=y
> +CONFIG_NET_XGENE=y
> +CONFIG_ATL1C=m
> +CONFIG_BNX2X=m
> +CONFIG_MACB=y
> +CONFIG_THUNDER_NIC_PF=y
> +CONFIG_FEC=y
> +CONFIG_HIX5HD2_GMAC=y
> +CONFIG_HNS_DSAF=y
> +CONFIG_HNS_ENET=y
> +CONFIG_HNS3=y
> +CONFIG_HNS3_HCLGE=y
> +CONFIG_HNS3_ENET=y
> +CONFIG_E1000E=y
> +CONFIG_IGB=y
> +CONFIG_IGBVF=y
> +CONFIG_MVNETA=y
> +CONFIG_MVPP2=y
> +CONFIG_SKY2=y
> +CONFIG_MLX4_EN=m
> +CONFIG_MLX5_CORE=m
> +CONFIG_MLX5_CORE_EN=y
> +CONFIG_QCOM_EMAC=m
> +CONFIG_RAVB=y
> +CONFIG_SMC91X=y
> +CONFIG_SMSC911X=y
> +CONFIG_SNI_AVE=y
> +CONFIG_SNI_NETSEC=y
> +CONFIG_STMMAC_ETH=m
> +CONFIG_MDIO_BUS_MUX_MMIOREG=y
> +CONFIG_AT803X_PHY=m
> +CONFIG_MARVELL_PHY=m
> +CONFIG_MARVELL_10G_PHY=m
> +CONFIG_MESON_GXL_PHY=m
> +CONFIG_MICREL_PHY=y
> +CONFIG_REALTEK_PHY=m
> +CONFIG_ROCKCHIP_PHY=y
> +CONFIG_USB_PEGASUS=m
> +CONFIG_USB_RTL8150=m
> +CONFIG_USB_RTL8152=m
> +CONFIG_USB_LAN78XX=m
> +CONFIG_USB_USBNET=m
> +CONFIG_USB_NET_DM9601=m
> +CONFIG_USB_NET_SR9800=m
> +CONFIG_USB_NET_SMSC75XX=m
> +CONFIG_USB_NET_SMSC95XX=m
> +CONFIG_USB_NET_PLUSB=m
> +CONFIG_USB_NET_MCS7830=m
> +CONFIG_ATH10K=m
> +CONFIG_ATH10K_PCI=m
> +CONFIG_BRCMFMAC=m
> +CONFIG_MWIFIEX=m
> +CONFIG_MWIFIEX_PCIE=m
> +CONFIG_WL18XX=m
> +CONFIG_WLCORE_SDIO=m
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_KEYBOARD_ADC=m
> +CONFIG_KEYBOARD_GPIO=y
> +CONFIG_KEYBOARD_SNVS_PWRKEY=m
> +CONFIG_KEYBOARD_CROS_EC=y
> +CONFIG_INPUT_TOUCHSCREEN=y
> +CONFIG_TOUCHSCREEN_ATMEL_MXT=m
> +CONFIG_INPUT_MISC=y
> +CONFIG_INPUT_PM8941_PWRKEY=y
> +CONFIG_INPUT_HISI_POWERKEY=y
> +# CONFIG_SERIO_SERPORT is not set
> +CONFIG_SERIO_AMBAKMI=y
> +CONFIG_LEGACY_PTY_COUNT=16
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_EXTENDED=y
> +CONFIG_SERIAL_8250_SHARE_IRQ=y
> +CONFIG_SERIAL_8250_BCM2835AUX=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_SERIAL_8250_OMAP=y
> +CONFIG_SERIAL_8250_MT6577=y
> +CONFIG_SERIAL_8250_UNIPHIER=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_AMBA_PL011=y
> +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> +CONFIG_SERIAL_MESON=y
> +CONFIG_SERIAL_MESON_CONSOLE=y
> +CONFIG_SERIAL_SAMSUNG=y
> +CONFIG_SERIAL_SAMSUNG_CONSOLE=y
> +CONFIG_SERIAL_TEGRA=y
> +CONFIG_SERIAL_TEGRA_TCU=y
> +CONFIG_SERIAL_IMX=y
> +CONFIG_SERIAL_IMX_CONSOLE=y
> +CONFIG_SERIAL_SH_SCI=y
> +CONFIG_SERIAL_MSM=y
> +CONFIG_SERIAL_MSM_CONSOLE=y
> +CONFIG_SERIAL_QCOM_GENI=y
> +CONFIG_SERIAL_QCOM_GENI_CONSOLE=y
> +CONFIG_SERIAL_XILINX_PS_UART=y
> +CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
> +CONFIG_SERIAL_FSL_LPUART=y
> +CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
> +CONFIG_SERIAL_MVEBU_UART=y
> +CONFIG_SERIAL_DEV_BUS=y
> +CONFIG_VIRTIO_CONSOLE=y
> +CONFIG_IPMI_HANDLER=m
> +CONFIG_IPMI_DEVICE_INTERFACE=m
> +CONFIG_IPMI_SI=m
> +CONFIG_TCG_TPM=y
> +CONFIG_TCG_TIS_I2C_INFINEON=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_MUX=y
> +CONFIG_I2C_MUX_PCA954x=y
> +CONFIG_I2C_BCM2835=m
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> +CONFIG_I2C_GPIO=m
> +CONFIG_I2C_IMX=y
> +CONFIG_I2C_IMX_LPI2C=y
> +CONFIG_I2C_MESON=y
> +CONFIG_I2C_MV64XXX=y
> +CONFIG_I2C_PXA=y
> +CONFIG_I2C_QCOM_GENI=m
> +CONFIG_I2C_QUP=y
> +CONFIG_I2C_RK3X=y
> +CONFIG_I2C_SH_MOBILE=y
> +CONFIG_I2C_TEGRA=y
> +CONFIG_I2C_UNIPHIER_F=y
> +CONFIG_I2C_RCAR=y
> +CONFIG_I2C_CROS_EC_TUNNEL=y
> +CONFIG_SPI=y
> +CONFIG_SPI_ARMADA_3700=y
> +CONFIG_SPI_BCM2835=m
> +CONFIG_SPI_BCM2835AUX=m
> +CONFIG_SPI_NXP_FLEXSPI=y
> +CONFIG_SPI_IMX=m
> +CONFIG_SPI_MESON_SPICC=m
> +CONFIG_SPI_MESON_SPIFC=m
> +CONFIG_SPI_ORION=y
> +CONFIG_SPI_PL022=y
> +CONFIG_SPI_ROCKCHIP=y
> +CONFIG_SPI_QUP=y
> +CONFIG_SPI_S3C64XX=y
> +CONFIG_SPI_SUN6I=y
> +CONFIG_SPI_SPIDEV=m
> +CONFIG_SPMI=y
> +CONFIG_PINCTRL_SINGLE=y
> +CONFIG_PINCTRL_MAX77620=y
> +CONFIG_PINCTRL_IMX8MM=y
> +CONFIG_PINCTRL_IMX8MN=y
> +CONFIG_PINCTRL_IMX8MQ=y
> +CONFIG_PINCTRL_IMX8QXP=y
> +CONFIG_PINCTRL_IPQ8074=y
> +CONFIG_PINCTRL_MSM8916=y
> +CONFIG_PINCTRL_MSM8994=y
> +CONFIG_PINCTRL_MSM8996=y
> +CONFIG_PINCTRL_MSM8998=y
> +CONFIG_PINCTRL_QCS404=y
> +CONFIG_PINCTRL_QDF2XXX=y
> +CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
> +CONFIG_PINCTRL_SDM845=y
> +CONFIG_PINCTRL_SM8150=y
> +CONFIG_GPIO_DWAPB=y
> +CONFIG_GPIO_MB86S7X=y
> +CONFIG_GPIO_PL061=y
> +CONFIG_GPIO_RCAR=y
> +CONFIG_GPIO_UNIPHIER=y
> +CONFIG_GPIO_XGENE=y
> +CONFIG_GPIO_XGENE_SB=y
> +CONFIG_GPIO_MAX732X=y
> +CONFIG_GPIO_PCA953X=y
> +CONFIG_GPIO_PCA953X_IRQ=y
> +CONFIG_GPIO_MAX77620=y
> +CONFIG_POWER_AVS=y
> +CONFIG_ROCKCHIP_IODOMAIN=y
> +CONFIG_POWER_RESET_MSM=y
> +CONFIG_POWER_RESET_XGENE=y
> +CONFIG_POWER_RESET_SYSCON=y
> +CONFIG_SYSCON_REBOOT_MODE=y
> +CONFIG_BATTERY_SBS=m
> +CONFIG_BATTERY_BQ27XXX=y
> +CONFIG_SENSORS_ARM_SCPI=y
> +CONFIG_SENSORS_LM90=m
> +CONFIG_SENSORS_PWM_FAN=m
> +CONFIG_SENSORS_RASPBERRYPI_HWMON=m
> +CONFIG_SENSORS_INA2XX=m
> +CONFIG_SENSORS_INA3221=m
> +CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
> +CONFIG_CPU_THERMAL=y
> +CONFIG_THERMAL_EMULATION=y
> +CONFIG_QORIQ_THERMAL=m
> +CONFIG_ROCKCHIP_THERMAL=m
> +CONFIG_RCAR_THERMAL=y
> +CONFIG_RCAR_GEN3_THERMAL=y
> +CONFIG_ARMADA_THERMAL=y
> +CONFIG_BCM2835_THERMAL=m
> +CONFIG_BRCMSTB_THERMAL=m
> +CONFIG_EXYNOS_THERMAL=y
> +CONFIG_TEGRA_BPMP_THERMAL=m
> +CONFIG_QCOM_TSENS=y
> +CONFIG_UNIPHIER_THERMAL=y
> +CONFIG_WATCHDOG=y
> +CONFIG_ARM_SP805_WATCHDOG=y
> +CONFIG_S3C2410_WATCHDOG=y
> +CONFIG_DW_WATCHDOG=y
> +CONFIG_SUNXI_WATCHDOG=m
> +CONFIG_IMX2_WDT=y
> +CONFIG_IMX_SC_WDT=m
> +CONFIG_MESON_GXBB_WATCHDOG=m
> +CONFIG_MESON_WATCHDOG=m
> +CONFIG_RENESAS_WDT=y
> +CONFIG_UNIPHIER_WATCHDOG=y
> +CONFIG_BCM2835_WDT=y
> +CONFIG_MFD_ALTERA_SYSMGR=y
> +CONFIG_MFD_BD9571MWV=y
> +CONFIG_MFD_AXP20X_I2C=y
> +CONFIG_MFD_AXP20X_RSB=y
> +CONFIG_MFD_EXYNOS_LPASS=m
> +CONFIG_MFD_HI6421_PMIC=y
> +CONFIG_MFD_HI655X_PMIC=y
> +CONFIG_MFD_MAX77620=y
> +CONFIG_MFD_SPMI_PMIC=y
> +CONFIG_MFD_RK808=y
> +CONFIG_MFD_SEC_CORE=y
> +CONFIG_MFD_ROHM_BD718XX=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_REGULATOR_AXP20X=y
> +CONFIG_REGULATOR_BD718XX=y
> +CONFIG_REGULATOR_BD9571MWV=y
> +CONFIG_REGULATOR_FAN53555=y
> +CONFIG_REGULATOR_GPIO=y
> +CONFIG_REGULATOR_HI6421V530=y
> +CONFIG_REGULATOR_HI655X=y
> +CONFIG_REGULATOR_MAX77620=y
> +CONFIG_REGULATOR_MAX8973=y
> +CONFIG_REGULATOR_PFUZE100=y
> +CONFIG_REGULATOR_PWM=y
> +CONFIG_REGULATOR_QCOM_RPMH=y
> +CONFIG_REGULATOR_QCOM_SMD_RPM=y
> +CONFIG_REGULATOR_QCOM_SPMI=y
> +CONFIG_REGULATOR_RK808=y
> +CONFIG_REGULATOR_S2MPS11=y
> +CONFIG_REGULATOR_VCTRL=m
> +CONFIG_RC_CORE=m
> +CONFIG_RC_DECODERS=y
> +CONFIG_RC_DEVICES=y
> +CONFIG_IR_MESON=m
> +CONFIG_IR_SUNXI=m
> +CONFIG_MEDIA_SUPPORT=m
> +CONFIG_MEDIA_CAMERA_SUPPORT=y
> +CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> +CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> +CONFIG_MEDIA_CONTROLLER=y
> +CONFIG_VIDEO_V4L2_SUBDEV_API=y
> +# CONFIG_DVB_NET is not set
> +CONFIG_MEDIA_USB_SUPPORT=y
> +CONFIG_USB_VIDEO_CLASS=m
> +CONFIG_V4L_PLATFORM_DRIVERS=y
> +CONFIG_VIDEO_SUN6I_CSI=m
> +CONFIG_V4L_MEM2MEM_DRIVERS=y
> +CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
> +CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> +CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
> +CONFIG_VIDEO_RENESAS_FCP=m
> +CONFIG_VIDEO_RENESAS_VSP1=m
> +CONFIG_DRM=m
> +CONFIG_DRM_I2C_NXP_TDA998X=m
> +CONFIG_DRM_NOUVEAU=m
> +CONFIG_DRM_EXYNOS=m
> +CONFIG_DRM_EXYNOS5433_DECON=y
> +CONFIG_DRM_EXYNOS7_DECON=y
> +CONFIG_DRM_EXYNOS_DSI=y
> +# CONFIG_DRM_EXYNOS_DP is not set
> +CONFIG_DRM_EXYNOS_HDMI=y
> +CONFIG_DRM_EXYNOS_MIC=y
> +CONFIG_DRM_ROCKCHIP=m
> +CONFIG_ROCKCHIP_ANALOGIX_DP=y
> +CONFIG_ROCKCHIP_CDN_DP=y
> +CONFIG_ROCKCHIP_DW_HDMI=y
> +CONFIG_ROCKCHIP_DW_MIPI_DSI=y
> +CONFIG_ROCKCHIP_INNO_HDMI=y
> +CONFIG_DRM_RCAR_DU=m
> +CONFIG_DRM_SUN4I=m
> +CONFIG_DRM_SUN8I_DW_HDMI=m
> +CONFIG_DRM_SUN8I_MIXER=m
> +CONFIG_DRM_MSM=m
> +CONFIG_DRM_TEGRA=m
> +CONFIG_DRM_PANEL_SIMPLE=m
> +CONFIG_DRM_SII902X=m
> +CONFIG_DRM_I2C_ADV7511=m
> +CONFIG_DRM_VC4=m
> +CONFIG_DRM_ETNAVIV=m
> +CONFIG_DRM_HISI_HIBMC=m
> +CONFIG_DRM_HISI_KIRIN=m
> +CONFIG_DRM_MESON=m
> +CONFIG_DRM_PL111=m
> +CONFIG_DRM_LIMA=m
> +CONFIG_DRM_PANFROST=m
> +CONFIG_FB=y
> +CONFIG_FB_MODE_HELPERS=y
> +CONFIG_FB_EFI=y
> +CONFIG_BACKLIGHT_GENERIC=m
> +CONFIG_BACKLIGHT_PWM=m
> +CONFIG_BACKLIGHT_LP855X=m
> +CONFIG_LOGO=y
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +CONFIG_SOUND=y
> +CONFIG_SND=y
> +CONFIG_SND_HDA_TEGRA=m
> +CONFIG_SND_HDA_CODEC_HDMI=m
> +CONFIG_SND_SOC=y
> +CONFIG_SND_BCM2835_SOC_I2S=m
> +CONFIG_SND_MESON_AXG_SOUND_CARD=m
> +CONFIG_SND_SOC_ROCKCHIP=m
> +CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
> +CONFIG_SND_SOC_ROCKCHIP_RT5645=m
> +CONFIG_SND_SOC_RK3399_GRU_SOUND=m
> +CONFIG_SND_SOC_SAMSUNG=y
> +CONFIG_SND_SOC_RCAR=m
> +CONFIG_SND_SUN4I_SPDIF=m
> +CONFIG_SND_SOC_AK4613=m
> +CONFIG_SND_SOC_ES7134=m
> +CONFIG_SND_SOC_ES7241=m
> +CONFIG_SND_SOC_PCM3168A_I2C=m
> +CONFIG_SND_SOC_TAS571X=m
> +CONFIG_SND_SIMPLE_CARD=m
> +CONFIG_SND_AUDIO_GRAPH_CARD=m
> +CONFIG_I2C_HID=m
> +CONFIG_USB=y
> +CONFIG_USB_OTG=y
> +CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_TEGRA=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_EXYNOS=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_EXYNOS=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_RENESAS_USBHS=m
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_MUSB_HDRC=y
> +CONFIG_USB_MUSB_SUNXI=y
> +CONFIG_USB_DWC3=y
> +CONFIG_USB_DWC2=y
> +CONFIG_USB_CHIPIDEA=y
> +CONFIG_USB_CHIPIDEA_UDC=y
> +CONFIG_USB_CHIPIDEA_HOST=y
> +CONFIG_USB_ISP1760=y
> +CONFIG_USB_HSIC_USB3503=y
> +CONFIG_NOP_USB_XCEIV=y
> +CONFIG_USB_ULPI=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_RENESAS_USBHS_UDC=m
> +CONFIG_USB_RENESAS_USB3=m
> +CONFIG_TYPEC=m
> +CONFIG_MMC=y
> +CONFIG_MMC_BLOCK_MINORS=32
> +CONFIG_MMC_ARMMMCI=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_ACPI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_OF_ARASAN=y
> +CONFIG_MMC_SDHCI_OF_ESDHC=y
> +CONFIG_MMC_SDHCI_CADENCE=y
> +CONFIG_MMC_SDHCI_ESDHC_IMX=y
> +CONFIG_MMC_SDHCI_TEGRA=y
> +CONFIG_MMC_SDHCI_F_SDH30=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_MMC_SDHCI_MSM=y
> +CONFIG_MMC_SPI=y
> +CONFIG_MMC_SDHI=y
> +CONFIG_MMC_UNIPHIER=y
> +CONFIG_MMC_DW=y
> +CONFIG_MMC_DW_EXYNOS=y
> +CONFIG_MMC_DW_HI3798CV200=y
> +CONFIG_MMC_DW_K3=y
> +CONFIG_MMC_DW_ROCKCHIP=y
> +CONFIG_MMC_SUNXI=y
> +CONFIG_MMC_BCM2835=y
> +CONFIG_MMC_SDHCI_XENON=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PWM=y
> +CONFIG_LEDS_SYSCON=y
> +CONFIG_LEDS_TRIGGER_DISK=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> +CONFIG_LEDS_TRIGGER_CPU=y
> +CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
> +CONFIG_LEDS_TRIGGER_PANIC=y
> +CONFIG_EDAC=y
> +CONFIG_EDAC_GHES=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_MAX77686=y
> +CONFIG_RTC_DRV_RK808=m
> +CONFIG_RTC_DRV_RX8581=m
> +CONFIG_RTC_DRV_S5M=y
> +CONFIG_RTC_DRV_DS3232=y
> +CONFIG_RTC_DRV_EFI=y
> +CONFIG_RTC_DRV_CROS_EC=y
> +CONFIG_RTC_DRV_S3C=y
> +CONFIG_RTC_DRV_PL031=y
> +CONFIG_RTC_DRV_SUN6I=y
> +CONFIG_RTC_DRV_ARMADA38X=y
> +CONFIG_RTC_DRV_TEGRA=y
> +CONFIG_RTC_DRV_SNVS=m
> +CONFIG_RTC_DRV_IMX_SC=m
> +CONFIG_RTC_DRV_XGENE=y
> +CONFIG_DMADEVICES=y
> +CONFIG_DMA_BCM2835=m
> +CONFIG_DMA_SUN6I=m
> +CONFIG_FSL_EDMA=y
> +CONFIG_IMX_SDMA=y
> +CONFIG_K3_DMA=y
> +CONFIG_MV_XOR=y
> +CONFIG_MV_XOR_V2=y
> +CONFIG_PL330_DMA=y
> +CONFIG_TEGRA20_APB_DMA=y
> +CONFIG_QCOM_BAM_DMA=y
> +CONFIG_QCOM_HIDMA_MGMT=y
> +CONFIG_QCOM_HIDMA=y
> +CONFIG_RCAR_DMAC=y
> +CONFIG_RENESAS_USB_DMAC=m
> +CONFIG_UIO=y
> +CONFIG_UIO_IVSHMEM=y
> +CONFIG_VFIO=y
> +CONFIG_VFIO_PCI=y
> +CONFIG_VIRT_DRIVERS=y
> +CONFIG_JAILHOUSE_DBGCON=y
> +CONFIG_VIRTIO_PCI=y
> +CONFIG_VIRTIO_BALLOON=y
> +CONFIG_VIRTIO_MMIO=y
> +CONFIG_XEN_GNTDEV=y
> +CONFIG_XEN_GRANT_DEV_ALLOC=y
> +CONFIG_MFD_CROS_EC=y
> +CONFIG_CROS_EC_I2C=y
> +CONFIG_CROS_EC_SPI=y
> +CONFIG_COMMON_CLK_RK808=y
> +CONFIG_COMMON_CLK_SCPI=y
> +CONFIG_COMMON_CLK_CS2000_CP=y
> +CONFIG_COMMON_CLK_S2MPS11=y
> +CONFIG_CLK_QORIQ=y
> +CONFIG_COMMON_CLK_PWM=y
> +CONFIG_CLK_RASPBERRYPI=m
> +CONFIG_CLK_IMX8MM=y
> +CONFIG_CLK_IMX8MN=y
> +CONFIG_CLK_IMX8MQ=y
> +CONFIG_CLK_IMX8QXP=y
> +CONFIG_TI_SCI_CLK=y
> +CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_QCOM_A53PLL=y
> +CONFIG_QCOM_CLK_APCS_MSM8916=y
> +CONFIG_QCOM_CLK_SMD_RPM=y
> +CONFIG_QCOM_CLK_RPMH=y
> +CONFIG_IPQ_GCC_8074=y
> +CONFIG_MSM_GCC_8916=y
> +CONFIG_MSM_GCC_8994=y
> +CONFIG_MSM_MMCC_8996=y
> +CONFIG_MSM_GCC_8998=y
> +CONFIG_QCS_GCC_404=y
> +CONFIG_SDM_GCC_845=y
> +CONFIG_SM_GCC_8150=y
> +CONFIG_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_QCOM=y
> +CONFIG_ARM_MHU=y
> +CONFIG_IMX_MBOX=y
> +CONFIG_PLATFORM_MHU=y
> +CONFIG_BCM2835_MBOX=y
> +CONFIG_QCOM_APCS_IPC=y
> +CONFIG_ROCKCHIP_IOMMU=y
> +CONFIG_TEGRA_IOMMU_SMMU=y
> +CONFIG_ARM_SMMU=y
> +CONFIG_ARM_SMMU_V3=y
> +CONFIG_QCOM_IOMMU=y
> +CONFIG_REMOTEPROC=y
> +CONFIG_QCOM_Q6V5_MSS=m
> +CONFIG_QCOM_Q6V5_PAS=m
> +CONFIG_QCOM_SYSMON=m
> +CONFIG_RPMSG_QCOM_GLINK_RPM=y
> +CONFIG_RPMSG_QCOM_GLINK_SMEM=m
> +CONFIG_RPMSG_QCOM_SMD=y
> +CONFIG_RASPBERRYPI_POWER=y
> +CONFIG_IMX_SCU_SOC=y
> +CONFIG_QCOM_GENI_SE=y
> +CONFIG_QCOM_GLINK_SSR=m
> +CONFIG_QCOM_RPMH=y
> +CONFIG_QCOM_SMEM=y
> +CONFIG_QCOM_SMD_RPM=y
> +CONFIG_QCOM_SMP2P=y
> +CONFIG_QCOM_SMSM=y
> +CONFIG_ARCH_R8A774A1=y
> +CONFIG_ARCH_R8A774C0=y
> +CONFIG_ARCH_R8A7795=y
> +CONFIG_ARCH_R8A7796=y
> +CONFIG_ARCH_R8A77965=y
> +CONFIG_ARCH_R8A77970=y
> +CONFIG_ARCH_R8A77980=y
> +CONFIG_ARCH_R8A77990=y
> +CONFIG_ARCH_R8A77995=y
> +CONFIG_ROCKCHIP_PM_DOMAINS=y
> +CONFIG_ARCH_TEGRA_132_SOC=y
> +CONFIG_ARCH_TEGRA_210_SOC=y
> +CONFIG_ARCH_TEGRA_186_SOC=y
> +CONFIG_ARCH_TEGRA_194_SOC=y
> +CONFIG_ARCH_K3_AM6_SOC=y
> +CONFIG_ARCH_K3_J721E_SOC=y
> +CONFIG_TI_SCI_PM_DOMAINS=y
> +CONFIG_EXTCON_USB_GPIO=y
> +CONFIG_EXTCON_USBC_CROS_EC=y
> +CONFIG_MEMORY=y
> +CONFIG_IIO=y
> +CONFIG_EXYNOS_ADC=y
> +CONFIG_ROCKCHIP_SARADC=m
> +CONFIG_IIO_CROS_EC_SENSORS_CORE=m
> +CONFIG_IIO_CROS_EC_SENSORS=m
> +CONFIG_IIO_CROS_EC_LIGHT_PROX=m
> +CONFIG_SENSORS_ISL29018=m
> +CONFIG_IIO_CROS_EC_BARO=m
> +CONFIG_MPL3115=m
> +CONFIG_PWM=y
> +CONFIG_PWM_BCM2835=m
> +CONFIG_PWM_CROS_EC=m
> +CONFIG_PWM_MESON=m
> +CONFIG_PWM_RCAR=m
> +CONFIG_PWM_ROCKCHIP=y
> +CONFIG_PWM_SAMSUNG=y
> +CONFIG_PWM_SUN4I=m
> +CONFIG_PWM_TEGRA=m
> +CONFIG_RESET_TI_SCI=y
> +CONFIG_PHY_XGENE=y
> +CONFIG_PHY_SUN4I_USB=y
> +CONFIG_PHY_HI6220_USB=y
> +CONFIG_PHY_HISTB_COMBPHY=y
> +CONFIG_PHY_HISI_INNO_USB2=y
> +CONFIG_PHY_MVEBU_CP110_COMPHY=y
> +CONFIG_PHY_QCOM_QMP=m
> +CONFIG_PHY_QCOM_QUSB2=m
> +CONFIG_PHY_QCOM_USB_HS=y
> +CONFIG_PHY_RCAR_GEN3_PCIE=y
> +CONFIG_PHY_RCAR_GEN3_USB2=y
> +CONFIG_PHY_RCAR_GEN3_USB3=m
> +CONFIG_PHY_ROCKCHIP_EMMC=y
> +CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
> +CONFIG_PHY_ROCKCHIP_INNO_USB2=y
> +CONFIG_PHY_ROCKCHIP_PCIE=m
> +CONFIG_PHY_ROCKCHIP_TYPEC=y
> +CONFIG_PHY_UNIPHIER_USB2=y
> +CONFIG_PHY_UNIPHIER_USB3=y
> +CONFIG_PHY_TEGRA_XUSB=y
> +CONFIG_FSL_IMX8_DDR_PMU=m
> +CONFIG_HISI_PMU=y
> +CONFIG_QCOM_L2_PMU=y
> +CONFIG_QCOM_L3_PMU=y
> +CONFIG_NVMEM_IMX_OCOTP=y
> +CONFIG_NVMEM_IMX_OCOTP_SCU=y
> +CONFIG_QCOM_QFPROM=y
> +CONFIG_ROCKCHIP_EFUSE=y
> +CONFIG_NVMEM_SUNXI_SID=y
> +CONFIG_UNIPHIER_EFUSE=y
> +CONFIG_MESON_EFUSE=m
> +CONFIG_FPGA=y
> +CONFIG_FPGA_MGR_STRATIX10_SOC=m
> +CONFIG_FPGA_BRIDGE=m
> +CONFIG_ALTERA_FREEZE_BRIDGE=m
> +CONFIG_FPGA_REGION=m
> +CONFIG_OF_FPGA_REGION=m
> +CONFIG_TEE=y
> +CONFIG_OPTEE=y
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT3_FS=y
> +CONFIG_EXT4_FS_POSIX_ACL=y
> +CONFIG_BTRFS_FS=m
> +CONFIG_BTRFS_FS_POSIX_ACL=y
> +CONFIG_FANOTIFY=y
> +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
> +CONFIG_QUOTA=y
> +CONFIG_AUTOFS4_FS=y
> +CONFIG_FUSE_FS=m
> +CONFIG_CUSE=m
> +CONFIG_OVERLAY_FS=m
> +CONFIG_VFAT_FS=y
> +CONFIG_HUGETLBFS=y
> +CONFIG_CONFIGFS_FS=y
> +CONFIG_EFIVAR_FS=y
> +CONFIG_SQUASHFS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V4=y
> +CONFIG_NFS_V4_1=y
> +CONFIG_NFS_V4_2=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_9P_FS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_SECURITY=y
> +CONFIG_CRYPTO_ECHAINIV=y
> +CONFIG_CRYPTO_ANSI_CPRNG=y
> +CONFIG_CMA_SIZE_MBYTES=32
> +CONFIG_PRINTK_TIME=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_FS=y
> +CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_KERNEL=y
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_DEBUG_PREEMPT is not set
> +# CONFIG_FTRACE is not set
> +CONFIG_MEMTEST=y
> diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.inc b/recipes-kernel/linux/linux-jailhouse_5.4.inc
> index a9e75a8..6dbf2a4 100644
> --- a/recipes-kernel/linux/linux-jailhouse_5.4.inc
> +++ b/recipes-kernel/linux/linux-jailhouse_5.4.inc
> @@ -13,6 +13,7 @@ require recipes-kernel/linux/linux-custom.inc
>   
>   KERNEL_DEFCONFIG = "${DISTRO_ARCH}_defconfig_5.4"
>   KERNEL_DEFCONFIG_orangepi-zero = "orangepi-zero_defconfig_5.4"
> +KERNEL_DEFCONFIG_pine64-plus = "pine64-plus_defconfig_5.4"
>   KERNEL_DEFCONFIG_rpi4 = "rpi4_defconfig_5.4"
>   
>   SRC_URI += " \
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b17e4dc3-8e4f-2521-c8f9-d3476c03e739%40siemens.com.
