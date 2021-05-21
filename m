Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUU4T2CQMGQEAKINLIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210B38C521
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:41:23 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id c4-20020a05651c0144b02900d41930170esf8659659ljd.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:41:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593683; cv=pass;
        d=google.com; s=arc-20160816;
        b=SLne0G++EUwsakm4aEFR+JzRO4lqVEwmy6SP0kJj+v97VVhs4nqNqawQbghXVoIPLP
         RyIclKRr5A7ZmbysdGjd9XMpceE7TCBhZhJZ/4DOG5r3RcFk0cEdds5P4ntR1dbRWzao
         9X1P22hZTW+dwjXCSFcQC6FVNkbuXLreJ6B3hHUe0egJG2d3kVMc4ImI9wmFI8Mk/Nje
         g92wxqLX8lVZiYOwoK7CFXMfIn0aettqDj+ZzVD+Oy1KE0iYXofQfHOj0+mroeZb+4ei
         3ZCiEREMc6quCOFBbxGdsSEBKcUEnAzqvorAmXe5g12VbjhhYdqXe4MPrTil2tzacH7X
         Dgag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Ad1wN9+vag9bfGveXuyS52wWTT4A//VvmFHNP/Ut/DY=;
        b=qPCpqx+90UUWg19oqBgMekXwDX/0wsF8qFxY1AjYbrxiaCSblofO91JTUPSnwB0T4A
         KgCA7+I5xDYCBJG6HWL/cEoQguFoqTi4U2lD+M7b0+gJkhCR4S/JBk4GxFbWhX5BlZB7
         QLdFJ456pgS44ekL7WH/dFsAaNkMt1rUVSmbYQPtes0WEBZ2WJ3ThiTdaJq6uOKIVdWY
         Gxt2vFiFJf3tJRYp5OKOFJAsinnLEdE6QLrRgWfAC1pGR/Py7GDV1ZOy841eJUqscnND
         qS8/mGg7wmOjkKDrkaPlX+3trg0M2q8PErclpQD7aZBsWwB+v72JSQnKtmzulNgXu1Dg
         DQWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ad1wN9+vag9bfGveXuyS52wWTT4A//VvmFHNP/Ut/DY=;
        b=tQBUrY/8MGeTb3yNpTthJmLlgr/uCMeThbW7Zho5hocPdy4ukDZM4Iym1cV0JEldFE
         7kcWa0PTg2dw5Eqsf8wkwGT4aH+mNmKUK2sbX6iZHqXqWMc+TQi8jkb+Gya8j5wUyQFM
         AknySyauAsvurg8uIB/kCVTdHQ1I6rJ7I3EbM381yacqKCh7FhhIvWGo2i+sG+KdDsJs
         Z/jDsICWYcuhCE4tNHBnUT/OmzV2YVmxtcvwgQD185U5jMsqKLVcdOhcTVdn4Q4YGn3Y
         3FE/kVSoqea0ePPMH6k1DkgiLsKTGQk7SfHeoJr21A9weu96XFGNKUCzlo7BkHeEQknd
         mPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ad1wN9+vag9bfGveXuyS52wWTT4A//VvmFHNP/Ut/DY=;
        b=AuYnE8FT/h7MoB+Tb3Juy7iegNkFWjfyySRZk43gE9PQeUiXf91CXdLC6t7ZripgAo
         LGVOQ2ZnXolow8uu4MxF9GEd/kqRJBljTToGUsfTHuOsH223XiopRTgRZczAYiYq3KYz
         Gk5wzm83LdTWt3LQbDlvWsR5hHBHAt45lB58BuytCoHzLinAFXwkMbWKBlXjHYwUkH+F
         7+XMdy/eSKx16sSXjFmt7rtEIS4m9tPR5VCtDvwL2ilLM0iiZNyAw33vFUVn2d+qhrkm
         6M+qK3X44raftS6BcJ+cNj6H43nvFILa2Qfm+oYxIZZgLS0J27hGz/Cnl+JfB1etvuYM
         rd0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+x8yscvmrm5AQQYYuSxBWKDk6P2a8Qn1bkRio9w53poJYOgeg
	dwHLycxXY/PllKGUbvPpLCo=
X-Google-Smtp-Source: ABdhPJx/7R9+uiXgEKRseXFIvKmBhTNMRfS5CmHrZHqeU/KLYZlpZfmsttLIiqOVaXitm7MYn9wvDA==
X-Received: by 2002:ac2:5feb:: with SMTP id s11mr1767473lfg.99.1621593682968;
        Fri, 21 May 2021 03:41:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f94:: with SMTP id x20ls330148lfa.0.gmail; Fri, 21
 May 2021 03:41:21 -0700 (PDT)
X-Received: by 2002:a05:6512:b98:: with SMTP id b24mr1751744lfv.216.1621593681635;
        Fri, 21 May 2021 03:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593681; cv=none;
        d=google.com; s=arc-20160816;
        b=L+ZYW64nZDtc9XjybcCBKvaRElOKTivTEx/owH9Rn5GCRw3sQNUeyT7WFYoyIwSrjF
         HRd9c5rxMLnTWqxUtFWeJSI0aTbLWVTrXIm9cP6uAbdN95tn5dZVuERHJXTvI7dbFjQc
         gLdBgpuF+J0HPf/XeMxW9z6aLolDpFqNQLUgTOkWxTHOrPFiSIH9P3gaJj6bnWFONKnI
         Z3Y47atn9PvJYyg9EoEW0fS7GuKe/Z3Flucfqd4A1nVmfldbmKz83o3ZfxpXwiaTRvWK
         KhFOrMQ1qNjWO0Zpi3y7Lh6KiZ+YH89l/1a4oiKtBW8VQCCYX1/qvez8BOtQtB9vqhUg
         zWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=VcbW8VU/1ulZMxs2ueeQkD1B4LhGVqIatSlCVEUkqvk=;
        b=QwBsot4Fi+SC6w6nQpIo5tUlHrzayzrATpzHLJLrISQ4oOI8y8wrE6eRW56LdtNBv9
         tsESWi5KjCLvpuy14X39+iBPwoAwFLOB0JSczASNinlKmvMQsg5VCuV6oWblXHEljsfM
         gpPDLXJmGDYAFXyjN0sb23IU/NMsK0rUR/fCqDm0de4ZO3/Bp1jNYFFra0LptbW2fn4U
         q2b4pavSKdO0MIOFLD4P9ca1x8IUlEj0aS0/gm4D/Ft6kNwIH7CgwTfgVSh6oFvfWCvh
         uyZIzK10zwZRT+9hGiJutpy7wLJiwTnFOjM5vNz15JiLF4J7tzAa5GpBybZzLfjV+VUb
         FMfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g25si257913lfb.10.2021.05.21.03.41.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAfKJJ021762
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:41:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcL032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:39 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 16/22] linux-jailhouse[-rt], wilc: Switch to 5.10
Date: Fri, 21 May 2021 12:37:28 +0200
Message-Id: <7950e99f4890d2ac4f14c990da016a0f4b58271a.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

This allows to drop a lot of ZynqMP-related patches. Still, two new ones
are needed due to a regression of the DTs for Ultra96 v1 and v2, see
also https://lkml.org/lkml/2021/3/27/354.

The downstream wilc driver for the Ultra96v2 requires a backport from
upstream in order to work with the newer kernel. For simplicity reasons,
that patch will not account for older kernels anymore, thus is part of
this commit.

RPi4 will be handled separately.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...s-xilinx-Remove-dtsi-for-fixed-clock.patch | 237 +++++++
 ...san-Separate-out-clk-related-data-to.patch |  99 ---
 ...-xilinx-Add-the-clock-nodes-for-zynq.patch | 581 ++++++++++++++++++
 ...san-Add-sampling-clock-for-a-phy-to-.patch | 232 -------
 ...03-arm64-zynqmp-Add-firmware-DT-node.patch |  37 --
 ...zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch | 109 ----
 ...san-Add-support-to-set-clock-phase-d.patch | 160 -----
 ...ware-xilinx-Add-SDIO-Tap-Delay-nodes.patch |  44 --
 ...san-Add-support-for-ZynqMP-Platform-.patch | 308 ----------
 ...irmware-xilinx-Add-DLL-reset-support.patch |  57 --
 ...san-Add-support-for-DLL-reset-for-Zy.patch |  99 ---
 ...p-Add-ZynqMP-SDHCI-compatible-string.patch |  52 --
 ...san-Modified-SD-default-speed-to-19M.patch |  64 --
 ...d64_defconfig_5.4 => amd64_defconfig_5.10} |  16 +-
 ...m64_defconfig_5.4 => arm64_defconfig_5.10} |  36 +-
 ...mhf_defconfig_5.4 => armhf_defconfig_5.10} |   8 +-
 .../linux/linux-jailhouse-rt_5.10.27-rt36.bb  |  17 +
 .../linux/linux-jailhouse-rt_5.4.58-rt35.bb   |  17 -
 .../linux/linux-jailhouse_5.10.31.bb          |  15 +
 recipes-kernel/linux/linux-jailhouse_5.10.inc |  27 +
 .../linux/linux-jailhouse_5.4.61.bb           |  15 -
 recipes-kernel/linux/linux-jailhouse_5.4.inc  |  14 -
 ...001-Make-compatible-with-5.8-kernels.patch | 191 ++++++
 recipes-kernel/wilc/wilc_15.2-avnet.bb        |   1 +
 24 files changed, 1084 insertions(+), 1352 deletions(-)
 create mode 100644 recipes-kernel/linux/files/0001-Revert-arm64-dts-xilinx-Remove-dtsi-for-fixed-clock.patch
 delete mode 100644 recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
 create mode 100644 recipes-kernel/linux/files/0002-Revert-arm64-dts-xilinx-Add-the-clock-nodes-for-zynq.patch
 delete mode 100644 recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
 delete mode 100644 recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
 delete mode 100644 recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
 delete mode 100644 recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
 delete mode 100644 recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
 delete mode 100644 recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
 delete mode 100644 recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
 delete mode 100644 recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
 delete mode 100644 recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
 delete mode 100644 recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
 rename recipes-kernel/linux/files/{amd64_defconfig_5.4 => amd64_defconfig_5.10} (98%)
 rename recipes-kernel/linux/files/{arm64_defconfig_5.4 => arm64_defconfig_5.10} (92%)
 rename recipes-kernel/linux/files/{armhf_defconfig_5.4 => armhf_defconfig_5.10} (98%)
 create mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.10.31.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.10.inc
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.61.bb
 create mode 100644 recipes-kernel/wilc/files/0001-Make-compatible-with-5.8-kernels.patch

diff --git a/recipes-kernel/linux/files/0001-Revert-arm64-dts-xilinx-Remove-dtsi-for-fixed-clock.patch b/recipes-kernel/linux/files/0001-Revert-arm64-dts-xilinx-Remove-dtsi-for-fixed-clock.patch
new file mode 100644
index 0000000..3327592
--- /dev/null
+++ b/recipes-kernel/linux/files/0001-Revert-arm64-dts-xilinx-Remove-dtsi-for-fixed-clock.patch
@@ -0,0 +1,237 @@
+From 916d970f05e5b6dbfbb96955617f40a122c9c556 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Wed, 31 Mar 2021 18:57:39 +0200
+Subject: [PATCH 1/2] Revert "arm64: dts: xilinx: Remove dtsi for fixed clock"
+
+This reverts commit 4406486805bffbf245473e6111e2d7984550846e.
+
+Needed in order to revert 9c8a47b484ed8d7b06b4ca0032e93c458c7b931e.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi | 213 +++++++++++++++++++++
+ 1 file changed, 213 insertions(+)
+ create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
+
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
+new file mode 100644
+index 000000000000..d900fedf0bfc
+--- /dev/null
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
+@@ -0,0 +1,213 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Clock specification for Xilinx ZynqMP
++ *
++ * (C) Copyright 2015 - 2018, Xilinx, Inc.
++ *
++ * Michal Simek <michal.simek@xilinx.com>
++ */
++
++/ {
++	clk100: clk100 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <100000000>;
++	};
++
++	clk125: clk125 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <125000000>;
++	};
++
++	clk200: clk200 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <200000000>;
++	};
++
++	clk250: clk250 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <250000000>;
++	};
++
++	clk300: clk300 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <300000000>;
++	};
++
++	clk600: clk600 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <600000000>;
++	};
++
++	dp_aclk: clock0 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <100000000>;
++		clock-accuracy = <100>;
++	};
++
++	dp_aud_clk: clock1 {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <24576000>;
++		clock-accuracy = <100>;
++	};
++
++	dpdma_clk: dpdma-clk {
++		compatible = "fixed-clock";
++		#clock-cells = <0x0>;
++		clock-frequency = <533000000>;
++	};
++
++	drm_clock: drm-clock {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <262750000>;
++		clock-accuracy = <100>;
++	};
++};
++
++&can0 {
++	clocks = <&clk100 &clk100>;
++};
++
++&can1 {
++	clocks = <&clk100 &clk100>;
++};
++
++&fpd_dma_chan1 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&fpd_dma_chan2 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&fpd_dma_chan3 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&fpd_dma_chan4 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&fpd_dma_chan5 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&fpd_dma_chan6 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&fpd_dma_chan7 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&fpd_dma_chan8 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan1 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan2 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan3 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan4 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan5 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan6 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan7 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&lpd_dma_chan8 {
++	clocks = <&clk600>, <&clk100>;
++};
++
++&gem0 {
++	clocks = <&clk125>, <&clk125>, <&clk125>;
++};
++
++&gem1 {
++	clocks = <&clk125>, <&clk125>, <&clk125>;
++};
++
++&gem2 {
++	clocks = <&clk125>, <&clk125>, <&clk125>;
++};
++
++&gem3 {
++	clocks = <&clk125>, <&clk125>, <&clk125>;
++};
++
++&gpio {
++	clocks = <&clk100>;
++};
++
++&i2c0 {
++	clocks = <&clk100>;
++};
++
++&i2c1 {
++	clocks = <&clk100>;
++};
++
++&sata {
++	clocks = <&clk250>;
++};
++
++&sdhci0 {
++	clocks = <&clk200 &clk200>;
++};
++
++&sdhci1 {
++	clocks = <&clk200 &clk200>;
++};
++
++&spi0 {
++	clocks = <&clk200 &clk200>;
++};
++
++&spi1 {
++	clocks = <&clk200 &clk200>;
++};
++
++&uart0 {
++	clocks = <&clk100 &clk100>;
++};
++
++&uart1 {
++	clocks = <&clk100 &clk100>;
++};
++
++&usb0 {
++	clocks = <&clk250>, <&clk250>;
++};
++
++&usb1 {
++	clocks = <&clk250>, <&clk250>;
++};
++
++&watchdog0 {
++	clocks = <&clk250>;
++};
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch b/recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
deleted file mode 100644
index 7950e6c..0000000
--- a/recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From efed4267a13839aee9d7441b101ee5a94fe17ee9 Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:21 -0700
-Subject: [PATCH 01/12] mmc: sdhci-of-arasan: Separate out clk related data to
- another structure
-
-To improve the code readability, use two different structs, one for
-clock provider data and one for mmc platform data.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
-Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=e1463618cd8c1c381ef343cb6efb413ae355eb07
-State: upstream (e1463618cd8c1c381ef343cb6efb413ae355eb07)
----
- drivers/mmc/host/sdhci-of-arasan.c | 31 ++++++++++++++++++++----------
- 1 file changed, 21 insertions(+), 10 deletions(-)
-
-diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
-index 7023cbec4017..701b6cc0f9a3 100644
---- a/drivers/mmc/host/sdhci-of-arasan.c
-+++ b/drivers/mmc/host/sdhci-of-arasan.c
-@@ -71,14 +71,23 @@ struct sdhci_arasan_soc_ctl_map {
- 	bool					hiword_update;
- };
- 
-+/**
-+ * struct sdhci_arasan_clk_data
-+ * @sdcardclk_hw:	Struct for the clock we might provide to a PHY.
-+ * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
-+ */
-+struct sdhci_arasan_clk_data {
-+	struct clk_hw	sdcardclk_hw;
-+	struct clk      *sdcardclk;
-+};
-+
- /**
-  * struct sdhci_arasan_data
-  * @host:		Pointer to the main SDHCI host structure.
-  * @clk_ahb:		Pointer to the AHB clock
-  * @phy:		Pointer to the generic phy
-  * @is_phy_on:		True if the PHY is on; false if not.
-- * @sdcardclk_hw:	Struct for the clock we might provide to a PHY.
-- * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
-+ * @clk_data:		Struct for the Arasan Controller Clock Data.
-  * @soc_ctl_base:	Pointer to regmap for syscon for soc_ctl registers.
-  * @soc_ctl_map:	Map to get offsets into soc_ctl registers.
-  */
-@@ -89,8 +98,7 @@ struct sdhci_arasan_data {
- 	bool		is_phy_on;
- 
- 	bool		has_cqe;
--	struct clk_hw	sdcardclk_hw;
--	struct clk      *sdcardclk;
-+	struct sdhci_arasan_clk_data clk_data;
- 
- 	struct regmap	*soc_ctl_base;
- 	const struct sdhci_arasan_soc_ctl_map *soc_ctl_map;
-@@ -520,8 +528,10 @@ static unsigned long sdhci_arasan_sdcardclk_recalc_rate(struct clk_hw *hw,
- 						      unsigned long parent_rate)
- 
- {
-+	struct sdhci_arasan_clk_data *clk_data =
-+		container_of(hw, struct sdhci_arasan_clk_data, sdcardclk_hw);
- 	struct sdhci_arasan_data *sdhci_arasan =
--		container_of(hw, struct sdhci_arasan_data, sdcardclk_hw);
-+		container_of(clk_data, struct sdhci_arasan_data, clk_data);
- 	struct sdhci_host *host = sdhci_arasan->host;
- 
- 	return host->mmc->actual_clock;
-@@ -633,6 +643,7 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
- 				       struct clk *clk_xin,
- 				       struct device *dev)
- {
-+	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
- 	struct device_node *np = dev->of_node;
- 	struct clk_init_data sdcardclk_init;
- 	const char *parent_clk_name;
-@@ -655,13 +666,13 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
- 	sdcardclk_init.flags = CLK_GET_RATE_NOCACHE;
- 	sdcardclk_init.ops = &arasan_sdcardclk_ops;
- 
--	sdhci_arasan->sdcardclk_hw.init = &sdcardclk_init;
--	sdhci_arasan->sdcardclk =
--		devm_clk_register(dev, &sdhci_arasan->sdcardclk_hw);
--	sdhci_arasan->sdcardclk_hw.init = NULL;
-+	clk_data->sdcardclk_hw.init = &sdcardclk_init;
-+	clk_data->sdcardclk =
-+		devm_clk_register(dev, &clk_data->sdcardclk_hw);
-+	clk_data->sdcardclk_hw.init = NULL;
- 
- 	ret = of_clk_add_provider(np, of_clk_src_simple_get,
--				  sdhci_arasan->sdcardclk);
-+				  clk_data->sdcardclk);
- 	if (ret)
- 		dev_err(dev, "Failed to add clock provider\n");
- 
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0002-Revert-arm64-dts-xilinx-Add-the-clock-nodes-for-zynq.patch b/recipes-kernel/linux/files/0002-Revert-arm64-dts-xilinx-Add-the-clock-nodes-for-zynq.patch
new file mode 100644
index 0000000..282b97f
--- /dev/null
+++ b/recipes-kernel/linux/files/0002-Revert-arm64-dts-xilinx-Add-the-clock-nodes-for-zynq.patch
@@ -0,0 +1,581 @@
+From fd0b64fc1a08de49de14d692b7fe17ded6440162 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Wed, 31 Mar 2021 18:53:39 +0200
+Subject: [PATCH 2/2] Revert "arm64: dts: xilinx: Add the clock nodes for
+ zynqmp"
+
+This reverts commit 9c8a47b484ed8d7b06b4ca0032e93c458c7b931e.
+
+Breaks booting of Ultra96 boards, see also
+
+https://lkml.org/lkml/2021/3/27/354
+
+Reason still unclear.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ .../arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi | 217 ------------------
+ .../boot/dts/xilinx/zynqmp-zc1232-revA.dts    |   4 +-
+ .../boot/dts/xilinx/zynqmp-zc1254-revA.dts    |   4 +-
+ .../boot/dts/xilinx/zynqmp-zc1275-revA.dts    |   4 +-
+ .../dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    |   4 +-
+ .../dts/xilinx/zynqmp-zc1751-xm016-dc2.dts    |   4 +-
+ .../dts/xilinx/zynqmp-zc1751-xm017-dc3.dts    |   4 +-
+ .../dts/xilinx/zynqmp-zc1751-xm018-dc4.dts    |   4 +-
+ .../dts/xilinx/zynqmp-zc1751-xm019-dc5.dts    |   4 +-
+ .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    |   4 +-
+ .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   4 +-
+ .../boot/dts/xilinx/zynqmp-zcu104-revA.dts    |   4 +-
+ .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |   4 +-
+ .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    |   4 +-
+ arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  17 +-
+ 15 files changed, 27 insertions(+), 259 deletions(-)
+ delete mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
+
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
+deleted file mode 100644
+index c94c3bb67edc..000000000000
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
++++ /dev/null
+@@ -1,217 +0,0 @@
+-// SPDX-License-Identifier: GPL-2.0+
+-/*
+- * Clock specification for Xilinx ZynqMP
+- *
+- * (C) Copyright 2017 - 2019, Xilinx, Inc.
+- *
+- * Michal Simek <michal.simek@xilinx.com>
+- */
+-
+-#include <dt-bindings/clock/xlnx-zynqmp-clk.h>
+-/ {
+-	pss_ref_clk: pss_ref_clk {
+-		compatible = "fixed-clock";
+-		#clock-cells = <0>;
+-		clock-frequency = <33333333>;
+-	};
+-
+-	video_clk: video_clk {
+-		compatible = "fixed-clock";
+-		#clock-cells = <0>;
+-		clock-frequency = <27000000>;
+-	};
+-
+-	pss_alt_ref_clk: pss_alt_ref_clk {
+-		compatible = "fixed-clock";
+-		#clock-cells = <0>;
+-		clock-frequency = <0>;
+-	};
+-
+-	gt_crx_ref_clk: gt_crx_ref_clk {
+-		compatible = "fixed-clock";
+-		#clock-cells = <0>;
+-		clock-frequency = <108000000>;
+-	};
+-
+-	aux_ref_clk: aux_ref_clk {
+-		compatible = "fixed-clock";
+-		#clock-cells = <0>;
+-		clock-frequency = <27000000>;
+-	};
+-};
+-
+-&can0 {
+-	clocks = <&zynqmp_clk CAN0_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&can1 {
+-	clocks = <&zynqmp_clk CAN1_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&cpu0 {
+-	clocks = <&zynqmp_clk ACPU>;
+-};
+-
+-&fpd_dma_chan1 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&fpd_dma_chan2 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&fpd_dma_chan3 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&fpd_dma_chan4 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&fpd_dma_chan5 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&fpd_dma_chan6 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&fpd_dma_chan7 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&fpd_dma_chan8 {
+-	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan1 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan2 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan3 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan4 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan5 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan6 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan7 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&lpd_dma_chan8 {
+-	clocks = <&zynqmp_clk ADMA_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&gem0 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>, <&zynqmp_clk GEM0_REF>,
+-		 <&zynqmp_clk GEM0_TX>, <&zynqmp_clk GEM0_RX>,
+-		 <&zynqmp_clk GEM_TSU>;
+-	clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
+-};
+-
+-&gem1 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>, <&zynqmp_clk GEM1_REF>,
+-		 <&zynqmp_clk GEM1_TX>, <&zynqmp_clk GEM1_RX>,
+-		 <&zynqmp_clk GEM_TSU>;
+-	clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
+-};
+-
+-&gem2 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>, <&zynqmp_clk GEM2_REF>,
+-		 <&zynqmp_clk GEM2_TX>, <&zynqmp_clk GEM2_RX>,
+-		 <&zynqmp_clk GEM_TSU>;
+-	clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
+-};
+-
+-&gem3 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>, <&zynqmp_clk GEM3_REF>,
+-		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
+-		 <&zynqmp_clk GEM_TSU>;
+-	clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
+-};
+-
+-&gpio {
+-	clocks = <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&i2c0 {
+-	clocks = <&zynqmp_clk I2C0_REF>;
+-};
+-
+-&i2c1 {
+-	clocks = <&zynqmp_clk I2C1_REF>;
+-};
+-
+-&pcie {
+-	clocks = <&zynqmp_clk PCIE_REF>;
+-};
+-
+-&sata {
+-	clocks = <&zynqmp_clk SATA_REF>;
+-};
+-
+-&sdhci0 {
+-	clocks = <&zynqmp_clk SDIO0_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&sdhci1 {
+-	clocks = <&zynqmp_clk SDIO1_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&spi0 {
+-	clocks = <&zynqmp_clk SPI0_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&spi1 {
+-	clocks = <&zynqmp_clk SPI1_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&ttc0 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&ttc1 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&ttc2 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&ttc3 {
+-	clocks = <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&uart0 {
+-	clocks = <&zynqmp_clk UART0_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&uart1 {
+-	clocks = <&zynqmp_clk UART1_REF>, <&zynqmp_clk LPD_LSBUS>;
+-};
+-
+-&usb0 {
+-	clocks = <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_DUAL_REF>;
+-};
+-
+-&usb1 {
+-	clocks = <&zynqmp_clk USB1_BUS_REF>, <&zynqmp_clk USB3_DUAL_REF>;
+-};
+-
+-&watchdog0 {
+-	clocks = <&zynqmp_clk WDT>;
+-};
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts
+index 2e05fa416955..0f7b4cf6078e 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZC1232
+  *
+- * (C) Copyright 2017 - 2019, Xilinx, Inc.
++ * (C) Copyright 2017 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ 
+ / {
+ 	model = "ZynqMP ZC1232 RevA";
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
+index 3d0aaa02f184..9092828f92ec 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZC1254
+  *
+- * (C) Copyright 2015 - 2019, Xilinx, Inc.
++ * (C) Copyright 2015 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  * Siva Durga Prasad Paladugu <sivadur@xilinx.com>
+@@ -11,7 +11,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ 
+ / {
+ 	model = "ZynqMP ZC1254 RevA";
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts
+index 66a90483b004..4f404c580eec 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZC1275
+  *
+- * (C) Copyright 2017 - 2019, Xilinx, Inc.
++ * (C) Copyright 2017 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  * Siva Durga Prasad Paladugu <sivadur@xilinx.com>
+@@ -11,7 +11,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ 
+ / {
+ 	model = "ZynqMP ZC1275 RevA";
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
+index 69f6e4610739..88245027d0dc 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP zc1751-xm015-dc1
+  *
+- * (C) Copyright 2015 - 2019, Xilinx, Inc.
++ * (C) Copyright 2015 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/gpio/gpio.h>
+ 
+ / {
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
+index 4a86efa32d68..f53cf1e767f0 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP zc1751-xm016-dc2
+  *
+- * (C) Copyright 2015 - 2019, Xilinx, Inc.
++ * (C) Copyright 2015 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/gpio/gpio.h>
+ 
+ / {
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts
+index 4ea6ef5a7f2b..c71c78fa4938 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP zc1751-xm017-dc3
+  *
+- * (C) Copyright 2016 - 2019, Xilinx, Inc.
++ * (C) Copyright 2016 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ 
+ / {
+ 	model = "ZynqMP zc1751-xm017-dc3 RevA";
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
+index 2366cd9f091a..54c7b4f1d1e4 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP zc1751-xm018-dc4
+  *
+- * (C) Copyright 2015 - 2019, Xilinx, Inc.
++ * (C) Copyright 2015 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ 
+ / {
+ 	model = "ZynqMP zc1751-xm018-dc4";
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
+index 41934e3525c6..52ca998e2420 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP zc1751-xm019-dc5
+  *
+- * (C) Copyright 2015 - 2019, Xilinx, Inc.
++ * (C) Copyright 2015 - 2018, Xilinx, Inc.
+  *
+  * Siva Durga Prasad <siva.durga.paladugu@xilinx.com>
+  * Michal Simek <michal.simek@xilinx.com>
+@@ -11,7 +11,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/gpio/gpio.h>
+ 
+ / {
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
+index 68ecd0f7b2f2..104768c5c542 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZCU100 revC
+  *
+- * (C) Copyright 2016 - 2019, Xilinx, Inc.
++ * (C) Copyright 2016 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  * Nathalie Chan King Choy
+@@ -11,7 +11,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/input/input.h>
+ #include <dt-bindings/interrupt-controller/irq.h>
+ #include <dt-bindings/gpio/gpio.h>
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+index f1255f635dfd..b5ee86ba3feb 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZCU102 RevA
+  *
+- * (C) Copyright 2015 - 2019, Xilinx, Inc.
++ * (C) Copyright 2015 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/input/input.h>
+ #include <dt-bindings/gpio/gpio.h>
+ 
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+index 7a4614e3f5fa..1e90320a6aeb 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZCU104
+  *
+- * (C) Copyright 2017 - 2019, Xilinx, Inc.
++ * (C) Copyright 2017 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/gpio/gpio.h>
+ 
+ / {
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+index 6e9efe233838..72e435977b94 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZCU106
+  *
+- * (C) Copyright 2016 - 2019, Xilinx, Inc.
++ * (C) Copyright 2016, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/input/input.h>
+ #include <dt-bindings/gpio/gpio.h>
+ 
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+index 2e92634c77f9..229a22c9f554 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP ZCU111
+  *
+- * (C) Copyright 2017 - 2019, Xilinx, Inc.
++ * (C) Copyright 2017 - 2018, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  */
+@@ -10,7 +10,7 @@
+ /dts-v1/;
+ 
+ #include "zynqmp.dtsi"
+-#include "zynqmp-clk-ccf.dtsi"
++#include "zynqmp-clk.dtsi"
+ #include <dt-bindings/input/input.h>
+ #include <dt-bindings/gpio/gpio.h>
+ 
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+index 771f60e0346d..e59aa15e633b 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
++++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+@@ -2,7 +2,7 @@
+ /*
+  * dts file for Xilinx ZynqMP
+  *
+- * (C) Copyright 2014 - 2019, Xilinx, Inc.
++ * (C) Copyright 2014 - 2015, Xilinx, Inc.
+  *
+  * Michal Simek <michal.simek@xilinx.com>
+  *
+@@ -130,21 +130,6 @@ zynqmp_power: zynqmp-power {
+ 				interrupts = <0 35 4>;
+ 			};
+ 
+-			zynqmp_clk: clock-controller {
+-				#clock-cells = <1>;
+-				compatible = "xlnx,zynqmp-clk";
+-				clocks = <&pss_ref_clk>,
+-					 <&video_clk>,
+-					 <&pss_alt_ref_clk>,
+-					 <&aux_ref_clk>,
+-					 <&gt_crx_ref_clk>;
+-				clock-names = "pss_ref_clk",
+-					      "video_clk",
+-					      "pss_alt_ref_clk",
+-					      "aux_ref_clk",
+-					      "gt_crx_ref_clk";
+-			};
+-
+ 			nvmem_firmware {
+ 				compatible = "xlnx,zynqmp-nvmem-fw";
+ 				#address-cells = <1>;
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch b/recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
deleted file mode 100644
index 7b9b15e..0000000
--- a/recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-From b2ae7e86061f30a1325bbc20f16e24e53032ae02 Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:23 -0700
-Subject: [PATCH 02/12] mmc: sdhci-of-arasan: Add sampling clock for a phy to
- use
-
-There are some operations like setting the clock delays may need to have
-two clocks, one for output path and one for input path. Adding input
-path clock for some phys to use.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
-Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=07a14d1df4547ebc0104331511f25e2a7f3a8858
-State: upstream (07a14d1df4547ebc0104331511f25e2a7f3a8858)
----
- drivers/mmc/host/sdhci-of-arasan.c | 151 +++++++++++++++++++++++++----
- 1 file changed, 134 insertions(+), 17 deletions(-)
-
-diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
-index 701b6cc0f9a3..b75ba780f902 100644
---- a/drivers/mmc/host/sdhci-of-arasan.c
-+++ b/drivers/mmc/host/sdhci-of-arasan.c
-@@ -75,10 +75,14 @@ struct sdhci_arasan_soc_ctl_map {
-  * struct sdhci_arasan_clk_data
-  * @sdcardclk_hw:	Struct for the clock we might provide to a PHY.
-  * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
-+ * @sampleclk_hw:	Struct for the clock we might provide to a PHY.
-+ * @sampleclk:		Pointer to normal 'struct clock' for sampleclk_hw.
-  */
- struct sdhci_arasan_clk_data {
- 	struct clk_hw	sdcardclk_hw;
- 	struct clk      *sdcardclk;
-+	struct clk_hw	sampleclk_hw;
-+	struct clk      *sampleclk;
- };
- 
- /**
-@@ -541,6 +545,33 @@ static const struct clk_ops arasan_sdcardclk_ops = {
- 	.recalc_rate = sdhci_arasan_sdcardclk_recalc_rate,
- };
- 
-+/**
-+ * sdhci_arasan_sampleclk_recalc_rate - Return the sampling clock rate
-+ *
-+ * Return the current actual rate of the sampling clock.  This can be used
-+ * to communicate with out PHY.
-+ *
-+ * @hw:			Pointer to the hardware clock structure.
-+ * @parent_rate		The parent rate (should be rate of clk_xin).
-+ * Returns the sample clock rate.
-+ */
-+static unsigned long sdhci_arasan_sampleclk_recalc_rate(struct clk_hw *hw,
-+						      unsigned long parent_rate)
-+
-+{
-+	struct sdhci_arasan_clk_data *clk_data =
-+		container_of(hw, struct sdhci_arasan_clk_data, sampleclk_hw);
-+	struct sdhci_arasan_data *sdhci_arasan =
-+		container_of(clk_data, struct sdhci_arasan_data, clk_data);
-+	struct sdhci_host *host = sdhci_arasan->host;
-+
-+	return host->mmc->actual_clock;
-+}
-+
-+static const struct clk_ops arasan_sampleclk_ops = {
-+	.recalc_rate = sdhci_arasan_sampleclk_recalc_rate,
-+};
-+
- /**
-  * sdhci_arasan_update_clockmultiplier - Set corecfg_clockmultiplier
-  *
-@@ -620,28 +651,21 @@ static void sdhci_arasan_update_baseclkfreq(struct sdhci_host *host)
- }
- 
- /**
-- * sdhci_arasan_register_sdclk - Register the sdclk for a PHY to use
-+ * sdhci_arasan_register_sdcardclk - Register the sdcardclk for a PHY to use
-  *
-  * Some PHY devices need to know what the actual card clock is.  In order for
-  * them to find out, we'll provide a clock through the common clock framework
-  * for them to query.
-  *
-- * Note: without seriously re-architecting SDHCI's clock code and testing on
-- * all platforms, there's no way to create a totally beautiful clock here
-- * with all clock ops implemented.  Instead, we'll just create a clock that can
-- * be queried and set the CLK_GET_RATE_NOCACHE attribute to tell common clock
-- * framework that we're doing things behind its back.  This should be sufficient
-- * to create nice clean device tree bindings and later (if needed) we can try
-- * re-architecting SDHCI if we see some benefit to it.
-- *
-  * @sdhci_arasan:	Our private data structure.
-  * @clk_xin:		Pointer to the functional clock
-  * @dev:		Pointer to our struct device.
-  * Returns 0 on success and error value on error
-  */
--static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
--				       struct clk *clk_xin,
--				       struct device *dev)
-+static int
-+sdhci_arasan_register_sdcardclk(struct sdhci_arasan_data *sdhci_arasan,
-+				struct clk *clk_xin,
-+				struct device *dev)
- {
- 	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
- 	struct device_node *np = dev->of_node;
-@@ -649,10 +673,6 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
- 	const char *parent_clk_name;
- 	int ret;
- 
--	/* Providing a clock to the PHY is optional; no error if missing */
--	if (!of_find_property(np, "#clock-cells", NULL))
--		return 0;
--
- 	ret = of_property_read_string_index(np, "clock-output-names", 0,
- 					    &sdcardclk_init.name);
- 	if (ret) {
-@@ -674,7 +694,56 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
- 	ret = of_clk_add_provider(np, of_clk_src_simple_get,
- 				  clk_data->sdcardclk);
- 	if (ret)
--		dev_err(dev, "Failed to add clock provider\n");
-+		dev_err(dev, "Failed to add sdcard clock provider\n");
-+
-+	return ret;
-+}
-+
-+/**
-+ * sdhci_arasan_register_sampleclk - Register the sampleclk for a PHY to use
-+ *
-+ * Some PHY devices need to know what the actual card clock is.  In order for
-+ * them to find out, we'll provide a clock through the common clock framework
-+ * for them to query.
-+ *
-+ * @sdhci_arasan:	Our private data structure.
-+ * @clk_xin:		Pointer to the functional clock
-+ * @dev:		Pointer to our struct device.
-+ * Returns 0 on success and error value on error
-+ */
-+static int
-+sdhci_arasan_register_sampleclk(struct sdhci_arasan_data *sdhci_arasan,
-+				struct clk *clk_xin,
-+				struct device *dev)
-+{
-+	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
-+	struct device_node *np = dev->of_node;
-+	struct clk_init_data sampleclk_init;
-+	const char *parent_clk_name;
-+	int ret;
-+
-+	ret = of_property_read_string_index(np, "clock-output-names", 1,
-+					    &sampleclk_init.name);
-+	if (ret) {
-+		dev_err(dev, "DT has #clock-cells but no clock-output-names\n");
-+		return ret;
-+	}
-+
-+	parent_clk_name = __clk_get_name(clk_xin);
-+	sampleclk_init.parent_names = &parent_clk_name;
-+	sampleclk_init.num_parents = 1;
-+	sampleclk_init.flags = CLK_GET_RATE_NOCACHE;
-+	sampleclk_init.ops = &arasan_sampleclk_ops;
-+
-+	clk_data->sampleclk_hw.init = &sampleclk_init;
-+	clk_data->sampleclk =
-+		devm_clk_register(dev, &clk_data->sampleclk_hw);
-+	clk_data->sampleclk_hw.init = NULL;
-+
-+	ret = of_clk_add_provider(np, of_clk_src_simple_get,
-+				  clk_data->sampleclk);
-+	if (ret)
-+		dev_err(dev, "Failed to add sample clock provider\n");
- 
- 	return ret;
- }
-@@ -697,6 +766,54 @@ static void sdhci_arasan_unregister_sdclk(struct device *dev)
- 	of_clk_del_provider(dev->of_node);
- }
- 
-+/**
-+ * sdhci_arasan_register_sdclk - Register the sdcardclk for a PHY to use
-+ *
-+ * Some PHY devices need to know what the actual card clock is.  In order for
-+ * them to find out, we'll provide a clock through the common clock framework
-+ * for them to query.
-+ *
-+ * Note: without seriously re-architecting SDHCI's clock code and testing on
-+ * all platforms, there's no way to create a totally beautiful clock here
-+ * with all clock ops implemented.  Instead, we'll just create a clock that can
-+ * be queried and set the CLK_GET_RATE_NOCACHE attribute to tell common clock
-+ * framework that we're doing things behind its back.  This should be sufficient
-+ * to create nice clean device tree bindings and later (if needed) we can try
-+ * re-architecting SDHCI if we see some benefit to it.
-+ *
-+ * @sdhci_arasan:	Our private data structure.
-+ * @clk_xin:		Pointer to the functional clock
-+ * @dev:		Pointer to our struct device.
-+ * Returns 0 on success and error value on error
-+ */
-+static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
-+				       struct clk *clk_xin,
-+				       struct device *dev)
-+{
-+	struct device_node *np = dev->of_node;
-+	u32 num_clks = 0;
-+	int ret;
-+
-+	/* Providing a clock to the PHY is optional; no error if missing */
-+	if (of_property_read_u32(np, "#clock-cells", &num_clks) < 0)
-+		return 0;
-+
-+	ret = sdhci_arasan_register_sdcardclk(sdhci_arasan, clk_xin, dev);
-+	if (ret)
-+		return ret;
-+
-+	if (num_clks) {
-+		ret = sdhci_arasan_register_sampleclk(sdhci_arasan, clk_xin,
-+						      dev);
-+		if (ret) {
-+			sdhci_arasan_unregister_sdclk(dev);
-+			return ret;
-+		}
-+	}
-+
-+	return 0;
-+}
-+
- static int sdhci_arasan_add_host(struct sdhci_arasan_data *sdhci_arasan)
- {
- 	struct sdhci_host *host = sdhci_arasan->host;
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch b/recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
deleted file mode 100644
index 635b1b4..0000000
--- a/recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5dfbe0b3dce445b2e637dbd4a3afc6e93124d768 Mon Sep 17 00:00:00 2001
-From: Rajan Vaja <rajan.vaja@xilinx.com>
-Date: Fri, 18 Oct 2019 18:07:31 +0200
-Subject: [PATCH 03/12] arm64: zynqmp: Add firmware DT node
-
-Add firmware DT node in ZynqMP device tree. This node
-uses bindings as per new firmware interface driver.
-
-Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
-Signed-off-by: Michal Simek <michal.simek@xilinx.com>
-Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
-State: upstream (ef0d933efa8256b6ad462f60c8cdd4255ed5dc28)
----
- arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
-index 9aa67340a4d8..9115eaebbf70 100644
---- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
-+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
-@@ -115,6 +115,13 @@
- 		method = "smc";
- 	};
- 
-+	firmware {
-+		zynqmp_firmware: zynqmp-firmware {
-+			compatible = "xlnx,zynqmp-firmware";
-+			method = "smc";
-+		};
-+	};
-+
- 	timer {
- 		compatible = "arm,armv8-timer";
- 		interrupt-parent = <&gic>;
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch b/recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
deleted file mode 100644
index fed3518..0000000
--- a/recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 1590acccababd46c451214554ec9458986981487 Mon Sep 17 00:00:00 2001
-From: Rajan Vaja <rajan.vaja@xilinx.com>
-Date: Mon, 23 Dec 2019 00:34:59 -0800
-Subject: [PATCH 04/12] firmware: zynqmp: Add Node IDs in xlnx-zynqmp.h
-
-Add Node IDs in xlnx-zynqmp.h, which is required for using EEMI APIs.
-
-Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
-State: pending
----
- include/linux/firmware/xlnx-zynqmp.h | 82 ++++++++++++++++++++++++++++
- 1 file changed, 82 insertions(+)
-
-diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
-index 778abbbc7d94..fad681ba97d5 100644
---- a/include/linux/firmware/xlnx-zynqmp.h
-+++ b/include/linux/firmware/xlnx-zynqmp.h
-@@ -250,6 +250,88 @@ enum zynqmp_pm_request_ack {
- 	ZYNQMP_PM_REQUEST_ACK_NON_BLOCKING,
- };
- 
-+enum pm_node_id {
-+	NODE_UNKNOWN = 0,
-+	NODE_APU,
-+	NODE_APU_0,
-+	NODE_APU_1,
-+	NODE_APU_2,
-+	NODE_APU_3,
-+	NODE_RPU,
-+	NODE_RPU_0,
-+	NODE_RPU_1,
-+	NODE_PLD,
-+	NODE_FPD,
-+	NODE_OCM_BANK_0,
-+	NODE_OCM_BANK_1,
-+	NODE_OCM_BANK_2,
-+	NODE_OCM_BANK_3,
-+	NODE_TCM_0_A,
-+	NODE_TCM_0_B,
-+	NODE_TCM_1_A,
-+	NODE_TCM_1_B,
-+	NODE_L2,
-+	NODE_GPU_PP_0,
-+	NODE_GPU_PP_1,
-+	NODE_USB_0,
-+	NODE_USB_1,
-+	NODE_TTC_0,
-+	NODE_TTC_1,
-+	NODE_TTC_2,
-+	NODE_TTC_3,
-+	NODE_SATA,
-+	NODE_ETH_0,
-+	NODE_ETH_1,
-+	NODE_ETH_2,
-+	NODE_ETH_3,
-+	NODE_UART_0,
-+	NODE_UART_1,
-+	NODE_SPI_0,
-+	NODE_SPI_1,
-+	NODE_I2C_0,
-+	NODE_I2C_1,
-+	NODE_SD_0,
-+	NODE_SD_1,
-+	NODE_DP,
-+	NODE_GDMA,
-+	NODE_ADMA,
-+	NODE_NAND,
-+	NODE_QSPI,
-+	NODE_GPIO,
-+	NODE_CAN_0,
-+	NODE_CAN_1,
-+	NODE_EXTERN,
-+	NODE_APLL,
-+	NODE_VPLL,
-+	NODE_DPLL,
-+	NODE_RPLL,
-+	NODE_IOPLL,
-+	NODE_DDR,
-+	NODE_IPI_APU,
-+	NODE_IPI_RPU_0,
-+	NODE_GPU,
-+	NODE_PCIE,
-+	NODE_PCAP,
-+	NODE_RTC,
-+	NODE_LPD,
-+	NODE_VCU,
-+	NODE_IPI_RPU_1,
-+	NODE_IPI_PL_0,
-+	NODE_IPI_PL_1,
-+	NODE_IPI_PL_2,
-+	NODE_IPI_PL_3,
-+	NODE_PL,
-+	NODE_GEM_TSU,
-+	NODE_SWDT_0,
-+	NODE_SWDT_1,
-+	NODE_CSU,
-+	NODE_PJTAG,
-+	NODE_TRACE,
-+	NODE_TESTSCAN,
-+	NODE_PMU,
-+	NODE_MAX,
-+};
-+
- /**
-  * struct zynqmp_pm_query_data - PM query data
-  * @qid:	query ID
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch b/recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
deleted file mode 100644
index 198dcb9..0000000
--- a/recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 3dd549f60684322f64e7c8f1dc1acc63256c5b81 Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:25 -0700
-Subject: [PATCH 05/12] mmc: sdhci-of-arasan: Add support to set clock phase
- delays for SD
-
-Add support to read Clock Phase Delays from the DT and set it via
-clk_set_phase() API from clock framework. Some of the controllers might
-have their own handling of setting clock delays, for this keep the
-set_clk_delays as function pointer which can be assigned controller
-specific handling of the same.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
-Link : https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=f3dafc374a82929c679a0e791f43cc53268af952
-State: upstream (f3dafc374a82929c679a0e791f43cc53268af952)
----
- drivers/mmc/host/sdhci-of-arasan.c | 92 ++++++++++++++++++++++++++++++
- 1 file changed, 92 insertions(+)
-
-diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
-index b75ba780f902..9452ae01f6fa 100644
---- a/drivers/mmc/host/sdhci-of-arasan.c
-+++ b/drivers/mmc/host/sdhci-of-arasan.c
-@@ -77,12 +77,18 @@ struct sdhci_arasan_soc_ctl_map {
-  * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
-  * @sampleclk_hw:	Struct for the clock we might provide to a PHY.
-  * @sampleclk:		Pointer to normal 'struct clock' for sampleclk_hw.
-+ * @clk_phase_in:	Array of Input Clock Phase Delays for all speed modes
-+ * @clk_phase_out:	Array of Output Clock Phase Delays for all speed modes
-+ * @set_clk_delays:	Function pointer for setting Clock Delays
-  */
- struct sdhci_arasan_clk_data {
- 	struct clk_hw	sdcardclk_hw;
- 	struct clk      *sdcardclk;
- 	struct clk_hw	sampleclk_hw;
- 	struct clk      *sampleclk;
-+	int		clk_phase_in[MMC_TIMING_MMC_HS400 + 1];
-+	int		clk_phase_out[MMC_TIMING_MMC_HS400 + 1];
-+	void		(*set_clk_delays)(struct sdhci_host *host);
- };
- 
- /**
-@@ -186,6 +192,7 @@ static void sdhci_arasan_set_clock(struct sdhci_host *host, unsigned int clock)
- {
- 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
- 	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
-+	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
- 	bool ctrl_phy = false;
- 
- 	if (!IS_ERR(sdhci_arasan->phy)) {
-@@ -227,6 +234,10 @@ static void sdhci_arasan_set_clock(struct sdhci_host *host, unsigned int clock)
- 		sdhci_arasan->is_phy_on = false;
- 	}
- 
-+	/* Set the Input and Output Clock Phase Delays */
-+	if (clk_data->set_clk_delays)
-+		clk_data->set_clk_delays(host);
-+
- 	sdhci_set_clock(host, clock);
- 
- 	if (sdhci_arasan->quirks & SDHCI_ARASAN_QUIRK_CLOCK_UNSTABLE)
-@@ -650,6 +661,85 @@ static void sdhci_arasan_update_baseclkfreq(struct sdhci_host *host)
- 	sdhci_arasan_syscon_write(host, &soc_ctl_map->baseclkfreq, mhz);
- }
- 
-+static void sdhci_arasan_set_clk_delays(struct sdhci_host *host)
-+{
-+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
-+	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
-+	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
-+
-+	clk_set_phase(clk_data->sampleclk,
-+		      clk_data->clk_phase_in[host->timing]);
-+	clk_set_phase(clk_data->sdcardclk,
-+		      clk_data->clk_phase_out[host->timing]);
-+}
-+
-+static void arasan_dt_read_clk_phase(struct device *dev,
-+				     struct sdhci_arasan_clk_data *clk_data,
-+				     unsigned int timing, const char *prop)
-+{
-+	struct device_node *np = dev->of_node;
-+
-+	int clk_phase[2] = {0};
-+
-+	/*
-+	 * Read Tap Delay values from DT, if the DT does not contain the
-+	 * Tap Values then use the pre-defined values.
-+	 */
-+	if (of_property_read_variable_u32_array(np, prop, &clk_phase[0],
-+						2, 0)) {
-+		dev_dbg(dev, "Using predefined clock phase for %s = %d %d\n",
-+			prop, clk_data->clk_phase_in[timing],
-+			clk_data->clk_phase_out[timing]);
-+		return;
-+	}
-+
-+	/* The values read are Input and Output Clock Delays in order */
-+	clk_data->clk_phase_in[timing] = clk_phase[0];
-+	clk_data->clk_phase_out[timing] = clk_phase[1];
-+}
-+
-+/**
-+ * arasan_dt_parse_clk_phases - Read Clock Delay values from DT
-+ *
-+ * Called at initialization to parse the values of Clock Delays.
-+ *
-+ * @dev:		Pointer to our struct device.
-+ * @clk_data:		Pointer to the Clock Data structure
-+ */
-+static void arasan_dt_parse_clk_phases(struct device *dev,
-+				       struct sdhci_arasan_clk_data *clk_data)
-+{
-+	/*
-+	 * This has been kept as a pointer and is assigned a function here.
-+	 * So that different controller variants can assign their own handling
-+	 * function.
-+	 */
-+	clk_data->set_clk_delays = sdhci_arasan_set_clk_delays;
-+
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_LEGACY,
-+				 "clk-phase-legacy");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS,
-+				 "clk-phase-mmc-hs");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_SD_HS,
-+				 "clk-phase-sd-hs");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR12,
-+				 "clk-phase-uhs-sdr12");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR25,
-+				 "clk-phase-uhs-sdr25");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR50,
-+				 "clk-phase-uhs-sdr50");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR104,
-+				 "clk-phase-uhs-sdr104");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_DDR50,
-+				 "clk-phase-uhs-ddr50");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_DDR52,
-+				 "clk-phase-mmc-ddr52");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS200,
-+				 "clk-phase-mmc-hs200");
-+	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS400,
-+				 "clk-phase-mmc-hs400");
-+}
-+
- /**
-  * sdhci_arasan_register_sdcardclk - Register the sdcardclk for a PHY to use
-  *
-@@ -942,6 +1032,8 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
- 	if (ret)
- 		goto clk_disable_all;
- 
-+	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
-+
- 	ret = mmc_of_parse(host->mmc);
- 	if (ret) {
- 		if (ret != -EPROBE_DEFER)
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch b/recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
deleted file mode 100644
index 88f4d94..0000000
--- a/recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 6f56034f6d06881b9f016f5320a4c57129a10a75 Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:26 -0700
-Subject: [PATCH 06/12] firmware: xilinx: Add SDIO Tap Delay nodes
-
-Add tap delay nodes for setting SDIO Tap Delays on ZynqMP platform.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
-Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/firmware/xlnx-zynqmp.h?id=1ed7d5c8f82d2aebabb6fe24f436a68bdd8c1065
-State: upstream (1ed7d5c8f82d2aebabb6fe24f436a68bdd8c1065)
----
- include/linux/firmware/xlnx-zynqmp.h | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
-index fad681ba97d5..d30f354eed09 100644
---- a/include/linux/firmware/xlnx-zynqmp.h
-+++ b/include/linux/firmware/xlnx-zynqmp.h
-@@ -91,7 +91,8 @@ enum pm_ret_status {
- };
- 
- enum pm_ioctl_id {
--	IOCTL_SET_PLL_FRAC_MODE = 8,
-+	IOCTL_SET_SD_TAPDELAY = 7,
-+	IOCTL_SET_PLL_FRAC_MODE,
- 	IOCTL_GET_PLL_FRAC_MODE,
- 	IOCTL_SET_PLL_FRAC_DATA,
- 	IOCTL_GET_PLL_FRAC_DATA,
-@@ -250,6 +251,11 @@ enum zynqmp_pm_request_ack {
- 	ZYNQMP_PM_REQUEST_ACK_NON_BLOCKING,
- };
- 
-+enum tap_delay_type {
-+	PM_TAPDELAY_INPUT = 0,
-+	PM_TAPDELAY_OUTPUT,
-+};
-+
- enum pm_node_id {
- 	NODE_UNKNOWN = 0,
- 	NODE_APU,
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch b/recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
deleted file mode 100644
index 988cc3d..0000000
--- a/recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
+++ /dev/null
@@ -1,308 +0,0 @@
-From fa38046c53f1e02af90579437bd290dc5c5d8a49 Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:28 -0700
-Subject: [PATCH 07/12] mmc: sdhci-of-arasan: Add support for ZynqMP Platform
- Tap Delays Setup
-
-Apart from taps set by auto tuning, ZynqMP platform has feature to set
-the tap values manually. Add support to set tap delay values in HW via
-ZynqMP SoC framework.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
-Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=a5c8b2ae2e5123c8a6b291e2c56ba5c39b645a95
-State: upstream (a5c8b2ae2e5123c8a6b291e2c56ba5c39b645a95)
----
- drivers/mmc/host/sdhci-of-arasan.c | 206 ++++++++++++++++++++++++++++-
- 1 file changed, 204 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
-index 9452ae01f6fa..228dbeef74a8 100644
---- a/drivers/mmc/host/sdhci-of-arasan.c
-+++ b/drivers/mmc/host/sdhci-of-arasan.c
-@@ -22,6 +22,7 @@
- #include <linux/phy/phy.h>
- #include <linux/regmap.h>
- #include <linux/of.h>
-+#include <linux/firmware/xlnx-zynqmp.h>
- 
- #include "cqhci.h"
- #include "sdhci-pltfm.h"
-@@ -32,6 +33,10 @@
- 
- #define PHY_CLK_TOO_SLOW_HZ		400000
- 
-+/* Default settings for ZynqMP Clock Phases */
-+#define ZYNQMP_ICLK_PHASE {0, 63, 63, 0, 63,  0,   0, 183, 54,  0, 0}
-+#define ZYNQMP_OCLK_PHASE {0, 72, 60, 0, 60, 72, 135, 48, 72, 135, 0}
-+
- /*
-  * On some SoCs the syscon area has a feature where the upper 16-bits of
-  * each 32-bit register act as a write mask for the lower 16-bits.  This allows
-@@ -80,6 +85,7 @@ struct sdhci_arasan_soc_ctl_map {
-  * @clk_phase_in:	Array of Input Clock Phase Delays for all speed modes
-  * @clk_phase_out:	Array of Output Clock Phase Delays for all speed modes
-  * @set_clk_delays:	Function pointer for setting Clock Delays
-+ * @clk_of_data:	Platform specific runtime clock data storage pointer
-  */
- struct sdhci_arasan_clk_data {
- 	struct clk_hw	sdcardclk_hw;
-@@ -89,6 +95,11 @@ struct sdhci_arasan_clk_data {
- 	int		clk_phase_in[MMC_TIMING_MMC_HS400 + 1];
- 	int		clk_phase_out[MMC_TIMING_MMC_HS400 + 1];
- 	void		(*set_clk_delays)(struct sdhci_host *host);
-+	void		*clk_of_data;
-+};
-+
-+struct sdhci_arasan_zynqmp_clk_data {
-+	const struct zynqmp_eemi_ops *eemi_ops;
- };
- 
- /**
-@@ -525,6 +536,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
- 		.compatible = "arasan,sdhci-4.9a",
- 		.data = &sdhci_arasan_data,
- 	},
-+	{
-+		.compatible = "xlnx,zynqmp-8.9a",
-+		.data = &sdhci_arasan_data,
-+	},
- 	{ /* sentinel */ }
- };
- MODULE_DEVICE_TABLE(of, sdhci_arasan_of_match);
-@@ -583,6 +598,150 @@ static const struct clk_ops arasan_sampleclk_ops = {
- 	.recalc_rate = sdhci_arasan_sampleclk_recalc_rate,
- };
- 
-+/**
-+ * sdhci_zynqmp_sdcardclk_set_phase - Set the SD Output Clock Tap Delays
-+ *
-+ * Set the SD Output Clock Tap Delays for Output path
-+ *
-+ * @hw:			Pointer to the hardware clock structure.
-+ * @degrees		The clock phase shift between 0 - 359.
-+ * Return: 0 on success and error value on error
-+ */
-+static int sdhci_zynqmp_sdcardclk_set_phase(struct clk_hw *hw, int degrees)
-+
-+{
-+	struct sdhci_arasan_clk_data *clk_data =
-+		container_of(hw, struct sdhci_arasan_clk_data, sdcardclk_hw);
-+	struct sdhci_arasan_data *sdhci_arasan =
-+		container_of(clk_data, struct sdhci_arasan_data, clk_data);
-+	struct sdhci_host *host = sdhci_arasan->host;
-+	struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data =
-+		clk_data->clk_of_data;
-+	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_clk_data->eemi_ops;
-+	const char *clk_name = clk_hw_get_name(hw);
-+	u32 node_id = !strcmp(clk_name, "clk_out_sd0") ? NODE_SD_0 : NODE_SD_1;
-+	u8 tap_delay, tap_max = 0;
-+	int ret;
-+
-+	/*
-+	 * This is applicable for SDHCI_SPEC_300 and above
-+	 * ZynqMP does not set phase for <=25MHz clock.
-+	 * If degrees is zero, no need to do anything.
-+	 */
-+	if (host->version < SDHCI_SPEC_300 ||
-+	    host->timing == MMC_TIMING_LEGACY ||
-+	    host->timing == MMC_TIMING_UHS_SDR12 || !degrees)
-+		return 0;
-+
-+	switch (host->timing) {
-+	case MMC_TIMING_MMC_HS:
-+	case MMC_TIMING_SD_HS:
-+	case MMC_TIMING_UHS_SDR25:
-+	case MMC_TIMING_UHS_DDR50:
-+	case MMC_TIMING_MMC_DDR52:
-+		/* For 50MHz clock, 30 Taps are available */
-+		tap_max = 30;
-+		break;
-+	case MMC_TIMING_UHS_SDR50:
-+		/* For 100MHz clock, 15 Taps are available */
-+		tap_max = 15;
-+		break;
-+	case MMC_TIMING_UHS_SDR104:
-+	case MMC_TIMING_MMC_HS200:
-+		/* For 200MHz clock, 8 Taps are available */
-+		tap_max = 8;
-+	default:
-+		break;
-+	}
-+
-+	tap_delay = (degrees * tap_max) / 360;
-+
-+	/* Set the Clock Phase */
-+	ret = eemi_ops->ioctl(node_id, IOCTL_SET_SD_TAPDELAY,
-+			      PM_TAPDELAY_OUTPUT, tap_delay, NULL);
-+	if (ret)
-+		pr_err("Error setting Output Tap Delay\n");
-+
-+	return ret;
-+}
-+
-+static const struct clk_ops zynqmp_sdcardclk_ops = {
-+	.recalc_rate = sdhci_arasan_sdcardclk_recalc_rate,
-+	.set_phase = sdhci_zynqmp_sdcardclk_set_phase,
-+};
-+
-+/**
-+ * sdhci_zynqmp_sampleclk_set_phase - Set the SD Input Clock Tap Delays
-+ *
-+ * Set the SD Input Clock Tap Delays for Input path
-+ *
-+ * @hw:			Pointer to the hardware clock structure.
-+ * @degrees		The clock phase shift between 0 - 359.
-+ * Return: 0 on success and error value on error
-+ */
-+static int sdhci_zynqmp_sampleclk_set_phase(struct clk_hw *hw, int degrees)
-+
-+{
-+	struct sdhci_arasan_clk_data *clk_data =
-+		container_of(hw, struct sdhci_arasan_clk_data, sampleclk_hw);
-+	struct sdhci_arasan_data *sdhci_arasan =
-+		container_of(clk_data, struct sdhci_arasan_data, clk_data);
-+	struct sdhci_host *host = sdhci_arasan->host;
-+	struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data =
-+		clk_data->clk_of_data;
-+	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_clk_data->eemi_ops;
-+	const char *clk_name = clk_hw_get_name(hw);
-+	u32 node_id = !strcmp(clk_name, "clk_in_sd0") ? NODE_SD_0 : NODE_SD_1;
-+	u8 tap_delay, tap_max = 0;
-+	int ret;
-+
-+	/*
-+	 * This is applicable for SDHCI_SPEC_300 and above
-+	 * ZynqMP does not set phase for <=25MHz clock.
-+	 * If degrees is zero, no need to do anything.
-+	 */
-+	if (host->version < SDHCI_SPEC_300 ||
-+	    host->timing == MMC_TIMING_LEGACY ||
-+	    host->timing == MMC_TIMING_UHS_SDR12 || !degrees)
-+		return 0;
-+
-+	switch (host->timing) {
-+	case MMC_TIMING_MMC_HS:
-+	case MMC_TIMING_SD_HS:
-+	case MMC_TIMING_UHS_SDR25:
-+	case MMC_TIMING_UHS_DDR50:
-+	case MMC_TIMING_MMC_DDR52:
-+		/* For 50MHz clock, 120 Taps are available */
-+		tap_max = 120;
-+		break;
-+	case MMC_TIMING_UHS_SDR50:
-+		/* For 100MHz clock, 60 Taps are available */
-+		tap_max = 60;
-+		break;
-+	case MMC_TIMING_UHS_SDR104:
-+	case MMC_TIMING_MMC_HS200:
-+		/* For 200MHz clock, 30 Taps are available */
-+		tap_max = 30;
-+	default:
-+		break;
-+	}
-+
-+	tap_delay = (degrees * tap_max) / 360;
-+
-+	/* Set the Clock Phase */
-+	ret = eemi_ops->ioctl(node_id, IOCTL_SET_SD_TAPDELAY,
-+			      PM_TAPDELAY_INPUT, tap_delay, NULL);
-+	if (ret)
-+		pr_err("Error setting Input Tap Delay\n");
-+
-+	return ret;
-+}
-+
-+static const struct clk_ops zynqmp_sampleclk_ops = {
-+	.recalc_rate = sdhci_arasan_sampleclk_recalc_rate,
-+	.set_phase = sdhci_zynqmp_sampleclk_set_phase,
-+};
-+
- /**
-  * sdhci_arasan_update_clockmultiplier - Set corecfg_clockmultiplier
-  *
-@@ -709,6 +868,10 @@ static void arasan_dt_read_clk_phase(struct device *dev,
- static void arasan_dt_parse_clk_phases(struct device *dev,
- 				       struct sdhci_arasan_clk_data *clk_data)
- {
-+	int *iclk_phase, *oclk_phase;
-+	u32 mio_bank = 0;
-+	int i;
-+
- 	/*
- 	 * This has been kept as a pointer and is assigned a function here.
- 	 * So that different controller variants can assign their own handling
-@@ -716,6 +879,22 @@ static void arasan_dt_parse_clk_phases(struct device *dev,
- 	 */
- 	clk_data->set_clk_delays = sdhci_arasan_set_clk_delays;
- 
-+	if (of_device_is_compatible(dev->of_node, "xlnx,zynqmp-8.9a")) {
-+		iclk_phase = (int [MMC_TIMING_MMC_HS400 + 1]) ZYNQMP_ICLK_PHASE;
-+		oclk_phase = (int [MMC_TIMING_MMC_HS400 + 1]) ZYNQMP_OCLK_PHASE;
-+
-+		of_property_read_u32(dev->of_node, "xlnx,mio-bank", &mio_bank);
-+		if (mio_bank == 2) {
-+			oclk_phase[MMC_TIMING_UHS_SDR104] = 90;
-+			oclk_phase[MMC_TIMING_MMC_HS200] = 90;
-+		}
-+
-+		for (i = 0; i <= MMC_TIMING_MMC_HS400; i++) {
-+			clk_data->clk_phase_in[i] = iclk_phase[i];
-+			clk_data->clk_phase_out[i] = oclk_phase[i];
-+		}
-+	}
-+
- 	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_LEGACY,
- 				 "clk-phase-legacy");
- 	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS,
-@@ -774,7 +953,10 @@ sdhci_arasan_register_sdcardclk(struct sdhci_arasan_data *sdhci_arasan,
- 	sdcardclk_init.parent_names = &parent_clk_name;
- 	sdcardclk_init.num_parents = 1;
- 	sdcardclk_init.flags = CLK_GET_RATE_NOCACHE;
--	sdcardclk_init.ops = &arasan_sdcardclk_ops;
-+	if (of_device_is_compatible(np, "xlnx,zynqmp-8.9a"))
-+		sdcardclk_init.ops = &zynqmp_sdcardclk_ops;
-+	else
-+		sdcardclk_init.ops = &arasan_sdcardclk_ops;
- 
- 	clk_data->sdcardclk_hw.init = &sdcardclk_init;
- 	clk_data->sdcardclk =
-@@ -823,7 +1005,10 @@ sdhci_arasan_register_sampleclk(struct sdhci_arasan_data *sdhci_arasan,
- 	sampleclk_init.parent_names = &parent_clk_name;
- 	sampleclk_init.num_parents = 1;
- 	sampleclk_init.flags = CLK_GET_RATE_NOCACHE;
--	sampleclk_init.ops = &arasan_sampleclk_ops;
-+	if (of_device_is_compatible(np, "xlnx,zynqmp-8.9a"))
-+		sampleclk_init.ops = &zynqmp_sampleclk_ops;
-+	else
-+		sampleclk_init.ops = &arasan_sampleclk_ops;
- 
- 	clk_data->sampleclk_hw.init = &sampleclk_init;
- 	clk_data->sampleclk =
-@@ -1032,6 +1217,23 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
- 	if (ret)
- 		goto clk_disable_all;
- 
-+	if (of_device_is_compatible(np, "xlnx,zynqmp-8.9a")) {
-+		struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data;
-+		const struct zynqmp_eemi_ops *eemi_ops;
-+
-+		zynqmp_clk_data = devm_kzalloc(&pdev->dev,
-+					       sizeof(*zynqmp_clk_data),
-+					       GFP_KERNEL);
-+		eemi_ops = zynqmp_pm_get_eemi_ops();
-+		if (IS_ERR(eemi_ops)) {
-+			ret = PTR_ERR(eemi_ops);
-+			goto unreg_clk;
-+		}
-+
-+		zynqmp_clk_data->eemi_ops = eemi_ops;
-+		sdhci_arasan->clk_data.clk_of_data = zynqmp_clk_data;
-+	}
-+
- 	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
- 
- 	ret = mmc_of_parse(host->mmc);
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch b/recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
deleted file mode 100644
index 9755b12..0000000
--- a/recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From a4bb3bf0ca0ffc87a12e7dafd59c03ec2a919cf6 Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:29 -0700
-Subject: [PATCH 08/12] firmware: xilinx: Add DLL reset support
-
-Add DLL reset support in ZynqMP firmware driver for SD DLL reset.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-State: pending
----
- drivers/firmware/xilinx/zynqmp.c     | 2 ++
- include/linux/firmware/xlnx-zynqmp.h | 9 ++++++++-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
-index fd3d83745208..d41c0983e8d7 100644
---- a/drivers/firmware/xilinx/zynqmp.c
-+++ b/drivers/firmware/xilinx/zynqmp.c
-@@ -473,6 +473,8 @@ static inline int zynqmp_is_valid_ioctl(u32 ioctl_id)
- 	case IOCTL_GET_PLL_FRAC_MODE:
- 	case IOCTL_SET_PLL_FRAC_DATA:
- 	case IOCTL_GET_PLL_FRAC_DATA:
-+	case IOCTL_SD_DLL_RESET:
-+	case IOCTL_SET_SD_TAPDELAY:
- 		return 1;
- 	default:
- 		return 0;
-diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
-index d30f354eed09..b4f9adf18327 100644
---- a/include/linux/firmware/xlnx-zynqmp.h
-+++ b/include/linux/firmware/xlnx-zynqmp.h
-@@ -91,7 +91,8 @@ enum pm_ret_status {
- };
- 
- enum pm_ioctl_id {
--	IOCTL_SET_SD_TAPDELAY = 7,
-+	IOCTL_SD_DLL_RESET = 6,
-+	IOCTL_SET_SD_TAPDELAY,
- 	IOCTL_SET_PLL_FRAC_MODE,
- 	IOCTL_GET_PLL_FRAC_MODE,
- 	IOCTL_SET_PLL_FRAC_DATA,
-@@ -256,6 +257,12 @@ enum tap_delay_type {
- 	PM_TAPDELAY_OUTPUT,
- };
- 
-+enum dll_reset_type {
-+	PM_DLL_RESET_ASSERT,
-+	PM_DLL_RESET_RELEASE,
-+	PM_DLL_RESET_PULSE,
-+};
-+
- enum pm_node_id {
- 	NODE_UNKNOWN = 0,
- 	NODE_APU,
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch b/recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
deleted file mode 100644
index 1599b73..0000000
--- a/recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 01a29e9ae1c9caa344eced880bcb6c05f2e0f918 Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:30 -0700
-Subject: [PATCH 09/12] mmc: sdhci-of-arasan: Add support for DLL reset for
- ZynqMP platforms
-
-The DLL resets are required while executing the auto tuning procedure in
-ZynqMP. This patch adds code to support the same.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-State: pending
----
- drivers/mmc/host/sdhci-of-arasan.c | 63 ++++++++++++++++++++++++++++++
- 1 file changed, 63 insertions(+)
-
-diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
-index 228dbeef74a8..d4e1823bc10b 100644
---- a/drivers/mmc/host/sdhci-of-arasan.c
-+++ b/drivers/mmc/host/sdhci-of-arasan.c
-@@ -742,6 +742,67 @@ static const struct clk_ops zynqmp_sampleclk_ops = {
- 	.set_phase = sdhci_zynqmp_sampleclk_set_phase,
- };
- 
-+static void arasan_zynqmp_dll_reset(struct sdhci_host *host, u32 deviceid)
-+{
-+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
-+	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
-+	struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data =
-+		sdhci_arasan->clk_data.clk_of_data;
-+	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_clk_data->eemi_ops;
-+	u16 clk;
-+	unsigned long timeout;
-+
-+	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
-+	clk &= ~(SDHCI_CLOCK_CARD_EN | SDHCI_CLOCK_INT_EN);
-+	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
-+
-+	/* Issue DLL Reset */
-+	eemi_ops->ioctl(deviceid, IOCTL_SD_DLL_RESET,
-+			PM_DLL_RESET_PULSE, 0, NULL);
-+
-+	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
-+	clk |= SDHCI_CLOCK_INT_EN;
-+	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
-+
-+	/* Wait max 20 ms */
-+	timeout = 20;
-+	while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL))
-+				& SDHCI_CLOCK_INT_STABLE)) {
-+		if (timeout == 0) {
-+			dev_err(mmc_dev(host->mmc),
-+				": Internal clock never stabilised.\n");
-+			return;
-+		}
-+		timeout--;
-+		mdelay(1);
-+	}
-+
-+	clk |= SDHCI_CLOCK_CARD_EN;
-+	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
-+}
-+
-+static int arasan_zynqmp_execute_tuning(struct mmc_host *mmc, u32 opcode)
-+{
-+	struct sdhci_host *host = mmc_priv(mmc);
-+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
-+	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
-+	struct clk_hw *hw = &sdhci_arasan->clk_data.sdcardclk_hw;
-+	const char *clk_name = clk_hw_get_name(hw);
-+	u32 device_id = !strcmp(clk_name, "clk_out_sd0") ? NODE_SD_0 :
-+							   NODE_SD_1;
-+	int err;
-+
-+	arasan_zynqmp_dll_reset(host, device_id);
-+
-+	err = sdhci_execute_tuning(mmc, opcode);
-+	if (err)
-+		return err;
-+
-+	arasan_zynqmp_dll_reset(host, device_id);
-+
-+	return 0;
-+}
-+
- /**
-  * sdhci_arasan_update_clockmultiplier - Set corecfg_clockmultiplier
-  *
-@@ -1232,6 +1293,8 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
- 
- 		zynqmp_clk_data->eemi_ops = eemi_ops;
- 		sdhci_arasan->clk_data.clk_of_data = zynqmp_clk_data;
-+		host->mmc_host_ops.execute_tuning =
-+			arasan_zynqmp_execute_tuning;
- 	}
- 
- 	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch b/recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
deleted file mode 100644
index 1ec5fb7..0000000
--- a/recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4f818dabce72220544f537eaaff409443b7cd16c Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Fri, 10 Jan 2020 02:17:31 -0700
-Subject: [PATCH 10/12] arm64: zynqmp: Add ZynqMP SDHCI compatible string
-
-Add the new compatible string for ZynqMP SD Host Controller for its use
-in the Arasan SDHCI driver for some of the ZynqMP specific operations.
-Add required properties for the same.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-Signed-off-by: Michal Simek <michal.simek@xilinx.com>
-Link: https://github.com/Xilinx/linux-xlnx/commit/a8fdb80f4d477a71a98cb069f4d5a42f41bbbe9c
-State: upstream (a8fdb80f4d477a71a98cb069f4d5a42f41bbbe9c)
----
- arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
-index 9115eaebbf70..7bae80c537a5 100644
---- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
-+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
-@@ -500,21 +500,25 @@
- 		};
- 
- 		sdhci0: mmc@ff160000 {
--			compatible = "arasan,sdhci-8.9a";
-+			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
- 			status = "disabled";
- 			interrupt-parent = <&gic>;
- 			interrupts = <0 48 4>;
- 			reg = <0x0 0xff160000 0x0 0x1000>;
- 			clock-names = "clk_xin", "clk_ahb";
-+			#clock-cells = <1>;
-+			clock-output-names = "clk_out_sd0", "clk_in_sd0";
- 		};
- 
- 		sdhci1: mmc@ff170000 {
--			compatible = "arasan,sdhci-8.9a";
-+			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
- 			status = "disabled";
- 			interrupt-parent = <&gic>;
- 			interrupts = <0 49 4>;
- 			reg = <0x0 0xff170000 0x0 0x1000>;
- 			clock-names = "clk_xin", "clk_ahb";
-+			#clock-cells = <1>;
-+			clock-output-names = "clk_out_sd1", "clk_in_sd1";
- 		};
- 
- 		smmu: smmu@fd800000 {
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch b/recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
deleted file mode 100644
index 29471c2..0000000
--- a/recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 3adc5f79a53ad8fe3e7fbf22bcc9dcc78ccf2d8c Mon Sep 17 00:00:00 2001
-From: Manish Narani <manish.narani@xilinx.com>
-Date: Tue, 18 Feb 2020 04:04:48 -0700
-Subject: [PATCH 11/12] mmc: sdhci-of-arasan: Modified SD default speed to
- 19MHz for ZynqMP
-
-SD standard speed timing was met only at 19MHz and not 25 MHz, that's
-why changing driver to 19MHz. The reason for this is when a level shifter
-is used on the board, timing was met for standard speed only at 19MHz.
-Since this level shifter is commonly required for high speed modes,
-the driver is modified to use standard speed of 19Mhz.
-
-Signed-off-by: Manish Narani <manish.narani@xilinx.com>
-State: pending
----
- drivers/mmc/host/sdhci-of-arasan.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
-index d4e1823bc10b..7e82a33f7031 100644
---- a/drivers/mmc/host/sdhci-of-arasan.c
-+++ b/drivers/mmc/host/sdhci-of-arasan.c
-@@ -130,6 +130,12 @@ struct sdhci_arasan_data {
- /* Controller immediately reports SDHCI_CLOCK_INT_STABLE after enabling the
-  * internal clock even when the clock isn't stable */
- #define SDHCI_ARASAN_QUIRK_CLOCK_UNSTABLE BIT(1)
-+/*
-+ * Some of the Arasan variations might not have timing requirements
-+ * met at 25MHz for Default Speed mode, those controllers work at
-+ * 19MHz instead
-+ */
-+#define SDHCI_ARASAN_QUIRK_CLOCK_25_BROKEN BIT(2)
- };
- 
- struct sdhci_arasan_of_data {
-@@ -245,6 +251,16 @@ static void sdhci_arasan_set_clock(struct sdhci_host *host, unsigned int clock)
- 		sdhci_arasan->is_phy_on = false;
- 	}
- 
-+	if (sdhci_arasan->quirks & SDHCI_ARASAN_QUIRK_CLOCK_25_BROKEN) {
-+		/*
-+		 * Some of the Arasan variations might not have timing
-+		 * requirements met at 25MHz for Default Speed mode,
-+		 * those controllers work at 19MHz instead.
-+		 */
-+		if (clock == DEFAULT_SPEED_MAX_DTR)
-+			clock = (DEFAULT_SPEED_MAX_DTR * 19) / 25;
-+	}
-+
- 	/* Set the Input and Output Clock Phase Delays */
- 	if (clk_data->set_clk_delays)
- 		clk_data->set_clk_delays(host);
-@@ -1295,6 +1311,8 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
- 		sdhci_arasan->clk_data.clk_of_data = zynqmp_clk_data;
- 		host->mmc_host_ops.execute_tuning =
- 			arasan_zynqmp_execute_tuning;
-+
-+		sdhci_arasan->quirks |= SDHCI_ARASAN_QUIRK_CLOCK_25_BROKEN;
- 	}
- 
- 	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
--- 
-2.26.2
-
diff --git a/recipes-kernel/linux/files/amd64_defconfig_5.4 b/recipes-kernel/linux/files/amd64_defconfig_5.10
similarity index 98%
rename from recipes-kernel/linux/files/amd64_defconfig_5.4
rename to recipes-kernel/linux/files/amd64_defconfig_5.10
index 977af5e..11bc670 100644
--- a/recipes-kernel/linux/files/amd64_defconfig_5.4
+++ b/recipes-kernel/linux/files/amd64_defconfig_5.10
@@ -159,6 +159,7 @@ CONFIG_VIRTIO_NET=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_AURORA is not set
 CONFIG_E1000E=m
+CONFIG_IGB=m
 CONFIG_R8169=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_CDC_EEM=y
@@ -223,8 +224,6 @@ CONFIG_INPUT_MISC=y
 CONFIG_INPUT_PCSPKR=m
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_RAW=m
-CONFIG_SERIAL_NONSTANDARD=y
-CONFIG_DEVKMEM=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=48
@@ -232,10 +231,13 @@ CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_NONSTANDARD=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 # CONFIG_HW_RANDOM_INTEL is not set
 # CONFIG_HW_RANDOM_AMD is not set
+CONFIG_DEVKMEM=y
 CONFIG_HPET=y
 CONFIG_I2C=y
 CONFIG_I2C_I801=m
@@ -245,6 +247,8 @@ CONFIG_POWER_SUPPLY=y
 CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_CORE=y
 CONFIG_LPC_ICH=m
+CONFIG_MFD_INTEL_LPSS_ACPI=y
+CONFIG_MFD_INTEL_LPSS_PCI=y
 CONFIG_AGP=y
 CONFIG_AGP_AMD64=y
 CONFIG_AGP_INTEL=m
@@ -255,7 +259,6 @@ CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_VESA=y
 CONFIG_FB_EFI=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_VGACON_SOFT_SCROLLBACK=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
@@ -332,7 +335,6 @@ CONFIG_SECURITY_SELINUX_BOOTPARAM=y
 CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_SHA256=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
@@ -340,14 +342,14 @@ CONFIG_DEBUG_RODATA_TEST=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_RCU_CPU_STALL_TIMEOUT=60
+# CONFIG_DYNAMIC_FTRACE is not set
+CONFIG_FUNCTION_PROFILER=y
+CONFIG_STACK_TRACER=y
 CONFIG_IRQSOFF_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
-CONFIG_STACK_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
 # CONFIG_UPROBE_EVENTS is not set
-# CONFIG_DYNAMIC_FTRACE is not set
-CONFIG_FUNCTION_PROFILER=y
 # CONFIG_STRICT_DEVMEM is not set
 # CONFIG_X86_VERBOSE_BOOTUP is not set
 # CONFIG_X86_DEBUG_FPU is not set
diff --git a/recipes-kernel/linux/files/arm64_defconfig_5.4 b/recipes-kernel/linux/files/arm64_defconfig_5.10
similarity index 92%
rename from recipes-kernel/linux/files/arm64_defconfig_5.4
rename to recipes-kernel/linux/files/arm64_defconfig_5.10
index 8c400db..6a65ffa 100644
--- a/recipes-kernel/linux/files/arm64_defconfig_5.4
+++ b/recipes-kernel/linux/files/arm64_defconfig_5.10
@@ -15,7 +15,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_HUGETLB=y
@@ -27,7 +26,6 @@ CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
-# CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
@@ -59,12 +57,10 @@ CONFIG_ARCH_ZYNQMP=y
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_NUMA=y
-CONFIG_SECCOMP=y
 CONFIG_PARAVIRT=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_COMPAT=y
-# CONFIG_ARM64_LSE_ATOMICS is not set
 CONFIG_HIBERNATION=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
@@ -76,7 +72,6 @@ CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_ACPI=y
 CONFIG_ACPI_APEI=y
 CONFIG_ACPI_APEI_GHES=y
-CONFIG_ACPI_APEI_PCIEAER=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_ARM64_CRYPTO=y
 CONFIG_CRYPTO_SHA1_ARM64_CE=y
@@ -87,7 +82,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_CMA=y
@@ -99,7 +93,6 @@ CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6_SIT is not set
 CONFIG_NETFILTER=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_NET_SWITCHDEV=y
@@ -132,7 +125,6 @@ CONFIG_OF_OVERLAY=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_SRAM=y
-# CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SAS_ATA=y
 CONFIG_SCSI_HISI_SAS=y
@@ -152,7 +144,6 @@ CONFIG_TUN=y
 CONFIG_VIRTIO_NET=y
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
-# CONFIG_NET_VENDOR_AURORA is not set
 CONFIG_MACB=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
@@ -166,17 +157,10 @@ CONFIG_RAVB=y
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_STMMAC_ETH=y
-# CONFIG_DWMAC_GENERIC is not set
-# CONFIG_DWMAC_IPQ806X is not set
-# CONFIG_DWMAC_MESON is not set
-# CONFIG_DWMAC_QCOM_ETHQOS is not set
-# CONFIG_DWMAC_ROCKCHIP is not set
-# CONFIG_DWMAC_SOCFPGA is not set
-# CONFIG_DWMAC_SUNXI is not set
-CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_MARVELL_PHY=y
 CONFIG_MARVELL_10G_PHY=y
 CONFIG_MICREL_PHY=y
+CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_ATH9K_HTC=m
 CONFIG_CARL9170=m
 CONFIG_ATH6KL=m
@@ -186,7 +170,6 @@ CONFIG_ATH10K=m
 CONFIG_ATH10K_USB=m
 CONFIG_AT76C50X_USB=m
 CONFIG_BRCMFMAC=m
-# CONFIG_BRCMFMAC_SDIO is not set
 CONFIG_BRCMFMAC_USB=y
 CONFIG_HERMES=m
 CONFIG_ORINOCO_USB=m
@@ -218,7 +201,6 @@ CONFIG_USB_NET_RNDIS_WLAN=m
 CONFIG_IVSHMEM_NET=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
-CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_PM8941_PWRKEY=y
 CONFIG_INPUT_HISI_POWERKEY=m
@@ -264,7 +246,6 @@ CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
-CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SPI=y
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_ORION=y
@@ -296,7 +277,6 @@ CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_BATTERY_BQ27XXX=y
 CONFIG_SENSORS_ARM_SCPI=y
-CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_HISI_THERMAL=m
@@ -326,7 +306,6 @@ CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_FB=y
 CONFIG_FB_ARMCLCD=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
@@ -352,11 +331,9 @@ CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_ISP1760=y
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_NOP_USB_XCEIV=m
-CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_MV_UDC=y
 CONFIG_USB_MV_U3D=y
-# CONFIG_USB_BDC_UDC is not set
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
@@ -385,7 +362,6 @@ CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-CONFIG_EDAC=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_S5M=y
@@ -419,7 +395,6 @@ CONFIG_JAILHOUSE_DBGCON=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
-CONFIG_MFD_CROS_EC=y
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCPI=y
 CONFIG_COMMON_CLK_CS2000_CP=y
@@ -430,14 +405,13 @@ CONFIG_COMMON_CLK_QCOM=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
+CONFIG_COMMON_CLK_ZYNQMP=y
 CONFIG_ARM_MHU=y
 CONFIG_PLATFORM_MHU=y
 CONFIG_PCC=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_BCM_FLEXRM_MBOX=y
 CONFIG_RASPBERRYPI_POWER=y
-CONFIG_ARCH_R8A7795=y
-CONFIG_ARCH_R8A7796=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
@@ -483,15 +457,13 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
-# CONFIG_CRYPTO_DEV_VIRTIO is not set
-# CONFIG_CRYPTO_DEV_BCM_SPU is not set
 CONFIG_DMA_CMA=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
-CONFIG_MEMTEST=y
 # CONFIG_STRICT_DEVMEM is not set
+CONFIG_MEMTEST=y
diff --git a/recipes-kernel/linux/files/armhf_defconfig_5.4 b/recipes-kernel/linux/files/armhf_defconfig_5.10
similarity index 98%
rename from recipes-kernel/linux/files/armhf_defconfig_5.4
rename to recipes-kernel/linux/files/armhf_defconfig_5.10
index fafdebb..717f97a 100644
--- a/recipes-kernel/linux/files/armhf_defconfig_5.4
+++ b/recipes-kernel/linux/files/armhf_defconfig_5.10
@@ -6,7 +6,6 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
@@ -49,8 +48,6 @@ CONFIG_NR_CPUS=8
 CONFIG_ARM_PSCI=y
 # CONFIG_ARM_MODULE_PLTS is not set
 # CONFIG_ATAGS is not set
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_MODULES=y
@@ -106,7 +103,6 @@ CONFIG_VIRTIO_NET=y
 # CONFIG_NET_VENDOR_EZCHIP is not set
 # CONFIG_NET_VENDOR_FARADAY is not set
 # CONFIG_NET_VENDOR_HISILICON is not set
-# CONFIG_NET_VENDOR_HP is not set
 # CONFIG_NET_VENDOR_HUAWEI is not set
 # CONFIG_NET_VENDOR_INTEL is not set
 # CONFIG_NET_VENDOR_MARVELL is not set
@@ -147,7 +143,6 @@ CONFIG_IVSHMEM_NET=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_DEVKMEM=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
@@ -159,6 +154,7 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_VIRTIO_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
+CONFIG_DEVKMEM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MV64XXX=y
@@ -240,8 +236,8 @@ CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG=y
 CONFIG_XZ_DEC=y
 CONFIG_PRINTK_TIME=y
 CONFIG_BOOT_PRINTK_DELAY=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_SCHEDSTATS=y
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb
new file mode 100644
index 0000000..dd7a9e7
--- /dev/null
+++ b/recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb
@@ -0,0 +1,17 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018-2021
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-kernel/linux/linux-jailhouse_5.10.inc
+
+SRC_URI += "file://preempt-rt.cfg"
+
+SRC_URI[sha256sum] = "8206051628eac35ded4f691ed683cd08a22174a2e05f9f1837cef4e39443e5e7"
+SRCREV = "5cf8cf58d799b9d16bf522c31d92476dc9e22736"
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
deleted file mode 100644
index ed840e9..0000000
--- a/recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018-2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require recipes-kernel/linux/linux-jailhouse_5.4.inc
-
-SRC_URI += "file://preempt-rt.cfg"
-
-SRC_URI[sha256sum] = "7b58715af2468353b966dc57ec41737f41cde8729f1e2e209dc1d10e758464a3"
-SRCREV = "951c9e56a32b9ef1f9c1906b5cf8b47a8d953d64"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.10.31.bb b/recipes-kernel/linux/linux-jailhouse_5.10.31.bb
new file mode 100644
index 0000000..70df5a8
--- /dev/null
+++ b/recipes-kernel/linux/linux-jailhouse_5.10.31.bb
@@ -0,0 +1,15 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018-2021
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-kernel/linux/linux-jailhouse_5.10.inc
+
+SRC_URI[sha256sum] = "73ea481798bffb0378c7eba6d10f7d009c0d6dc6937d3760248c2cc143d8b70b"
+SRCREV = "eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.10.inc b/recipes-kernel/linux/linux-jailhouse_5.10.inc
new file mode 100644
index 0000000..c8bb325
--- /dev/null
+++ b/recipes-kernel/linux/linux-jailhouse_5.10.inc
@@ -0,0 +1,27 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018-2021
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-kernel/linux/linux-custom.inc
+
+KERNEL_DEFCONFIG = "${DISTRO_ARCH}_defconfig_5.10"
+
+SRC_URI += " \
+    https://github.com/siemens/linux/archive/${SRCREV}.tar.gz;downloadfilename=linux-${SRCREV}.tar.gz \
+    file://0001-ARM-dts-orange-pi-zero-Adjust-wifi-settings.patch \
+    file://0001-pwrseq_simple-Workaround-for-missing-device-tree-ent.patch \
+    file://0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch \
+    file://0001-Revert-arm64-dts-xilinx-Remove-dtsi-for-fixed-clock.patch \
+    file://0002-Revert-arm64-dts-xilinx-Add-the-clock-nodes-for-zynq.patch \
+    file://${KERNEL_DEFCONFIG}"
+
+S = "${WORKDIR}/linux-${SRCREV}"
+
+KBUILD_DEPENDS += "liblz4-tool"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.61.bb b/recipes-kernel/linux/linux-jailhouse_5.4.61.bb
deleted file mode 100644
index 2892828..0000000
--- a/recipes-kernel/linux/linux-jailhouse_5.4.61.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018-2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require recipes-kernel/linux/linux-jailhouse_5.4.inc
-
-SRC_URI[sha256sum] = "e6769cfb9fe666372a5baf52e116c6022ee8a0a2de48248a5897c6af54812a8e"
-SRCREV = "eb3ca54a7882348374d7ae32a749459c8bb4decd"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.inc b/recipes-kernel/linux/linux-jailhouse_5.4.inc
index c703839..c56e1c0 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.inc
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.inc
@@ -16,20 +16,6 @@ KERNEL_DEFCONFIG_rpi4 = "rpi4_defconfig_5.4"
 
 SRC_URI += " \
     https://github.com/siemens/linux/archive/${SRCREV}.tar.gz;downloadfilename=linux-${SRCREV}.tar.gz \
-    file://0001-ARM-dts-orange-pi-zero-Adjust-wifi-settings.patch \
-    file://0001-pwrseq_simple-Workaround-for-missing-device-tree-ent.patch \
-    file://0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch \
-    file://0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch \
-    file://0003-arm64-zynqmp-Add-firmware-DT-node.patch \
-    file://0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch \
-    file://0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch \
-    file://0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch \
-    file://0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch \
-    file://0008-firmware-xilinx-Add-DLL-reset-support.patch \
-    file://0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch \
-    file://0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch \
-    file://0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch \
-    file://0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch \
     file://${KERNEL_DEFCONFIG}"
 
 S = "${WORKDIR}/linux-${SRCREV}"
diff --git a/recipes-kernel/wilc/files/0001-Make-compatible-with-5.8-kernels.patch b/recipes-kernel/wilc/files/0001-Make-compatible-with-5.8-kernels.patch
new file mode 100644
index 0000000..37a9b1e
--- /dev/null
+++ b/recipes-kernel/wilc/files/0001-Make-compatible-with-5.8-kernels.patch
@@ -0,0 +1,191 @@
+From ce711d00e932310f2bc4fd4d7228c4e1fa550331 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sat, 27 Mar 2021 07:40:45 +0100
+Subject: [PATCH] Make compatible with 5.8+ kernels
+
+This is a port of upstream d530b9864073 to this fork. Breaks older
+kernels but it's not worth to account for that anymore.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ wilc/linux_wlan.c             | 20 ++++++++---------
+ wilc/wilc_wfi_cfgoperations.c | 42 ++++++++++++++---------------------
+ wilc/wilc_wfi_cfgoperations.h |  5 +++--
+ wilc/wilc_wfi_netdevice.h     |  9 +-------
+ 4 files changed, 31 insertions(+), 45 deletions(-)
+
+diff --git a/wilc/linux_wlan.c b/wilc/linux_wlan.c
+index 8cf0068..697e992 100644
+--- a/wilc/linux_wlan.c
++++ b/wilc/linux_wlan.c
+@@ -1229,6 +1229,7 @@ static int wilc_mac_open(struct net_device *ndev)
+ 	struct wilc_priv *priv = wdev_priv(vif->ndev->ieee80211_ptr);
+ 	unsigned char mac_add[ETH_ALEN] = {0};
+ 	int ret = 0;
++	struct mgmt_frame_regs mgmt_regs = {};
+ 
+ 	if (!wl || !wl->dev) {
+ 		PRINT_ER(ndev, "device not ready\n");
+@@ -1282,14 +1283,12 @@ static int wilc_mac_open(struct net_device *ndev)
+ 	}
+ 	ether_addr_copy(ndev->dev_addr, mac_add);
+ 
+-	wilc_mgmt_frame_register(vif->ndev->ieee80211_ptr->wiphy,
+-				 vif->ndev->ieee80211_ptr,
+-				 vif->frame_reg[0].type,
+-				 vif->frame_reg[0].reg);
+-	wilc_mgmt_frame_register(vif->ndev->ieee80211_ptr->wiphy,
+-				 vif->ndev->ieee80211_ptr,
+-				 vif->frame_reg[1].type,
+-				 vif->frame_reg[1].reg);
++	mgmt_regs.interface_stypes = vif->mgmt_reg_stypes;
++	/* so we detect a change */
++	vif->mgmt_reg_stypes = 0;
++	wilc_update_mgmt_frame_registrations(vif->ndev->ieee80211_ptr->wiphy,
++					     vif->ndev->ieee80211_ptr,
++					     &mgmt_regs);
+ 	netif_wake_queue(ndev);
+ 	wl->open_ifcs++;
+ 	priv->p2p.local_random = 0x01;
+@@ -1609,6 +1608,8 @@ void wilc_wfi_mgmt_rx(struct wilc *wilc, u8 *buff, u32 size)
+ {
+ 	int i = 0;
+ 	struct wilc_vif *vif;
++	u16 type = le16_to_cpup((__le16 *)buff);
++	u32 type_bit = BIT(type >> 4);
+ 
+ 	for (i = 0; i <= wilc->vif_num; i++) {
+ 		vif = netdev_priv(wilc->vif[i]->ndev);
+@@ -1619,8 +1620,7 @@ void wilc_wfi_mgmt_rx(struct wilc *wilc, u8 *buff, u32 size)
+ 	}
+ 
+ 	vif = netdev_priv(wilc->vif[1]->ndev);
+-	if ((buff[0] == vif->frame_reg[0].type && vif->frame_reg[0].reg) ||
+-	    (buff[0] == vif->frame_reg[1].type && vif->frame_reg[1].reg))
++	if (vif->mgmt_reg_stypes & type_bit)
+ 		wilc_wfi_p2p_rx(wilc->vif[1]->ndev, buff, size);
+ }
+ 
+diff --git a/wilc/wilc_wfi_cfgoperations.c b/wilc/wilc_wfi_cfgoperations.c
+index 53ccce1..e154232 100644
+--- a/wilc/wilc_wfi_cfgoperations.c
++++ b/wilc/wilc_wfi_cfgoperations.c
+@@ -2069,40 +2069,32 @@ static int mgmt_tx_cancel_wait(struct wiphy *wiphy,
+ 	return 0;
+ }
+ 
+-void wilc_mgmt_frame_register(struct wiphy *wiphy, struct wireless_dev *wdev,
+-			      u16 frame_type, bool reg)
++void wilc_update_mgmt_frame_registrations(struct wiphy *wiphy,
++					  struct wireless_dev *wdev,
++					  struct mgmt_frame_regs *upd)
+ {
+ 	struct wilc_priv *priv = wiphy_priv(wiphy);
+ 	struct wilc_vif *vif = netdev_priv(priv->wdev->netdev);
+ 	struct wilc *wl = vif->wilc;
++	u32 presp_bit = BIT(IEEE80211_STYPE_PROBE_REQ >> 4);
++	u32 action_bit = BIT(IEEE80211_STYPE_ACTION >> 4);
+ 
+-	if (!frame_type)
+-		return;
++	if (wl->initialized) {
++		bool prev = vif->mgmt_reg_stypes & presp_bit;
++		bool now = upd->interface_stypes & presp_bit;
+ 
+-	PRINT_INFO(vif->ndev, GENERIC_DBG,
+-		   "Frame registering Frame Type: %x: Boolean: %d\n",
+-		   frame_type, reg);
+-	switch (frame_type) {
+-	case PROBE_REQ:
+-		vif->frame_reg[0].type = frame_type;
+-		vif->frame_reg[0].reg = reg;
+-		break;
++		if (now != prev)
++			wilc_frame_register(vif, IEEE80211_STYPE_PROBE_REQ, now);
+ 
+-	case ACTION:
+-		vif->frame_reg[1].type = frame_type;
+-		vif->frame_reg[1].reg = reg;
+-		break;
++		prev = vif->mgmt_reg_stypes & action_bit;
++		now = upd->interface_stypes & action_bit;
+ 
+-	default:
+-		break;
++		if (now != prev)
++			wilc_frame_register(vif, IEEE80211_STYPE_ACTION, now);
+ 	}
+ 
+-	if (!wl->initialized) {
+-		PRINT_INFO(vif->ndev, GENERIC_DBG,
+-			   "Return since mac is closed\n");
+-		return;
+-	}
+-	wilc_frame_register(vif, frame_type, reg);
++	vif->mgmt_reg_stypes =
++		upd->interface_stypes & (presp_bit | action_bit);
+ }
+ 
+ static int set_cqm_rssi_config(struct wiphy *wiphy, struct net_device *dev,
+@@ -2712,7 +2704,7 @@ static const struct cfg80211_ops wilc_cfg80211_ops = {
+ 	.cancel_remain_on_channel = cancel_remain_on_channel,
+ 	.mgmt_tx_cancel_wait = mgmt_tx_cancel_wait,
+ 	.mgmt_tx = mgmt_tx,
+-	.mgmt_frame_register = wilc_mgmt_frame_register,
++	.update_mgmt_frame_registrations = wilc_update_mgmt_frame_registrations,
+ 	.set_power_mgmt = set_power_mgmt,
+ 	.set_cqm_rssi_config = set_cqm_rssi_config,
+ 
+diff --git a/wilc/wilc_wfi_cfgoperations.h b/wilc/wilc_wfi_cfgoperations.h
+index e9115a6..77ff719 100644
+--- a/wilc/wilc_wfi_cfgoperations.h
++++ b/wilc/wilc_wfi_cfgoperations.h
+@@ -21,8 +21,9 @@ void wilc_wfi_monitor_rx(struct wilc_vif *vif, u8 *buff, u32 size);
+ void wilc_wfi_deinit_mon_interface(void);
+ struct net_device *wilc_wfi_init_mon_interface(const char *name,
+ 					       struct net_device *real_dev);
+-void wilc_mgmt_frame_register(struct wiphy *wiphy, struct wireless_dev *wdev,
+-			      u16 frame_type, bool reg);
++void wilc_update_mgmt_frame_registrations(struct wiphy *wiphy,
++					  struct wireless_dev *wdev,
++					  struct mgmt_frame_regs *upd);
+ void wilc_sysfs_init(struct wilc_vif *vif1, struct wilc_vif *vif2);
+ void wilc_sysfs_exit(void);
+ void filter_shadow_scan(struct wilc_priv *priv, u8 *ch_freq_list,
+diff --git a/wilc/wilc_wfi_netdevice.h b/wilc/wilc_wfi_netdevice.h
+index 12f48f3..614d9fd 100644
+--- a/wilc/wilc_wfi_netdevice.h
++++ b/wilc/wilc_wfi_netdevice.h
+@@ -32,8 +32,6 @@
+ #define PMKID_FOUND				1
+ #define NUM_STA_ASSOCIATED			8
+ 
+-#define NUM_REG_FRAME				2
+-
+ #define TCP_ACK_FILTER_LINK_SPEED_THRESH	54
+ #define DEFAULT_LINK_SPEED			72
+ 
+@@ -125,11 +123,6 @@ struct wilc_priv {
+ 	struct wilc_p2p_var p2p;
+ };
+ 
+-struct frame_reg {
+-	u16 type;
+-	bool reg;
+-};
+-
+ #define MAX_TCP_SESSION                25
+ #define MAX_PENDING_ACKS               256
+ 
+@@ -168,7 +161,7 @@ struct wilc_vif {
+ 	u8 iftype;
+ 	int monitor_flag;
+ 	int mac_opened;
+-	struct frame_reg frame_reg[NUM_REG_FRAME];
++	u32 mgmt_reg_stypes;
+ 	struct net_device_stats netstats;
+ 	struct wilc *wilc;
+ 	u8 bssid[ETH_ALEN];
+-- 
+2.26.2
+
diff --git a/recipes-kernel/wilc/wilc_15.2-avnet.bb b/recipes-kernel/wilc/wilc_15.2-avnet.bb
index 1a1d680..c9f2d50 100644
--- a/recipes-kernel/wilc/wilc_15.2-avnet.bb
+++ b/recipes-kernel/wilc/wilc_15.2-avnet.bb
@@ -15,6 +15,7 @@ FIRMWARE_REV = "a67c351f9028c7a559330365c649a07721965cd4"
 
 SRC_URI += " \
     git://github.com/Avnet/u96v2-wilc-driver;protocol=https;branch=v15_2 \
+    file://0001-Make-compatible-with-5.8-kernels.patch;striplevel=2 \
     https://github.com/linux4wilc/firmware/raw/${FIRMWARE_REV}/wilc3000_wifi_firmware.bin;name=firmware \
     file://debian/wilc.install"
 SRCREV = "01ab7484e0e6b2191c69d7ec7c6e89da5ca51f0f"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7950e99f4890d2ac4f14c990da016a0f4b58271a.1621593454.git.jan.kiszka%40siemens.com.
