Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB413D7FC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id c4sf1028347wmb.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170891; cv=pass;
        d=google.com; s=arc-20160816;
        b=tqM39h1IAFxs25vT2jW+B4kBWG/sOtYikXb11pGlHF8axwezpbrmjv0vjmw/eZUHMO
         19KaxF6WaSg1lRHDxsKombSBqFflGfD9o/+ULmjI4Lq4fP7efFPUs+w8swlRK2cJqkPY
         Gxfbhq8XpF6dcQQKfZA/kCrFJtowpLQ2T+6GlSf3PiPdmdB1rz+38G9n/g/UL3T+K5N6
         2pn8HVMzXbAmu2gKyy8YXMSP7ymZmH05XFRmEZu0nHu74RjwEar/ZRtorJmLTC9/ePYQ
         B79IPK+sajl0Z4mPAkPji+vkX1+r+sf1YhGEDosLMphktJ3EUBOoeKabJr+Pu1dwHLVn
         C6+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=5wo/iEqjZH1GCiY2fnsxH/ijLkVHR7lA27NxPIbz4kY=;
        b=fnEOFhonb+4zH73zmOhpw8Bb7Fdz4B3T04K+j1z2Zfyf1kmrWddkQGlYGlCJ9T8Gl+
         dHFmp0CTBj8ob7ojKvd3M2jhuGRxKoBKV7+hOHnS9gwZWMpe/K/tzR9f//GtAGZhHb5p
         mOu1FI19q12NdfQRMgcFcnmGkRm8tla1WxpJxjljEdER+kFeCRUPgdRKIz6OD/xX8gpa
         GLVC5nimJhxQkcWPzv0xCsNxCgOTp9ogcz4FMGOqQxcsemcZmNE8d7xM4w6BivvQ4Lt2
         euR1fhfhmDCFqhG4VC+x1Dlo6ukm6Mtqcn/UWafxGiiwsKuo1Hi4zDmNs2RuwD2EkLJa
         FNmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5wo/iEqjZH1GCiY2fnsxH/ijLkVHR7lA27NxPIbz4kY=;
        b=hT1cTpNomrtjqEmoE225j8QhuJYVdMwxXSGECqzS86xIzLbP2pDNQ8W/eToHAeKXBy
         6kbjHk72XjmNs+jAp2Rm5lVCPdDEsUxueN8xKah82X6x3LkfhwqSuZ/qCEiYqnV6+6k1
         R5kl6oRRj1Mffym36eX94r39JJpBLAaYd8OBglju+cHS7/Hh40QA8QDEJiSfo0dHyQYZ
         rYjl52aEnliXLi5G56O4xylje2ZEkPFfF4CGxCNGR+FyozqWIzLLqd3u2l75/Z7A27Kk
         OQUXTGbTIOaDj2mcloaPaFB3wQKHfMLJlACF/c2Yh92EdUWhjS6s8YBgBOvx4xW9+dg8
         Y7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5wo/iEqjZH1GCiY2fnsxH/ijLkVHR7lA27NxPIbz4kY=;
        b=mZPFN9m+CXY7TDfrO4wMebUrrYrClufJ+gLTBzGOl30//nWlS9D9cbVOuU6TPDns4M
         +oNhelEdMwuKbPMy6ZcUmj6wNwK1nkxOaT6bwvigEWPVrt5bydVP8fTiShjfEbMCJr50
         F/d4fjvt0C0aNO/qxzPDCCErAbQRPdnehonXplSa7YCuwU/LS+PDiZp325355PkDJyIQ
         ZJI+9HuAevRwGBGH1IjkiBwv2T5wuAxyxdOPqYsDlWkIdFOFIUK/t8LcmEu1nPmJyFge
         K0+vkTLb/WyyYw1iwNmYfJsbtamWEtcfGl+SMJqXhfHhmJ/fvIjlUpEzGYi//AiQgIOU
         zPFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVA2kfE7H8mqBc/Qg8rnqJVw0kZZjeRDtqHhVCnyBiIxbMi+rEn
	FJETQb2D9kGS2EAuN5+G8Mw=
X-Google-Smtp-Source: APXvYqxvpicj1zpDzcSSEjhK1lYbt6mMeY9DgA1MSB8BMovCPi0ATg204lTLac1vkVEH2WyN7IasUA==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr2561375wrp.236.1579170891084;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls7778818wrs.9.gmail; Thu, 16 Jan
 2020 02:34:50 -0800 (PST)
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr2605546wrr.312.1579170890291;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=uRKkl1aFY9VH0eFbCXXLLgp0crg5cuUfj5/Rt9GVc7LcXvoLV4+OUjBPtURYHbZ7Ox
         pNVkA3OzIrN2wB/BUoNexQKa5kC4WNUtAVlKHSSd7hSPpkEZaLJguxqpEFCWygpGPHGq
         i+yqKcT9NT2irbcyIHXzyzdg0eFkNo4e3UnPduzVkUL7B8b3h/iRHkm1pWclq+1hfZ9h
         IW0GeHp24WLh2D8v7h6rIy6D8ObEdAmkx/GIg1ncu5RiwW/QCFEtAuENoF4voAFnSYAz
         sLvxZHYQd7YsiIDxD6ULK29AXfiRsO+aMqtLafhVFE/ksT3Q89BrfwbakASDY0KipNVs
         LMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=o9N6c3CyZ4lH8qGvfUQtu5JzOZjVAGgwQSilw2GMjsA=;
        b=KDRNC50KL7XNb6MwGMR2xhd9AeW/tDZdPYVfT4mSQb+zWVFSx4ioQpZI9XU1AOAV87
         4vAp/+P7G8apIWeYmLsrBmi7wRngx4J+xI6ytcZKRAh54DHqbuCY++G5bAhmib2SWXG8
         db+Zc33MvHFfzuJtg1NOQjUDB6H8tVJp7FroGJ2TlgDEkziBj2BXTGapRVp9MJtO/sWH
         0vPQaaV9WR7z2oQU25jwFZjXbFJyHQVvZRik9d1OJxRFIAgMPnJHHCozDVhUFSiiNq5B
         YsacqT3Yf4jqs/K6M4gefd6GvextEuaMkP9E5EZ8Y4hmYpuDeu2tf7A9J8u2w2a1Oams
         Ef+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m2si430147wmi.3.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00GAYnPq029238
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQK031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 10/18] linux-jailhouse: Update to 5.4
Date: Thu, 16 Jan 2020 11:34:39 +0100
Message-Id: <0dacdb1e0eedca081a6fb0b5333b0d3343019711.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Move to 5.4-based kernel which is also needed for supporting latest
Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../{amd64_defconfig_4.19 => amd64_defconfig_5.4}  | 28 ++++--------
 .../{arm64_defconfig_4.19 => arm64_defconfig_5.4}  | 51 +++++++++-------------
 ..._defconfig_4.19 => orangepi-zero_defconfig_5.4} | 10 ++---
 recipes-kernel/linux/files/preempt-rt.cfg          |  2 +-
 .../linux/linux-jailhouse-rt_4.19.72-rt26.bb       | 17 --------
 .../linux/linux-jailhouse-rt_5.4.5-rt3.bb          | 17 ++++++++
 recipes-kernel/linux/linux-jailhouse_4.19.81.bb    | 15 -------
 recipes-kernel/linux/linux-jailhouse_5.4.7.bb      | 15 +++++++
 ...-jailhouse_4.19.inc => linux-jailhouse_5.4.inc} |  6 +--
 9 files changed, 67 insertions(+), 94 deletions(-)
 rename recipes-kernel/linux/files/{amd64_defconfig_4.19 => amd64_defconfig_5.4} (93%)
 rename recipes-kernel/linux/files/{arm64_defconfig_4.19 => arm64_defconfig_5.4} (96%)
 rename recipes-kernel/linux/files/{orangepi-zero_defconfig_4.19 => orangepi-zero_defconfig_5.4} (97%)
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_4.19.81.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.7.bb
 rename recipes-kernel/linux/{linux-jailhouse_4.19.inc => linux-jailhouse_5.4.inc} (78%)

diff --git a/recipes-kernel/linux/files/amd64_defconfig_4.19 b/recipes-kernel/linux/files/amd64_defconfig_5.4
similarity index 93%
rename from recipes-kernel/linux/files/amd64_defconfig_4.19
rename to recipes-kernel/linux/files/amd64_defconfig_5.4
index d76215b..9c2a00d 100644
--- a/recipes-kernel/linux/files/amd64_defconfig_4.19
+++ b/recipes-kernel/linux/files/amd64_defconfig_5.4
@@ -66,11 +66,6 @@ CONFIG_ACPI_FAN=m
 CONFIG_ACPI_DOCK=y
 CONFIG_ACPI_APEI=y
 CONFIG_CPU_IDLE_GOV_LADDER=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_HOTPLUG_PCI_PCIE=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_HOTPLUG_PCI_ACPI=y
-CONFIG_HOTPLUG_PCI_CPCI=y
 # CONFIG_ISA_DMA_API is not set
 CONFIG_IA32_EMULATION=y
 # CONFIG_VIRTUALIZATION is not set
@@ -80,9 +75,9 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
+# CONFIG_UNUSED_SYMBOLS is not set
 CONFIG_BLK_DEV_BSGLIB=y
 CONFIG_BLK_DEV_INTEGRITY=y
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_CMA=y
@@ -101,14 +96,8 @@ CONFIG_IP_MROUTE=y
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 CONFIG_TCP_MD5SIG=y
 CONFIG_IPV6=m
-# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET6_XFRM_MODE_BEET is not set
 # CONFIG_IPV6_SIT is not set
 CONFIG_NETFILTER=y
 CONFIG_NF_CONNTRACK=m
@@ -141,13 +130,17 @@ CONFIG_MAC80211=m
 CONFIG_MAC80211_MESH=y
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_ACPI=y
+CONFIG_HOTPLUG_PCI_CPCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65536
 CONFIG_VIRTIO_BLK=y
-# CONFIG_SCSI_MQ_DEFAULT is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=m
 CONFIG_SCSI_CONSTANTS=y
@@ -155,7 +148,7 @@ CONFIG_SCSI_LOGGING=y
 CONFIG_SCSI_SCAN_ASYNC=y
 CONFIG_SCSI_VIRTIO=m
 CONFIG_ATA=y
-CONFIG_SATA_AHCI=m
+CONFIG_SATA_AHCI=y
 CONFIG_ATA_PIIX=y
 CONFIG_ATA_GENERIC=m
 CONFIG_MD=y
@@ -226,8 +219,6 @@ CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_VESA=y
 CONFIG_FB_EFI=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_VGACON_SOFT_SCROLLBACK=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
@@ -304,15 +295,12 @@ CONFIG_SECURITY_NETWORK=y
 CONFIG_HARDENED_USERCOPY=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE=0
 CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
-# CONFIG_CRYPTO_ECHAINIV is not set
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_SHA256=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
-# CONFIG_UNUSED_SYMBOLS is not set
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_RODATA_TEST=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/recipes-kernel/linux/files/arm64_defconfig_4.19 b/recipes-kernel/linux/files/arm64_defconfig_5.4
similarity index 96%
rename from recipes-kernel/linux/files/arm64_defconfig_4.19
rename to recipes-kernel/linux/files/arm64_defconfig_5.4
index c4814c3..ccfd7d7 100644
--- a/recipes-kernel/linux/files/arm64_defconfig_4.19
+++ b/recipes-kernel/linux/files/arm64_defconfig_5.4
@@ -43,11 +43,9 @@ CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MESON=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_ARCH_QCOM=y
+CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
-CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_R8A7795=y
-CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_STRATIX10=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_SPRD=y
@@ -58,20 +56,6 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZX=y
 CONFIG_ARCH_ZYNQMP=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_HOTPLUG_PCI_PCIE=y
-CONFIG_PCI_IOV=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_HOTPLUG_PCI_ACPI=y
-CONFIG_PCI_AARDVARK=y
-CONFIG_PCIE_RCAR=y
-CONFIG_PCI_HOST_GENERIC=y
-CONFIG_PCI_XGENE=y
-CONFIG_PCI_LAYERSCAPE=y
-CONFIG_PCI_HISI=y
-CONFIG_PCIE_QCOM=y
-CONFIG_PCIE_ARMADA_8K=y
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_NUMA=y
@@ -79,13 +63,12 @@ CONFIG_SECCOMP=y
 CONFIG_PARAVIRT=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
-# CONFIG_ARM64_LSE_ATOMICS is not set
 CONFIG_COMPAT=y
+# CONFIG_ARM64_LSE_ATOMICS is not set
 CONFIG_HIBERNATION=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
-CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
@@ -104,7 +87,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
@@ -117,9 +99,6 @@ CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET6_XFRM_MODE_BEET is not set
 # CONFIG_IPV6_SIT is not set
 CONFIG_NETFILTER=y
 CONFIG_IP_NF_IPTABLES=y
@@ -130,22 +109,30 @@ CONFIG_MAC80211=m
 CONFIG_RFKILL=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_PCI_IOV=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_ACPI=y
+CONFIG_PCI_AARDVARK=y
+CONFIG_PCIE_RCAR=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCI_XGENE=y
+CONFIG_PCI_LAYERSCAPE=y
+CONFIG_PCI_HISI=y
+CONFIG_PCIE_QCOM=y
+CONFIG_PCIE_ARMADA_8K=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DMA_CMA=y
 # CONFIG_SUNXI_RSB is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_DENALI_DT=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_OF_OVERLAY=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_SRAM=y
-# CONFIG_SCSI_MQ_DEFAULT is not set
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SAS_ATA=y
@@ -312,7 +299,6 @@ CONFIG_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_BCM2835_WDT=y
-CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
 CONFIG_MFD_SPMI_PMIC=y
@@ -330,7 +316,6 @@ CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_FB=y
 CONFIG_FB_ARMCLCD=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
@@ -424,6 +409,7 @@ CONFIG_JAILHOUSE_DBGCON=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_MFD_CROS_EC=y
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCPI=y
 CONFIG_COMMON_CLK_CS2000_CP=y
@@ -442,6 +428,8 @@ CONFIG_BCM_FLEXRM_MBOX=y
 CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_RASPBERRYPI_POWER=y
+CONFIG_ARCH_R8A7795=y
+CONFIG_ARCH_R8A7796=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
@@ -489,6 +477,7 @@ CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
 # CONFIG_CRYPTO_DEV_VIRTIO is not set
 # CONFIG_CRYPTO_DEV_BCM_SPU is not set
+CONFIG_DMA_CMA=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/recipes-kernel/linux/files/orangepi-zero_defconfig_4.19 b/recipes-kernel/linux/files/orangepi-zero_defconfig_5.4
similarity index 97%
rename from recipes-kernel/linux/files/orangepi-zero_defconfig_4.19
rename to recipes-kernel/linux/files/orangepi-zero_defconfig_5.4
index 79f8f79..4895867 100644
--- a/recipes-kernel/linux/files/orangepi-zero_defconfig_4.19
+++ b/recipes-kernel/linux/files/orangepi-zero_defconfig_5.4
@@ -43,9 +43,6 @@ CONFIG_ARM_ERRATA_821420=y
 CONFIG_ARM_ERRATA_825619=y
 CONFIG_ARM_ERRATA_852421=y
 CONFIG_ARM_ERRATA_852423=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCI_HOST_GENERIC=y
 CONFIG_SMP=y
 CONFIG_HAVE_ARM_ARCH_TIMER=y
 CONFIG_ARM_PSCI=y
@@ -65,9 +62,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_DNS_RESOLVER=y
@@ -76,6 +70,9 @@ CONFIG_CFG80211_DEBUGFS=y
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=y
 CONFIG_MAC80211_LEDS=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_OF_OVERLAY=y
@@ -229,7 +226,6 @@ CONFIG_CONFIGFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_HARDENED_USERCOPY=y
-# CONFIG_CRYPTO_ECHAINIV is not set
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_DEV_SUN4I_SS=y
 CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG=y
diff --git a/recipes-kernel/linux/files/preempt-rt.cfg b/recipes-kernel/linux/files/preempt-rt.cfg
index 9822df2..ffab30d 100644
--- a/recipes-kernel/linux/files/preempt-rt.cfg
+++ b/recipes-kernel/linux/files/preempt-rt.cfg
@@ -1 +1 @@
-CONFIG_PREEMPT_RT_FULL=y
+CONFIG_PREEMPT_RT=y
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb b/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
deleted file mode 100644
index b93967d..0000000
--- a/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require recipes-kernel/linux/linux-jailhouse_4.19.inc
-
-SRC_URI += "file://preempt-rt.cfg"
-
-SRC_URI[sha256sum] = "2d4640f928e237254ed4242f75c6133853859d38aa08a6b91fc3a919caa0dc7e"
-SRCREV = "90c6f75204884080b23d30424a4eff313dfeaa7d"
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb
new file mode 100644
index 0000000..995fe7e
--- /dev/null
+++ b/recipes-kernel/linux/linux-jailhouse-rt_5.4.5-rt3.bb
@@ -0,0 +1,17 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-kernel/linux/linux-jailhouse_5.4.inc
+
+SRC_URI += "file://preempt-rt.cfg"
+
+SRC_URI[sha256sum] = "5714bd79562a43c17aa869a6dac40a19ac3965a3c1151aa4d0f66993eb69ae9d"
+SRCREV = "f8a16c29b76d12da917f14bbbbf97b862346e91e"
diff --git a/recipes-kernel/linux/linux-jailhouse_4.19.81.bb b/recipes-kernel/linux/linux-jailhouse_4.19.81.bb
deleted file mode 100644
index b3027fc..0000000
--- a/recipes-kernel/linux/linux-jailhouse_4.19.81.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require recipes-kernel/linux/linux-jailhouse_4.19.inc
-
-SRC_URI[sha256sum] = "07ca5f88e1ecd68cd1408780c7cd25fd17002478008af2531f4ed64c827678fa"
-SRCREV = "c94c49b84d7a7adca2320d617d3a7721eb753e3b"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.7.bb b/recipes-kernel/linux/linux-jailhouse_5.4.7.bb
new file mode 100644
index 0000000..bf1e3f0
--- /dev/null
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.7.bb
@@ -0,0 +1,15 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-kernel/linux/linux-jailhouse_5.4.inc
+
+SRC_URI[sha256sum] = "c2a9e69f32c017c4d32d7f87d3221232fc9053e8fd94f7e25e8e6867f9be2dd0"
+SRCREV = "9caa6a8cab0d7f46475990aaeb7dcc7721547ef0"
diff --git a/recipes-kernel/linux/linux-jailhouse_4.19.inc b/recipes-kernel/linux/linux-jailhouse_5.4.inc
similarity index 78%
rename from recipes-kernel/linux/linux-jailhouse_4.19.inc
rename to recipes-kernel/linux/linux-jailhouse_5.4.inc
index bfafc9a..1346775 100644
--- a/recipes-kernel/linux/linux-jailhouse_4.19.inc
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.inc
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -11,8 +11,8 @@
 
 require recipes-kernel/linux/linux-custom.inc
 
-KERNEL_DEFCONFIG = "${DISTRO_ARCH}_defconfig_4.19"
-KERNEL_DEFCONFIG_orangepi-zero = "orangepi-zero_defconfig_4.19"
+KERNEL_DEFCONFIG = "${DISTRO_ARCH}_defconfig_5.4"
+KERNEL_DEFCONFIG_orangepi-zero = "orangepi-zero_defconfig_5.4"
 
 SRC_URI += " \
     https://github.com/siemens/linux/archive/${SRCREV}.tar.gz;downloadfilename=linux-${SRCREV}.tar.gz \
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0dacdb1e0eedca081a6fb0b5333b0d3343019711.1579170887.git.jan.kiszka%40siemens.com.
