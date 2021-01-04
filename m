Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJWDZP7QKGQECZZCBDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F67E2E92AD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:39 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id w11sf16615161lff.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752998; cv=pass;
        d=google.com; s=arc-20160816;
        b=rNwX1g5yEbXOvGrRXFg8O8UD8ZVNaB3TwszAQ53J/GrjPzd3vYyAbAcpEB/4wZbdGz
         F1TOSi9c8vLLPMkp19ZcIN7u9KcJ1CxgS/o/j4touvqI6mO0kjqIf/rbc2QBSbir64p+
         HwAl9KK7zEUj16++yPVW1ksXR1LSD5SLQ2UpvViWZ1am9VSpAzCZ9cPlSz3Cs5n7CAvZ
         p7wGBAC046jXG6grSgLrmC7+IHQeFjNIuex+/M6tFlfE+OFeionDry8JyND3oRiOKJ8c
         61W8Zu6eXlDxWmuF3K/s/kB2xbIgKeTa06cuQnoy93ZhPYgUkMcnRSaQ4IReQZCeiT90
         0N2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=FDEUlgBcvPCv15+9YhhS5or5HK6Y/WxxuDIIjS/aXfc=;
        b=CS3eGQMp/Cr7JnIRVlRcWa5vnW6USGzbZAfocFPi12Ro/J0kQp7/oh4ZW5gA8t/Sxe
         5bsVy0Mc5Em4HpHH1JAwS2Vlq2pAvNtE0OlJWoiyoqRbMdKaW0NaMqxTO9X0PTnoWpi/
         bnA+5SMgLWJjJiTUfUdQBYpeIViPoirJoxqygU/yCwmmJEfVryYT0tkG4zCgEXw9OWGg
         bfMnN8rUxln/pV+3OEI/02nP+SCvnhWFu+2Xsi264AwJHFbYbF46h5tJIzjvnp0OSAbV
         rWxbagEJulqI4Ow2QKKUvlyQI577fqHXGdubvR3FsJXgDJNc5vg0jmiCMYbHxHIWdO9t
         9cCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="XzO5u/qS";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FDEUlgBcvPCv15+9YhhS5or5HK6Y/WxxuDIIjS/aXfc=;
        b=Kjq1xVOz2H42+TphEOcHxLYU4JMYtng0RUOmdb8nfxcqFDY++B6SUQOFVtRiKIW2pN
         094S2Cbol8uynxGIA9enig25A3l5f/P0ysIVf2DQ3+m44dWFnw1yjvkCxTt0V4V9X3jL
         20lItGmIJCV12HjnmjUgqlA4bk9J+VhqH+AA175xSUhKmOy/ccb40C5L9vUsRfvXk4jb
         B6OuBZwndaMnjyOZ82trEMYpT2JVGe8zwOwkYAwlcmpX1PL55PddUBWw9DS35L0VisXd
         0jEbVh3084rQHftOpENAS4cpmdNCv8BDdoNFlRBJ08DCAa5HfVanbVqrO1Rit32xzwsj
         P8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FDEUlgBcvPCv15+9YhhS5or5HK6Y/WxxuDIIjS/aXfc=;
        b=RHaKoelpk6XDXnV7ZKK2HRsFUbhCz0MzkOwXAGixic4HVjnQKHAjMTZkIkV1IWaTd2
         t5/LsDVqcyheIvJHfQ34/E6Ax2ZA3doLYAgjggBsaOLoYiekSBvK9TMVzWSNVdI5RSdC
         AMB5jguBe0jEDKA3EGX/TIAlPwk/NJgBRZR1JvXJj4B7PR9ZM3jr6zQS1lf0Ny+ggQOS
         6jMLkcc9YxO58IFDHBhP65I6q94PGbd+4Ep/nzn97/QOkk2eyw8B/ghuDDE72yM9spCl
         5jf4fmv9VAY8KhdLZZ+JYwqQIUKCjLdbrz54RS1FHJztSoFx1/czZg7U45bwdo9OGjyJ
         Shlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5334SVTgTw8E4Jt/nHTTFdU07fy683muikDvqVb5v90QwbBdIm26
	hHbE2LhJD6zRvbQno7LZHFQ=
X-Google-Smtp-Source: ABdhPJwghovdnjvJORW8pjwfnRYvIL6yg4skh9OsF6l2QUgToYJ+e7GPl1G/p9nDoimyzs+Le/qr6w==
X-Received: by 2002:a05:651c:1390:: with SMTP id k16mr34096467ljb.138.1609752998671;
        Mon, 04 Jan 2021 01:36:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7d0d:: with SMTP id y13ls12310190ljc.9.gmail; Mon, 04
 Jan 2021 01:36:37 -0800 (PST)
X-Received: by 2002:a2e:898a:: with SMTP id c10mr33737986lji.241.1609752997682;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752997; cv=none;
        d=google.com; s=arc-20160816;
        b=HftpdUpsbRjx7692XY1gZ2cergAs1xX06xHx/3VlcmUlyBTyzPi89h/3yAj9I92pMn
         8dE+Vx3MRHg7iSuTNOJjd66sqCu7aqqFmDEmNS1CdSg4BPZ6/lkYvchLbgQdd5/rnYaV
         +E+fQPjESZs1SkRmo+Igu0SxFMmxPSWwm2hf1GbwYRXA6SBUhp1NRuq9pr5w/L1U9H5t
         JO2hzPmUD7wqbcYJVxrG6GQKuD3CnHHRBz270hdocXbowA0yiZ1MXp0spEXAnUsJp6in
         XeA6CXbkz4l1IY3RQoOJG9Qc74nViU/uqjoZ6p6LYZJCc/axfXjbpI+oC5lJui/DLUV8
         x3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=P5sKFCIjvHrtwpR6nR1XpaDcdeQIA3Cck7Hr/S9TSs4=;
        b=GRCHDYn6ioylsGCsZms3y2xcqg4u+YahqPhGUCyCmKupsnOU/umSAuLNxueXhdyuKb
         TUIBYBeOsjUj5thrKpandazrwH/vOnBl5Msj7vpCHn1feq2EPdYp8Svk1MOJYf6UMo8X
         VP2s7WHShL5hdLd5PJvDSXwZfBTcb7pjBKNXjlmqxuzI0zGLsxj2iAqlMq7MtzCeR+sq
         qVTo0CvtwS4XpPej/lfKHaImzLae/bLb9lNz68M4vzkHelr5STOtx1BEGppMBdqp4BJq
         U3fmuU1g7RfSYRAyIAytimmwSgJ4alWvQ5iIjSAPa4kdAnQLP2EhxAgo8CY1mF7MMqv7
         6SKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="XzO5u/qS";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id u25si1611157lfd.11.2021.01.04.01.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MGzXS-1kiauM3hhq-00DoFP for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:36 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 5/8] configs: arm: Add QEMU target
Date: Mon,  4 Jan 2021 10:36:19 +0100
Message-Id: <3cf261b06c63f165a48ad1671596e8eb7de4a3f0.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dswyqBTwMczanbylXosEUCYSWIhYLXse7Lne2VLUGxUf6QJ3KfX
 t0LfTk7X2EBpOdRB4cQ+0BhDcsc5FzMzegDutXjQcF0XHi/JujCeJlr8ocNRlmqxZv79oYE
 nQpjtH30vIW3jlDkbsIQZOmC9FekiJfU4QClYK66aIBZsv76AVe7uFu3HV3mxJb1K8HrOyU
 gENd6PF5duAlJpDiY0Kjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vCGogVHVhzU=:RZRoCcTEc91KIVApM4tQEx
 UBOpmX2RMkjzmkopVj1ADtrCVbDE1Wbo/j8PL9mwbqzAEWk8wmbLgrdEtr+3sbtsSnRfYaTog
 bZcAvOSMSN4TAn27Psq3O9oHLz8rpfpsxvWfrHeobSfxtoYawHEg7WfruhtGX4gTEvWjZyRlL
 iklqv/+7Mjwp8Oj6LmC55pIQvfYz2U0yAeg8ux36LBBqKAK6SGNXh1G3jdk27oYkhn8NCKVHW
 BLSWRECa3rN2vKfWb32+Z0o7cVNh6K702Y31RRhb2ILJNG3uBqkTaT9FEOlx1Jm3ToaV3o3Md
 n1+BZ2pMmTJB7HhAGGF7VyM2RQI+D/m0+iLM9kz0ELTCtulUBgfHIW8+FkPUg5b3FLMEMzgwP
 zgH/C/zA75tHBz2+ouFUPgx26SUPQYIOvcQGZVPT0QAZxLp99sFpzRGY9HiU7mdIgGa5eA/ru
 MEAzcv3UfnO7bPtRlC1opn1m97zTZ6clyVUWj+IM0y9701xT5m2vnXkm4Uuek4no4NAyeh7YT
 ytR/vqUnEgSQQ6EazjFjN1ws5FZk02dJ+8rxmZwdkXRNHlat4w1xCyVkw7nEKwp+nScmMX3P8
 6qaXEv1i+Felw752mU5kV1HoDkyLLTS6H2ejMBr5QxNIAPDMZjGCMigqPw8vHkqbcurVSKnCQ
 1jh3VvvBa4MzVr2Rc8pZRZl8oDJSWx+s/FmVuxo1JrbmTco/Wm2x6Rga4MgbOQDUQZb+j0sxe
 ArAIrViduPbLk++Gdv0A16mXgH07nmX6hPVj8h3hMWHNG7Om1fKxJcYb/88QTm2fcp9HM57ss
 l9y2kXReRNwhLT3vK24wp2xyWLyPY8RswWh9NO+lHFobJmzsarW5BnJKniq6pYkgLqD6r5WZG
 MgQ/ohh7xh9Kyh15iTJA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="XzO5u/qS";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

Derived from the arm64 QEMU target, this adds one for 32-bit ARM which
also stresses the virtual GICv2. Works with QEMU 4.2.1 or newer.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/dts/inmate-qemu-arm.dts | 105 +++++++++++++++++++
 configs/arm/qemu-arm-inmate-demo.c  | 132 ++++++++++++++++++++++++
 configs/arm/qemu-arm-linux-demo.c   | 152 +++++++++++++++++++++++++++
 configs/arm/qemu-arm.c              | 154 ++++++++++++++++++++++++++++
 4 files changed, 543 insertions(+)
 create mode 100644 configs/arm/dts/inmate-qemu-arm.dts
 create mode 100644 configs/arm/qemu-arm-inmate-demo.c
 create mode 100644 configs/arm/qemu-arm-linux-demo.c
 create mode 100644 configs/arm/qemu-arm.c

diff --git a/configs/arm/dts/inmate-qemu-arm.dts b/configs/arm/dts/inmate-qemu-arm.dts
new file mode 100644
index 00000000..06e92912
--- /dev/null
+++ b/configs/arm/dts/inmate-qemu-arm.dts
@@ -0,0 +1,105 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Device tree for Linux inmate test on QEMU ARM target,
+ * corresponds to configs/arm/qemu-arm-linux-demo.c
+ *
+ * Copyright (c) Siemens AG, 2016-2020
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
+	model = "Jailhouse cell on QEMU ARM";
+
+	#address-cells = <1>;
+	#size-cells = <1>;
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
+		cpu@2 {
+			compatible = "arm,cortex-a15";
+			device_type = "cpu";
+			reg = <2>;
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a15";
+			device_type = "cpu";
+			reg = <3>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	gic: interrupt-controller@8000000 {
+		compatible = "arm,cortex-a15-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x08000000 0x1000>, /* GICD */
+		      <0x08010000 0x1000>; /* GICC */
+	};
+
+	apb_pclk: clk24mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clk24mhz";
+	};
+
+	uart0: serial@9000000 {
+		compatible = "arm,pl011", "arm,primecell";
+		reg = <0x09000000 0x1000>;
+		interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&apb_pclk>, <&apb_pclk>;
+		clock-names = "uartclk", "apb_pclk";
+	};
+
+	pci@7000000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 109 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 3 &gic GIC_SPI 110 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 4 &gic GIC_SPI 111 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x08e00000 0x100000>;
+		ranges =
+			<0x02000000 0x00 0x10000000 0x10000000 0x00 0x10000>;
+	};
+};
diff --git a/configs/arm/qemu-arm-inmate-demo.c b/configs/arm/qemu-arm-inmate-demo.c
new file mode 100644
index 00000000..3f835d9e
--- /dev/null
+++ b/configs/arm/qemu-arm-inmate-demo.c
@@ -0,0 +1,132 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on QEMU arm6virtual target
+ * 1 CPU, 64K RAM, 1 serial port
+ *
+ * Copyright (c) Siemens AG, 2017-2020
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
+		.vpci_irq_base = 144-32,
+
+		.console = {
+			.address = 0x09000000,
+			.type = JAILHOUSE_CON_TYPE_PL011,
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
+			.phys_start = 0x7faf0000,
+			.virt_start = 0x7faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7faf1000,
+			.virt_start = 0x7faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafa000,
+			.virt_start = 0x7fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafc000,
+			.virt_start = 0x7fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafe000,
+			.virt_start = 0x7fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART */ {
+			.phys_start = 0x09000000,
+			.virt_start = 0x09000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x7fa00000,
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
+			.address = 0x08000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				(1 << (144 - 128))
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
diff --git a/configs/arm/qemu-arm-linux-demo.c b/configs/arm/qemu-arm-linux-demo.c
new file mode 100644
index 00000000..e0124baa
--- /dev/null
+++ b/configs/arm/qemu-arm-linux-demo.c
@@ -0,0 +1,152 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for linux-demo inmate on QEMU arm:
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
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "qemu-arm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 140-32,
+
+		.console = {
+			.address = 0x09000000,
+			.type = JAILHOUSE_CON_TYPE_PL011,
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
+			.phys_start = 0x7faf0000,
+			.virt_start = 0x7faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7faf1000,
+			.virt_start = 0x7faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafa000,
+			.virt_start = 0x7fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafc000,
+			.virt_start = 0x7fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafe000,
+			.virt_start = 0x7fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
+		/* UART */ {
+			.phys_start = 0x09000000,
+			.virt_start = 0x09000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x7f900000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0x70000000,
+			.virt_start = 0x70000000,
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
+			.address = 0x08000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (33 - 32),
+				0,
+				0,
+				(1 << (140 - 128)) | (1 << (141 - 128))
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
diff --git a/configs/arm/qemu-arm.c b/configs/arm/qemu-arm.c
new file mode 100644
index 00000000..4a3eac7b
--- /dev/null
+++ b/configs/arm/qemu-arm.c
@@ -0,0 +1,154 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for QEMU arm virtual target, 1G RAM, 8 cores
+ *
+ * Copyright (c) Siemens AG, 2017-2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * NOTE: Add "mem=768M" to the kernel command line.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[11];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x7fc00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x09000000,
+			.size = 0x1000,
+			.type = JAILHOUSE_CON_TYPE_PL011,
+			.flags =  JAILHOUSE_CON_ACCESS_MMIO |
+				  JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0x08e00000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 1,
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0x08000000,
+				.gicc_base = 0x08010000,
+				.gich_base = 0x08030000,
+				.gicv_base = 0x08040000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "qemu-arm",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+			.vpci_irq_base = 128-32,
+		},
+	},
+
+	.cpus = {
+		0xff,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x7faf0000,
+			.virt_start = 0x7faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x7faf1000,
+			.virt_start = 0x7faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x7fafa000,
+			.virt_start = 0x7fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x7fafc000,
+			.virt_start = 0x7fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x7fafe000,
+			.virt_start = 0x7fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
+		/* MMIO (permissive) */ {
+			.phys_start = 0x09000000,
+			.virt_start = 0x09000000,
+			.size =	      0x37000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x40000000,
+			.virt_start = 0x40000000,
+			.size = 0x3fa10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x08000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
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
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3cf261b06c63f165a48ad1671596e8eb7de4a3f0.1609752982.git.jan.kiszka%40web.de.
