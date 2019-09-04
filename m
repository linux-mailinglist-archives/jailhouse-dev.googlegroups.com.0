Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB5OYX3VQKGQEJYNVR4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe40.google.com (mail-vs1-xe40.google.com [IPv6:2607:f8b0:4864:20::e40])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E4A820B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 14:22:14 +0200 (CEST)
Received: by mail-vs1-xe40.google.com with SMTP id r129sf3357693vsr.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 05:22:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567599733; cv=pass;
        d=google.com; s=arc-20160816;
        b=M6wz4OenO70Nvhpe/EcL47nSAkufKSI94j1txVh2XvGlkNDD08SSpl/+GpHYv0xjac
         nv0rdQvtO0gZeUuOMwRJg+IjqA2cUKLdVuDGXTkNh901tanddnloMRrY1Rr6YupbcNxK
         HknY56ljh4ocO3w7+s+w+Wj6rjTkCGYoQ0qMghf3c5ihXFun1qRtqWIF7y0BKQNgwrEM
         ixQMI6mREapDDItMLH+4Ds6l2SBTKj3VsLj2pXoHSZnvyOpznS9ifwVeTOQ+/K9vZ2bl
         Dk3qQnWA9xqNZQW91i+LK3FwpDWcohjgAIDzaZ4BaI3Q7/P68W1d1dvasMiVVWF0qAvs
         5pBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=VTBjNMBi0zEm5GIALZqkm21NkeOumgggGWzZdeGkZAA=;
        b=a2EA6ATLjAif3DVX3ezRA3pZUPQKoSiqrB4OTAwHtkqoleEX4QxWKxJT2tOAme6Y0q
         vRDYLzxRo7ka/GixZwn2+oNUWKdvi2c7NWpE1f9iCFv5B/iNz4cBGXl15OWoWAyxoRS7
         rO0O4RqpA+eeM+P38f6AqY0AVINm4H5gQ3I3fDGyxiEuoQiah99MAnIxXhCRVNvfyPQg
         J7SqUq6jJofhX2PvmX7yPvh6/sUQf0tmab0Cn7gpFb6TgW+nLyBWB0aanBUnfRdoZG/d
         QGbe44b0ePudXcHGGHPC09WsMAEXfb9aMYEoHbRyWW6Mo5t0W2dqKIEbgq5FCkhP5rSj
         TSxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RNfBQh9m;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VTBjNMBi0zEm5GIALZqkm21NkeOumgggGWzZdeGkZAA=;
        b=UKMufgxvJgJ7qAe4esC8IIr44b+FY2WHMd1/q3zkmkYYVoF6GGUAmuWevAQBGSCXNP
         LNVDiLc3q1ZyRxoQpevtS3nmHFJHa5uRGe4pa5tBM1S5pwPO063ccifSLnwgJbpGxKyu
         ndM8b9xIqH8d0Jyf4XVmvtjtfkkEbMtsfxYmdLTbgjtDb7loaWf/2ROjyhhDWA4ba/w9
         Cry0N3HGfa/1mvTtSsPXK7fcrE1+4lgxtAF6f8O1zZ5HiplYp2jNDZ0TrnZlU78SDbiS
         7FlBnuDTZGNR3f+2D23tPVCmzbWUSvp4KlQuGCHqIVdoYWU8wgTRllCndhvolMSrIwu2
         VfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VTBjNMBi0zEm5GIALZqkm21NkeOumgggGWzZdeGkZAA=;
        b=Ph5C8a8LbFJfSPNF4UlIZ+gmeNcZdML0LgYo6T8QQRf4w4sPMmirL0vSq2RqwzYY7C
         n8F4Wuvh720vUg0D5LPPozLYu+JCAQVURhi60p31D3WhXF6R+WEA1bHK0FjeTvS420az
         QOVwx2k2kA4oMkuvLnSoXgZYfhyO04Dv88TSAj34YI5tYDVlG4kwqaqJbJbE73w+qb/8
         eJ4+y/N0mp/fV9OQNeujPQV6aycruuG/jIb4M8UXO0F+22DM4DxPxPP75XMmfF022iGJ
         8H2Wsm2jH9LAIDVuVrTzn4/kQmEIIWsCC25pFzTF3N9KY+SOaQF2WqKYN7/Z4qFdI6u/
         ei5g==
X-Gm-Message-State: APjAAAW3jjgNnnOzuQ9QNmSs2O4kiC3Aq9iwQ0xYz6RyAbX2o/fO+K0E
	oF/fIJFS67R2Nsej2MevQlo=
X-Google-Smtp-Source: APXvYqztmhvi8EYKKVOGyhVdVc6pG57YyBVYCOGUx1ALvsI1S+0vITSAgmsBb/kiZI3FzbMe6G56XA==
X-Received: by 2002:ab0:2842:: with SMTP id c2mr4674748uaq.139.1567599733525;
        Wed, 04 Sep 2019 05:22:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:66c1:: with SMTP id a184ls1137939vsc.8.gmail; Wed, 04
 Sep 2019 05:22:13 -0700 (PDT)
X-Received: by 2002:a67:e219:: with SMTP id g25mr2443560vsa.112.1567599733184;
        Wed, 04 Sep 2019 05:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567599733; cv=none;
        d=google.com; s=arc-20160816;
        b=g93/DeJrg0UJJ7cdEJ7VEfatcDtUdS/0LY944wyPNE4lkEf4WzolEStp6RJAiSndL7
         jutHRaisSU/no+CxwGurGsGuSBpkZefoXVPhrkubeh2fwmFeg1Yh0o7BYLH0dxoJm08o
         Itd8LCVKE2Z2KP7h9Y0omSBdNsDWgLN2flLzSCHofsI/O/fuPJvVG7+h9kEuwn91WauS
         d+GVXtvvkoKznkF1nLBFUWiVJPi2huSQaDF2e8CluMEEFPPVhWP56CRODac07c8ciaGt
         kQsjhH02AFcuFPSdXE/892AZhkgjm2czxvv4KhRHXMt8WHZ/nq7ebu/6sBBDEG9+P5iO
         E9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H23fB4DOgaFGJbHV/BR032WvyXYN0EH9Cs3jnpCOwU4=;
        b=0BQT8vwHZcF/kXsyr8OnPDClG0MVZXLQXixalxUfEEWZAyyyTnH91e3KRAIuUXKmwz
         mi/bCtqlQ9+ekLRe9FVEgNi94Vzt5WvXGIM6sz0VI4E4/VcvTaRwmhMTRqOvTBUMOIZR
         K/H46cin4Ulvd5f+2SG+MZNH7UWfMfHWbsxu37cqa4azyBpy6K5UJLqI/WvK2O0spX+x
         rFMy8wkaLmrpqxvyIg9ePbdzmPiCd5mZzNG/LJ+SPRxJZhRFnmhGDZbDXiid19zMBGiJ
         QPPtocysPbMIGctreRXjkeGYFIptMW6fttGMOBpBaU7Ju0dGwihtAJKIz4DVXAdJ38ol
         1UPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RNfBQh9m;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id d4si639523uam.0.2019.09.04.05.22.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 05:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84CMCY8119323;
	Wed, 4 Sep 2019 07:22:12 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84CMC9r097252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Sep 2019 07:22:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 07:22:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 07:22:12 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84CM4PI116363;
	Wed, 4 Sep 2019 07:22:10 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 3/4] configs: arm64: Add gic and uart demos for j721-evm board
Date: Wed, 4 Sep 2019 17:52:02 +0530
Message-ID: <1567599723-19589-4-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
References: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=RNfBQh9m;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

Add GIC and UART demo cell configs for j721e-evm board.
This can be used to run the standard jaiilhouse baremetal
inmate demos like gic-demo and uart-demo.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes from v1:
* Remove pio_bitmap_size references

 configs/arm64/k3-j721e-evm-gic-demo.c  | 72 ++++++++++++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c | 72 ++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c

diff --git a/configs/arm64/k3-j721e-evm-gic-demo.c b/configs/arm64/k3-j721e-evm-gic-demo.c
new file mode 100644
index 0000000..0c122fe
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm-gic-demo.c
@@ -0,0 +1,72 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for gic-demo inmate on K3 based platforms.
+ * 1CPU, 64K RAM, 1 serial port.
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *  Lokesh Vutla <lokeshvutla@ti.com>
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_MDR_QUIRK |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* main_uart1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x89ff00000,
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
+	}
+};
diff --git a/configs/arm64/k3-j721e-evm-uart-demo.c b/configs/arm64/k3-j721e-evm-uart-demo.c
new file mode 100644
index 0000000..05dfd83
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm-uart-demo.c
@@ -0,0 +1,72 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for uart-demo inmate on K3 based platforms:
+ * 1 CPU, 64K RAM, serial port 3
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *  Lokesh Vutla <lokeshvutla@ti.com>
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "uart-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_MDR_QUIRK |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* main_uart1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x89ff00000,
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
+	}
+};
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1567599723-19589-4-git-send-email-nikhil.nd%40ti.com.
