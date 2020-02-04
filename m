Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBT4H4XYQKGQEDT6NHKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3a.google.com (mail-yw1-xc3a.google.com [IPv6:2607:f8b0:4864:20::c3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DE1518A2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 11:13:37 +0100 (CET)
Received: by mail-yw1-xc3a.google.com with SMTP id l12sf25599918ywk.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 02:13:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580811216; cv=pass;
        d=google.com; s=arc-20160816;
        b=xqhCK4xiHFHua5l+WQQSWduAanjsnYIv1ZI9j5p3sgxhjfj/1OoM6a9Bp0oKA8jSqi
         mQQnLRlI+xenZQR5nbhhe4nS1gu/IYefDnNb2nSECyMuQUklEkPq9D8rACe028PsquFB
         M32Rk9/WsdneleO22HCLmtX/n8r7XwzZo1lmDP8BqEgWp3e2m9EWyKWwI/VlbeoKjegE
         OnYINoRnbfTaOBJvP+/9JGo4cO6Z4+CVTEYLL2MZAC4YM4y7LUEArbU8Nzl10y1ErzhO
         PtvshSTkp2rQpWVGRbyqnBnQDjB62nsRKuLN1GbZwWZwkvMAt7bDHhFaDyhl6xGg7h6a
         0VWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=no8y6CjCyso/S0YBtbVSW2VokgcET074vsF8/FpfnT8=;
        b=sfkCzOBR2WCh8ZMl+z7YhtV7f3MDB0o2u5I72nUSyKKkABdNva/M9yxw1FcNxF5Rl7
         7zb4LidIrFaJKu+TEjT4oF5+mve/2ROHSQ+4rVbKy+I5axKeGzNBR4mzSopcKtIPi1hc
         AgAWeUDXcDg6CPphJX+Mw7dEmrRCfsgC+CWl70AvHrGE9bWC+t14x7eh+wtlLFoEm4hp
         2gu0ghHV0GObcny5VzmfWEtmCEKLy87VkmRhAMjkx8fhr7+hkY6r27Gx0zG8A3SNFynt
         7u3MG+DgTbv0pSRTllFV81kBeiO2bZrf4Md4sCtePpuqKeQdv6+KRKBSE3YttIc2DuyH
         Z2xA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YS3dq1Y4;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=no8y6CjCyso/S0YBtbVSW2VokgcET074vsF8/FpfnT8=;
        b=PswrKJxQ8x4SSQvphVKPmql/3qVgrVYp2Pdcfr0TXzhtjVpFdkvo40qn3Qs55h4ysj
         WbyErTI1jjduXQhpIQstNIjjr5veJMrWGR+3YuztTIhTS5OLF4VXhp8dLrX8HpURhTpi
         dFfZPPdqGERlt22up90kLcm1qUZ7OSfucUPWiG5OiPPrp2HnE6OpDeKTaStQtgUSY2Af
         KOuY1XOGRByRZqt3MY0PHyhHPOS58hvQZVIToPWdGppAR8WauP/c6FtTlJmRrDOsRhj7
         hurfx6ZCRPfzuDaiNJzPUGSxM8/dVQ4TYymgLA+LsTPKnOkupEWPNbicjl2XMP7JWhBU
         GP7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=no8y6CjCyso/S0YBtbVSW2VokgcET074vsF8/FpfnT8=;
        b=lTfALCD7bw0AZsG+FbJoAVM5lvB8f28bNU96tkx/86DM944gdtbsB/n4FE52iA8tne
         UhJT0bBCUnel7Xri861L6vnyUUj4Lp5PHsFEMF7wXtMcVg2nLVoWiDMMxqjgXEid4tzJ
         K0Lp0sENq72xn45/AiGv3l6C4ZaQQSk+vNkkHs80E1emL+k/UxpevAwr9arY4DhJQ8gj
         6G5+1u13O4zmoSNFdZ9x2hL+nNquQMPytbF9cRPItDJMKO1lP6p11sltCyk5PbsRHX9G
         9BHbes75nDihqxFpXev6JGIFaz30ln7+P+ilz27wvnhRWjVXb84uXnXStRWFlbP00Bs0
         J5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=no8y6CjCyso/S0YBtbVSW2VokgcET074vsF8/FpfnT8=;
        b=H1jJRXBqBx8zmujte7saVgwUGX2ChuD8dCRYYfU9Sm9Rnu9lfShUX2U0yTnoSoa6Wi
         BRv0VmdCsgOL+GhtMWuN3HUUNAhLv/UaipBOc3/v9KglQs/HNP9jpmHesPMsyNCsdHu0
         iKphyKpLRzeRbY+R7BoBiKiDfa7obkUbhqMmg+PWgDWIEOaYcQA3L+XfsTNBMwsUVxWL
         aa9ZNP1f06AFHe1HFfW0Q4C9yM300LF+pOMb+pcVhrxWpuWT8wnzv89xqHHaRB0ATKks
         OtIYSbXlIdXUWE+9+tPBqCPe1i3Z60V0frnLId0zAfP2Wq0vIo9/sdJnfmSsbvf/BMeF
         TyWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU959aFzHHBkddhM3IF4VUfGu5fzdecg1IrO7oDun0LBnvypOIJ
	j+HDpYArr+uBuhehRB/ruqg=
X-Google-Smtp-Source: APXvYqzwy1uwhfhtFj+4JMk5Jfq5IUbiykOlxqe6lU813xfBZFPWdlgEdIz2lZdJyERDMQVpW6uciQ==
X-Received: by 2002:a25:e04a:: with SMTP id x71mr23499706ybg.211.1580811215947;
        Tue, 04 Feb 2020 02:13:35 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:df8b:: with SMTP id i133ls588300ywe.7.gmail; Tue, 04 Feb
 2020 02:13:35 -0800 (PST)
X-Received: by 2002:a81:7145:: with SMTP id m66mr4859100ywc.458.1580811215295;
        Tue, 04 Feb 2020 02:13:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580811215; cv=none;
        d=google.com; s=arc-20160816;
        b=qW00wd+Is3nDoAQf0EZmg7rjh+10TRL7SlVp0KLl0wvlwm8RXpp8F6QRGI4pSpXMWL
         FnpjJE3zvHyvgbv6IlLtxSEWqbUXXVKCmJZmRGlMS/OQ+vC4/FeTm3gJg7DxtffiOrZu
         cWo2X7Li6GS6GSCz2Sgp08HC+9cL01q5vnrMcb6rdnXTRv+kvRqSGb8iEDMyN9Vdg6Nh
         RCA+cCIlYXSNGAZZt7ivxDkAe1/R1WmQKW+Niu4BY9H1vRa6707lvCGcVGQKoutKYgmB
         MyyhD/+S5ZGAsb1+E2eL+sLMIdEfXi6DaBQR97IMfMvWMDKMVQhJJgfLTj5GfVM/B+2U
         /Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=niDzTrzHdUTgxsAQidBIwEZYPjVqq1bWsD9JvZGGM/o=;
        b=W471B16WMPdM9a6Rke7ESgQ8hQkWNjrbDjlKDY4eCQ1LvXLqQ55Oe+6jRNvwibczB/
         hcp9xTrM/QWjEBa7f4k1V4NTPIuWV55kTYIw1lWtLjZRBh96zS2l16kF0xiP6D5CGD5V
         KRkJNrvANMRZp85T4hlhLB6I0XCelHxYRqBfhdQcKmRpXca6HxH01VAnpCt922Rm2gQW
         lzcAaE7AWJa7JcZKW45aFDm3Nk19HcMqh0H/dCCDImUgz4C3k9JN4Pe2p3ma55aPq0WM
         BzTvOJjVqmChhqNVs8AIXvPPaq6Mq6zMu3Gwr7ENfBefAvSTDmBlPjAQeBFKVZZuDX+R
         sBZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YS3dq1Y4;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com. [2607:f8b0:4864:20::1043])
        by gmr-mx.google.com with ESMTPS id e186si1317534yba.4.2020.02.04.02.13.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 02:13:35 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) client-ip=2607:f8b0:4864:20::1043;
Received: by mail-pj1-x1043.google.com with SMTP id d5so1143145pjz.5
        for <jailhouse-dev@googlegroups.com>; Tue, 04 Feb 2020 02:13:35 -0800 (PST)
X-Received: by 2002:a17:902:9309:: with SMTP id bc9mr29878761plb.88.1580811214223;
        Tue, 04 Feb 2020 02:13:34 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id p24sm22834066pgk.19.2020.02.04.02.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 02:13:33 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v3 3/3] Add Linux demo for pine64-plus
Date: Tue,  4 Feb 2020 15:43:13 +0530
Message-Id: <20200204101313.2495-4-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
References: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=YS3dq1Y4;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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
 configs/arm64/pine64-plus-linux-demo.c   | 149 +++++++++++++++++++++++
 2 files changed, 263 insertions(+)
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
index 00000000..55f59b35
--- /dev/null
+++ b/configs/arm64/pine64-plus-linux-demo.c
@@ -0,0 +1,149 @@
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
+				1 << (32-32), 0, 0, 1 << (155-128),
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
+		/* IVSHMEM 00:01.0 (networking) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 2,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200204101313.2495-4-vijaikumar.kanagarajan%40gmail.com.
