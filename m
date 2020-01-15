Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHX57TYAKGQE5YNPNFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C113C962
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 17:32:31 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id g5sf4302954ljj.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 08:32:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579105950; cv=pass;
        d=google.com; s=arc-20160816;
        b=U6AV5j63yXbLN0RmLiVWdyodexXWoDCganpmFTWLZUWPjtBBIz1w3xDSo7d+OrHgPw
         s5sWg5NuJTSeh/Jxlue3hrc1UNsX/2aD7AU4J8CpSFfEdFjQud+Fx3IhDWrC8GKL+YM+
         k/Gs297F8jGT0tZBPOdIMQW6u/h+CN74Ff3WTSDBRT1W2e68gTUtfrEBtLi+f6MZPV4n
         iwIC09/fYMcwguomFMiB54RzFV9/whU4U356hv55qnSKVw5NlpTZO5pEgbSUM5NT4K6o
         9eTBE8KShE37t4Z1+Wtk8RzrLPI7T7YFs3hqdPz9QfNuqI8sFovERLfSxn/qEw9UZXQr
         /UDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=5/3T8kyjkUwYsmEYmMuJzS3ZxFOL0hthKbv1Upf96lU=;
        b=Tt7NaomV8pdPDPGbv8uZjETQUh2Nh1Oz/NKC+Q1PGA4a4mdfi55Vz8PrU3993xItjE
         cZ1DzkWrG3mYpr+GYto9FT5FbM2CY6NwoQEJ01wvue36WIWKiLZwAKnEcrs8k1tadoF/
         zUKfmgheF4A206cQWb9PtNjIa1/DOQgBw5EFGgFBjPgV8YfS0xY6AoP2c7lZ3fOCDhBe
         9pNwFFUN0lGbdr6IY4hbvst9f33u2z6GGLghb3fPJFKaJ2iQ4uXXEtPMAJALBo8dBJ5S
         fFCvdvpTYQcXmCFCU90RMnxfffVkTJbcqNKeiYrcxooGcdyDxSK/EcO9K6Ou5NOXSOgu
         oJ4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5/3T8kyjkUwYsmEYmMuJzS3ZxFOL0hthKbv1Upf96lU=;
        b=F2JWwUkeLTOIO3Xsd5/B7E+4MjBvO/p76aEHYhIlTUOSHAckwWJ4JOTakEtqiHq2h/
         TBwAHlZkp6d8rYS2DlJCHK0uSfgq9ExpTs9cRlAah2M/UwjF9gagVx0ynD+pbYu7rwfL
         RIGlKlliwCzkdA9Ezp7eQSK0gVhTx89i8eMdjStf6QnihI/KB/+rmvZD+ESsyA6+rG8P
         3u+27U8psYYMdhA6R6N8Zi7t1ZJi4YcsEYfHiLH1e9SX58wgxWCaLv1m+5ZYpjI6sFZf
         jc6sIccN/0orBvzd46tRwUceyObrC9h5hEGWNR05Rqu7l1yoMDpf4tCjkiSGiOXsxCkS
         USkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5/3T8kyjkUwYsmEYmMuJzS3ZxFOL0hthKbv1Upf96lU=;
        b=Qiqt19W6Jwt3oW4i+KEhMV0Lw1exBZv19o6j8ExV8ZC4rEMQJt6TwV8SQQ7tCkqDrk
         UzfIeM0ES5I7b3RLtRbwHYNEDtgkYFm6SbXfbtxnkLbvesxY0X7vA6SoHNboFUairKqi
         pLOv5Q13WtAQLlPqox7KPUNbx1DhnZnVJy2SJMm1AInXsxoAhQGz8/6p3DOdVaAfEf2r
         c6QoLTvYsFAdI/u5p7mUd+pE0kZalmSb6lnbeI18BLqDprCquL0U3ChvcrNUlT99nEcM
         yMwzk1oZU78AlNMuBPIjvYHjqlPYy42DQ+X7o5tK7HzD7sI8nkEaQqoMHyKYoWceyLiP
         SA8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVy940+s0yZ9a+VcDxs8M5eUr3vFhlyd3gbzjfbdu3UcbhxR/zN
	GR72SNir/ZyvNPNTOHU9T1g=
X-Google-Smtp-Source: APXvYqyHjfQg5A3BNr7U9ik6aHyIKNZ3QIVA17dAfS9nsNFuI2zV2r/2bEIOcRZGMWpCikBTjaxSNg==
X-Received: by 2002:a05:651c:32b:: with SMTP id b11mr2392774ljp.203.1579105950313;
        Wed, 15 Jan 2020 08:32:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:95c7:: with SMTP id y7ls2723027ljh.16.gmail; Wed, 15 Jan
 2020 08:32:29 -0800 (PST)
X-Received: by 2002:a2e:814e:: with SMTP id t14mr2413028ljg.149.1579105949625;
        Wed, 15 Jan 2020 08:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579105949; cv=none;
        d=google.com; s=arc-20160816;
        b=OrrIgq4qrJorquo0Rx5fW/4dE2dC29mF6sEz2fXxWGGAbO7qUEousLY+1GWjHlsoqP
         v6ilathHHsNN2zNzoxbnN0qEUKStzPPpNpxuYxEDZJMPeV8B2p/ZIzMICebB2p+mEsLW
         U6DDAR1mM7msjdHKVdjuCWBD57xFmO/6EwEZ8O2TFN79MFzx34JBt21cU4ZKa9j3MBuV
         ZqieTf5tPk+X0752zI6kaGajDxtkqyWcnJNFbpotUvK3s1X79n4xHY0Y9RHjHCRQkGz5
         dYfJsF/uhzYieeNvnuq9fmc8U6i0CnxhzIJiwytTlA/unF31tvUd7B75y0IjkzW8SUT+
         m/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=sEWk0fupglXZq14+mdKwHvwUvD9Tju3V2CM4Pqgo/r4=;
        b=i52lKXno6ZH7vKXW4i2N6/ph6EQT9ApUQORhYgd4y9/rM/7XhG4uz5bfH3Eh9XCqkB
         oy7xSWhjvSOaOpI6m9GlrJzmdSZKJ82SjHcFNDuN/aHWQCw3VCI6Qws99uq139hjnhRJ
         eJyazE8/2dTprlGJrL1wosHx3a+3DcNlEobDpsCGWQUQPECiYxG/mvjo0d7lCbhdVa+f
         0KwnkAvt7dY6YGBr9/Y7phLxrGbZNSuiKhzFc22Pt65uaY5HNDW4mV3iLPnN72UsLoXv
         WjdP77xce6tdCWvi2SZRBu/zJHuy3F1cV06AHpLrVT44mwORgkItG0WoFjizZaPupUR5
         Ubzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p20si1066410lji.1.2020.01.15.08.32.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 08:32:29 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00FGWSJe013339
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jan 2020 17:32:28 +0100
Received: from [167.87.12.136] ([167.87.12.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00FGWRSW002154
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jan 2020 17:32:28 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: Add support for Raspberry Pi 4
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <04c3857f-43ac-d6b8-1a3d-47af1311f0a5@siemens.com>
Date: Wed, 15 Jan 2020 17:32:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This adds the system config, an inmate demo and a linux demo with dts
for running Jailhouse on the Raspberry Pi 4. Configs are designed for
the smallest, 1 GB variant. Models with more memory needs adjustments
or have to like like having 1 GB only.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Note that some integration work of ATF with the RPi boot process is
needed before you can create cells. This will be provided via
jailhouse-images.

 configs/arm64/dts/inmate-rpi4.dts | 103 +++++++++++++++++++++++
 configs/arm64/rpi4-inmate-demo.c  | 133 ++++++++++++++++++++++++++++++
 configs/arm64/rpi4-linux-demo.c   | 163 +++++++++++++++++++++++++++++++++++++
 configs/arm64/rpi4.c              | 166 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 565 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-rpi4.dts
 create mode 100644 configs/arm64/rpi4-inmate-demo.c
 create mode 100644 configs/arm64/rpi4-linux-demo.c
 create mode 100644 configs/arm64/rpi4.c

diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
new file mode 100644
index 00000000..52fd3ac2
--- /dev/null
+++ b/configs/arm64/dts/inmate-rpi4.dts
@@ -0,0 +1,103 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Device tree for Linux inmate test on Raspberry Pi 4,
+ * corresponds to configs/arm64/rpi4-linux-demo.c
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/dts-v1/;
+
+/ {
+	model = "Jailhouse cell on Raspberry Pi 4";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	interrupt-parent = <&gic>;
+
+	hypervisor {
+		compatible = "jailhouse,cell";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <3>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gic: interrupt-controller@ff841000 {
+		compatible = "arm,gic-400";
+		reg = <0x0 0xff841000 0x0 0x1000>,
+		      <0x0 0xff842000 0x0 0x2000>;
+		interrupt-controller;
+		#interrupt-cells = <3>;
+	};
+
+	fixed: clk500mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <500000000>;
+		clock-output-names = "clk500mhz";
+	};
+
+	uart1: serial@fe215040 {
+		compatible = "brcm,bcm2835-aux-uart";
+		reg = <0x0 0xfe215040 0x0 0x40>;
+		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&fixed>;
+		status = "okay";
+	};
+
+	pci@e0000000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 3 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 4 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xe0000000 0x0 0x100000>;
+		ranges =
+			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+};
diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
new file mode 100644
index 00000000..62442e7c
--- /dev/null
+++ b/configs/arm64/rpi4-inmate-demo.c
@@ -0,0 +1,133 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on Raspberry Pi 4:
+ * 1 CPU, 64K RAM, serial port 0
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 184-32,
+
+		.console = {
+			.address = 0xfe215040,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0b0010,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x3faf0000,
+			.virt_start = 0x3faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3faf1000,
+			.virt_start = 0x3faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3fafa000,
+			.virt_start = 0x3fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3fafc000,
+			.virt_start = 0x3fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3fafe000,
+			.virt_start = 0x3fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART */ {
+			.phys_start = 0xfe215040,
+			.virt_start = 0xfe215040,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x3fa00000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xff841000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				1 << (184 - 160),
+				0,
+				0,
+				0
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
new file mode 100644
index 00000000..9e7fad26
--- /dev/null
+++ b/configs/arm64/rpi4-linux-demo.c
@@ -0,0 +1,163 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for linux-demo inmate on Raspberry Pi 4:
+ * 2 CPUs, 128M RAM, serial port
+ *
+ * Copyright (c) Siemens AG, 2014-2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[13];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "rpi4-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 185-32,
+
+		.console = {
+			.address = 0xfe215040,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0b1100,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x3faf0000,
+			.virt_start = 0x3faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3faf1000,
+			.virt_start = 0x3faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3fafa000,
+			.virt_start = 0x3fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3fafc000,
+			.virt_start = 0x3fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3fafe000,
+			.virt_start = 0x3fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
+		/* UART */ {
+			.phys_start = 0xfe215040,
+			.virt_start = 0xfe215040,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x3f900000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0x30000000,
+			.virt_start = 0x30000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xff841000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				0,
+				1 << (125 - 96),
+				0,
+			},
+		},
+		/* GIC */ {
+			.address = 0xff841000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				(1 << (185 - 160)) | (1 << (186 - 160)),
+				0,
+				0,
+				0
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
new file mode 100644
index 00000000..92463184
--- /dev/null
+++ b/configs/arm64/rpi4.c
@@ -0,0 +1,166 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB RAM)
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x3fc00000,
+			.size       = 0x00400000,
+		},
+		.debug_console = {
+			.address = 0xfe215040,
+			.size = 0x40,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xe0000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 1,
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0xff841000,
+				.gicc_base = 0xff842000,
+				.gich_base = 0xff844000,
+				.gicv_base = 0xff846000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "Raspberry-Pi4",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+			.vpci_irq_base = 182 - 32,
+		},
+	},
+
+	.cpus = {
+		0b1111,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x3faf0000,
+			.virt_start = 0x3faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3faf1000,
+			.virt_start = 0x3faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x3fafa000,
+			.virt_start = 0x3fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x3fafc000,
+			.virt_start = 0x3fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3fafe000,
+			.virt_start = 0x3fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
+		/* MMIO 1 (permissive) */ {
+			.phys_start = 0xfd500000,
+			.virt_start = 0xfd500000,
+			.size =        0x1b00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MMIO 2 (permissive) */ {
+			.phys_start = 0x600000000,
+			.virt_start = 0x600000000,
+			.size =         0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x0,
+			.virt_start = 0x0,
+			.size = 0x3fa10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xff841000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0xff841000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0001:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0001:00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04c3857f-43ac-d6b8-1a3d-47af1311f0a5%40siemens.com.
