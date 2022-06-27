Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNHB42KQMGQEM6YNP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id A834B55BA0A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 10-20020ac2484a000000b0047f9f9c81dasf4728342lfy.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336565; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZKr0PWxA96/90jtQQoo03YYlKvrB4SkHzTD57DjXG4Eps6qQn4POujzV0bWcHoasW2
         VVljJUKk1lWGo/a/1xQszgZ7XDPPBWU3iShOzs6ewTFYgdKcwAtsqLNJVY08cOkF+VvW
         KAirKul/rhtmVHkzBc2821HNAvVx6HWM8D5772+F30xXGJHhNJBoA83F0/qdaTQ1Bq8K
         TaBERPI96bP6Pzyp7EZM67UXt/sT5dPIMVQb5YgFrGx3z3MwpWRW8h7N4ki/SMqRo6UT
         VZdSgs+seF1XPdXlugZKVG3RpFq1fMMgDaRJpYjoHbe2OzBjPLDIVjmTzfqtEe/TszWs
         7DAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rtFYpVYGlJEZi1Qp85jew6E5GxqxSzvzjHJn9HNFkuU=;
        b=JUqnALpmNoe8WNHZafYJFF97EgIyaEVfKn1gcbh2py5i5Xt2xG7t8nME62FDtnTDyJ
         TZcxQjEToKcqUhcixK7wa0OZGG5lOre41XcHY4TLZxsIhd33thUCGM9lnLYcbtNzI7kq
         frqWyfpmaX0KYIpAJm4Vq9/sWen0NBxIe9w/FOvYalW7hV7Muwl5a82q5nCPQoswFLdb
         KxEK0js5hknSVw4qRYeqB33RFmxELionqdHRtRMQ76qlYU5OiDDSB/sX1qDlf/SlxvSU
         tMlzKkUw4jrmWsM3KapJRcLxpijR9zXbqQ7+owzti0OWtE/8ucQ0Kokxc+N+a+spwQZx
         h8bQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="Tg/pi81T";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rtFYpVYGlJEZi1Qp85jew6E5GxqxSzvzjHJn9HNFkuU=;
        b=dTzRzgsOeVhBSNzeoOKpqgiup18LnBBKQ/XWctWscIxzCH8IRKi+lOw9uOAA8SAAyp
         +IdpEghPFuAKcxFn3evXNWP+zFaAs1/ltPPAn2AmtciZhcn1y7JnrdPl/QD89OR7MDMT
         CRBfaubwLBW3PJpawwMMQxhwyAp5QpEtPan8hnnUCoH1mbs7AiJEgZbbrWzESX4E4vNT
         SFNCzg/M8mxKkdke3W4WTG5yXFy4wc86TPjmCgLCzkNEaAGrUZSXESQJclQt3kyoJToc
         IvfIYcnMtoSW488Ux5zrBieZ0XJ2FzKz7op2JHpCLnxUzuAS0o8i/7hhS7LecRcHSpCF
         lpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rtFYpVYGlJEZi1Qp85jew6E5GxqxSzvzjHJn9HNFkuU=;
        b=VfFpVgHddUPQvPWAoIry0FA4LVo3FFFZQ4mBc2X+6EzWLYpjmUhqyug6tiiVYCHRrY
         yO5EgAjyKGARTC7F1ubAK46frsvAuyxyNQC5PitG6JMx4bc306xgrUqAQGKGlDh3/YD7
         /Dbmb7w2rJhOKkbBIjKwfbFeuZoKf/3f/48ALMVzGON/nfHPQMmlLErVdyR5HwZi+Wiu
         CvgoUOp89+m2lHEB9jLmfOwSNsjCxer2lfRIDBGyv+dCcomUlVgzhNdQJBFIItaXAYeH
         hnabAjTLuSOyXfElpIx3hT02FkJvM9lzoC9yNb0SNFkbnpQmzN6KPiaTQjs9C/mujBuu
         SiRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8v9D+eCwovxYDpCp/rTYHnz/i5f8uxKmpjdtWpHIyRuuvkWG5Q
	TW5Xv0qMDImIpEThTCykh5o=
X-Google-Smtp-Source: AGRyM1vFRcG58twicSeCqlsusfZ8XlyerqCbq+6QXwAVvAk3XnZxHfXNsPDzDBtlelR0dpZCjGuopQ==
X-Received: by 2002:a05:651c:19a6:b0:25a:8959:2a3d with SMTP id bx38-20020a05651c19a600b0025a89592a3dmr6554524ljb.428.1656336565462;
        Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e03:0:b0:25b:c694:1134 with SMTP id e3-20020a2e9e03000000b0025bc6941134ls324070ljk.7.gmail;
 Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
X-Received: by 2002:a05:651c:2107:b0:25b:b088:3259 with SMTP id a7-20020a05651c210700b0025bb0883259mr5630578ljq.142.1656336563818;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=UlPvvuQ7LlYJYo16K23eg3oJlVlYmo+Ll2mWtSEyQMzSOsuDXEYe46FIIgOig8jgUX
         95aeSa2oITOUTHqQmG3La6YEQTt0pVKp8Km+rWPdyaFpdvsHjGTEGJBNUmIyBTFHRAEJ
         E/467y5nEO1Y4ndKVHERnD3GPv8+8m51Iji9p0KxqOn6BbDbSjh2BZhrh3bnu0fbbg1I
         Z9EGlEXrfkdfQnrcm1Yc9/cybJ469WkVPfPhf7Qjs+BuicrKJgKp/6Ws8T39+1kjG+TA
         vAerWhkxdGTmSRd/q+aYzIwjPF/S6aAzkkQyH9LygFZrNcrKkSIbAZEDnzodroPLSojC
         jfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dHhXZ7YNh/iODaekOE2MjKXhwEUHEXbkHTq7QJXMmYU=;
        b=R2b1q+Dgu+bP9YfwbPZoLY5v5AVEDrmaIiCUQGItAIGNOxqrytKMoAzkHHvWedwuol
         sidmkpkWt/vMgs6diZVOLm72YuHCz6/JArE8fGduix/9Oo0TamNc5l3l0kB49Ikx/OSK
         Q+5TmBZp7/3RgTp4larknyAV0QBajFky2oaHIH43yBG2ym+kbwFlLQNiyNXivGOMSNkZ
         TXaUPDhplE35VTD61SYAOPmzToaP8XNCQwJnuPZfmgQtyC3XEJyP117o1Xbrda+Anmhu
         8ySHxyyyVgCOajXn3m2XUCh22Hc3jyn14C2EnvGy6LLqZfV2OWQVi1x/+0Ic/1+x99pq
         NOug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="Tg/pi81T";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id p16-20020a2eb7d0000000b0025a71229262si382429ljo.3.2022.06.27.06.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVC1gYqzxxR;
	Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:22 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 36/42] configs: riscv: qemu: Add linux-demo
Date: Mon, 27 Jun 2022 15:28:59 +0200
Message-ID: <20220627132905.4338-37-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="Tg/pi81T";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/riscv/dts/qemu-linux-inmate.dts | 135 ++++++++++++++++++++++++
 configs/riscv/qemu-linux-demo.c         | 101 ++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 configs/riscv/dts/qemu-linux-inmate.dts
 create mode 100644 configs/riscv/qemu-linux-demo.c

diff --git a/configs/riscv/dts/qemu-linux-inmate.dts b/configs/riscv/dts/qemu-linux-inmate.dts
new file mode 100644
index 00000000..0fdbbac8
--- /dev/null
+++ b/configs/riscv/dts/qemu-linux-inmate.dts
@@ -0,0 +1,135 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+/dts-v1/;
+/ {
+	model = "Jailhouse cell on RISC-V";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		stdout-path = "/soc/uart@10000000:115200n8";
+		bootargs = "console=ttyS0 earlycon=sbi";
+		linux,initrd-start = <0x82000000>;
+		linux,initrd-end = <0x82200000>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 63MiB @ 0x80000000 */
+		reg = <0x00000000 0x80000000>, <0x00000000 0x3f00000>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <0x989680>;
+
+		cpu@0 {
+			device_type = "cpu";
+			reg = <1>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdcsu";
+			mmu-type = "riscv,sv39";
+
+			cpu0_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			reg = <2>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdcsu";
+			mmu-type = "riscv,sv39";
+
+			cpu1_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			reg = <0>;
+			status = "disabled";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdcsu";
+			mmu-type = "riscv,sv39";
+
+			dummy_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+	};
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		uart@10000000 {
+			interrupts = <0x0a>;
+			interrupt-parent = <&plic0>;
+			clock-frequency = "\08@";
+			reg = <0x00 0x10000000 0x00 0x100>;
+			compatible = "ns16550a";
+			status = "okay";
+		};
+
+		plic0: plic@c000000 {
+			reg = <0x00 0xc000000 0x00 0x210000>;
+			interrupts-extended = <
+				&dummy_intc 11
+				&dummy_intc 9
+				&cpu0_intc 11
+				&cpu0_intc 9
+				&cpu1_intc 11
+				&cpu1_intc 9
+			>;
+			interrupt-controller;
+			compatible = "sifive,plic-1.0.0\0riscv,plic0";
+			riscv,ndev = <0x35>;
+			#interrupt-cells = <0x01>;
+			#address-cells = <0x00>;
+		};
+
+		pci@30000000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			bus-range = <0 0>;
+			#interrupt-cells = <1>;
+			reg = <0x0 0x30000000 0x0 0x10000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <
+				0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000
+				0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000
+				0x3000000 0x04 0x00 0x04 0x00 0x04 0x00>;
+
+			interrupt-map-mask = <0>;
+			interrupt-map = <0 0 0 1 &plic0 32 0>;
+		};
+	};
+};
diff --git a/configs/riscv/qemu-linux-demo.c b/configs/riscv/qemu-linux-demo.c
new file mode 100644
index 00000000..e1947125
--- /dev/null
+++ b/configs/riscv/qemu-linux-demo.c
@@ -0,0 +1,101 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for RISC-V Linux inmate on QEMU
+ *
+ * Copyright (c) OTH Regensburg 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
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
+	struct jailhouse_cpu cpus[2];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[0];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			JAILHOUSE_CELL_TEST_DEVICE |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.num_cpus = ARRAY_SIZE(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.console = {
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.size = 0x1000,
+			.address = 0x10000000,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_1,
+		},
+
+		.vpci_irq_base = 32,
+	},
+
+	.cpus = {
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+	},
+
+	.mem_regions = {
+		/* RAM low */ {
+			.phys_start = 0xbf800000,
+			.virt_start = 0x0,
+			.size = 1 * 1024 * 1024,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+		/* RAM high */ {
+			.phys_start = 0xbb800000,
+			.virt_start = 0x80000000,
+			.size = 64 * 1024 * 1024,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* uart@fc001000 */ {
+			.phys_start = 0x10000000,
+			.virt_start = 0x10000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbf900000, 1),
+	},
+
+	.pci_devices = {
+	},
+
+	.irqchips = {
+		/* PLIC */ {
+			.address = 0xc000000,
+			.pin_base = 0,
+			.pin_bitmap = {
+				(1 << 0xa), 0, 0, 0,
+			},
+		},
+	},
+};
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-37-ralf.ramsauer%40oth-regensburg.de.
