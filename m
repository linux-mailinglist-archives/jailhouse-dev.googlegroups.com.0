Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNHB42KQMGQEM6YNP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB2A55BA0B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id e20-20020a170906315400b007262bd0111esf2409051eje.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336565; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mjj12czruaUadv5LUM08DlNNPs8mueuvMQ2/WXN+qq2fogR9O03LQmWm9ENCgHSBv7
         U25kL20yIhkb6oYkiIKdIgPAvcXnYoN9B0EcjSaNnVKxakY/UdgeUaPCQ7ij1ePBXl72
         EUrDDvX0/yvguMtkySG33IQUOTQpBSSgLVv3JbUxaBAGLs4KXY3uTu1UQkiteDZ+0u/v
         FDTy75WadoH5+bRLXkJPm3MZAu6F84df6gFgvrw36yaLZ6tlmj6ytfeZaNLfWHPNS8kZ
         NY1nhF1cDIsT/AMeFYWDYjXEtxJPNbr4ryjDQuFGlc7b+svueR+1PEM7pKxqW2XyoCix
         cP7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Kb/1d1GmKx1CYSrwT0QrSMiSGXXeLlU2FTeZ8Ic4CWE=;
        b=ZiLKXiOhb89z3u0e4MArtuqQcz/eriL3wQ51bIzrb/d2aLwwaBhhAha7/w1EAlgFMj
         Tn+bf0B95g2r6KCLCOgeFa1tX32Te1LW1EO6scBi6opANZ4NVIL9lOcDQW3692XEjmDX
         04GIBmkz0LMjVRhynZZLfGkljnutHk6OHgCXwlC3Gb/xUIA0Pa62PgVyB55DLJoTBjw5
         eQAI6SNJtvktWmrLJZLLR8d8DKz3BvKszvTbumhaozEBevZAojZBrF9IIaqwoHRYdGKA
         UDPKYUeMX2n3kRFv772BkXJii/JmMUx0t5VQxMWELWMJi+DZ7ZBSwPziKX2+vNhu58GF
         mh+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Ofo3dq8S;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kb/1d1GmKx1CYSrwT0QrSMiSGXXeLlU2FTeZ8Ic4CWE=;
        b=cRaWI+gofjjtSQqkQBfwSPQIX3eUeadJyxNqtLKEwGuVDqS4/RPgJ6ni0TMgxIhUq5
         bzHJPBBcVLfy0bbCYijXaqbYXMR3w13dQtiIBBlwOp7FBm5G1ymRSOEJgs06vzFehTKV
         Bs9vO0KM23/d6UECPQvxIyiXBWfvpryP5yldei7pLfuZgLpaysI4nM47bKen06cffMBi
         WZJGE7vI2Wsdt0jAC4C3MEIPztEMJo4GcmFee2MhWh8pXYE6NnZG66fJ7A4iWdkkdNa8
         8O8+7fJOEGi033Shqe5vjOVv3BO3FLT6UAJCQMcUk77/5EZnb4LC0+CyWse+0Al5VEif
         FcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kb/1d1GmKx1CYSrwT0QrSMiSGXXeLlU2FTeZ8Ic4CWE=;
        b=Arh0oE2TBVntJnF6OC+Xt9cMK8gpGHGhSwfO5Czgdk3hNHS9Jnpi/fvudXlNAesEFe
         G+bjjDWW/jCmqQU/xSVsF4mib5Qt3KaViUQNJeFFM0y//83VyUOKiaakiJ9qf/4pFzAS
         mWtYZipjsf9VAovbAxBhBLSa24RgfKa0rWQUQsrd3+pCq1jOh8SdQluXBUDGhk1DbBWb
         Aqkgzf0Cxh0PWoIICxWg3zNHR3/a9zmNnt3/6nQ109zj9Qz18QqgJITDNOkwfMilGUHl
         +tu0PbxCVy8h7jnKYWgfcNJaMA86hY7oZpKhPsYn9kJCpS4XxIiuZcZC3ZjtqXaSL1JJ
         pGbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9P/SJ8dVf2LeR7jpVw0qjJR0FJ+woMQkm3jXud9t7DZyfa+Cx7
	bdKLBHPBRQFtJ3f4rviuyjs=
X-Google-Smtp-Source: AGRyM1sPfT0IZq+fiRaLMNQjrAz1LKJUCBO8o1AUSDAbOHLyQsA65YKa4t9g3h9AR5mzyA7JQzbbog==
X-Received: by 2002:a05:6402:280b:b0:437:9efc:a065 with SMTP id h11-20020a056402280b00b004379efca065mr3253345ede.3.1656336565385;
        Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:50cf:b0:435:9b77:f6e3 with SMTP id
 h15-20020a05640250cf00b004359b77f6e3ls1431571edb.0.gmail; Mon, 27 Jun 2022
 06:29:24 -0700 (PDT)
X-Received: by 2002:a05:6402:354d:b0:435:93f9:fc0b with SMTP id f13-20020a056402354d00b0043593f9fc0bmr16293744edd.288.1656336563992;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=t55vg+G2ho3Q8pdkUWHjkcyYlhmoAtOVw1TRRO679SYVJ8117nkvOqW0cJ53aMGzpv
         k692+sOdSBohctAmgA2yfHjhpDhYtOTndFDBqc2BlzUkeoyjY38HnR5yRpL38FxxX4Lh
         n4U3AhX+/x9d8SGSuzJxRefBe3ie/wByS796y4TU/i1MvgwiPSNQXpGyfBTZrWFiorv/
         zoJZHk+2QFEVsW8eoN2jWVx6jS2zT3glN3vsjFz1J1MZZqTt97Me02+1jLBIjxVoPutR
         By4NAvttqYCemTTlM71KqMnwRLqDS8VOCFvqH6kI/rVilHOvUVPA53VZX3LhZk+xjXCC
         v5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lea2N9Vb/BgmGJFzM+OkGcVMnEzZzQnFGVHEpB2v91U=;
        b=mEJ3IuHWsd3ju1Q5rCGxFDl4g4Q25HfVlNwcTKBwZUfBxjLxeAoCYwqq0/vVl1QUa3
         qp06z1VJHBm7HqIgK9FY/w5vcUGFKOmkBsDiLDJKukGaOosUj5OTLqX3FZbOaOxrhBsG
         YMfN4JBeydCuBhi9QcUDriE4uvZ0oKdwvpIXT8eVLwZPH0IjShJbs1xPP9w7MlFy0pWF
         rUc9N041Nbbxg+lnRleUb91Y7VpEI1B1g/pK8mhOaMQg9bmmqeO05kHub/AAwU3Guk/G
         akRLQJSeSdhbOQ1NNC4ioIvq2pY58SJPlG71P2S9VcsWfpfpw/yvfbsu8nU1S7Lg7ieh
         RqAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Ofo3dq8S;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id t36-20020a056402242400b004379317ffbbsi122670eda.1.2022.06.27.06.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVC4jB6zxwx;
	Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:23 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 39/42] configs: riscv: noelv: Add linux inmate config
Date: Mon, 27 Jun 2022 15:29:02 +0200
Message-ID: <20220627132905.4338-40-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Ofo3dq8S;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
 configs/riscv/dts/noelv-linux-inmate.dts | 130 +++++++++++++++++++++++
 configs/riscv/noelv-linux-demo.c         | 101 ++++++++++++++++++
 2 files changed, 231 insertions(+)
 create mode 100644 configs/riscv/dts/noelv-linux-inmate.dts
 create mode 100644 configs/riscv/noelv-linux-demo.c

diff --git a/configs/riscv/dts/noelv-linux-inmate.dts b/configs/riscv/dts/noelv-linux-inmate.dts
new file mode 100644
index 00000000..486ea82f
--- /dev/null
+++ b/configs/riscv/dts/noelv-linux-inmate.dts
@@ -0,0 +1,130 @@
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
+		stdout-path = "/soc/uart@fc001000:115200n8";
+		bootargs = "console=ttyGR0 earlycon=sbi";
+		linux,initrd-start = <0x82000000>;
+		linux,initrd-end = <0x82200000>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000>, <0x00000000 0x4000000>;
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
+		sysclock: sysclock {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <100000000>;
+		};
+
+		uart0: uart@fc001000 {
+			compatible = "gaisler,apbuart";
+			reg = <0x00 0xfc001000 0x00 0x100>;
+			clocks = <&sysclock>;
+			current-speed = <115200>;
+			interrupt-parent = <&plic0>;
+			interrupts = <1>;
+		};
+
+		plic0: plic@f8000000 {
+			#address-cells = <0x00>;
+			#interrupt-cells = <0x01>;
+			compatible = "riscv,plic0";
+			interrupt-controller;
+			reg = <0x00 0xf8000000 0x00 0x4000000>;
+			interrupts-extended = <
+				&dummy_intc 11
+				&dummy_intc 9
+				&dummy_intc 8
+				&dummy_intc 10
+				&cpu0_intc 11
+				&cpu0_intc 9
+				&cpu0_intc 8
+				&cpu0_intc 10
+				&cpu1_intc 11
+				&cpu1_intc 9
+				&cpu1_intc 8
+				&cpu1_intc 10
+			>;
+			riscv,ndev = <31>;
+			riscv,max-priority = <7>;
+		};
+	};
+};
diff --git a/configs/riscv/noelv-linux-demo.c b/configs/riscv/noelv-linux-demo.c
new file mode 100644
index 00000000..bd263b78
--- /dev/null
+++ b/configs/riscv/noelv-linux-demo.c
@@ -0,0 +1,101 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for RISC-V Linux inmate on NOEL-V
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
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+
+		/*
+		 * This IRQ must be BELOW the .riscv.plic.max_irq, as
+		 * Linux won't address any higher IRQ
+		 */
+		.vpci_irq_base = 28,
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
+			.phys_start = 0x3fa00000,
+			.virt_start = 0x0,
+			.size = 0x100000,
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
+			.phys_start = 0x3ba00000,
+			.virt_start = 0x80000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* uart@fc001000 */ {
+			.phys_start = 0xfc001000,
+			.virt_start = 0xfc001000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
+	},
+
+	.pci_devices = {
+	},
+
+	.irqchips = {
+		/* PLIC */ {
+			.address = 0xf8000000,
+			.pin_base = 0,
+			.pin_bitmap = {
+				(1 << 1), /* UART */
+				0,
+				0,
+				0,
+			},
+		},
+	},
+};
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-40-ralf.ramsauer%40oth-regensburg.de.
