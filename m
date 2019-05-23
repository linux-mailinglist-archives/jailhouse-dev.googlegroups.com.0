Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOU3TTTQKGQEX7JAGQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8928C2F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 23:16:44 +0200 (CEST)
Received: by mail-io1-xd3c.google.com with SMTP id j26sf1297999iog.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:16:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558646202; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOLwS8NaB/wFKS8GFfkNzt+zqklUhDigzZOsU097eEvMmmpYgqfXW7kFiUL4Ky5pOK
         ezsaGIOn7peysvzVbAexzlStll1fIUlPYWA9C9O3rfJsEbgIdrz5EDKDZdZeCReCa3Xq
         EzPwh2wWQ7SorhhOgIJUqH/2ipIXuBthgpf/xkVee5ENcm+JXobwXt1u3FIC1o78ZxQf
         H8rAWMATMolj2IETdipyD5qtWlX3uRRVIEam46v2ntcTGiicwKqvQhscCVPesiz3zr+p
         9X6wxBf4Hyz+a5gQlH3rT8EOqJEgnwn1jHyoh20l3INr2JLvhxoRxWLkmtmo+/aqZifW
         TMqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=lUsaxaNjRkuZTakhg40LfuxKYxGYJa78vKhbYF+QwYw=;
        b=eVyIndrNytRaAYCmesd+nrw7Zs1K2wJDoir5Uf3z+ThjYFDJHdRpZt2owFi7un5+lA
         HBfW4r+yhAOmss8yWQlaVkjpOt5+jD/t0JDsZX05qfDA1rN60lJ/ZqYX3JCQGPFvAxc7
         Z/E8CyFYCIOMHdiGpNZaQZa2lKHidpv/nCnSOD3rHxB4ZHz3KoSUUkRAoseBF9eKCOTj
         NIK5jfglOB1cJ1GTNr4n24T9SFIN24nbnHI40DZT6dYcfcSwnTzqNL0F6vAWecvb83nm
         sT9eAc4nC1yirHnXXid/MEQTkvQtRHBfBRNBTl7p0WsfapEGXd1oUXcTz5K/bBI6Rlpq
         GTvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FM8FJ9rJ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lUsaxaNjRkuZTakhg40LfuxKYxGYJa78vKhbYF+QwYw=;
        b=blM83qjHxMUaSYz1CNYufG8Czmcm6TsUPLnMq8F5fT5XfvBrNyU3ISNIUINkZflUJn
         Wsr9SE3Bk7R1yMpBqm/6WS6SBnshcG7GHSTDVjFs0pMlYjlc5P9HeT+8zBRiQTtmnDmm
         iFdp+NLkoGDpM4PA0PtsE1VKDNWIMZjVIJ8C6uvvQOQzXiT1h2HKazL2qvazqs8UGL5S
         M3JrLD+Cdps0Ym30px8l31UT9CwZxbtld1b2js6Ra0Jcs+9muag+E1PsoNdHIje0mmxG
         1H2aCKTPTBt1CCzi0mQOLtOdMy1wTcbYCw2xdLMCw/7N/Qg8+zt4PVALMclIBYXCKS5j
         3Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lUsaxaNjRkuZTakhg40LfuxKYxGYJa78vKhbYF+QwYw=;
        b=XnpvRwd0fBdBMDR7NX2+uvjM5bq61CQd/PTd6o4jisFRiacc1XH+3uiOq/z6PNn3zx
         MoYAZUP67KvLVlBIGVRGoaGmOILwO/EbkCRWmyb3qX5IZbwnv87ds38USCP3Fqj7Bp6r
         AqtY36JZDm+bYwyqa39zan1KxlmK6NS9b+Ffuqq5HrEQw/oS2vnyjpUCnkd6ZMEoqvWi
         0FpobsgMGgC9PwnsiawIEM74CQPwMuIBgKXrzURnnl2DwzhKqbP2WFAJ794VPorOfywy
         gf3r/gQVcdaRhPHkPyR93rWK1Mm3wVX70tvSZNYLPKelsDJeNmbvs+LG2clOzB1hRKX+
         i7OA==
X-Gm-Message-State: APjAAAWdrJzqq5xc3TVw7vacNxXwhqWtzKDqpCAhbSPVbnC+6tP3fORv
	fZ7U7Iu2HA9q+Y6I4EiKoxo=
X-Google-Smtp-Source: APXvYqzsPSEalxXN7WOawicIH9NpdqZeYbjA/ooYYg8Eo5/ZjO7XDhxbPtxDTBK+L8MbMnMYQmZUlg==
X-Received: by 2002:a24:ed82:: with SMTP id r124mr15422666ith.108.1558646202616;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:a890:: with SMTP id l16ls660161jam.3.gmail; Thu, 23 May
 2019 14:16:42 -0700 (PDT)
X-Received: by 2002:a02:1602:: with SMTP id a2mr24811161jaa.98.1558646202163;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558646202; cv=none;
        d=google.com; s=arc-20160816;
        b=UyKRTf/KWW4Xi8rJ40XFFPjWmCphbo+Tl2jepaWo7IfwOD40pof2g20OsN/PDMR3vn
         odl/gPoc4dPGDVyKXYcUhdshl9YdfbRkE/pk2YlZ82bXdLoZfw1LbygUmUgs4j4Z8go2
         dVjmAhg0lGM8wtrxmWC8IoWKH4a3Rz6UuCl/wrglx5e2A3AZk5yq4Y+B9eBITWzQHCpZ
         6rUzPVmBi5+0yHOPo+JFnYhXtMNlri86rcwuFRpb17aWr2AeVyWy7WVavkfFJ6pkVitn
         N5ETq+oZilotDPTRSJirH3Xv01qBz0eSpMaUH1rlFj6ifbGEe7OuP2NiJhgeWzIyG8nD
         /wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t7mP8HJnz2zZaMnbnCOHKoAKveyN1lVO5mC1/fVRWr8=;
        b=haRt1/iBDaFu0ZxFJrjXYzn2CvDHY7gOvWiGi+UeVzleQadu45Jq6+nR79aKszAN2A
         35DqvEZJ3S+Glcdp6BidG02k5Q0OLV3+H7dRjHgbaLIkrEixBq5BtHm4WmaLw4FAJ3dO
         W9UctIPPc9qhBvwgy/ijkfsxgzvVOgrxCicQ/NiJufx2OecgK2ku0GCRHehByym8QE8N
         KhXto4l6lMF0wEYvtUkoYjOvV3SUNKBVIHfFtpDYp9bR4hX0Gsar7soOcWBsTAKKXtCU
         XTEa4DU1uZelyeQnNTMQC/thm3XTMPXnRxQLu1MgE6Mh4LTLjEm5ZO9BC9IOUpcfrNUf
         NcTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FM8FJ9rJ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id y34si490510ita.0.2019.05.23.14.16.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfiT066842;
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NLGfGI091684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 16:16:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 16:16:41 -0500
Received: from NiksLab.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfOY116843;
	Thu, 23 May 2019 16:16:41 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH 1/5] configs: arm64: Add support for k3-j721-evm board
Date: Thu, 23 May 2019 16:16:19 -0500
Message-ID: <20190523211623.9718-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523211623.9718-1-nikhil.nd@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=FM8FJ9rJ;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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

k3-j721e-evm is the new evaluation module from Texas Instruments
which has the j721e SoC. (aka DRA829) It has a dual core
ARM Cortex-A72 CPU cores, 4GiB of RAM, 2x Display ports,
6x UART ports, 5x ethernet ports, SD and eMMC interfaces for
storage and many other connectivity, graphics, multimedia and
other accelerator devices.

J721E TRM: http://www.ti.com/lit/ug/spruil1/spruil1.pdf

Add support for the jailhouse root cell config for this board.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 configs/arm64/k3-j721e-evm.c | 254 +++++++++++++++++++++++++++++++++++
 1 file changed, 254 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm.c

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
new file mode 100644
index 00000000..2ab2c3ce
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm.c
@@ -0,0 +1,254 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Configuration for K3 based J721E-EVM
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
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_irqchip irqchips[6];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xcfc00000,
+			.size = 0x400000,
+		},
+		.debug_console = {
+			.address = 0x02800000,
+			.size = 0x1000,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0x76000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 1,
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x01800000,
+				.gicr_base = 0x01900000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "k3-j721e-evm",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.vpci_irq_base = 191 - 32,
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		 /* ctrl mmr */ {
+			.phys_start = 0x00100000,
+			.virt_start = 0x00100000,
+			.size = 0x00020000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* GPIO */ {
+			.phys_start = 0x00600000,
+			.virt_start = 0x00600000,
+			.size = 0x00002000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xcfb00000,
+			.virt_start = 0xcfb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* serdes */ {
+			.phys_start = 0x00900000,
+			.virt_start = 0x00900000,
+			.size = 0x00012000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* Most peripherals */ {
+			.phys_start = 0x01000000,
+			.virt_start = 0x01000000,
+			.size = 0x0af03000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MAIN NAVSS */ {
+			.phys_start = 0x30800000,
+			.virt_start = 0x30800000,
+			.size = 0x0bc00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCIe Core */ {
+			.phys_start = 0x0d000000,
+			.virt_start = 0x0d000000,
+			.size = 0x01000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCIe DAT */ {
+			.phys_start = 0x10000000,
+			.virt_start = 0x10000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* GPU */ {
+			.phys_start = 0x4e20000000,
+			.virt_start = 0x4e20000000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+
+		},
+		/* MCUSS */ {
+			.phys_start = 0x28380000,
+			.virt_start = 0x28380000,
+			.size = 0x03880000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCUSS */ {
+			.phys_start = 0x40200000,
+			.virt_start = 0x40200000,
+			.size = 0x00901000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCUSS */ {
+			.phys_start = 0x42040000,
+			.virt_start = 0x42040000,
+			.size = 0x03ac3000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCUSS */ {
+			.phys_start = 0x45100000,
+			.virt_start = 0x45100000,
+			.size = 0x00c24000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCUSS */ {
+			.phys_start = 0x46000000,
+			.virt_start = 0x46000000,
+			.size = 0x00200000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MCUSS */ {
+			.phys_start = 0x47000000,
+			.virt_start = 0x47000000,
+			.size = 0x00069000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x4fb00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM. Reserved for inmates */ {
+			.phys_start = 0xd0000000,
+			.virt_start = 0xd0000000,
+			.size = 0x20000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM. */ {
+			.phys_start = 0xf0000000,
+			.virt_start = 0xf0000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+	.irqchips = {
+		{
+			.address = 0x01800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 416,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 544,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		{
+			.address = 0x01800000,
+			.pin_base = 800,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 0001:00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0x00,
+			.bar_mask = {
+				0xffffff00, 0xffffffff, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.shmem_region = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190523211623.9718-2-nikhil.nd%40ti.com.
For more options, visit https://groups.google.com/d/optout.
