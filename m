Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBTWHSXZAKGQE2X46MIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id F409415C0C4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:57:19 +0100 (CET)
Received: by mail-ot1-x337.google.com with SMTP id 75sf3218306otc.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EvrRzPpP1OMHEWjaoqX924wVcoQHHhb8zu/OTZU8B3M=;
        b=SuyBlVRpH5telAdkQBTVRRHPSnkwvEIwQhCofuOKY4/3MhTtd5XLQIWkDp2t/PQWlV
         yF/U99Gb5DN9xI5lvGNTyALIxPpskefLwnrqo6UsQPYRklgV1y7e7ej+Cj0kK9HsJFJI
         IOsPoWnURVY0xeswY2zMuGBef0OwSJI/6ochcwmf9FMO5arHEZYHWk4PMpQydVsuyHIZ
         0L2x3rjid2MCMWVnj8gM/9pKIdWPboT8+33uSBlp+ujMDKT8HV9UsvPTA4Qgj5zgVfuC
         IbOezXaVLTDQ59bRp/YmN2NzTvQxipW6A4swJgGfocOdDGk8ljnaZxDMMGwx15X4CLBu
         8B/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EvrRzPpP1OMHEWjaoqX924wVcoQHHhb8zu/OTZU8B3M=;
        b=VWDl6Koff+QkoO73LqPY0uWJ/qfCeeBiDrTcFexkaW/t+s2/eKX4wCIzWDHgBNDVKg
         7wpyQIX0knfzSKXSsutHfjhGC9GeCH2yV0GbIY1RoPgzK0RIRM6O3k390eZkYJE0bIkb
         C6993z046gahtjneINSg9h7rjSSUei94QstiLVcH0w8USDSfXtDnG4uAtsGjwadvufmr
         r+1pwQbNDmnmFAu7lqReBN8hfojWzGzDx1z6AyQLl7dR5irHc/2/dGwOm/G1oe0pBop7
         z7eohm3//Qp/wxE4CVpSgH8bpYtb7y+/RHtd7/Z2G6+nG6to1iKJeY8W1AuxOE9fbIMV
         3wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EvrRzPpP1OMHEWjaoqX924wVcoQHHhb8zu/OTZU8B3M=;
        b=ANse6dvIpBckky1pvT428o0y7LyW/eJVafwK/0zhYwD5IOriCNSqDJG47hpw/9BKc/
         hj7Qyk3+HRDLd/XBFhTykq24a7d5NFJH6ZTV8Mj20JnA8VTlLH11zGX+rZ3TaFFde3Ld
         aQ/19zivh+J6wa9exg48oeChntcHXDVCnHT5i0u2FYxJCQdXtxegw9pLZnOPUQnfWh21
         bX/IEQ1ytCAniqfGnETOuQg1yUsAY/GqSggiHVqfWQsbv6feQi+vxi/J64N+p6Zm7SHd
         pW3Ac4nvLUhGwino1wMQ404aQ+10FkpdxvyXAFKxAHPpfBmeaZPweduW6hEmbsWRkQ5N
         t18g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWRzFtvp773muA+ft1ewT5O6Hk+R3sFSFe7r37iEnlF45BeQPa/
	Fgkhfmy+SlGAUlEA/zS7i/4=
X-Google-Smtp-Source: APXvYqx9UJZWiX6FlmVd+wNR/k5RppmUBPlyExVdx4leq/uyoUB6G/TT4ateuQHAWpgc47FbCZMGZw==
X-Received: by 2002:a05:6808:244:: with SMTP id m4mr3183509oie.125.1581605838815;
        Thu, 13 Feb 2020 06:57:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:649:: with SMTP id z9ls7569895oih.3.gmail; Thu, 13
 Feb 2020 06:57:18 -0800 (PST)
X-Received: by 2002:a05:6808:64e:: with SMTP id z14mr3006012oih.79.1581605837259;
        Thu, 13 Feb 2020 06:57:17 -0800 (PST)
Date: Thu, 13 Feb 2020 06:57:16 -0800 (PST)
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bb3d3927-ad61-429e-a683-bd6fdc2adeeb@googlegroups.com>
In-Reply-To: <b17e4dc3-8e4f-2521-c8f9-d3476c03e739@siemens.com>
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
 <b17e4dc3-8e4f-2521-c8f9-d3476c03e739@siemens.com>
Subject: Re: [PATCH 1/4] recipes-kernel: Add support to build pine64plus
 kernel
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3204_1715541322.1581605836659"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
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

------=_Part_3204_1715541322.1581605836659
Content-Type: multipart/alternative; 
	boundary="----=_Part_3205_1103837390.1581605836662"

------=_Part_3205_1103837390.1581605836662
Content-Type: text/plain; charset="UTF-8"



On Thursday, February 13, 2020 at 7:40:17 PM UTC+5:30, Jan Kiszka wrote:
>
> On 13.02.20 14:44, Vijai Kumar K wrote: 
> > Add defconfig for pine64-plus development board. 
> > 
>
> Can we add the missing switches to the arm64_defconfig instead? If not, 
> you would have to provide a different kernel (recipe) for this target, 
> just like for the rpi4. But I don't think that should be needed. 
>

Sure. I will try to consolidate it and send it as part of v2.


> Jan 
>
> > Signed-off-by: Vijai Kumar K <vijaikumar...@gmail.com <javascript:>> 
> > --- 
> >   .../linux/files/pine64-plus_defconfig_5.4     | 849 ++++++++++++++++++ 
> >   recipes-kernel/linux/linux-jailhouse_5.4.inc  |   1 + 
> >   2 files changed, 850 insertions(+) 
> >   create mode 100644 
> recipes-kernel/linux/files/pine64-plus_defconfig_5.4 
> > 
> > diff --git a/recipes-kernel/linux/files/pine64-plus_defconfig_5.4 
> b/recipes-kernel/linux/files/pine64-plus_defconfig_5.4 
> > new file mode 100644 
> > index 0000000..44a01f6 
> > --- /dev/null 
> > +++ b/recipes-kernel/linux/files/pine64-plus_defconfig_5.4 
> > @@ -0,0 +1,849 @@ 
> > +CONFIG_SYSVIPC=y 
> > +CONFIG_POSIX_MQUEUE=y 
> > +CONFIG_AUDIT=y 
> > +CONFIG_NO_HZ_IDLE=y 
> > +CONFIG_HIGH_RES_TIMERS=y 
> > +CONFIG_PREEMPT=y 
> > +CONFIG_IRQ_TIME_ACCOUNTING=y 
> > +CONFIG_BSD_PROCESS_ACCT=y 
> > +CONFIG_BSD_PROCESS_ACCT_V3=y 
> > +CONFIG_TASKSTATS=y 
> > +CONFIG_TASK_DELAY_ACCT=y 
> > +CONFIG_TASK_XACCT=y 
> > +CONFIG_TASK_IO_ACCOUNTING=y 
> > +CONFIG_IKCONFIG=y 
> > +CONFIG_IKCONFIG_PROC=y 
> > +CONFIG_NUMA_BALANCING=y 
> > +CONFIG_MEMCG=y 
> > +CONFIG_MEMCG_SWAP=y 
> > +CONFIG_BLK_CGROUP=y 
> > +CONFIG_CGROUP_PIDS=y 
> > +CONFIG_CGROUP_HUGETLB=y 
> > +CONFIG_CPUSETS=y 
> > +CONFIG_CGROUP_DEVICE=y 
> > +CONFIG_CGROUP_CPUACCT=y 
> > +CONFIG_CGROUP_PERF=y 
> > +CONFIG_USER_NS=y 
> > +CONFIG_SCHED_AUTOGROUP=y 
> > +CONFIG_BLK_DEV_INITRD=y 
> > +CONFIG_KALLSYMS_ALL=y 
> > +# CONFIG_COMPAT_BRK is not set 
> > +CONFIG_PROFILING=y 
> > +CONFIG_ARCH_AGILEX=y 
> > +CONFIG_ARCH_SUNXI=y 
> > +CONFIG_ARCH_ALPINE=y 
> > +CONFIG_ARCH_BCM2835=y 
> > +CONFIG_ARCH_BCM_IPROC=y 
> > +CONFIG_ARCH_BERLIN=y 
> > +CONFIG_ARCH_BRCMSTB=y 
> > +CONFIG_ARCH_EXYNOS=y 
> > +CONFIG_ARCH_K3=y 
> > +CONFIG_ARCH_LAYERSCAPE=y 
> > +CONFIG_ARCH_LG1K=y 
> > +CONFIG_ARCH_HISI=y 
> > +CONFIG_ARCH_MEDIATEK=y 
> > +CONFIG_ARCH_MESON=y 
> > +CONFIG_ARCH_MVEBU=y 
> > +CONFIG_ARCH_MXC=y 
> > +CONFIG_ARCH_QCOM=y 
> > +CONFIG_ARCH_RENESAS=y 
> > +CONFIG_ARCH_ROCKCHIP=y 
> > +CONFIG_ARCH_SEATTLE=y 
> > +CONFIG_ARCH_STRATIX10=y 
> > +CONFIG_ARCH_SYNQUACER=y 
> > +CONFIG_ARCH_TEGRA=y 
> > +CONFIG_ARCH_SPRD=y 
> > +CONFIG_ARCH_THUNDER=y 
> > +CONFIG_ARCH_THUNDER2=y 
> > +CONFIG_ARCH_UNIPHIER=y 
> > +CONFIG_ARCH_VEXPRESS=y 
> > +CONFIG_ARCH_XGENE=y 
> > +CONFIG_ARCH_ZX=y 
> > +CONFIG_ARCH_ZYNQMP=y 
> > +CONFIG_ARM64_VA_BITS_48=y 
> > +CONFIG_SCHED_MC=y 
> > +CONFIG_NUMA=y 
> > +CONFIG_SECCOMP=y 
> > +CONFIG_KEXEC=y 
> > +CONFIG_CRASH_DUMP=y 
> > +CONFIG_XEN=y 
> > +CONFIG_COMPAT=y 
> > +CONFIG_RANDOMIZE_BASE=y 
> > +CONFIG_HIBERNATION=y 
> > +CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y 
> > +CONFIG_ARM_CPUIDLE=y 
> > +CONFIG_ARM_PSCI_CPUIDLE=y 
> > +CONFIG_CPU_FREQ=y 
> > +CONFIG_CPU_FREQ_STAT=y 
> > +CONFIG_CPU_FREQ_GOV_POWERSAVE=m 
> > +CONFIG_CPU_FREQ_GOV_USERSPACE=y 
> > +CONFIG_CPU_FREQ_GOV_ONDEMAND=y 
> > +CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m 
> > +CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y 
> > +CONFIG_CPUFREQ_DT=y 
> > +CONFIG_ACPI_CPPC_CPUFREQ=m 
> > +CONFIG_ARM_ARMADA_37XX_CPUFREQ=y 
> > +CONFIG_ARM_SCPI_CPUFREQ=y 
> > +CONFIG_ARM_IMX_CPUFREQ_DT=m 
> > +CONFIG_ARM_RASPBERRYPI_CPUFREQ=m 
> > +CONFIG_ARM_TEGRA186_CPUFREQ=y 
> > +CONFIG_ARM_SCPI_PROTOCOL=y 
> > +CONFIG_RASPBERRYPI_FIRMWARE=y 
> > +CONFIG_INTEL_STRATIX10_SERVICE=y 
> > +CONFIG_EFI_CAPSULE_LOADER=y 
> > +CONFIG_IMX_SCU=y 
> > +CONFIG_IMX_SCU_PD=y 
> > +CONFIG_ACPI=y 
> > +CONFIG_ACPI_APEI=y 
> > +CONFIG_ACPI_APEI_GHES=y 
> > +CONFIG_ACPI_APEI_PCIEAER=y 
> > +CONFIG_ACPI_APEI_MEMORY_FAILURE=y 
> > +CONFIG_ACPI_APEI_EINJ=y 
> > +CONFIG_VIRTUALIZATION=y 
> > +CONFIG_KVM=y 
> > +CONFIG_ARM64_CRYPTO=y 
> > +CONFIG_CRYPTO_SHA1_ARM64_CE=y 
> > +CONFIG_CRYPTO_SHA2_ARM64_CE=y 
> > +CONFIG_CRYPTO_SHA512_ARM64_CE=m 
> > +CONFIG_CRYPTO_SHA3_ARM64=m 
> > +CONFIG_CRYPTO_SM3_ARM64_CE=m 
> > +CONFIG_CRYPTO_GHASH_ARM64_CE=y 
> > +CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m 
> > +CONFIG_CRYPTO_AES_ARM64_CE_CCM=y 
> > +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y 
> > +CONFIG_CRYPTO_CHACHA20_NEON=m 
> > +CONFIG_CRYPTO_AES_ARM64_BS=m 
> > +CONFIG_JUMP_LABEL=y 
> > +CONFIG_MODULES=y 
> > +CONFIG_MODULE_UNLOAD=y 
> > +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set 
> > +CONFIG_KSM=y 
> > +CONFIG_MEMORY_FAILURE=y 
> > +CONFIG_TRANSPARENT_HUGEPAGE=y 
> > +CONFIG_NET=y 
> > +CONFIG_PACKET=y 
> > +CONFIG_UNIX=y 
> > +CONFIG_INET=y 
> > +CONFIG_IP_MULTICAST=y 
> > +CONFIG_IP_PNP=y 
> > +CONFIG_IP_PNP_DHCP=y 
> > +CONFIG_IP_PNP_BOOTP=y 
> > +CONFIG_IPV6=m 
> > +CONFIG_NETFILTER=y 
> > +CONFIG_NF_CONNTRACK=m 
> > +CONFIG_NF_CONNTRACK_EVENTS=y 
> > +CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m 
> > +CONFIG_NETFILTER_XT_TARGET_LOG=m 
> > +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m 
> > +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m 
> > +CONFIG_IP_NF_IPTABLES=m 
> > +CONFIG_IP_NF_FILTER=m 
> > +CONFIG_IP_NF_TARGET_REJECT=m 
> > +CONFIG_IP_NF_NAT=m 
> > +CONFIG_IP_NF_TARGET_MASQUERADE=m 
> > +CONFIG_IP_NF_MANGLE=m 
> > +CONFIG_IP6_NF_IPTABLES=m 
> > +CONFIG_IP6_NF_FILTER=m 
> > +CONFIG_IP6_NF_TARGET_REJECT=m 
> > +CONFIG_IP6_NF_MANGLE=m 
> > +CONFIG_IP6_NF_NAT=m 
> > +CONFIG_IP6_NF_TARGET_MASQUERADE=m 
> > +CONFIG_BRIDGE=m 
> > +CONFIG_BRIDGE_VLAN_FILTERING=y 
> > +CONFIG_VLAN_8021Q=m 
> > +CONFIG_VLAN_8021Q_GVRP=y 
> > +CONFIG_VLAN_8021Q_MVRP=y 
> > +CONFIG_QRTR=m 
> > +CONFIG_QRTR_SMD=m 
> > +CONFIG_QRTR_TUN=m 
> > +CONFIG_BPF_JIT=y 
> > +CONFIG_BT=m 
> > +CONFIG_BT_HIDP=m 
> > +# CONFIG_BT_HS is not set 
> > +# CONFIG_BT_LE is not set 
> > +CONFIG_BT_LEDS=y 
> > +# CONFIG_BT_DEBUGFS is not set 
> > +CONFIG_BT_HCIBTUSB=m 
> > +CONFIG_BT_HCIUART=m 
> > +CONFIG_BT_HCIUART_LL=y 
> > +CONFIG_BT_HCIUART_BCM=y 
> > +CONFIG_CFG80211=m 
> > +CONFIG_MAC80211=m 
> > +CONFIG_MAC80211_LEDS=y 
> > +CONFIG_RFKILL=m 
> > +CONFIG_NET_9P=y 
> > +CONFIG_NET_9P_VIRTIO=y 
> > +CONFIG_PCI=y 
> > +CONFIG_PCIEPORTBUS=y 
> > +CONFIG_PCI_IOV=y 
> > +CONFIG_HOTPLUG_PCI=y 
> > +CONFIG_HOTPLUG_PCI_ACPI=y 
> > +CONFIG_PCI_AARDVARK=y 
> > +CONFIG_PCI_TEGRA=y 
> > +CONFIG_PCIE_RCAR=y 
> > +CONFIG_PCI_HOST_GENERIC=y 
> > +CONFIG_PCI_XGENE=y 
> > +CONFIG_PCIE_ALTERA=y 
> > +CONFIG_PCIE_ALTERA_MSI=y 
> > +CONFIG_PCI_HOST_THUNDER_PEM=y 
> > +CONFIG_PCI_HOST_THUNDER_ECAM=y 
> > +CONFIG_PCIE_ROCKCHIP_HOST=m 
> > +CONFIG_PCI_LAYERSCAPE=y 
> > +CONFIG_PCI_HISI=y 
> > +CONFIG_PCIE_QCOM=y 
> > +CONFIG_PCIE_ARMADA_8K=y 
> > +CONFIG_PCIE_KIRIN=y 
> > +CONFIG_PCIE_HISI_STB=y 
> > +CONFIG_PCIE_TEGRA194=m 
> > +CONFIG_DEVTMPFS=y 
> > +CONFIG_DEVTMPFS_MOUNT=y 
> > +CONFIG_FW_LOADER_USER_HELPER=y 
> > +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y 
> > +CONFIG_HISILICON_LPC=y 
> > +CONFIG_SIMPLE_PM_BUS=y 
> > +CONFIG_MTD=y 
> > +CONFIG_MTD_BLOCK=y 
> > +CONFIG_MTD_RAW_NAND=y 
> > +CONFIG_MTD_NAND_DENALI_DT=y 
> > +CONFIG_MTD_NAND_MARVELL=y 
> > +CONFIG_MTD_NAND_QCOM=y 
> > +CONFIG_MTD_SPI_NOR=y 
> > +CONFIG_BLK_DEV_LOOP=y 
> > +CONFIG_BLK_DEV_NBD=m 
> > +CONFIG_VIRTIO_BLK=y 
> > +CONFIG_BLK_DEV_NVME=m 
> > +CONFIG_SRAM=y 
> > +CONFIG_EEPROM_AT25=m 
> > +# CONFIG_SCSI_PROC_FS is not set 
> > +CONFIG_BLK_DEV_SD=y 
> > +CONFIG_SCSI_SAS_ATA=y 
> > +CONFIG_SCSI_HISI_SAS=y 
> > +CONFIG_SCSI_HISI_SAS_PCI=y 
> > +CONFIG_SCSI_MPT3SAS=m 
> > +CONFIG_SCSI_UFSHCD=y 
> > +CONFIG_SCSI_UFSHCD_PLATFORM=y 
> > +CONFIG_SCSI_UFS_QCOM=m 
> > +CONFIG_SCSI_UFS_HISI=y 
> > +CONFIG_ATA=y 
> > +CONFIG_SATA_AHCI=y 
> > +CONFIG_SATA_AHCI_PLATFORM=y 
> > +CONFIG_AHCI_CEVA=y 
> > +CONFIG_AHCI_MVEBU=y 
> > +CONFIG_AHCI_XGENE=y 
> > +CONFIG_AHCI_QORIQ=y 
> > +CONFIG_SATA_SIL24=y 
> > +CONFIG_SATA_RCAR=y 
> > +CONFIG_PATA_PLATFORM=y 
> > +CONFIG_PATA_OF_PLATFORM=y 
> > +CONFIG_MD=y 
> > +CONFIG_BLK_DEV_MD=m 
> > +CONFIG_BLK_DEV_DM=m 
> > +CONFIG_DM_MIRROR=m 
> > +CONFIG_DM_ZERO=m 
> > +CONFIG_NETDEVICES=y 
> > +CONFIG_MACVLAN=m 
> > +CONFIG_MACVTAP=m 
> > +CONFIG_TUN=y 
> > +CONFIG_VETH=m 
> > +CONFIG_VIRTIO_NET=y 
> > +CONFIG_AMD_XGBE=y 
> > +CONFIG_NET_XGENE=y 
> > +CONFIG_ATL1C=m 
> > +CONFIG_BNX2X=m 
> > +CONFIG_MACB=y 
> > +CONFIG_THUNDER_NIC_PF=y 
> > +CONFIG_FEC=y 
> > +CONFIG_HIX5HD2_GMAC=y 
> > +CONFIG_HNS_DSAF=y 
> > +CONFIG_HNS_ENET=y 
> > +CONFIG_HNS3=y 
> > +CONFIG_HNS3_HCLGE=y 
> > +CONFIG_HNS3_ENET=y 
> > +CONFIG_E1000E=y 
> > +CONFIG_IGB=y 
> > +CONFIG_IGBVF=y 
> > +CONFIG_MVNETA=y 
> > +CONFIG_MVPP2=y 
> > +CONFIG_SKY2=y 
> > +CONFIG_MLX4_EN=m 
> > +CONFIG_MLX5_CORE=m 
> > +CONFIG_MLX5_CORE_EN=y 
> > +CONFIG_QCOM_EMAC=m 
> > +CONFIG_RAVB=y 
> > +CONFIG_SMC91X=y 
> > +CONFIG_SMSC911X=y 
> > +CONFIG_SNI_AVE=y 
> > +CONFIG_SNI_NETSEC=y 
> > +CONFIG_STMMAC_ETH=m 
> > +CONFIG_MDIO_BUS_MUX_MMIOREG=y 
> > +CONFIG_AT803X_PHY=m 
> > +CONFIG_MARVELL_PHY=m 
> > +CONFIG_MARVELL_10G_PHY=m 
> > +CONFIG_MESON_GXL_PHY=m 
> > +CONFIG_MICREL_PHY=y 
> > +CONFIG_REALTEK_PHY=m 
> > +CONFIG_ROCKCHIP_PHY=y 
> > +CONFIG_USB_PEGASUS=m 
> > +CONFIG_USB_RTL8150=m 
> > +CONFIG_USB_RTL8152=m 
> > +CONFIG_USB_LAN78XX=m 
> > +CONFIG_USB_USBNET=m 
> > +CONFIG_USB_NET_DM9601=m 
> > +CONFIG_USB_NET_SR9800=m 
> > +CONFIG_USB_NET_SMSC75XX=m 
> > +CONFIG_USB_NET_SMSC95XX=m 
> > +CONFIG_USB_NET_PLUSB=m 
> > +CONFIG_USB_NET_MCS7830=m 
> > +CONFIG_ATH10K=m 
> > +CONFIG_ATH10K_PCI=m 
> > +CONFIG_BRCMFMAC=m 
> > +CONFIG_MWIFIEX=m 
> > +CONFIG_MWIFIEX_PCIE=m 
> > +CONFIG_WL18XX=m 
> > +CONFIG_WLCORE_SDIO=m 
> > +CONFIG_INPUT_EVDEV=y 
> > +CONFIG_KEYBOARD_ADC=m 
> > +CONFIG_KEYBOARD_GPIO=y 
> > +CONFIG_KEYBOARD_SNVS_PWRKEY=m 
> > +CONFIG_KEYBOARD_CROS_EC=y 
> > +CONFIG_INPUT_TOUCHSCREEN=y 
> > +CONFIG_TOUCHSCREEN_ATMEL_MXT=m 
> > +CONFIG_INPUT_MISC=y 
> > +CONFIG_INPUT_PM8941_PWRKEY=y 
> > +CONFIG_INPUT_HISI_POWERKEY=y 
> > +# CONFIG_SERIO_SERPORT is not set 
> > +CONFIG_SERIO_AMBAKMI=y 
> > +CONFIG_LEGACY_PTY_COUNT=16 
> > +CONFIG_SERIAL_8250=y 
> > +CONFIG_SERIAL_8250_CONSOLE=y 
> > +CONFIG_SERIAL_8250_EXTENDED=y 
> > +CONFIG_SERIAL_8250_SHARE_IRQ=y 
> > +CONFIG_SERIAL_8250_BCM2835AUX=y 
> > +CONFIG_SERIAL_8250_DW=y 
> > +CONFIG_SERIAL_8250_OMAP=y 
> > +CONFIG_SERIAL_8250_MT6577=y 
> > +CONFIG_SERIAL_8250_UNIPHIER=y 
> > +CONFIG_SERIAL_OF_PLATFORM=y 
> > +CONFIG_SERIAL_AMBA_PL011=y 
> > +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y 
> > +CONFIG_SERIAL_MESON=y 
> > +CONFIG_SERIAL_MESON_CONSOLE=y 
> > +CONFIG_SERIAL_SAMSUNG=y 
> > +CONFIG_SERIAL_SAMSUNG_CONSOLE=y 
> > +CONFIG_SERIAL_TEGRA=y 
> > +CONFIG_SERIAL_TEGRA_TCU=y 
> > +CONFIG_SERIAL_IMX=y 
> > +CONFIG_SERIAL_IMX_CONSOLE=y 
> > +CONFIG_SERIAL_SH_SCI=y 
> > +CONFIG_SERIAL_MSM=y 
> > +CONFIG_SERIAL_MSM_CONSOLE=y 
> > +CONFIG_SERIAL_QCOM_GENI=y 
> > +CONFIG_SERIAL_QCOM_GENI_CONSOLE=y 
> > +CONFIG_SERIAL_XILINX_PS_UART=y 
> > +CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y 
> > +CONFIG_SERIAL_FSL_LPUART=y 
> > +CONFIG_SERIAL_FSL_LPUART_CONSOLE=y 
> > +CONFIG_SERIAL_MVEBU_UART=y 
> > +CONFIG_SERIAL_DEV_BUS=y 
> > +CONFIG_VIRTIO_CONSOLE=y 
> > +CONFIG_IPMI_HANDLER=m 
> > +CONFIG_IPMI_DEVICE_INTERFACE=m 
> > +CONFIG_IPMI_SI=m 
> > +CONFIG_TCG_TPM=y 
> > +CONFIG_TCG_TIS_I2C_INFINEON=y 
> > +CONFIG_I2C_CHARDEV=y 
> > +CONFIG_I2C_MUX=y 
> > +CONFIG_I2C_MUX_PCA954x=y 
> > +CONFIG_I2C_BCM2835=m 
> > +CONFIG_I2C_DESIGNWARE_PLATFORM=y 
> > +CONFIG_I2C_GPIO=m 
> > +CONFIG_I2C_IMX=y 
> > +CONFIG_I2C_IMX_LPI2C=y 
> > +CONFIG_I2C_MESON=y 
> > +CONFIG_I2C_MV64XXX=y 
> > +CONFIG_I2C_PXA=y 
> > +CONFIG_I2C_QCOM_GENI=m 
> > +CONFIG_I2C_QUP=y 
> > +CONFIG_I2C_RK3X=y 
> > +CONFIG_I2C_SH_MOBILE=y 
> > +CONFIG_I2C_TEGRA=y 
> > +CONFIG_I2C_UNIPHIER_F=y 
> > +CONFIG_I2C_RCAR=y 
> > +CONFIG_I2C_CROS_EC_TUNNEL=y 
> > +CONFIG_SPI=y 
> > +CONFIG_SPI_ARMADA_3700=y 
> > +CONFIG_SPI_BCM2835=m 
> > +CONFIG_SPI_BCM2835AUX=m 
> > +CONFIG_SPI_NXP_FLEXSPI=y 
> > +CONFIG_SPI_IMX=m 
> > +CONFIG_SPI_MESON_SPICC=m 
> > +CONFIG_SPI_MESON_SPIFC=m 
> > +CONFIG_SPI_ORION=y 
> > +CONFIG_SPI_PL022=y 
> > +CONFIG_SPI_ROCKCHIP=y 
> > +CONFIG_SPI_QUP=y 
> > +CONFIG_SPI_S3C64XX=y 
> > +CONFIG_SPI_SUN6I=y 
> > +CONFIG_SPI_SPIDEV=m 
> > +CONFIG_SPMI=y 
> > +CONFIG_PINCTRL_SINGLE=y 
> > +CONFIG_PINCTRL_MAX77620=y 
> > +CONFIG_PINCTRL_IMX8MM=y 
> > +CONFIG_PINCTRL_IMX8MN=y 
> > +CONFIG_PINCTRL_IMX8MQ=y 
> > +CONFIG_PINCTRL_IMX8QXP=y 
> > +CONFIG_PINCTRL_IPQ8074=y 
> > +CONFIG_PINCTRL_MSM8916=y 
> > +CONFIG_PINCTRL_MSM8994=y 
> > +CONFIG_PINCTRL_MSM8996=y 
> > +CONFIG_PINCTRL_MSM8998=y 
> > +CONFIG_PINCTRL_QCS404=y 
> > +CONFIG_PINCTRL_QDF2XXX=y 
> > +CONFIG_PINCTRL_QCOM_SPMI_PMIC=y 
> > +CONFIG_PINCTRL_SDM845=y 
> > +CONFIG_PINCTRL_SM8150=y 
> > +CONFIG_GPIO_DWAPB=y 
> > +CONFIG_GPIO_MB86S7X=y 
> > +CONFIG_GPIO_PL061=y 
> > +CONFIG_GPIO_RCAR=y 
> > +CONFIG_GPIO_UNIPHIER=y 
> > +CONFIG_GPIO_XGENE=y 
> > +CONFIG_GPIO_XGENE_SB=y 
> > +CONFIG_GPIO_MAX732X=y 
> > +CONFIG_GPIO_PCA953X=y 
> > +CONFIG_GPIO_PCA953X_IRQ=y 
> > +CONFIG_GPIO_MAX77620=y 
> > +CONFIG_POWER_AVS=y 
> > +CONFIG_ROCKCHIP_IODOMAIN=y 
> > +CONFIG_POWER_RESET_MSM=y 
> > +CONFIG_POWER_RESET_XGENE=y 
> > +CONFIG_POWER_RESET_SYSCON=y 
> > +CONFIG_SYSCON_REBOOT_MODE=y 
> > +CONFIG_BATTERY_SBS=m 
> > +CONFIG_BATTERY_BQ27XXX=y 
> > +CONFIG_SENSORS_ARM_SCPI=y 
> > +CONFIG_SENSORS_LM90=m 
> > +CONFIG_SENSORS_PWM_FAN=m 
> > +CONFIG_SENSORS_RASPBERRYPI_HWMON=m 
> > +CONFIG_SENSORS_INA2XX=m 
> > +CONFIG_SENSORS_INA3221=m 
> > +CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y 
> > +CONFIG_CPU_THERMAL=y 
> > +CONFIG_THERMAL_EMULATION=y 
> > +CONFIG_QORIQ_THERMAL=m 
> > +CONFIG_ROCKCHIP_THERMAL=m 
> > +CONFIG_RCAR_THERMAL=y 
> > +CONFIG_RCAR_GEN3_THERMAL=y 
> > +CONFIG_ARMADA_THERMAL=y 
> > +CONFIG_BCM2835_THERMAL=m 
> > +CONFIG_BRCMSTB_THERMAL=m 
> > +CONFIG_EXYNOS_THERMAL=y 
> > +CONFIG_TEGRA_BPMP_THERMAL=m 
> > +CONFIG_QCOM_TSENS=y 
> > +CONFIG_UNIPHIER_THERMAL=y 
> > +CONFIG_WATCHDOG=y 
> > +CONFIG_ARM_SP805_WATCHDOG=y 
> > +CONFIG_S3C2410_WATCHDOG=y 
> > +CONFIG_DW_WATCHDOG=y 
> > +CONFIG_SUNXI_WATCHDOG=m 
> > +CONFIG_IMX2_WDT=y 
> > +CONFIG_IMX_SC_WDT=m 
> > +CONFIG_MESON_GXBB_WATCHDOG=m 
> > +CONFIG_MESON_WATCHDOG=m 
> > +CONFIG_RENESAS_WDT=y 
> > +CONFIG_UNIPHIER_WATCHDOG=y 
> > +CONFIG_BCM2835_WDT=y 
> > +CONFIG_MFD_ALTERA_SYSMGR=y 
> > +CONFIG_MFD_BD9571MWV=y 
> > +CONFIG_MFD_AXP20X_I2C=y 
> > +CONFIG_MFD_AXP20X_RSB=y 
> > +CONFIG_MFD_EXYNOS_LPASS=m 
> > +CONFIG_MFD_HI6421_PMIC=y 
> > +CONFIG_MFD_HI655X_PMIC=y 
> > +CONFIG_MFD_MAX77620=y 
> > +CONFIG_MFD_SPMI_PMIC=y 
> > +CONFIG_MFD_RK808=y 
> > +CONFIG_MFD_SEC_CORE=y 
> > +CONFIG_MFD_ROHM_BD718XX=y 
> > +CONFIG_REGULATOR_FIXED_VOLTAGE=y 
> > +CONFIG_REGULATOR_AXP20X=y 
> > +CONFIG_REGULATOR_BD718XX=y 
> > +CONFIG_REGULATOR_BD9571MWV=y 
> > +CONFIG_REGULATOR_FAN53555=y 
> > +CONFIG_REGULATOR_GPIO=y 
> > +CONFIG_REGULATOR_HI6421V530=y 
> > +CONFIG_REGULATOR_HI655X=y 
> > +CONFIG_REGULATOR_MAX77620=y 
> > +CONFIG_REGULATOR_MAX8973=y 
> > +CONFIG_REGULATOR_PFUZE100=y 
> > +CONFIG_REGULATOR_PWM=y 
> > +CONFIG_REGULATOR_QCOM_RPMH=y 
> > +CONFIG_REGULATOR_QCOM_SMD_RPM=y 
> > +CONFIG_REGULATOR_QCOM_SPMI=y 
> > +CONFIG_REGULATOR_RK808=y 
> > +CONFIG_REGULATOR_S2MPS11=y 
> > +CONFIG_REGULATOR_VCTRL=m 
> > +CONFIG_RC_CORE=m 
> > +CONFIG_RC_DECODERS=y 
> > +CONFIG_RC_DEVICES=y 
> > +CONFIG_IR_MESON=m 
> > +CONFIG_IR_SUNXI=m 
> > +CONFIG_MEDIA_SUPPORT=m 
> > +CONFIG_MEDIA_CAMERA_SUPPORT=y 
> > +CONFIG_MEDIA_ANALOG_TV_SUPPORT=y 
> > +CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y 
> > +CONFIG_MEDIA_CONTROLLER=y 
> > +CONFIG_VIDEO_V4L2_SUBDEV_API=y 
> > +# CONFIG_DVB_NET is not set 
> > +CONFIG_MEDIA_USB_SUPPORT=y 
> > +CONFIG_USB_VIDEO_CLASS=m 
> > +CONFIG_V4L_PLATFORM_DRIVERS=y 
> > +CONFIG_VIDEO_SUN6I_CSI=m 
> > +CONFIG_V4L_MEM2MEM_DRIVERS=y 
> > +CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m 
> > +CONFIG_VIDEO_SAMSUNG_S5P_MFC=m 
> > +CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m 
> > +CONFIG_VIDEO_RENESAS_FCP=m 
> > +CONFIG_VIDEO_RENESAS_VSP1=m 
> > +CONFIG_DRM=m 
> > +CONFIG_DRM_I2C_NXP_TDA998X=m 
> > +CONFIG_DRM_NOUVEAU=m 
> > +CONFIG_DRM_EXYNOS=m 
> > +CONFIG_DRM_EXYNOS5433_DECON=y 
> > +CONFIG_DRM_EXYNOS7_DECON=y 
> > +CONFIG_DRM_EXYNOS_DSI=y 
> > +# CONFIG_DRM_EXYNOS_DP is not set 
> > +CONFIG_DRM_EXYNOS_HDMI=y 
> > +CONFIG_DRM_EXYNOS_MIC=y 
> > +CONFIG_DRM_ROCKCHIP=m 
> > +CONFIG_ROCKCHIP_ANALOGIX_DP=y 
> > +CONFIG_ROCKCHIP_CDN_DP=y 
> > +CONFIG_ROCKCHIP_DW_HDMI=y 
> > +CONFIG_ROCKCHIP_DW_MIPI_DSI=y 
> > +CONFIG_ROCKCHIP_INNO_HDMI=y 
> > +CONFIG_DRM_RCAR_DU=m 
> > +CONFIG_DRM_SUN4I=m 
> > +CONFIG_DRM_SUN8I_DW_HDMI=m 
> > +CONFIG_DRM_SUN8I_MIXER=m 
> > +CONFIG_DRM_MSM=m 
> > +CONFIG_DRM_TEGRA=m 
> > +CONFIG_DRM_PANEL_SIMPLE=m 
> > +CONFIG_DRM_SII902X=m 
> > +CONFIG_DRM_I2C_ADV7511=m 
> > +CONFIG_DRM_VC4=m 
> > +CONFIG_DRM_ETNAVIV=m 
> > +CONFIG_DRM_HISI_HIBMC=m 
> > +CONFIG_DRM_HISI_KIRIN=m 
> > +CONFIG_DRM_MESON=m 
> > +CONFIG_DRM_PL111=m 
> > +CONFIG_DRM_LIMA=m 
> > +CONFIG_DRM_PANFROST=m 
> > +CONFIG_FB=y 
> > +CONFIG_FB_MODE_HELPERS=y 
> > +CONFIG_FB_EFI=y 
> > +CONFIG_BACKLIGHT_GENERIC=m 
> > +CONFIG_BACKLIGHT_PWM=m 
> > +CONFIG_BACKLIGHT_LP855X=m 
> > +CONFIG_LOGO=y 
> > +# CONFIG_LOGO_LINUX_MONO is not set 
> > +# CONFIG_LOGO_LINUX_VGA16 is not set 
> > +CONFIG_SOUND=y 
> > +CONFIG_SND=y 
> > +CONFIG_SND_HDA_TEGRA=m 
> > +CONFIG_SND_HDA_CODEC_HDMI=m 
> > +CONFIG_SND_SOC=y 
> > +CONFIG_SND_BCM2835_SOC_I2S=m 
> > +CONFIG_SND_MESON_AXG_SOUND_CARD=m 
> > +CONFIG_SND_SOC_ROCKCHIP=m 
> > +CONFIG_SND_SOC_ROCKCHIP_SPDIF=m 
> > +CONFIG_SND_SOC_ROCKCHIP_RT5645=m 
> > +CONFIG_SND_SOC_RK3399_GRU_SOUND=m 
> > +CONFIG_SND_SOC_SAMSUNG=y 
> > +CONFIG_SND_SOC_RCAR=m 
> > +CONFIG_SND_SUN4I_SPDIF=m 
> > +CONFIG_SND_SOC_AK4613=m 
> > +CONFIG_SND_SOC_ES7134=m 
> > +CONFIG_SND_SOC_ES7241=m 
> > +CONFIG_SND_SOC_PCM3168A_I2C=m 
> > +CONFIG_SND_SOC_TAS571X=m 
> > +CONFIG_SND_SIMPLE_CARD=m 
> > +CONFIG_SND_AUDIO_GRAPH_CARD=m 
> > +CONFIG_I2C_HID=m 
> > +CONFIG_USB=y 
> > +CONFIG_USB_OTG=y 
> > +CONFIG_USB_XHCI_HCD=y 
> > +CONFIG_USB_XHCI_TEGRA=y 
> > +CONFIG_USB_EHCI_HCD=y 
> > +CONFIG_USB_EHCI_EXYNOS=y 
> > +CONFIG_USB_EHCI_HCD_PLATFORM=y 
> > +CONFIG_USB_OHCI_HCD=y 
> > +CONFIG_USB_OHCI_EXYNOS=y 
> > +CONFIG_USB_OHCI_HCD_PLATFORM=y 
> > +CONFIG_USB_RENESAS_USBHS=m 
> > +CONFIG_USB_STORAGE=y 
> > +CONFIG_USB_MUSB_HDRC=y 
> > +CONFIG_USB_MUSB_SUNXI=y 
> > +CONFIG_USB_DWC3=y 
> > +CONFIG_USB_DWC2=y 
> > +CONFIG_USB_CHIPIDEA=y 
> > +CONFIG_USB_CHIPIDEA_UDC=y 
> > +CONFIG_USB_CHIPIDEA_HOST=y 
> > +CONFIG_USB_ISP1760=y 
> > +CONFIG_USB_HSIC_USB3503=y 
> > +CONFIG_NOP_USB_XCEIV=y 
> > +CONFIG_USB_ULPI=y 
> > +CONFIG_USB_GADGET=y 
> > +CONFIG_USB_RENESAS_USBHS_UDC=m 
> > +CONFIG_USB_RENESAS_USB3=m 
> > +CONFIG_TYPEC=m 
> > +CONFIG_MMC=y 
> > +CONFIG_MMC_BLOCK_MINORS=32 
> > +CONFIG_MMC_ARMMMCI=y 
> > +CONFIG_MMC_SDHCI=y 
> > +CONFIG_MMC_SDHCI_ACPI=y 
> > +CONFIG_MMC_SDHCI_PLTFM=y 
> > +CONFIG_MMC_SDHCI_OF_ARASAN=y 
> > +CONFIG_MMC_SDHCI_OF_ESDHC=y 
> > +CONFIG_MMC_SDHCI_CADENCE=y 
> > +CONFIG_MMC_SDHCI_ESDHC_IMX=y 
> > +CONFIG_MMC_SDHCI_TEGRA=y 
> > +CONFIG_MMC_SDHCI_F_SDH30=y 
> > +CONFIG_MMC_MESON_GX=y 
> > +CONFIG_MMC_SDHCI_MSM=y 
> > +CONFIG_MMC_SPI=y 
> > +CONFIG_MMC_SDHI=y 
> > +CONFIG_MMC_UNIPHIER=y 
> > +CONFIG_MMC_DW=y 
> > +CONFIG_MMC_DW_EXYNOS=y 
> > +CONFIG_MMC_DW_HI3798CV200=y 
> > +CONFIG_MMC_DW_K3=y 
> > +CONFIG_MMC_DW_ROCKCHIP=y 
> > +CONFIG_MMC_SUNXI=y 
> > +CONFIG_MMC_BCM2835=y 
> > +CONFIG_MMC_SDHCI_XENON=y 
> > +CONFIG_NEW_LEDS=y 
> > +CONFIG_LEDS_CLASS=y 
> > +CONFIG_LEDS_GPIO=y 
> > +CONFIG_LEDS_PWM=y 
> > +CONFIG_LEDS_SYSCON=y 
> > +CONFIG_LEDS_TRIGGER_DISK=y 
> > +CONFIG_LEDS_TRIGGER_HEARTBEAT=y 
> > +CONFIG_LEDS_TRIGGER_CPU=y 
> > +CONFIG_LEDS_TRIGGER_DEFAULT_ON=y 
> > +CONFIG_LEDS_TRIGGER_PANIC=y 
> > +CONFIG_EDAC=y 
> > +CONFIG_EDAC_GHES=y 
> > +CONFIG_RTC_CLASS=y 
> > +CONFIG_RTC_DRV_MAX77686=y 
> > +CONFIG_RTC_DRV_RK808=m 
> > +CONFIG_RTC_DRV_RX8581=m 
> > +CONFIG_RTC_DRV_S5M=y 
> > +CONFIG_RTC_DRV_DS3232=y 
> > +CONFIG_RTC_DRV_EFI=y 
> > +CONFIG_RTC_DRV_CROS_EC=y 
> > +CONFIG_RTC_DRV_S3C=y 
> > +CONFIG_RTC_DRV_PL031=y 
> > +CONFIG_RTC_DRV_SUN6I=y 
> > +CONFIG_RTC_DRV_ARMADA38X=y 
> > +CONFIG_RTC_DRV_TEGRA=y 
> > +CONFIG_RTC_DRV_SNVS=m 
> > +CONFIG_RTC_DRV_IMX_SC=m 
> > +CONFIG_RTC_DRV_XGENE=y 
> > +CONFIG_DMADEVICES=y 
> > +CONFIG_DMA_BCM2835=m 
> > +CONFIG_DMA_SUN6I=m 
> > +CONFIG_FSL_EDMA=y 
> > +CONFIG_IMX_SDMA=y 
> > +CONFIG_K3_DMA=y 
> > +CONFIG_MV_XOR=y 
> > +CONFIG_MV_XOR_V2=y 
> > +CONFIG_PL330_DMA=y 
> > +CONFIG_TEGRA20_APB_DMA=y 
> > +CONFIG_QCOM_BAM_DMA=y 
> > +CONFIG_QCOM_HIDMA_MGMT=y 
> > +CONFIG_QCOM_HIDMA=y 
> > +CONFIG_RCAR_DMAC=y 
> > +CONFIG_RENESAS_USB_DMAC=m 
> > +CONFIG_UIO=y 
> > +CONFIG_UIO_IVSHMEM=y 
> > +CONFIG_VFIO=y 
> > +CONFIG_VFIO_PCI=y 
> > +CONFIG_VIRT_DRIVERS=y 
> > +CONFIG_JAILHOUSE_DBGCON=y 
> > +CONFIG_VIRTIO_PCI=y 
> > +CONFIG_VIRTIO_BALLOON=y 
> > +CONFIG_VIRTIO_MMIO=y 
> > +CONFIG_XEN_GNTDEV=y 
> > +CONFIG_XEN_GRANT_DEV_ALLOC=y 
> > +CONFIG_MFD_CROS_EC=y 
> > +CONFIG_CROS_EC_I2C=y 
> > +CONFIG_CROS_EC_SPI=y 
> > +CONFIG_COMMON_CLK_RK808=y 
> > +CONFIG_COMMON_CLK_SCPI=y 
> > +CONFIG_COMMON_CLK_CS2000_CP=y 
> > +CONFIG_COMMON_CLK_S2MPS11=y 
> > +CONFIG_CLK_QORIQ=y 
> > +CONFIG_COMMON_CLK_PWM=y 
> > +CONFIG_CLK_RASPBERRYPI=m 
> > +CONFIG_CLK_IMX8MM=y 
> > +CONFIG_CLK_IMX8MN=y 
> > +CONFIG_CLK_IMX8MQ=y 
> > +CONFIG_CLK_IMX8QXP=y 
> > +CONFIG_TI_SCI_CLK=y 
> > +CONFIG_COMMON_CLK_QCOM=y 
> > +CONFIG_QCOM_A53PLL=y 
> > +CONFIG_QCOM_CLK_APCS_MSM8916=y 
> > +CONFIG_QCOM_CLK_SMD_RPM=y 
> > +CONFIG_QCOM_CLK_RPMH=y 
> > +CONFIG_IPQ_GCC_8074=y 
> > +CONFIG_MSM_GCC_8916=y 
> > +CONFIG_MSM_GCC_8994=y 
> > +CONFIG_MSM_MMCC_8996=y 
> > +CONFIG_MSM_GCC_8998=y 
> > +CONFIG_QCS_GCC_404=y 
> > +CONFIG_SDM_GCC_845=y 
> > +CONFIG_SM_GCC_8150=y 
> > +CONFIG_HWSPINLOCK=y 
> > +CONFIG_HWSPINLOCK_QCOM=y 
> > +CONFIG_ARM_MHU=y 
> > +CONFIG_IMX_MBOX=y 
> > +CONFIG_PLATFORM_MHU=y 
> > +CONFIG_BCM2835_MBOX=y 
> > +CONFIG_QCOM_APCS_IPC=y 
> > +CONFIG_ROCKCHIP_IOMMU=y 
> > +CONFIG_TEGRA_IOMMU_SMMU=y 
> > +CONFIG_ARM_SMMU=y 
> > +CONFIG_ARM_SMMU_V3=y 
> > +CONFIG_QCOM_IOMMU=y 
> > +CONFIG_REMOTEPROC=y 
> > +CONFIG_QCOM_Q6V5_MSS=m 
> > +CONFIG_QCOM_Q6V5_PAS=m 
> > +CONFIG_QCOM_SYSMON=m 
> > +CONFIG_RPMSG_QCOM_GLINK_RPM=y 
> > +CONFIG_RPMSG_QCOM_GLINK_SMEM=m 
> > +CONFIG_RPMSG_QCOM_SMD=y 
> > +CONFIG_RASPBERRYPI_POWER=y 
> > +CONFIG_IMX_SCU_SOC=y 
> > +CONFIG_QCOM_GENI_SE=y 
> > +CONFIG_QCOM_GLINK_SSR=m 
> > +CONFIG_QCOM_RPMH=y 
> > +CONFIG_QCOM_SMEM=y 
> > +CONFIG_QCOM_SMD_RPM=y 
> > +CONFIG_QCOM_SMP2P=y 
> > +CONFIG_QCOM_SMSM=y 
> > +CONFIG_ARCH_R8A774A1=y 
> > +CONFIG_ARCH_R8A774C0=y 
> > +CONFIG_ARCH_R8A7795=y 
> > +CONFIG_ARCH_R8A7796=y 
> > +CONFIG_ARCH_R8A77965=y 
> > +CONFIG_ARCH_R8A77970=y 
> > +CONFIG_ARCH_R8A77980=y 
> > +CONFIG_ARCH_R8A77990=y 
> > +CONFIG_ARCH_R8A77995=y 
> > +CONFIG_ROCKCHIP_PM_DOMAINS=y 
> > +CONFIG_ARCH_TEGRA_132_SOC=y 
> > +CONFIG_ARCH_TEGRA_210_SOC=y 
> > +CONFIG_ARCH_TEGRA_186_SOC=y 
> > +CONFIG_ARCH_TEGRA_194_SOC=y 
> > +CONFIG_ARCH_K3_AM6_SOC=y 
> > +CONFIG_ARCH_K3_J721E_SOC=y 
> > +CONFIG_TI_SCI_PM_DOMAINS=y 
> > +CONFIG_EXTCON_USB_GPIO=y 
> > +CONFIG_EXTCON_USBC_CROS_EC=y 
> > +CONFIG_MEMORY=y 
> > +CONFIG_IIO=y 
> > +CONFIG_EXYNOS_ADC=y 
> > +CONFIG_ROCKCHIP_SARADC=m 
> > +CONFIG_IIO_CROS_EC_SENSORS_CORE=m 
> > +CONFIG_IIO_CROS_EC_SENSORS=m 
> > +CONFIG_IIO_CROS_EC_LIGHT_PROX=m 
> > +CONFIG_SENSORS_ISL29018=m 
> > +CONFIG_IIO_CROS_EC_BARO=m 
> > +CONFIG_MPL3115=m 
> > +CONFIG_PWM=y 
> > +CONFIG_PWM_BCM2835=m 
> > +CONFIG_PWM_CROS_EC=m 
> > +CONFIG_PWM_MESON=m 
> > +CONFIG_PWM_RCAR=m 
> > +CONFIG_PWM_ROCKCHIP=y 
> > +CONFIG_PWM_SAMSUNG=y 
> > +CONFIG_PWM_SUN4I=m 
> > +CONFIG_PWM_TEGRA=m 
> > +CONFIG_RESET_TI_SCI=y 
> > +CONFIG_PHY_XGENE=y 
> > +CONFIG_PHY_SUN4I_USB=y 
> > +CONFIG_PHY_HI6220_USB=y 
> > +CONFIG_PHY_HISTB_COMBPHY=y 
> > +CONFIG_PHY_HISI_INNO_USB2=y 
> > +CONFIG_PHY_MVEBU_CP110_COMPHY=y 
> > +CONFIG_PHY_QCOM_QMP=m 
> > +CONFIG_PHY_QCOM_QUSB2=m 
> > +CONFIG_PHY_QCOM_USB_HS=y 
> > +CONFIG_PHY_RCAR_GEN3_PCIE=y 
> > +CONFIG_PHY_RCAR_GEN3_USB2=y 
> > +CONFIG_PHY_RCAR_GEN3_USB3=m 
> > +CONFIG_PHY_ROCKCHIP_EMMC=y 
> > +CONFIG_PHY_ROCKCHIP_INNO_HDMI=m 
> > +CONFIG_PHY_ROCKCHIP_INNO_USB2=y 
> > +CONFIG_PHY_ROCKCHIP_PCIE=m 
> > +CONFIG_PHY_ROCKCHIP_TYPEC=y 
> > +CONFIG_PHY_UNIPHIER_USB2=y 
> > +CONFIG_PHY_UNIPHIER_USB3=y 
> > +CONFIG_PHY_TEGRA_XUSB=y 
> > +CONFIG_FSL_IMX8_DDR_PMU=m 
> > +CONFIG_HISI_PMU=y 
> > +CONFIG_QCOM_L2_PMU=y 
> > +CONFIG_QCOM_L3_PMU=y 
> > +CONFIG_NVMEM_IMX_OCOTP=y 
> > +CONFIG_NVMEM_IMX_OCOTP_SCU=y 
> > +CONFIG_QCOM_QFPROM=y 
> > +CONFIG_ROCKCHIP_EFUSE=y 
> > +CONFIG_NVMEM_SUNXI_SID=y 
> > +CONFIG_UNIPHIER_EFUSE=y 
> > +CONFIG_MESON_EFUSE=m 
> > +CONFIG_FPGA=y 
> > +CONFIG_FPGA_MGR_STRATIX10_SOC=m 
> > +CONFIG_FPGA_BRIDGE=m 
> > +CONFIG_ALTERA_FREEZE_BRIDGE=m 
> > +CONFIG_FPGA_REGION=m 
> > +CONFIG_OF_FPGA_REGION=m 
> > +CONFIG_TEE=y 
> > +CONFIG_OPTEE=y 
> > +CONFIG_EXT2_FS=y 
> > +CONFIG_EXT3_FS=y 
> > +CONFIG_EXT4_FS_POSIX_ACL=y 
> > +CONFIG_BTRFS_FS=m 
> > +CONFIG_BTRFS_FS_POSIX_ACL=y 
> > +CONFIG_FANOTIFY=y 
> > +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y 
> > +CONFIG_QUOTA=y 
> > +CONFIG_AUTOFS4_FS=y 
> > +CONFIG_FUSE_FS=m 
> > +CONFIG_CUSE=m 
> > +CONFIG_OVERLAY_FS=m 
> > +CONFIG_VFAT_FS=y 
> > +CONFIG_HUGETLBFS=y 
> > +CONFIG_CONFIGFS_FS=y 
> > +CONFIG_EFIVAR_FS=y 
> > +CONFIG_SQUASHFS=y 
> > +CONFIG_NFS_FS=y 
> > +CONFIG_NFS_V4=y 
> > +CONFIG_NFS_V4_1=y 
> > +CONFIG_NFS_V4_2=y 
> > +CONFIG_ROOT_NFS=y 
> > +CONFIG_9P_FS=y 
> > +CONFIG_NLS_CODEPAGE_437=y 
> > +CONFIG_NLS_ISO8859_1=y 
> > +CONFIG_SECURITY=y 
> > +CONFIG_CRYPTO_ECHAINIV=y 
> > +CONFIG_CRYPTO_ANSI_CPRNG=y 
> > +CONFIG_CMA_SIZE_MBYTES=32 
> > +CONFIG_PRINTK_TIME=y 
> > +CONFIG_DEBUG_INFO=y 
> > +CONFIG_DEBUG_FS=y 
> > +CONFIG_MAGIC_SYSRQ=y 
> > +CONFIG_DEBUG_KERNEL=y 
> > +# CONFIG_SCHED_DEBUG is not set 
> > +# CONFIG_DEBUG_PREEMPT is not set 
> > +# CONFIG_FTRACE is not set 
> > +CONFIG_MEMTEST=y 
> > diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.inc 
> b/recipes-kernel/linux/linux-jailhouse_5.4.inc 
> > index a9e75a8..6dbf2a4 100644 
> > --- a/recipes-kernel/linux/linux-jailhouse_5.4.inc 
> > +++ b/recipes-kernel/linux/linux-jailhouse_5.4.inc 
> > @@ -13,6 +13,7 @@ require recipes-kernel/linux/linux-custom.inc 
> >   
> >   KERNEL_DEFCONFIG = "${DISTRO_ARCH}_defconfig_5.4" 
> >   KERNEL_DEFCONFIG_orangepi-zero = "orangepi-zero_defconfig_5.4" 
> > +KERNEL_DEFCONFIG_pine64-plus = "pine64-plus_defconfig_5.4" 
> >   KERNEL_DEFCONFIG_rpi4 = "rpi4_defconfig_5.4" 
> >   
> >   SRC_URI += " \ 
> > 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bb3d3927-ad61-429e-a683-bd6fdc2adeeb%40googlegroups.com.

------=_Part_3205_1103837390.1581605836662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thursday, February 13, 2020 at 7:40:17 PM UTC+5=
:30, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;=
margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 13.02=
.20 14:44, Vijai Kumar K wrote:
<br>&gt; Add defconfig for pine64-plus development board.
<br>&gt;=20
<br>
<br>Can we add the missing switches to the arm64_defconfig instead? If not,=
=20
<br>you would have to provide a different kernel (recipe) for this target,=
=20
<br>just like for the rpi4. But I don&#39;t think that should be needed.
<br></blockquote><div><br></div><div>Sure. I will try to consolidate it and=
 send it as part of v2.</div><div> <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;paddi=
ng-left: 1ex;">
<br>Jan
<br>
<br>&gt; Signed-off-by: Vijai Kumar K &lt;<a href=3D"javascript:" target=3D=
"_blank" gdf-obfuscated-mailto=3D"V7ivR3ThBQAJ" rel=3D"nofollow" onmousedow=
n=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=
=3D&#39;javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; ---
<br>&gt; =C2=A0 .../linux/files/pine64-plus_<wbr>defconfig_5.4 =C2=A0 =C2=
=A0 | 849 ++++++++++++++++++
<br>&gt; =C2=A0 recipes-kernel/linux/linux-<wbr>jailhouse_5.4.inc =C2=A0| =
=C2=A0 1 +
<br>&gt; =C2=A0 2 files changed, 850 insertions(+)
<br>&gt; =C2=A0 create mode 100644 recipes-kernel/linux/files/<wbr>pine64-p=
lus_defconfig_5.4
<br>&gt;=20
<br>&gt; diff --git a/recipes-kernel/linux/files/<wbr>pine64-plus_defconfig=
_5.4 b/recipes-kernel/linux/files/<wbr>pine64-plus_defconfig_5.4
<br>&gt; new file mode 100644
<br>&gt; index 0000000..44a01f6
<br>&gt; --- /dev/null
<br>&gt; +++ b/recipes-kernel/linux/files/<wbr>pine64-plus_defconfig_5.4
<br>&gt; @@ -0,0 +1,849 @@
<br>&gt; +CONFIG_SYSVIPC=3Dy
<br>&gt; +CONFIG_POSIX_MQUEUE=3Dy
<br>&gt; +CONFIG_AUDIT=3Dy
<br>&gt; +CONFIG_NO_HZ_IDLE=3Dy
<br>&gt; +CONFIG_HIGH_RES_TIMERS=3Dy
<br>&gt; +CONFIG_PREEMPT=3Dy
<br>&gt; +CONFIG_IRQ_TIME_ACCOUNTING=3Dy
<br>&gt; +CONFIG_BSD_PROCESS_ACCT=3Dy
<br>&gt; +CONFIG_BSD_PROCESS_ACCT_V3=3Dy
<br>&gt; +CONFIG_TASKSTATS=3Dy
<br>&gt; +CONFIG_TASK_DELAY_ACCT=3Dy
<br>&gt; +CONFIG_TASK_XACCT=3Dy
<br>&gt; +CONFIG_TASK_IO_ACCOUNTING=3Dy
<br>&gt; +CONFIG_IKCONFIG=3Dy
<br>&gt; +CONFIG_IKCONFIG_PROC=3Dy
<br>&gt; +CONFIG_NUMA_BALANCING=3Dy
<br>&gt; +CONFIG_MEMCG=3Dy
<br>&gt; +CONFIG_MEMCG_SWAP=3Dy
<br>&gt; +CONFIG_BLK_CGROUP=3Dy
<br>&gt; +CONFIG_CGROUP_PIDS=3Dy
<br>&gt; +CONFIG_CGROUP_HUGETLB=3Dy
<br>&gt; +CONFIG_CPUSETS=3Dy
<br>&gt; +CONFIG_CGROUP_DEVICE=3Dy
<br>&gt; +CONFIG_CGROUP_CPUACCT=3Dy
<br>&gt; +CONFIG_CGROUP_PERF=3Dy
<br>&gt; +CONFIG_USER_NS=3Dy
<br>&gt; +CONFIG_SCHED_AUTOGROUP=3Dy
<br>&gt; +CONFIG_BLK_DEV_INITRD=3Dy
<br>&gt; +CONFIG_KALLSYMS_ALL=3Dy
<br>&gt; +# CONFIG_COMPAT_BRK is not set
<br>&gt; +CONFIG_PROFILING=3Dy
<br>&gt; +CONFIG_ARCH_AGILEX=3Dy
<br>&gt; +CONFIG_ARCH_SUNXI=3Dy
<br>&gt; +CONFIG_ARCH_ALPINE=3Dy
<br>&gt; +CONFIG_ARCH_BCM2835=3Dy
<br>&gt; +CONFIG_ARCH_BCM_IPROC=3Dy
<br>&gt; +CONFIG_ARCH_BERLIN=3Dy
<br>&gt; +CONFIG_ARCH_BRCMSTB=3Dy
<br>&gt; +CONFIG_ARCH_EXYNOS=3Dy
<br>&gt; +CONFIG_ARCH_K3=3Dy
<br>&gt; +CONFIG_ARCH_LAYERSCAPE=3Dy
<br>&gt; +CONFIG_ARCH_LG1K=3Dy
<br>&gt; +CONFIG_ARCH_HISI=3Dy
<br>&gt; +CONFIG_ARCH_MEDIATEK=3Dy
<br>&gt; +CONFIG_ARCH_MESON=3Dy
<br>&gt; +CONFIG_ARCH_MVEBU=3Dy
<br>&gt; +CONFIG_ARCH_MXC=3Dy
<br>&gt; +CONFIG_ARCH_QCOM=3Dy
<br>&gt; +CONFIG_ARCH_RENESAS=3Dy
<br>&gt; +CONFIG_ARCH_ROCKCHIP=3Dy
<br>&gt; +CONFIG_ARCH_SEATTLE=3Dy
<br>&gt; +CONFIG_ARCH_STRATIX10=3Dy
<br>&gt; +CONFIG_ARCH_SYNQUACER=3Dy
<br>&gt; +CONFIG_ARCH_TEGRA=3Dy
<br>&gt; +CONFIG_ARCH_SPRD=3Dy
<br>&gt; +CONFIG_ARCH_THUNDER=3Dy
<br>&gt; +CONFIG_ARCH_THUNDER2=3Dy
<br>&gt; +CONFIG_ARCH_UNIPHIER=3Dy
<br>&gt; +CONFIG_ARCH_VEXPRESS=3Dy
<br>&gt; +CONFIG_ARCH_XGENE=3Dy
<br>&gt; +CONFIG_ARCH_ZX=3Dy
<br>&gt; +CONFIG_ARCH_ZYNQMP=3Dy
<br>&gt; +CONFIG_ARM64_VA_BITS_48=3Dy
<br>&gt; +CONFIG_SCHED_MC=3Dy
<br>&gt; +CONFIG_NUMA=3Dy
<br>&gt; +CONFIG_SECCOMP=3Dy
<br>&gt; +CONFIG_KEXEC=3Dy
<br>&gt; +CONFIG_CRASH_DUMP=3Dy
<br>&gt; +CONFIG_XEN=3Dy
<br>&gt; +CONFIG_COMPAT=3Dy
<br>&gt; +CONFIG_RANDOMIZE_BASE=3Dy
<br>&gt; +CONFIG_HIBERNATION=3Dy
<br>&gt; +CONFIG_WQ_POWER_EFFICIENT_<wbr>DEFAULT=3Dy
<br>&gt; +CONFIG_ARM_CPUIDLE=3Dy
<br>&gt; +CONFIG_ARM_PSCI_CPUIDLE=3Dy
<br>&gt; +CONFIG_CPU_FREQ=3Dy
<br>&gt; +CONFIG_CPU_FREQ_STAT=3Dy
<br>&gt; +CONFIG_CPU_FREQ_GOV_<wbr>POWERSAVE=3Dm
<br>&gt; +CONFIG_CPU_FREQ_GOV_<wbr>USERSPACE=3Dy
<br>&gt; +CONFIG_CPU_FREQ_GOV_ONDEMAND=3D<wbr>y
<br>&gt; +CONFIG_CPU_FREQ_GOV_<wbr>CONSERVATIVE=3Dm
<br>&gt; +CONFIG_CPU_FREQ_GOV_<wbr>SCHEDUTIL=3Dy
<br>&gt; +CONFIG_CPUFREQ_DT=3Dy
<br>&gt; +CONFIG_ACPI_CPPC_CPUFREQ=3Dm
<br>&gt; +CONFIG_ARM_ARMADA_37XX_<wbr>CPUFREQ=3Dy
<br>&gt; +CONFIG_ARM_SCPI_CPUFREQ=3Dy
<br>&gt; +CONFIG_ARM_IMX_CPUFREQ_DT=3Dm
<br>&gt; +CONFIG_ARM_RASPBERRYPI_<wbr>CPUFREQ=3Dm
<br>&gt; +CONFIG_ARM_TEGRA186_CPUFREQ=3Dy
<br>&gt; +CONFIG_ARM_SCPI_PROTOCOL=3Dy
<br>&gt; +CONFIG_RASPBERRYPI_FIRMWARE=3Dy
<br>&gt; +CONFIG_INTEL_STRATIX10_<wbr>SERVICE=3Dy
<br>&gt; +CONFIG_EFI_CAPSULE_LOADER=3Dy
<br>&gt; +CONFIG_IMX_SCU=3Dy
<br>&gt; +CONFIG_IMX_SCU_PD=3Dy
<br>&gt; +CONFIG_ACPI=3Dy
<br>&gt; +CONFIG_ACPI_APEI=3Dy
<br>&gt; +CONFIG_ACPI_APEI_GHES=3Dy
<br>&gt; +CONFIG_ACPI_APEI_PCIEAER=3Dy
<br>&gt; +CONFIG_ACPI_APEI_MEMORY_<wbr>FAILURE=3Dy
<br>&gt; +CONFIG_ACPI_APEI_EINJ=3Dy
<br>&gt; +CONFIG_VIRTUALIZATION=3Dy
<br>&gt; +CONFIG_KVM=3Dy
<br>&gt; +CONFIG_ARM64_CRYPTO=3Dy
<br>&gt; +CONFIG_CRYPTO_SHA1_ARM64_CE=3Dy
<br>&gt; +CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
<br>&gt; +CONFIG_CRYPTO_SHA512_ARM64_<wbr>CE=3Dm
<br>&gt; +CONFIG_CRYPTO_SHA3_ARM64=3Dm
<br>&gt; +CONFIG_CRYPTO_SM3_ARM64_CE=3Dm
<br>&gt; +CONFIG_CRYPTO_GHASH_ARM64_CE=3D<wbr>y
<br>&gt; +CONFIG_CRYPTO_CRCT10DIF_<wbr>ARM64_CE=3Dm
<br>&gt; +CONFIG_CRYPTO_AES_ARM64_CE_<wbr>CCM=3Dy
<br>&gt; +CONFIG_CRYPTO_AES_ARM64_CE_<wbr>BLK=3Dy
<br>&gt; +CONFIG_CRYPTO_CHACHA20_NEON=3Dm
<br>&gt; +CONFIG_CRYPTO_AES_ARM64_BS=3Dm
<br>&gt; +CONFIG_JUMP_LABEL=3Dy
<br>&gt; +CONFIG_MODULES=3Dy
<br>&gt; +CONFIG_MODULE_UNLOAD=3Dy
<br>&gt; +# CONFIG_CORE_DUMP_DEFAULT_ELF_<wbr>HEADERS is not set
<br>&gt; +CONFIG_KSM=3Dy
<br>&gt; +CONFIG_MEMORY_FAILURE=3Dy
<br>&gt; +CONFIG_TRANSPARENT_HUGEPAGE=3Dy
<br>&gt; +CONFIG_NET=3Dy
<br>&gt; +CONFIG_PACKET=3Dy
<br>&gt; +CONFIG_UNIX=3Dy
<br>&gt; +CONFIG_INET=3Dy
<br>&gt; +CONFIG_IP_MULTICAST=3Dy
<br>&gt; +CONFIG_IP_PNP=3Dy
<br>&gt; +CONFIG_IP_PNP_DHCP=3Dy
<br>&gt; +CONFIG_IP_PNP_BOOTP=3Dy
<br>&gt; +CONFIG_IPV6=3Dm
<br>&gt; +CONFIG_NETFILTER=3Dy
<br>&gt; +CONFIG_NF_CONNTRACK=3Dm
<br>&gt; +CONFIG_NF_CONNTRACK_EVENTS=3Dy
<br>&gt; +CONFIG_NETFILTER_XT_TARGET_<wbr>CHECKSUM=3Dm
<br>&gt; +CONFIG_NETFILTER_XT_TARGET_<wbr>LOG=3Dm
<br>&gt; +CONFIG_NETFILTER_XT_MATCH_<wbr>ADDRTYPE=3Dm
<br>&gt; +CONFIG_NETFILTER_XT_MATCH_<wbr>CONNTRACK=3Dm
<br>&gt; +CONFIG_IP_NF_IPTABLES=3Dm
<br>&gt; +CONFIG_IP_NF_FILTER=3Dm
<br>&gt; +CONFIG_IP_NF_TARGET_REJECT=3Dm
<br>&gt; +CONFIG_IP_NF_NAT=3Dm
<br>&gt; +CONFIG_IP_NF_TARGET_<wbr>MASQUERADE=3Dm
<br>&gt; +CONFIG_IP_NF_MANGLE=3Dm
<br>&gt; +CONFIG_IP6_NF_IPTABLES=3Dm
<br>&gt; +CONFIG_IP6_NF_FILTER=3Dm
<br>&gt; +CONFIG_IP6_NF_TARGET_REJECT=3Dm
<br>&gt; +CONFIG_IP6_NF_MANGLE=3Dm
<br>&gt; +CONFIG_IP6_NF_NAT=3Dm
<br>&gt; +CONFIG_IP6_NF_TARGET_<wbr>MASQUERADE=3Dm
<br>&gt; +CONFIG_BRIDGE=3Dm
<br>&gt; +CONFIG_BRIDGE_VLAN_FILTERING=3D<wbr>y
<br>&gt; +CONFIG_VLAN_8021Q=3Dm
<br>&gt; +CONFIG_VLAN_8021Q_GVRP=3Dy
<br>&gt; +CONFIG_VLAN_8021Q_MVRP=3Dy
<br>&gt; +CONFIG_QRTR=3Dm
<br>&gt; +CONFIG_QRTR_SMD=3Dm
<br>&gt; +CONFIG_QRTR_TUN=3Dm
<br>&gt; +CONFIG_BPF_JIT=3Dy
<br>&gt; +CONFIG_BT=3Dm
<br>&gt; +CONFIG_BT_HIDP=3Dm
<br>&gt; +# CONFIG_BT_HS is not set
<br>&gt; +# CONFIG_BT_LE is not set
<br>&gt; +CONFIG_BT_LEDS=3Dy
<br>&gt; +# CONFIG_BT_DEBUGFS is not set
<br>&gt; +CONFIG_BT_HCIBTUSB=3Dm
<br>&gt; +CONFIG_BT_HCIUART=3Dm
<br>&gt; +CONFIG_BT_HCIUART_LL=3Dy
<br>&gt; +CONFIG_BT_HCIUART_BCM=3Dy
<br>&gt; +CONFIG_CFG80211=3Dm
<br>&gt; +CONFIG_MAC80211=3Dm
<br>&gt; +CONFIG_MAC80211_LEDS=3Dy
<br>&gt; +CONFIG_RFKILL=3Dm
<br>&gt; +CONFIG_NET_9P=3Dy
<br>&gt; +CONFIG_NET_9P_VIRTIO=3Dy
<br>&gt; +CONFIG_PCI=3Dy
<br>&gt; +CONFIG_PCIEPORTBUS=3Dy
<br>&gt; +CONFIG_PCI_IOV=3Dy
<br>&gt; +CONFIG_HOTPLUG_PCI=3Dy
<br>&gt; +CONFIG_HOTPLUG_PCI_ACPI=3Dy
<br>&gt; +CONFIG_PCI_AARDVARK=3Dy
<br>&gt; +CONFIG_PCI_TEGRA=3Dy
<br>&gt; +CONFIG_PCIE_RCAR=3Dy
<br>&gt; +CONFIG_PCI_HOST_GENERIC=3Dy
<br>&gt; +CONFIG_PCI_XGENE=3Dy
<br>&gt; +CONFIG_PCIE_ALTERA=3Dy
<br>&gt; +CONFIG_PCIE_ALTERA_MSI=3Dy
<br>&gt; +CONFIG_PCI_HOST_THUNDER_PEM=3Dy
<br>&gt; +CONFIG_PCI_HOST_THUNDER_ECAM=3D<wbr>y
<br>&gt; +CONFIG_PCIE_ROCKCHIP_HOST=3Dm
<br>&gt; +CONFIG_PCI_LAYERSCAPE=3Dy
<br>&gt; +CONFIG_PCI_HISI=3Dy
<br>&gt; +CONFIG_PCIE_QCOM=3Dy
<br>&gt; +CONFIG_PCIE_ARMADA_8K=3Dy
<br>&gt; +CONFIG_PCIE_KIRIN=3Dy
<br>&gt; +CONFIG_PCIE_HISI_STB=3Dy
<br>&gt; +CONFIG_PCIE_TEGRA194=3Dm
<br>&gt; +CONFIG_DEVTMPFS=3Dy
<br>&gt; +CONFIG_DEVTMPFS_MOUNT=3Dy
<br>&gt; +CONFIG_FW_LOADER_USER_HELPER=3D<wbr>y
<br>&gt; +CONFIG_FW_LOADER_USER_HELPER_<wbr>FALLBACK=3Dy
<br>&gt; +CONFIG_HISILICON_LPC=3Dy
<br>&gt; +CONFIG_SIMPLE_PM_BUS=3Dy
<br>&gt; +CONFIG_MTD=3Dy
<br>&gt; +CONFIG_MTD_BLOCK=3Dy
<br>&gt; +CONFIG_MTD_RAW_NAND=3Dy
<br>&gt; +CONFIG_MTD_NAND_DENALI_DT=3Dy
<br>&gt; +CONFIG_MTD_NAND_MARVELL=3Dy
<br>&gt; +CONFIG_MTD_NAND_QCOM=3Dy
<br>&gt; +CONFIG_MTD_SPI_NOR=3Dy
<br>&gt; +CONFIG_BLK_DEV_LOOP=3Dy
<br>&gt; +CONFIG_BLK_DEV_NBD=3Dm
<br>&gt; +CONFIG_VIRTIO_BLK=3Dy
<br>&gt; +CONFIG_BLK_DEV_NVME=3Dm
<br>&gt; +CONFIG_SRAM=3Dy
<br>&gt; +CONFIG_EEPROM_AT25=3Dm
<br>&gt; +# CONFIG_SCSI_PROC_FS is not set
<br>&gt; +CONFIG_BLK_DEV_SD=3Dy
<br>&gt; +CONFIG_SCSI_SAS_ATA=3Dy
<br>&gt; +CONFIG_SCSI_HISI_SAS=3Dy
<br>&gt; +CONFIG_SCSI_HISI_SAS_PCI=3Dy
<br>&gt; +CONFIG_SCSI_MPT3SAS=3Dm
<br>&gt; +CONFIG_SCSI_UFSHCD=3Dy
<br>&gt; +CONFIG_SCSI_UFSHCD_PLATFORM=3Dy
<br>&gt; +CONFIG_SCSI_UFS_QCOM=3Dm
<br>&gt; +CONFIG_SCSI_UFS_HISI=3Dy
<br>&gt; +CONFIG_ATA=3Dy
<br>&gt; +CONFIG_SATA_AHCI=3Dy
<br>&gt; +CONFIG_SATA_AHCI_PLATFORM=3Dy
<br>&gt; +CONFIG_AHCI_CEVA=3Dy
<br>&gt; +CONFIG_AHCI_MVEBU=3Dy
<br>&gt; +CONFIG_AHCI_XGENE=3Dy
<br>&gt; +CONFIG_AHCI_QORIQ=3Dy
<br>&gt; +CONFIG_SATA_SIL24=3Dy
<br>&gt; +CONFIG_SATA_RCAR=3Dy
<br>&gt; +CONFIG_PATA_PLATFORM=3Dy
<br>&gt; +CONFIG_PATA_OF_PLATFORM=3Dy
<br>&gt; +CONFIG_MD=3Dy
<br>&gt; +CONFIG_BLK_DEV_MD=3Dm
<br>&gt; +CONFIG_BLK_DEV_DM=3Dm
<br>&gt; +CONFIG_DM_MIRROR=3Dm
<br>&gt; +CONFIG_DM_ZERO=3Dm
<br>&gt; +CONFIG_NETDEVICES=3Dy
<br>&gt; +CONFIG_MACVLAN=3Dm
<br>&gt; +CONFIG_MACVTAP=3Dm
<br>&gt; +CONFIG_TUN=3Dy
<br>&gt; +CONFIG_VETH=3Dm
<br>&gt; +CONFIG_VIRTIO_NET=3Dy
<br>&gt; +CONFIG_AMD_XGBE=3Dy
<br>&gt; +CONFIG_NET_XGENE=3Dy
<br>&gt; +CONFIG_ATL1C=3Dm
<br>&gt; +CONFIG_BNX2X=3Dm
<br>&gt; +CONFIG_MACB=3Dy
<br>&gt; +CONFIG_THUNDER_NIC_PF=3Dy
<br>&gt; +CONFIG_FEC=3Dy
<br>&gt; +CONFIG_HIX5HD2_GMAC=3Dy
<br>&gt; +CONFIG_HNS_DSAF=3Dy
<br>&gt; +CONFIG_HNS_ENET=3Dy
<br>&gt; +CONFIG_HNS3=3Dy
<br>&gt; +CONFIG_HNS3_HCLGE=3Dy
<br>&gt; +CONFIG_HNS3_ENET=3Dy
<br>&gt; +CONFIG_E1000E=3Dy
<br>&gt; +CONFIG_IGB=3Dy
<br>&gt; +CONFIG_IGBVF=3Dy
<br>&gt; +CONFIG_MVNETA=3Dy
<br>&gt; +CONFIG_MVPP2=3Dy
<br>&gt; +CONFIG_SKY2=3Dy
<br>&gt; +CONFIG_MLX4_EN=3Dm
<br>&gt; +CONFIG_MLX5_CORE=3Dm
<br>&gt; +CONFIG_MLX5_CORE_EN=3Dy
<br>&gt; +CONFIG_QCOM_EMAC=3Dm
<br>&gt; +CONFIG_RAVB=3Dy
<br>&gt; +CONFIG_SMC91X=3Dy
<br>&gt; +CONFIG_SMSC911X=3Dy
<br>&gt; +CONFIG_SNI_AVE=3Dy
<br>&gt; +CONFIG_SNI_NETSEC=3Dy
<br>&gt; +CONFIG_STMMAC_ETH=3Dm
<br>&gt; +CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
<br>&gt; +CONFIG_AT803X_PHY=3Dm
<br>&gt; +CONFIG_MARVELL_PHY=3Dm
<br>&gt; +CONFIG_MARVELL_10G_PHY=3Dm
<br>&gt; +CONFIG_MESON_GXL_PHY=3Dm
<br>&gt; +CONFIG_MICREL_PHY=3Dy
<br>&gt; +CONFIG_REALTEK_PHY=3Dm
<br>&gt; +CONFIG_ROCKCHIP_PHY=3Dy
<br>&gt; +CONFIG_USB_PEGASUS=3Dm
<br>&gt; +CONFIG_USB_RTL8150=3Dm
<br>&gt; +CONFIG_USB_RTL8152=3Dm
<br>&gt; +CONFIG_USB_LAN78XX=3Dm
<br>&gt; +CONFIG_USB_USBNET=3Dm
<br>&gt; +CONFIG_USB_NET_DM9601=3Dm
<br>&gt; +CONFIG_USB_NET_SR9800=3Dm
<br>&gt; +CONFIG_USB_NET_SMSC75XX=3Dm
<br>&gt; +CONFIG_USB_NET_SMSC95XX=3Dm
<br>&gt; +CONFIG_USB_NET_PLUSB=3Dm
<br>&gt; +CONFIG_USB_NET_MCS7830=3Dm
<br>&gt; +CONFIG_ATH10K=3Dm
<br>&gt; +CONFIG_ATH10K_PCI=3Dm
<br>&gt; +CONFIG_BRCMFMAC=3Dm
<br>&gt; +CONFIG_MWIFIEX=3Dm
<br>&gt; +CONFIG_MWIFIEX_PCIE=3Dm
<br>&gt; +CONFIG_WL18XX=3Dm
<br>&gt; +CONFIG_WLCORE_SDIO=3Dm
<br>&gt; +CONFIG_INPUT_EVDEV=3Dy
<br>&gt; +CONFIG_KEYBOARD_ADC=3Dm
<br>&gt; +CONFIG_KEYBOARD_GPIO=3Dy
<br>&gt; +CONFIG_KEYBOARD_SNVS_PWRKEY=3Dm
<br>&gt; +CONFIG_KEYBOARD_CROS_EC=3Dy
<br>&gt; +CONFIG_INPUT_TOUCHSCREEN=3Dy
<br>&gt; +CONFIG_TOUCHSCREEN_ATMEL_MXT=3D<wbr>m
<br>&gt; +CONFIG_INPUT_MISC=3Dy
<br>&gt; +CONFIG_INPUT_PM8941_PWRKEY=3Dy
<br>&gt; +CONFIG_INPUT_HISI_POWERKEY=3Dy
<br>&gt; +# CONFIG_SERIO_SERPORT is not set
<br>&gt; +CONFIG_SERIO_AMBAKMI=3Dy
<br>&gt; +CONFIG_LEGACY_PTY_COUNT=3D16
<br>&gt; +CONFIG_SERIAL_8250=3Dy
<br>&gt; +CONFIG_SERIAL_8250_CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_8250_EXTENDED=3Dy
<br>&gt; +CONFIG_SERIAL_8250_SHARE_IRQ=3D<wbr>y
<br>&gt; +CONFIG_SERIAL_8250_<wbr>BCM2835AUX=3Dy
<br>&gt; +CONFIG_SERIAL_8250_DW=3Dy
<br>&gt; +CONFIG_SERIAL_8250_OMAP=3Dy
<br>&gt; +CONFIG_SERIAL_8250_MT6577=3Dy
<br>&gt; +CONFIG_SERIAL_8250_UNIPHIER=3Dy
<br>&gt; +CONFIG_SERIAL_OF_PLATFORM=3Dy
<br>&gt; +CONFIG_SERIAL_AMBA_PL011=3Dy
<br>&gt; +CONFIG_SERIAL_AMBA_PL011_<wbr>CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_MESON=3Dy
<br>&gt; +CONFIG_SERIAL_MESON_CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_SAMSUNG=3Dy
<br>&gt; +CONFIG_SERIAL_SAMSUNG_<wbr>CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_TEGRA=3Dy
<br>&gt; +CONFIG_SERIAL_TEGRA_TCU=3Dy
<br>&gt; +CONFIG_SERIAL_IMX=3Dy
<br>&gt; +CONFIG_SERIAL_IMX_CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_SH_SCI=3Dy
<br>&gt; +CONFIG_SERIAL_MSM=3Dy
<br>&gt; +CONFIG_SERIAL_MSM_CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_QCOM_GENI=3Dy
<br>&gt; +CONFIG_SERIAL_QCOM_GENI_<wbr>CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_XILINX_PS_UART=3D<wbr>y
<br>&gt; +CONFIG_SERIAL_XILINX_PS_UART_<wbr>CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_FSL_LPUART=3Dy
<br>&gt; +CONFIG_SERIAL_FSL_LPUART_<wbr>CONSOLE=3Dy
<br>&gt; +CONFIG_SERIAL_MVEBU_UART=3Dy
<br>&gt; +CONFIG_SERIAL_DEV_BUS=3Dy
<br>&gt; +CONFIG_VIRTIO_CONSOLE=3Dy
<br>&gt; +CONFIG_IPMI_HANDLER=3Dm
<br>&gt; +CONFIG_IPMI_DEVICE_INTERFACE=3D<wbr>m
<br>&gt; +CONFIG_IPMI_SI=3Dm
<br>&gt; +CONFIG_TCG_TPM=3Dy
<br>&gt; +CONFIG_TCG_TIS_I2C_INFINEON=3Dy
<br>&gt; +CONFIG_I2C_CHARDEV=3Dy
<br>&gt; +CONFIG_I2C_MUX=3Dy
<br>&gt; +CONFIG_I2C_MUX_PCA954x=3Dy
<br>&gt; +CONFIG_I2C_BCM2835=3Dm
<br>&gt; +CONFIG_I2C_DESIGNWARE_<wbr>PLATFORM=3Dy
<br>&gt; +CONFIG_I2C_GPIO=3Dm
<br>&gt; +CONFIG_I2C_IMX=3Dy
<br>&gt; +CONFIG_I2C_IMX_LPI2C=3Dy
<br>&gt; +CONFIG_I2C_MESON=3Dy
<br>&gt; +CONFIG_I2C_MV64XXX=3Dy
<br>&gt; +CONFIG_I2C_PXA=3Dy
<br>&gt; +CONFIG_I2C_QCOM_GENI=3Dm
<br>&gt; +CONFIG_I2C_QUP=3Dy
<br>&gt; +CONFIG_I2C_RK3X=3Dy
<br>&gt; +CONFIG_I2C_SH_MOBILE=3Dy
<br>&gt; +CONFIG_I2C_TEGRA=3Dy
<br>&gt; +CONFIG_I2C_UNIPHIER_F=3Dy
<br>&gt; +CONFIG_I2C_RCAR=3Dy
<br>&gt; +CONFIG_I2C_CROS_EC_TUNNEL=3Dy
<br>&gt; +CONFIG_SPI=3Dy
<br>&gt; +CONFIG_SPI_ARMADA_3700=3Dy
<br>&gt; +CONFIG_SPI_BCM2835=3Dm
<br>&gt; +CONFIG_SPI_BCM2835AUX=3Dm
<br>&gt; +CONFIG_SPI_NXP_FLEXSPI=3Dy
<br>&gt; +CONFIG_SPI_IMX=3Dm
<br>&gt; +CONFIG_SPI_MESON_SPICC=3Dm
<br>&gt; +CONFIG_SPI_MESON_SPIFC=3Dm
<br>&gt; +CONFIG_SPI_ORION=3Dy
<br>&gt; +CONFIG_SPI_PL022=3Dy
<br>&gt; +CONFIG_SPI_ROCKCHIP=3Dy
<br>&gt; +CONFIG_SPI_QUP=3Dy
<br>&gt; +CONFIG_SPI_S3C64XX=3Dy
<br>&gt; +CONFIG_SPI_SUN6I=3Dy
<br>&gt; +CONFIG_SPI_SPIDEV=3Dm
<br>&gt; +CONFIG_SPMI=3Dy
<br>&gt; +CONFIG_PINCTRL_SINGLE=3Dy
<br>&gt; +CONFIG_PINCTRL_MAX77620=3Dy
<br>&gt; +CONFIG_PINCTRL_IMX8MM=3Dy
<br>&gt; +CONFIG_PINCTRL_IMX8MN=3Dy
<br>&gt; +CONFIG_PINCTRL_IMX8MQ=3Dy
<br>&gt; +CONFIG_PINCTRL_IMX8QXP=3Dy
<br>&gt; +CONFIG_PINCTRL_IPQ8074=3Dy
<br>&gt; +CONFIG_PINCTRL_MSM8916=3Dy
<br>&gt; +CONFIG_PINCTRL_MSM8994=3Dy
<br>&gt; +CONFIG_PINCTRL_MSM8996=3Dy
<br>&gt; +CONFIG_PINCTRL_MSM8998=3Dy
<br>&gt; +CONFIG_PINCTRL_QCS404=3Dy
<br>&gt; +CONFIG_PINCTRL_QDF2XXX=3Dy
<br>&gt; +CONFIG_PINCTRL_QCOM_SPMI_<wbr>PMIC=3Dy
<br>&gt; +CONFIG_PINCTRL_SDM845=3Dy
<br>&gt; +CONFIG_PINCTRL_SM8150=3Dy
<br>&gt; +CONFIG_GPIO_DWAPB=3Dy
<br>&gt; +CONFIG_GPIO_MB86S7X=3Dy
<br>&gt; +CONFIG_GPIO_PL061=3Dy
<br>&gt; +CONFIG_GPIO_RCAR=3Dy
<br>&gt; +CONFIG_GPIO_UNIPHIER=3Dy
<br>&gt; +CONFIG_GPIO_XGENE=3Dy
<br>&gt; +CONFIG_GPIO_XGENE_SB=3Dy
<br>&gt; +CONFIG_GPIO_MAX732X=3Dy
<br>&gt; +CONFIG_GPIO_PCA953X=3Dy
<br>&gt; +CONFIG_GPIO_PCA953X_IRQ=3Dy
<br>&gt; +CONFIG_GPIO_MAX77620=3Dy
<br>&gt; +CONFIG_POWER_AVS=3Dy
<br>&gt; +CONFIG_ROCKCHIP_IODOMAIN=3Dy
<br>&gt; +CONFIG_POWER_RESET_MSM=3Dy
<br>&gt; +CONFIG_POWER_RESET_XGENE=3Dy
<br>&gt; +CONFIG_POWER_RESET_SYSCON=3Dy
<br>&gt; +CONFIG_SYSCON_REBOOT_MODE=3Dy
<br>&gt; +CONFIG_BATTERY_SBS=3Dm
<br>&gt; +CONFIG_BATTERY_BQ27XXX=3Dy
<br>&gt; +CONFIG_SENSORS_ARM_SCPI=3Dy
<br>&gt; +CONFIG_SENSORS_LM90=3Dm
<br>&gt; +CONFIG_SENSORS_PWM_FAN=3Dm
<br>&gt; +CONFIG_SENSORS_RASPBERRYPI_<wbr>HWMON=3Dm
<br>&gt; +CONFIG_SENSORS_INA2XX=3Dm
<br>&gt; +CONFIG_SENSORS_INA3221=3Dm
<br>&gt; +CONFIG_THERMAL_GOV_POWER_<wbr>ALLOCATOR=3Dy
<br>&gt; +CONFIG_CPU_THERMAL=3Dy
<br>&gt; +CONFIG_THERMAL_EMULATION=3Dy
<br>&gt; +CONFIG_QORIQ_THERMAL=3Dm
<br>&gt; +CONFIG_ROCKCHIP_THERMAL=3Dm
<br>&gt; +CONFIG_RCAR_THERMAL=3Dy
<br>&gt; +CONFIG_RCAR_GEN3_THERMAL=3Dy
<br>&gt; +CONFIG_ARMADA_THERMAL=3Dy
<br>&gt; +CONFIG_BCM2835_THERMAL=3Dm
<br>&gt; +CONFIG_BRCMSTB_THERMAL=3Dm
<br>&gt; +CONFIG_EXYNOS_THERMAL=3Dy
<br>&gt; +CONFIG_TEGRA_BPMP_THERMAL=3Dm
<br>&gt; +CONFIG_QCOM_TSENS=3Dy
<br>&gt; +CONFIG_UNIPHIER_THERMAL=3Dy
<br>&gt; +CONFIG_WATCHDOG=3Dy
<br>&gt; +CONFIG_ARM_SP805_WATCHDOG=3Dy
<br>&gt; +CONFIG_S3C2410_WATCHDOG=3Dy
<br>&gt; +CONFIG_DW_WATCHDOG=3Dy
<br>&gt; +CONFIG_SUNXI_WATCHDOG=3Dm
<br>&gt; +CONFIG_IMX2_WDT=3Dy
<br>&gt; +CONFIG_IMX_SC_WDT=3Dm
<br>&gt; +CONFIG_MESON_GXBB_WATCHDOG=3Dm
<br>&gt; +CONFIG_MESON_WATCHDOG=3Dm
<br>&gt; +CONFIG_RENESAS_WDT=3Dy
<br>&gt; +CONFIG_UNIPHIER_WATCHDOG=3Dy
<br>&gt; +CONFIG_BCM2835_WDT=3Dy
<br>&gt; +CONFIG_MFD_ALTERA_SYSMGR=3Dy
<br>&gt; +CONFIG_MFD_BD9571MWV=3Dy
<br>&gt; +CONFIG_MFD_AXP20X_I2C=3Dy
<br>&gt; +CONFIG_MFD_AXP20X_RSB=3Dy
<br>&gt; +CONFIG_MFD_EXYNOS_LPASS=3Dm
<br>&gt; +CONFIG_MFD_HI6421_PMIC=3Dy
<br>&gt; +CONFIG_MFD_HI655X_PMIC=3Dy
<br>&gt; +CONFIG_MFD_MAX77620=3Dy
<br>&gt; +CONFIG_MFD_SPMI_PMIC=3Dy
<br>&gt; +CONFIG_MFD_RK808=3Dy
<br>&gt; +CONFIG_MFD_SEC_CORE=3Dy
<br>&gt; +CONFIG_MFD_ROHM_BD718XX=3Dy
<br>&gt; +CONFIG_REGULATOR_FIXED_<wbr>VOLTAGE=3Dy
<br>&gt; +CONFIG_REGULATOR_AXP20X=3Dy
<br>&gt; +CONFIG_REGULATOR_BD718XX=3Dy
<br>&gt; +CONFIG_REGULATOR_BD9571MWV=3Dy
<br>&gt; +CONFIG_REGULATOR_FAN53555=3Dy
<br>&gt; +CONFIG_REGULATOR_GPIO=3Dy
<br>&gt; +CONFIG_REGULATOR_HI6421V530=3Dy
<br>&gt; +CONFIG_REGULATOR_HI655X=3Dy
<br>&gt; +CONFIG_REGULATOR_MAX77620=3Dy
<br>&gt; +CONFIG_REGULATOR_MAX8973=3Dy
<br>&gt; +CONFIG_REGULATOR_PFUZE100=3Dy
<br>&gt; +CONFIG_REGULATOR_PWM=3Dy
<br>&gt; +CONFIG_REGULATOR_QCOM_RPMH=3Dy
<br>&gt; +CONFIG_REGULATOR_QCOM_SMD_<wbr>RPM=3Dy
<br>&gt; +CONFIG_REGULATOR_QCOM_SPMI=3Dy
<br>&gt; +CONFIG_REGULATOR_RK808=3Dy
<br>&gt; +CONFIG_REGULATOR_S2MPS11=3Dy
<br>&gt; +CONFIG_REGULATOR_VCTRL=3Dm
<br>&gt; +CONFIG_RC_CORE=3Dm
<br>&gt; +CONFIG_RC_DECODERS=3Dy
<br>&gt; +CONFIG_RC_DEVICES=3Dy
<br>&gt; +CONFIG_IR_MESON=3Dm
<br>&gt; +CONFIG_IR_SUNXI=3Dm
<br>&gt; +CONFIG_MEDIA_SUPPORT=3Dm
<br>&gt; +CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
<br>&gt; +CONFIG_MEDIA_ANALOG_TV_<wbr>SUPPORT=3Dy
<br>&gt; +CONFIG_MEDIA_DIGITAL_TV_<wbr>SUPPORT=3Dy
<br>&gt; +CONFIG_MEDIA_CONTROLLER=3Dy
<br>&gt; +CONFIG_VIDEO_V4L2_SUBDEV_API=3D<wbr>y
<br>&gt; +# CONFIG_DVB_NET is not set
<br>&gt; +CONFIG_MEDIA_USB_SUPPORT=3Dy
<br>&gt; +CONFIG_USB_VIDEO_CLASS=3Dm
<br>&gt; +CONFIG_V4L_PLATFORM_DRIVERS=3Dy
<br>&gt; +CONFIG_VIDEO_SUN6I_CSI=3Dm
<br>&gt; +CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
<br>&gt; +CONFIG_VIDEO_SAMSUNG_S5P_<wbr>JPEG=3Dm
<br>&gt; +CONFIG_VIDEO_SAMSUNG_S5P_MFC=3D<wbr>m
<br>&gt; +CONFIG_VIDEO_SAMSUNG_EXYNOS_<wbr>GSC=3Dm
<br>&gt; +CONFIG_VIDEO_RENESAS_FCP=3Dm
<br>&gt; +CONFIG_VIDEO_RENESAS_VSP1=3Dm
<br>&gt; +CONFIG_DRM=3Dm
<br>&gt; +CONFIG_DRM_I2C_NXP_TDA998X=3Dm
<br>&gt; +CONFIG_DRM_NOUVEAU=3Dm
<br>&gt; +CONFIG_DRM_EXYNOS=3Dm
<br>&gt; +CONFIG_DRM_EXYNOS5433_DECON=3Dy
<br>&gt; +CONFIG_DRM_EXYNOS7_DECON=3Dy
<br>&gt; +CONFIG_DRM_EXYNOS_DSI=3Dy
<br>&gt; +# CONFIG_DRM_EXYNOS_DP is not set
<br>&gt; +CONFIG_DRM_EXYNOS_HDMI=3Dy
<br>&gt; +CONFIG_DRM_EXYNOS_MIC=3Dy
<br>&gt; +CONFIG_DRM_ROCKCHIP=3Dm
<br>&gt; +CONFIG_ROCKCHIP_ANALOGIX_DP=3Dy
<br>&gt; +CONFIG_ROCKCHIP_CDN_DP=3Dy
<br>&gt; +CONFIG_ROCKCHIP_DW_HDMI=3Dy
<br>&gt; +CONFIG_ROCKCHIP_DW_MIPI_DSI=3Dy
<br>&gt; +CONFIG_ROCKCHIP_INNO_HDMI=3Dy
<br>&gt; +CONFIG_DRM_RCAR_DU=3Dm
<br>&gt; +CONFIG_DRM_SUN4I=3Dm
<br>&gt; +CONFIG_DRM_SUN8I_DW_HDMI=3Dm
<br>&gt; +CONFIG_DRM_SUN8I_MIXER=3Dm
<br>&gt; +CONFIG_DRM_MSM=3Dm
<br>&gt; +CONFIG_DRM_TEGRA=3Dm
<br>&gt; +CONFIG_DRM_PANEL_SIMPLE=3Dm
<br>&gt; +CONFIG_DRM_SII902X=3Dm
<br>&gt; +CONFIG_DRM_I2C_ADV7511=3Dm
<br>&gt; +CONFIG_DRM_VC4=3Dm
<br>&gt; +CONFIG_DRM_ETNAVIV=3Dm
<br>&gt; +CONFIG_DRM_HISI_HIBMC=3Dm
<br>&gt; +CONFIG_DRM_HISI_KIRIN=3Dm
<br>&gt; +CONFIG_DRM_MESON=3Dm
<br>&gt; +CONFIG_DRM_PL111=3Dm
<br>&gt; +CONFIG_DRM_LIMA=3Dm
<br>&gt; +CONFIG_DRM_PANFROST=3Dm
<br>&gt; +CONFIG_FB=3Dy
<br>&gt; +CONFIG_FB_MODE_HELPERS=3Dy
<br>&gt; +CONFIG_FB_EFI=3Dy
<br>&gt; +CONFIG_BACKLIGHT_GENERIC=3Dm
<br>&gt; +CONFIG_BACKLIGHT_PWM=3Dm
<br>&gt; +CONFIG_BACKLIGHT_LP855X=3Dm
<br>&gt; +CONFIG_LOGO=3Dy
<br>&gt; +# CONFIG_LOGO_LINUX_MONO is not set
<br>&gt; +# CONFIG_LOGO_LINUX_VGA16 is not set
<br>&gt; +CONFIG_SOUND=3Dy
<br>&gt; +CONFIG_SND=3Dy
<br>&gt; +CONFIG_SND_HDA_TEGRA=3Dm
<br>&gt; +CONFIG_SND_HDA_CODEC_HDMI=3Dm
<br>&gt; +CONFIG_SND_SOC=3Dy
<br>&gt; +CONFIG_SND_BCM2835_SOC_I2S=3Dm
<br>&gt; +CONFIG_SND_MESON_AXG_SOUND_<wbr>CARD=3Dm
<br>&gt; +CONFIG_SND_SOC_ROCKCHIP=3Dm
<br>&gt; +CONFIG_SND_SOC_ROCKCHIP_<wbr>SPDIF=3Dm
<br>&gt; +CONFIG_SND_SOC_ROCKCHIP_<wbr>RT5645=3Dm
<br>&gt; +CONFIG_SND_SOC_RK3399_GRU_<wbr>SOUND=3Dm
<br>&gt; +CONFIG_SND_SOC_SAMSUNG=3Dy
<br>&gt; +CONFIG_SND_SOC_RCAR=3Dm
<br>&gt; +CONFIG_SND_SUN4I_SPDIF=3Dm
<br>&gt; +CONFIG_SND_SOC_AK4613=3Dm
<br>&gt; +CONFIG_SND_SOC_ES7134=3Dm
<br>&gt; +CONFIG_SND_SOC_ES7241=3Dm
<br>&gt; +CONFIG_SND_SOC_PCM3168A_I2C=3Dm
<br>&gt; +CONFIG_SND_SOC_TAS571X=3Dm
<br>&gt; +CONFIG_SND_SIMPLE_CARD=3Dm
<br>&gt; +CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
<br>&gt; +CONFIG_I2C_HID=3Dm
<br>&gt; +CONFIG_USB=3Dy
<br>&gt; +CONFIG_USB_OTG=3Dy
<br>&gt; +CONFIG_USB_XHCI_HCD=3Dy
<br>&gt; +CONFIG_USB_XHCI_TEGRA=3Dy
<br>&gt; +CONFIG_USB_EHCI_HCD=3Dy
<br>&gt; +CONFIG_USB_EHCI_EXYNOS=3Dy
<br>&gt; +CONFIG_USB_EHCI_HCD_PLATFORM=3D<wbr>y
<br>&gt; +CONFIG_USB_OHCI_HCD=3Dy
<br>&gt; +CONFIG_USB_OHCI_EXYNOS=3Dy
<br>&gt; +CONFIG_USB_OHCI_HCD_PLATFORM=3D<wbr>y
<br>&gt; +CONFIG_USB_RENESAS_USBHS=3Dm
<br>&gt; +CONFIG_USB_STORAGE=3Dy
<br>&gt; +CONFIG_USB_MUSB_HDRC=3Dy
<br>&gt; +CONFIG_USB_MUSB_SUNXI=3Dy
<br>&gt; +CONFIG_USB_DWC3=3Dy
<br>&gt; +CONFIG_USB_DWC2=3Dy
<br>&gt; +CONFIG_USB_CHIPIDEA=3Dy
<br>&gt; +CONFIG_USB_CHIPIDEA_UDC=3Dy
<br>&gt; +CONFIG_USB_CHIPIDEA_HOST=3Dy
<br>&gt; +CONFIG_USB_ISP1760=3Dy
<br>&gt; +CONFIG_USB_HSIC_USB3503=3Dy
<br>&gt; +CONFIG_NOP_USB_XCEIV=3Dy
<br>&gt; +CONFIG_USB_ULPI=3Dy
<br>&gt; +CONFIG_USB_GADGET=3Dy
<br>&gt; +CONFIG_USB_RENESAS_USBHS_UDC=3D<wbr>m
<br>&gt; +CONFIG_USB_RENESAS_USB3=3Dm
<br>&gt; +CONFIG_TYPEC=3Dm
<br>&gt; +CONFIG_MMC=3Dy
<br>&gt; +CONFIG_MMC_BLOCK_MINORS=3D32
<br>&gt; +CONFIG_MMC_ARMMMCI=3Dy
<br>&gt; +CONFIG_MMC_SDHCI=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_ACPI=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_PLTFM=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_OF_ARASAN=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_OF_ESDHC=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_CADENCE=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_ESDHC_IMX=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_TEGRA=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_F_SDH30=3Dy
<br>&gt; +CONFIG_MMC_MESON_GX=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_MSM=3Dy
<br>&gt; +CONFIG_MMC_SPI=3Dy
<br>&gt; +CONFIG_MMC_SDHI=3Dy
<br>&gt; +CONFIG_MMC_UNIPHIER=3Dy
<br>&gt; +CONFIG_MMC_DW=3Dy
<br>&gt; +CONFIG_MMC_DW_EXYNOS=3Dy
<br>&gt; +CONFIG_MMC_DW_HI3798CV200=3Dy
<br>&gt; +CONFIG_MMC_DW_K3=3Dy
<br>&gt; +CONFIG_MMC_DW_ROCKCHIP=3Dy
<br>&gt; +CONFIG_MMC_SUNXI=3Dy
<br>&gt; +CONFIG_MMC_BCM2835=3Dy
<br>&gt; +CONFIG_MMC_SDHCI_XENON=3Dy
<br>&gt; +CONFIG_NEW_LEDS=3Dy
<br>&gt; +CONFIG_LEDS_CLASS=3Dy
<br>&gt; +CONFIG_LEDS_GPIO=3Dy
<br>&gt; +CONFIG_LEDS_PWM=3Dy
<br>&gt; +CONFIG_LEDS_SYSCON=3Dy
<br>&gt; +CONFIG_LEDS_TRIGGER_DISK=3Dy
<br>&gt; +CONFIG_LEDS_TRIGGER_<wbr>HEARTBEAT=3Dy
<br>&gt; +CONFIG_LEDS_TRIGGER_CPU=3Dy
<br>&gt; +CONFIG_LEDS_TRIGGER_DEFAULT_<wbr>ON=3Dy
<br>&gt; +CONFIG_LEDS_TRIGGER_PANIC=3Dy
<br>&gt; +CONFIG_EDAC=3Dy
<br>&gt; +CONFIG_EDAC_GHES=3Dy
<br>&gt; +CONFIG_RTC_CLASS=3Dy
<br>&gt; +CONFIG_RTC_DRV_MAX77686=3Dy
<br>&gt; +CONFIG_RTC_DRV_RK808=3Dm
<br>&gt; +CONFIG_RTC_DRV_RX8581=3Dm
<br>&gt; +CONFIG_RTC_DRV_S5M=3Dy
<br>&gt; +CONFIG_RTC_DRV_DS3232=3Dy
<br>&gt; +CONFIG_RTC_DRV_EFI=3Dy
<br>&gt; +CONFIG_RTC_DRV_CROS_EC=3Dy
<br>&gt; +CONFIG_RTC_DRV_S3C=3Dy
<br>&gt; +CONFIG_RTC_DRV_PL031=3Dy
<br>&gt; +CONFIG_RTC_DRV_SUN6I=3Dy
<br>&gt; +CONFIG_RTC_DRV_ARMADA38X=3Dy
<br>&gt; +CONFIG_RTC_DRV_TEGRA=3Dy
<br>&gt; +CONFIG_RTC_DRV_SNVS=3Dm
<br>&gt; +CONFIG_RTC_DRV_IMX_SC=3Dm
<br>&gt; +CONFIG_RTC_DRV_XGENE=3Dy
<br>&gt; +CONFIG_DMADEVICES=3Dy
<br>&gt; +CONFIG_DMA_BCM2835=3Dm
<br>&gt; +CONFIG_DMA_SUN6I=3Dm
<br>&gt; +CONFIG_FSL_EDMA=3Dy
<br>&gt; +CONFIG_IMX_SDMA=3Dy
<br>&gt; +CONFIG_K3_DMA=3Dy
<br>&gt; +CONFIG_MV_XOR=3Dy
<br>&gt; +CONFIG_MV_XOR_V2=3Dy
<br>&gt; +CONFIG_PL330_DMA=3Dy
<br>&gt; +CONFIG_TEGRA20_APB_DMA=3Dy
<br>&gt; +CONFIG_QCOM_BAM_DMA=3Dy
<br>&gt; +CONFIG_QCOM_HIDMA_MGMT=3Dy
<br>&gt; +CONFIG_QCOM_HIDMA=3Dy
<br>&gt; +CONFIG_RCAR_DMAC=3Dy
<br>&gt; +CONFIG_RENESAS_USB_DMAC=3Dm
<br>&gt; +CONFIG_UIO=3Dy
<br>&gt; +CONFIG_UIO_IVSHMEM=3Dy
<br>&gt; +CONFIG_VFIO=3Dy
<br>&gt; +CONFIG_VFIO_PCI=3Dy
<br>&gt; +CONFIG_VIRT_DRIVERS=3Dy
<br>&gt; +CONFIG_JAILHOUSE_DBGCON=3Dy
<br>&gt; +CONFIG_VIRTIO_PCI=3Dy
<br>&gt; +CONFIG_VIRTIO_BALLOON=3Dy
<br>&gt; +CONFIG_VIRTIO_MMIO=3Dy
<br>&gt; +CONFIG_XEN_GNTDEV=3Dy
<br>&gt; +CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
<br>&gt; +CONFIG_MFD_CROS_EC=3Dy
<br>&gt; +CONFIG_CROS_EC_I2C=3Dy
<br>&gt; +CONFIG_CROS_EC_SPI=3Dy
<br>&gt; +CONFIG_COMMON_CLK_RK808=3Dy
<br>&gt; +CONFIG_COMMON_CLK_SCPI=3Dy
<br>&gt; +CONFIG_COMMON_CLK_CS2000_CP=3Dy
<br>&gt; +CONFIG_COMMON_CLK_S2MPS11=3Dy
<br>&gt; +CONFIG_CLK_QORIQ=3Dy
<br>&gt; +CONFIG_COMMON_CLK_PWM=3Dy
<br>&gt; +CONFIG_CLK_RASPBERRYPI=3Dm
<br>&gt; +CONFIG_CLK_IMX8MM=3Dy
<br>&gt; +CONFIG_CLK_IMX8MN=3Dy
<br>&gt; +CONFIG_CLK_IMX8MQ=3Dy
<br>&gt; +CONFIG_CLK_IMX8QXP=3Dy
<br>&gt; +CONFIG_TI_SCI_CLK=3Dy
<br>&gt; +CONFIG_COMMON_CLK_QCOM=3Dy
<br>&gt; +CONFIG_QCOM_A53PLL=3Dy
<br>&gt; +CONFIG_QCOM_CLK_APCS_MSM8916=3D<wbr>y
<br>&gt; +CONFIG_QCOM_CLK_SMD_RPM=3Dy
<br>&gt; +CONFIG_QCOM_CLK_RPMH=3Dy
<br>&gt; +CONFIG_IPQ_GCC_8074=3Dy
<br>&gt; +CONFIG_MSM_GCC_8916=3Dy
<br>&gt; +CONFIG_MSM_GCC_8994=3Dy
<br>&gt; +CONFIG_MSM_MMCC_8996=3Dy
<br>&gt; +CONFIG_MSM_GCC_8998=3Dy
<br>&gt; +CONFIG_QCS_GCC_404=3Dy
<br>&gt; +CONFIG_SDM_GCC_845=3Dy
<br>&gt; +CONFIG_SM_GCC_8150=3Dy
<br>&gt; +CONFIG_HWSPINLOCK=3Dy
<br>&gt; +CONFIG_HWSPINLOCK_QCOM=3Dy
<br>&gt; +CONFIG_ARM_MHU=3Dy
<br>&gt; +CONFIG_IMX_MBOX=3Dy
<br>&gt; +CONFIG_PLATFORM_MHU=3Dy
<br>&gt; +CONFIG_BCM2835_MBOX=3Dy
<br>&gt; +CONFIG_QCOM_APCS_IPC=3Dy
<br>&gt; +CONFIG_ROCKCHIP_IOMMU=3Dy
<br>&gt; +CONFIG_TEGRA_IOMMU_SMMU=3Dy
<br>&gt; +CONFIG_ARM_SMMU=3Dy
<br>&gt; +CONFIG_ARM_SMMU_V3=3Dy
<br>&gt; +CONFIG_QCOM_IOMMU=3Dy
<br>&gt; +CONFIG_REMOTEPROC=3Dy
<br>&gt; +CONFIG_QCOM_Q6V5_MSS=3Dm
<br>&gt; +CONFIG_QCOM_Q6V5_PAS=3Dm
<br>&gt; +CONFIG_QCOM_SYSMON=3Dm
<br>&gt; +CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
<br>&gt; +CONFIG_RPMSG_QCOM_GLINK_SMEM=3D<wbr>m
<br>&gt; +CONFIG_RPMSG_QCOM_SMD=3Dy
<br>&gt; +CONFIG_RASPBERRYPI_POWER=3Dy
<br>&gt; +CONFIG_IMX_SCU_SOC=3Dy
<br>&gt; +CONFIG_QCOM_GENI_SE=3Dy
<br>&gt; +CONFIG_QCOM_GLINK_SSR=3Dm
<br>&gt; +CONFIG_QCOM_RPMH=3Dy
<br>&gt; +CONFIG_QCOM_SMEM=3Dy
<br>&gt; +CONFIG_QCOM_SMD_RPM=3Dy
<br>&gt; +CONFIG_QCOM_SMP2P=3Dy
<br>&gt; +CONFIG_QCOM_SMSM=3Dy
<br>&gt; +CONFIG_ARCH_R8A774A1=3Dy
<br>&gt; +CONFIG_ARCH_R8A774C0=3Dy
<br>&gt; +CONFIG_ARCH_R8A7795=3Dy
<br>&gt; +CONFIG_ARCH_R8A7796=3Dy
<br>&gt; +CONFIG_ARCH_R8A77965=3Dy
<br>&gt; +CONFIG_ARCH_R8A77970=3Dy
<br>&gt; +CONFIG_ARCH_R8A77980=3Dy
<br>&gt; +CONFIG_ARCH_R8A77990=3Dy
<br>&gt; +CONFIG_ARCH_R8A77995=3Dy
<br>&gt; +CONFIG_ROCKCHIP_PM_DOMAINS=3Dy
<br>&gt; +CONFIG_ARCH_TEGRA_132_SOC=3Dy
<br>&gt; +CONFIG_ARCH_TEGRA_210_SOC=3Dy
<br>&gt; +CONFIG_ARCH_TEGRA_186_SOC=3Dy
<br>&gt; +CONFIG_ARCH_TEGRA_194_SOC=3Dy
<br>&gt; +CONFIG_ARCH_K3_AM6_SOC=3Dy
<br>&gt; +CONFIG_ARCH_K3_J721E_SOC=3Dy
<br>&gt; +CONFIG_TI_SCI_PM_DOMAINS=3Dy
<br>&gt; +CONFIG_EXTCON_USB_GPIO=3Dy
<br>&gt; +CONFIG_EXTCON_USBC_CROS_EC=3Dy
<br>&gt; +CONFIG_MEMORY=3Dy
<br>&gt; +CONFIG_IIO=3Dy
<br>&gt; +CONFIG_EXYNOS_ADC=3Dy
<br>&gt; +CONFIG_ROCKCHIP_SARADC=3Dm
<br>&gt; +CONFIG_IIO_CROS_EC_SENSORS_<wbr>CORE=3Dm
<br>&gt; +CONFIG_IIO_CROS_EC_SENSORS=3Dm
<br>&gt; +CONFIG_IIO_CROS_EC_LIGHT_<wbr>PROX=3Dm
<br>&gt; +CONFIG_SENSORS_ISL29018=3Dm
<br>&gt; +CONFIG_IIO_CROS_EC_BARO=3Dm
<br>&gt; +CONFIG_MPL3115=3Dm
<br>&gt; +CONFIG_PWM=3Dy
<br>&gt; +CONFIG_PWM_BCM2835=3Dm
<br>&gt; +CONFIG_PWM_CROS_EC=3Dm
<br>&gt; +CONFIG_PWM_MESON=3Dm
<br>&gt; +CONFIG_PWM_RCAR=3Dm
<br>&gt; +CONFIG_PWM_ROCKCHIP=3Dy
<br>&gt; +CONFIG_PWM_SAMSUNG=3Dy
<br>&gt; +CONFIG_PWM_SUN4I=3Dm
<br>&gt; +CONFIG_PWM_TEGRA=3Dm
<br>&gt; +CONFIG_RESET_TI_SCI=3Dy
<br>&gt; +CONFIG_PHY_XGENE=3Dy
<br>&gt; +CONFIG_PHY_SUN4I_USB=3Dy
<br>&gt; +CONFIG_PHY_HI6220_USB=3Dy
<br>&gt; +CONFIG_PHY_HISTB_COMBPHY=3Dy
<br>&gt; +CONFIG_PHY_HISI_INNO_USB2=3Dy
<br>&gt; +CONFIG_PHY_MVEBU_CP110_<wbr>COMPHY=3Dy
<br>&gt; +CONFIG_PHY_QCOM_QMP=3Dm
<br>&gt; +CONFIG_PHY_QCOM_QUSB2=3Dm
<br>&gt; +CONFIG_PHY_QCOM_USB_HS=3Dy
<br>&gt; +CONFIG_PHY_RCAR_GEN3_PCIE=3Dy
<br>&gt; +CONFIG_PHY_RCAR_GEN3_USB2=3Dy
<br>&gt; +CONFIG_PHY_RCAR_GEN3_USB3=3Dm
<br>&gt; +CONFIG_PHY_ROCKCHIP_EMMC=3Dy
<br>&gt; +CONFIG_PHY_ROCKCHIP_INNO_<wbr>HDMI=3Dm
<br>&gt; +CONFIG_PHY_ROCKCHIP_INNO_<wbr>USB2=3Dy
<br>&gt; +CONFIG_PHY_ROCKCHIP_PCIE=3Dm
<br>&gt; +CONFIG_PHY_ROCKCHIP_TYPEC=3Dy
<br>&gt; +CONFIG_PHY_UNIPHIER_USB2=3Dy
<br>&gt; +CONFIG_PHY_UNIPHIER_USB3=3Dy
<br>&gt; +CONFIG_PHY_TEGRA_XUSB=3Dy
<br>&gt; +CONFIG_FSL_IMX8_DDR_PMU=3Dm
<br>&gt; +CONFIG_HISI_PMU=3Dy
<br>&gt; +CONFIG_QCOM_L2_PMU=3Dy
<br>&gt; +CONFIG_QCOM_L3_PMU=3Dy
<br>&gt; +CONFIG_NVMEM_IMX_OCOTP=3Dy
<br>&gt; +CONFIG_NVMEM_IMX_OCOTP_SCU=3Dy
<br>&gt; +CONFIG_QCOM_QFPROM=3Dy
<br>&gt; +CONFIG_ROCKCHIP_EFUSE=3Dy
<br>&gt; +CONFIG_NVMEM_SUNXI_SID=3Dy
<br>&gt; +CONFIG_UNIPHIER_EFUSE=3Dy
<br>&gt; +CONFIG_MESON_EFUSE=3Dm
<br>&gt; +CONFIG_FPGA=3Dy
<br>&gt; +CONFIG_FPGA_MGR_STRATIX10_<wbr>SOC=3Dm
<br>&gt; +CONFIG_FPGA_BRIDGE=3Dm
<br>&gt; +CONFIG_ALTERA_FREEZE_BRIDGE=3Dm
<br>&gt; +CONFIG_FPGA_REGION=3Dm
<br>&gt; +CONFIG_OF_FPGA_REGION=3Dm
<br>&gt; +CONFIG_TEE=3Dy
<br>&gt; +CONFIG_OPTEE=3Dy
<br>&gt; +CONFIG_EXT2_FS=3Dy
<br>&gt; +CONFIG_EXT3_FS=3Dy
<br>&gt; +CONFIG_EXT4_FS_POSIX_ACL=3Dy
<br>&gt; +CONFIG_BTRFS_FS=3Dm
<br>&gt; +CONFIG_BTRFS_FS_POSIX_ACL=3Dy
<br>&gt; +CONFIG_FANOTIFY=3Dy
<br>&gt; +CONFIG_FANOTIFY_ACCESS_<wbr>PERMISSIONS=3Dy
<br>&gt; +CONFIG_QUOTA=3Dy
<br>&gt; +CONFIG_AUTOFS4_FS=3Dy
<br>&gt; +CONFIG_FUSE_FS=3Dm
<br>&gt; +CONFIG_CUSE=3Dm
<br>&gt; +CONFIG_OVERLAY_FS=3Dm
<br>&gt; +CONFIG_VFAT_FS=3Dy
<br>&gt; +CONFIG_HUGETLBFS=3Dy
<br>&gt; +CONFIG_CONFIGFS_FS=3Dy
<br>&gt; +CONFIG_EFIVAR_FS=3Dy
<br>&gt; +CONFIG_SQUASHFS=3Dy
<br>&gt; +CONFIG_NFS_FS=3Dy
<br>&gt; +CONFIG_NFS_V4=3Dy
<br>&gt; +CONFIG_NFS_V4_1=3Dy
<br>&gt; +CONFIG_NFS_V4_2=3Dy
<br>&gt; +CONFIG_ROOT_NFS=3Dy
<br>&gt; +CONFIG_9P_FS=3Dy
<br>&gt; +CONFIG_NLS_CODEPAGE_437=3Dy
<br>&gt; +CONFIG_NLS_ISO8859_1=3Dy
<br>&gt; +CONFIG_SECURITY=3Dy
<br>&gt; +CONFIG_CRYPTO_ECHAINIV=3Dy
<br>&gt; +CONFIG_CRYPTO_ANSI_CPRNG=3Dy
<br>&gt; +CONFIG_CMA_SIZE_MBYTES=3D32
<br>&gt; +CONFIG_PRINTK_TIME=3Dy
<br>&gt; +CONFIG_DEBUG_INFO=3Dy
<br>&gt; +CONFIG_DEBUG_FS=3Dy
<br>&gt; +CONFIG_MAGIC_SYSRQ=3Dy
<br>&gt; +CONFIG_DEBUG_KERNEL=3Dy
<br>&gt; +# CONFIG_SCHED_DEBUG is not set
<br>&gt; +# CONFIG_DEBUG_PREEMPT is not set
<br>&gt; +# CONFIG_FTRACE is not set
<br>&gt; +CONFIG_MEMTEST=3Dy
<br>&gt; diff --git a/recipes-kernel/linux/linux-<wbr>jailhouse_5.4.inc b/r=
ecipes-kernel/linux/linux-<wbr>jailhouse_5.4.inc
<br>&gt; index a9e75a8..6dbf2a4 100644
<br>&gt; --- a/recipes-kernel/linux/linux-<wbr>jailhouse_5.4.inc
<br>&gt; +++ b/recipes-kernel/linux/linux-<wbr>jailhouse_5.4.inc
<br>&gt; @@ -13,6 +13,7 @@ require recipes-kernel/linux/linux-<wbr>custom.i=
nc
<br>&gt; =C2=A0=20
<br>&gt; =C2=A0 KERNEL_DEFCONFIG =3D &quot;${DISTRO_ARCH}_defconfig_5.4&quo=
t;
<br>&gt; =C2=A0 KERNEL_DEFCONFIG_orangepi-zero =3D &quot;orangepi-zero_defc=
onfig_5.4&quot;
<br>&gt; +KERNEL_DEFCONFIG_pine64-plus =3D &quot;pine64-plus_defconfig_5.4&=
quot;
<br>&gt; =C2=A0 KERNEL_DEFCONFIG_rpi4 =3D &quot;rpi4_defconfig_5.4&quot;
<br>&gt; =C2=A0=20
<br>&gt; =C2=A0 SRC_URI +=3D &quot; \
<br>&gt;=20
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bb3d3927-ad61-429e-a683-bd6fdc2adeeb%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/bb3d3927-ad61-429e-a683-bd6fdc2adeeb%40googlegroups.com<=
/a>.<br />

------=_Part_3205_1103837390.1581605836662--

------=_Part_3204_1715541322.1581605836659--
