Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBB27RRHZAKGQEDUB2MSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBA158C1A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 10:50:39 +0100 (CET)
Received: by mail-qt1-x840.google.com with SMTP id m8sf6241206qta.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 01:50:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581414636; cv=pass;
        d=google.com; s=arc-20160816;
        b=q0G58uSX4FVRdh/plc5JBqp2N8pzx3pDdP2/8zYSCE3JMbpZIL9pofhUCOm7Kv9XpP
         xM1OCP8mxphMAfm0kBaKro2qVj9+h54e5f15s8sd35Le7EZnaYP/bSFPT+V/p1AJHUUI
         Y/l/Ky8bX7KX9QnQb7q5mcct4C+r5ji0HXWnSfb2c+NrOiZQkPqU4wFaXbXQsQtpNxQh
         V9e4+0ctDn9z/O2r902UZIOX8uUbNRYGLBRKa5g//8BjR+vzttBVD7P1abfN9de/Gt5C
         fcbIFPkqGBiKMWV8LUm7p786BpcsGleDQqkpjQQtDddVzW8uXbvLBZB/OgSSibCnbTF3
         0IDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=aJ3HsCVw9o2MxmQSGQ8z6F6rWnkCSU/r9W7ceBp982w=;
        b=u0KNXLhg4bhQkBPV9jZ3RlPek5Top4Ip9mfvPCa9X9cwwrx3pNtL8tzuJvZfOUn1Rp
         vY1ljP02/O78o02Ya42gHkPSxE4J1EQpvQYsUp7Vohl5Rn7TTTb9/cZ1veHJVc2oObXD
         8xgxx8WMcyPX4EarU+E4HalzpBU2emDR5LdewcrDOCs7fnQ2MSt5O7vgZwsoWnAhJlyP
         0ZLTNBhL+k4qVDA1pIoS0owrG1mtn1Yxot2NDtKSaerJg/h53aO7tD3hWGhMINCaHsYC
         EVCR+yAL24lRFTntj+Iu+W42Rl+gb6lVMB5lrPCy0on6Dk6nj8i2t65JMhofCN0A54Ip
         W9ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSnFvNp1;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aJ3HsCVw9o2MxmQSGQ8z6F6rWnkCSU/r9W7ceBp982w=;
        b=UZNV1T28LOtAWrp+MUf0hMMR7VF+Qd/HAEhZwDXaRv7a4MBMR1ya7JYpJPVncdF45T
         nMNdd7YPM9izbqqaw5mLOJJNehOC0LQdA4Y7Y8IxlKdkuK7VbhHDzNvp7TZKTJlptL3K
         h8lljm5/I1rzQTpeblTLQlkmkV9xgp5SdBlohJ/R2K0CpweL+ptxm7JUhGnqXZxstfo4
         Tt1zOVR6iTkCbtYuAejB/WAsDr2Yzyk9ZEcQHJ8vMZDR6YWSg72ZROSrRsX8JEBZUZRa
         m1kHmKHylw2kuph2myUcD8AvCLFT5BrAH7e2zOYvdcw2tED3tNlwqKgC41QSdqiQj8/E
         p4HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aJ3HsCVw9o2MxmQSGQ8z6F6rWnkCSU/r9W7ceBp982w=;
        b=A3dPqInQ7ZLBmF9wgW2ravOdvpV2Ug7e05CNMGxOhIG/StnVlXToOr2TKj+d477IE5
         WVfPAoNEE+jmWeKATr3DyKVagmJE+WbdSTDXoCI9FdrUhY2Bfte0FSazl7QQrex9v5zk
         vvHttz3k1ABFau7nZrhSvR8YqDPwnXV/wuvZu6e8LTzS3RspjPjZLFUhtbk1C5HYXQk/
         /LB+tS/wlKMeoqyBxa+Hp6g6hgyYbTSbhL5syJYuRfq0ZvW9jDZAexKUXrI+ce8DmtUx
         1Vt9Z/zPkFxUOb0OD6YxZCq1iTkMwfqKTJhq6iwaXoSfAYbGpG9xq1rdJoRpXTnPtXWj
         ESCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aJ3HsCVw9o2MxmQSGQ8z6F6rWnkCSU/r9W7ceBp982w=;
        b=L0cIOGbp67CCfzfmLcfarfbEN4T+wCClNj0eTcgYpOCvPl3HMz3ZrcOqvfQw8GxUv6
         MOrcNDf4sbzMll4ZpyK2VsoUNGCiRAkvv44eWyEzK5DBlJWokPiSiqDptaWe4+Ox/7AK
         qGKXfESdsLtTgWyPSqKTnHcygk5xGiI+38w99xwZYEEkKKFg1BKp5qLBsvwUvVXmsBb3
         gIDgpYjFdEjg1vuVGrJgcFXtIwC7JxB5dliDVlg7VIsL8h1vZK3Mryh/HXYyh5erkYDw
         qR4EpQ/+ww3cgR2eSoS4m8NLjhHGlUS//AKvXjo3BD6I6jvv7iYYlBITOt3eI/exXetW
         Y8bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXIiZUnbZ863KvfVmsaH3jkEAgVuSUmHbMmvTDFVhWCua9/Gq6L
	oDdeyFCPdIgPlKeYfxd7uws=
X-Google-Smtp-Source: APXvYqzwtch/r4gyVzRfPHQpLAIp7/ixQ1LR+uQXZKRipzT9J7EDPiASMvRUVH4gQi1ysyi3SG4l6Q==
X-Received: by 2002:a05:6214:13a8:: with SMTP id h8mr13880222qvz.41.1581414636040;
        Tue, 11 Feb 2020 01:50:36 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7b38:: with SMTP id l24ls3927414qtu.11.gmail; Tue, 11
 Feb 2020 01:50:35 -0800 (PST)
X-Received: by 2002:ac8:1635:: with SMTP id p50mr1664098qtj.13.1581414635509;
        Tue, 11 Feb 2020 01:50:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581414635; cv=none;
        d=google.com; s=arc-20160816;
        b=SrVM8PuXyKbpggh6Cqu5DlcxpHAVocaUnjCv/rJ0GYb0fHJ/T40YKyi2T4WAKXYiat
         8cSZYH/t6TsoNSalbFLitsv/hDIvaOwVS45XbM7Y9I40QVZLgtysK2eQhAxHdv9QYMZ2
         b5YEicfMQYOFrkx4QTX1GvWtdBxlbjs+MfGHnRB5FaPeUhIZ9huk3dPo8IoQO+prO8QR
         9ZyXdUuud1whWGp98+ltWzP+nGUnlButTWluy9bZbjmJddGAvZ9eJnCXI7lJoKm76S1t
         ZI9FyXhda7totTOtfo5tlr0iezGIxnFIFoMYJynEAGvX7bXjl4NaQr6JfIlckCW6Txk3
         680Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=bpGUBErMr7tAz0jOSLCiFQk91QPCyUCWbDZE40vesBo=;
        b=E+0+DNfJgjWayeS5+3E3b/8vGYvsBSk0q4hrXCCbX3KlsmrO4b3lSE6+JcrM+hkmQ2
         JdeRqOTqmZvc1qFXvZrRH8QuxEiwZbIR5MzuQjDyJpDxRlNwjxmXU3oRMb10Ot1Vrs9k
         VpKkPSf3ug+Br9djXzkPtlLkl9Y0G7Nk58IJiBBWwYboMnmlZAao1MGjLmekUsnXUJ/z
         ag3B4fQ551OYjhtjkoW49eKNJgfPph9Yx6SyVl/bsRZqYyxWWBAjY5gFoBE8SGNbw99B
         b9DVmvUYMrmjQAQ7x6ZmXLk+EfZYgA7njMRKJdRodmIHbxwKjoceu8gCZNcglQUSddgc
         7d3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSnFvNp1;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com. [2607:f8b0:4864:20::643])
        by gmr-mx.google.com with ESMTPS id g23si120196qki.4.2020.02.11.01.50.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 01:50:35 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) client-ip=2607:f8b0:4864:20::643;
Received: by mail-pl1-x643.google.com with SMTP id b22so4048183pls.12
        for <jailhouse-dev@googlegroups.com>; Tue, 11 Feb 2020 01:50:35 -0800 (PST)
X-Received: by 2002:a17:90a:e397:: with SMTP id b23mr2596815pjz.135.1581414634309;
        Tue, 11 Feb 2020 01:50:34 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id v8sm3269354pgt.52.2020.02.11.01.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:50:34 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v4 3/3] configs/arm64: Add Linux demo for pine64-plus
Date: Tue, 11 Feb 2020 15:20:10 +0530
Message-Id: <20200211095010.11234-3-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211095010.11234-1-vijaikumar.kanagarajan@gmail.com>
References: <32b59107-d919-a2c8-0761-4e03f5138209@siemens.com>
 <20200211095010.11234-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=kSnFvNp1;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Add Linux demo with 2 CPUs and 128M RAM for Pine64+.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 configs/arm64/dts/inmate-pine64-plus.dts | 114 +++++++++++++++++
 configs/arm64/pine64-plus-linux-demo.c   | 148 +++++++++++++++++++++++
 2 files changed, 262 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-pine64-plus.dts
 create mode 100644 configs/arm64/pine64-plus-linux-demo.c

diff --git a/configs/arm64/dts/inmate-pine64-plus.dts b/configs/arm64/dts/inmate-pine64-plus.dts
new file mode 100644
index 00000000..0f980c98
--- /dev/null
+++ b/configs/arm64/dts/inmate-pine64-plus.dts
@@ -0,0 +1,114 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Device tree for Linux inmate test on Pine64+ board,
+ * corresponds to configs/arm64/pine64-plus-linux-demo.c
+ *
+ * Copyright (c) Vijai Kumar K, 2019-2020
+ *
+ * Authors:
+ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
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
+	model = "Jailhouse cell on Pine64+";
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
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <2>;
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
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
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		osc24M: clk24M {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "osc24M";
+		};
+	};
+
+	gic: interrupt-controller@01c81000 {
+		compatible = "arm,gic-400";
+		reg = <0x01c81000 0x1000>,
+		      <0x01c82000 0x2000>;
+		interrupt-controller;
+		#interrupt-cells = <3>;
+	};
+
+	uart: serial@01c28000 {
+		compatible = "snps,dw-apb-uart";
+		reg = <0x01c28000 0x400>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		clock-frequency = <24000000>;
+	};
+
+	pci@02000000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 3 &gic GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 4 &gic GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x02000000 0x100000>;
+		ranges =
+			<0x02000000 0x00 0x10000000 0x10000000 0x00 0x10000>;
+	};
+};
diff --git a/configs/arm64/pine64-plus-linux-demo.c b/configs/arm64/pine64-plus-linux-demo.c
new file mode 100644
index 00000000..1d099906
--- /dev/null
+++ b/configs/arm64/pine64-plus-linux-demo.c
@@ -0,0 +1,148 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for linux-demo inmate on Pine64+ board:
+ * 2 CPU, 128M RAM, serial port 0
+ *
+ * Copyright (c) Vijai Kumar K, 2019-2020
+ *
+ * Authors:
+ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
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
+		.name = "pine64-plus-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 123,
+
+		.console = {
+			.address = 0x01c28000,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		/* State Table */ {
+			.phys_start = 0xbbef1000,
+			.virt_start = 0xbbef1000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Read/Write Section */ {
+			.phys_start = 0xbbef2000,
+			.virt_start = 0xbbef2000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Output (peer 0) */ {
+			.phys_start = 0xbbefb000,
+			.virt_start = 0xbbefb000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Output (peer 1) */ {
+			.phys_start = 0xbbefd000,
+			.virt_start = 0xbbefd000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Output (peer 2) */ {
+			.phys_start = 0xbbeff000,
+			.virt_start = 0xbbeff000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbf01000, 1),
+		/* UART 0-3 */ {
+			.phys_start = 0x01c28000,
+			.virt_start = 0x01c28000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xbb900000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0xb0000000,
+			.virt_start = 0xb0000000,
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
+			.address = 0x01c81000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (32-32), 0, 0, (1 << (155-128)) | (1 << (156-128)),
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* IVSHMEM 00:01.0 (networking) */ {
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
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200211095010.11234-3-vijaikumar.kanagarajan%40gmail.com.
