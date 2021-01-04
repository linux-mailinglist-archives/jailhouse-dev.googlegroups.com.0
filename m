Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XIZT7QKGQEGSSHSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A3F2E988B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:06 +0100 (CET)
Received: by mail-ej1-x638.google.com with SMTP id s17sf7159800ejm.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774206; cv=pass;
        d=google.com; s=arc-20160816;
        b=Djq912gCFseLSpR7CTPCOyY1elZR3yldH2t1MagSL4cHvz5E8sGLQPPdytUSZoc5cC
         VOVD+wpbr4XsES2IHuk7Fs/u9Tld+Ga4Ne94vP/Kt4lfllM69KxCGb3lc13bjX4gCtK6
         eViCEBSuq4CiUig67fdsQsexupZ98CJ0qz1H4+t4L+TQisL6AU09DIkX22zU6+ZCu3YN
         tuTw69fXCudM5GyZCSz/V4OBwgnUVzqIVj/gVUuhwySZsyKnMgaIiLyTKl5d2vjfurVa
         jBcWV8G6KRy9aY5VpeJCNAVdY2vbwaHhVjo5YEWvUz+8FwCud10zRBNQeOBkYZXCgCyp
         py3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=0sgDs+RxoEcd1YKYqpA6mLr5n9zs9pi4jC6+SBkEa78=;
        b=VgjYC/eepspb8VJOA8j9nD4lHYcwC6woVSdqUs5HdnHqmvy3vi/eCiVw9EZ22ICc6r
         yWCcWKr44r+POLb+NIIhlxj9y8Oiq+caqTpeAhV/LroSCQoM551ILH3OqnrMLrgl41eq
         GSP79roxSHGcyzjQvyRA4Xu59BJrporDHBOjz7kuKrBLfaqJ+g+7+ziXbWzemd9gPqUB
         DFQRgAXlGVDHH/caTm+d+qAaP2/dMW8C/Rpl3Fq6qwARC7Bm+yIN1GQSOYdgJ+JYhAOA
         aRE2GPuhS+jpPIPfCISxjbFc5Ak5NOaAWNz2486iY8Gf7e5PBP0s3+op+ZrDDQFF2z5I
         30yQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DF+2dHrL;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0sgDs+RxoEcd1YKYqpA6mLr5n9zs9pi4jC6+SBkEa78=;
        b=N9nukGmYBJxRE47qIclLnj4yeZLHQtTm3Fpxzc9knLF9+83x2PP5PlWpBfMz5p9psT
         7q/ab6Xop4k/agdfzDtcwR3PEnTwPvZpw/5OJnehI5ziMdIob+BNVhpQyAHIxOCofUGL
         fauc4oyP8NhP8PgMFIluFWPUB72FPVtFX+4d90C8kyNDf9r1UEuxu8WyQD/9bqI7JZwd
         /HMMW0syUbVf20D9UlDlzHlK61QWUyFuUqeZe+WrbI/KmivUIgNr7SOtGixckvaXriip
         R3abxaF7YPOc7yMvllmKfM6rSpmkNoFz1e7crRsjPUiVdWY6r0GC5zfsFmlgZHh1ziJb
         R7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0sgDs+RxoEcd1YKYqpA6mLr5n9zs9pi4jC6+SBkEa78=;
        b=abDY4eK8Ec1DUef0aRoSUojDAe3YbW+vsjIF/vu+7BNS22aSQxf6DY5n2VLV3OQRzl
         Wo1YPjffiYEOZaFsV8XnstMZNw+Bd22/QKgNWNgx62pRveWgvG+fsNeY0gJ7oujeUkrd
         hMNm7oU+2j1w3P33lJdzBj6F/vHatgT9wRh0qVXGtlgRGWmA6db2ykGF/Pc2pOk/LIXi
         6q2v6y/zLVJ/vDTHfSOX3lCoaq8ALiSHbXQoccvtCri0o3GagEXO8iruKyNPiEAUTouV
         YkET95Noeq18GZYSQ/jfePfV0N4Y4Z/E6p53CGjnhg4T3RQsm+i94fTA0fEvSj9sef0b
         TXjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316FKqaL1Q1Y5XMheeF5Ad7EfTT7dyP302ZbnkdqDF7UpkTj0At
	kpDRW+/ygFF2rwqc75ZRRMk=
X-Google-Smtp-Source: ABdhPJxkqCIobUvCKhZQXqjYemMufZk+X5bAlNuAbVl47AygBaTu7cLyxNuY5O9eBVci3WY+rz8msw==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr71738564edr.63.1609774206699;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:793:: with SMTP id l19ls24186386ejc.4.gmail; Mon, 04
 Jan 2021 07:30:05 -0800 (PST)
X-Received: by 2002:a17:906:a181:: with SMTP id s1mr68742511ejy.60.1609774205611;
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774205; cv=none;
        d=google.com; s=arc-20160816;
        b=NIIHDdgH87BU6m28tlg2u1yN2QdAxzdxX8upyoyb8eKMKyv2woMxcFeSGhC4pMaKQZ
         skvp3CaebkyxsYuwceO0UcuEjwkFxTlPtujkyIngxNJ9ZWQerxPKSBXRS3V7cNxXtzLM
         66uzyxGmGNof9dHGfdgPz/7vaB7QTDeRcvE802nENJri/+YZHNeXY8vCoDEbnxCzNBAn
         oT07wVu1PbaMjOyf1YHm0Yfbm0aVnoDxZHUoeJb05d1XFTN1mpsVzQaH2YStBADfSyOm
         ELfDpFS4nrNpWSJCqi3+lkYLir5n3eFBcshXHNSwcRSrzNomy1azna8XpzkgDL5EZLUD
         9jhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=P5sKFCIjvHrtwpR6nR1XpaDcdeQIA3Cck7Hr/S9TSs4=;
        b=ZR8HC65rY3WtB9lw+NDA3B131YhEkzcwN44wJssjpONZHElacFBvIE/9Xut6aiUd0d
         jecJk5IxXaiCvAu+gVos1spirclUaUTE7CDopedtlOAtGNm/XzL82sr4rFX1XVCmYWnm
         5Zilpbke7srXpVBM0qemHVhBYWICsZBJkAqAqOU51m6RwxEcEk19nxSbUH4a+xyaNNRZ
         IdcD2v6lQR1izUDkCugz2bhf2TkIBPhtiPWGnTVMp1Yftke1ugccWq4dJ1dJj0OA1u/o
         xnQ7S+T4KopB6vh73LC/tXPjbO/oCFH/ySM4FTwh1CG5BuvAFbfI8Y33JB4hN9baR+M6
         Ssag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DF+2dHrL;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id d9si2063201edr.1.2021.01.04.07.30.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MMp8Y-1kg0qn0HOm-00Iq40 for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:05 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 5/9] configs: arm: Add QEMU target
Date: Mon,  4 Jan 2021 16:29:55 +0100
Message-Id: <3cf261b06c63f165a48ad1671596e8eb7de4a3f0.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:g0jayRaPYtperj4nvYlxXy8leS6uizlBfRlGWj67jcd7IFocRkC
 peDaJXI7UqoudGco+yNQshdQ/z5EvPO3EfzX+q9KvlImO/mi9+tOzBBfXQiBXGHB/iezciF
 sLE9BXjb549ULtpOuDxHBox8rL2X/No6uvOe3sK8RFU2tWL3Clgt5L9LdZoODgwFP+SjngL
 JMr+Gayh8OhkLL4lDa++A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YTRcRkFUDHM=:3dZvXjby/K7JZ5teVtz4sm
 XiLubOsR2pxLTC0fd0bkNcHJdoHTQWoGE077cJlN4BzQJB39sHF41AzmZDJYXj8OY6cB7k/IL
 xruM9BFz1yqxE+a05YyJY62di4cGV/b6YN3IjrxKR4oF625a5cIA0iNHNhIZO8kCpD4PbwH41
 l2b9c+hKLK085P0j+LYorqo7g0l4WlBk/7XIDgeFXnNPV7QapAZ+2eret5DvC6R782TM07Nhq
 6ihGXqmYFqezpW4B3C4dqPIEnI14Ev6cMfvgg9CU+jEYFsE1ywAq/RWsZ039ug96sbX8NMMRi
 H683wzijUkf7qCJ9mQ7Zlekeysigcr31sUkCANi/RFnrz0jI0YAJBVq5ex5UZxfLKm5gT54pL
 hJX6rqCezjUwvDIDLUIvTU1X4X1Hx9AEzlbnYIstIpuGQTS0aSooWonKYdQxF5jieW+1KrdbS
 YHk8v5eyg43OEg1CA+dHoiXQ7lu7hdExhfYpyHeihezNSsL8OmzZq4c9OGEspTJ8w/c9uKW7j
 PmsWUZcmU/Cid/qIDzvlyVRTn72Qsnn6qLYhpEfcUxcBfUjEoLdhN7E80SFuqY6aeUssoGFr5
 JwnN7jrJEdXkMA68kpN+cK/yQ7NrEq3qJclFTgxze0g9qK292nJ6dqpbjo9pM9iW/MsYBr5Yi
 1IeAFUUspEcCNU6cjzOXzDSb74D/q+Yb/tKupjQFkILzaFnYjyACgqj6AbJ2hL68wRS05EWNW
 LhYLPp0m5EZcu7F6q1mhAdxr7+Xo4/Eoigwqh1lRDX9+3qmj1y/LKm6cRrq8z1XhXvdGGp7e9
 fzmWXh7dpfC+177amr5OWPXxyrAZiDuVr3tAKB08tyF4vSiZAS8Sjkapn4dYKsa89PO7XDGUH
 7Addc3coDdKG/oBXi1Tw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=DF+2dHrL;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3cf261b06c63f165a48ad1671596e8eb7de4a3f0.1609774199.git.jan.kiszka%40web.de.
