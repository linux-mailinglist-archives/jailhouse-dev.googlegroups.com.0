Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBL7GXKAAMGQECVI3PNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEEB30249A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:52 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id o2sf2728540lft.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576112; cv=pass;
        d=google.com; s=arc-20160816;
        b=j3mN3jjFUgJmBGmFWfdApuik7TMF6mh5gKi3+RndcAxJODSmCS/GP7pmShvTTIb3X/
         v3hR2DT2qtJi0uI/6XyE9rKmf3XeSHJgsLwLv8J1c9oVmCMwyIFyDVkGUYEbaK2tnFVq
         gfWol4HGOgBYfEZLcCWDkoURktZDtXH8i95utuNXHRgdVlikehg1Q6JTWoBHuXZgTgoL
         X0aTyIxdgR5XQO9z8m2rGIYsz5Zdiwv8mSsFyCujiFgCnUXx20IEJBigHECqbpn6uAY7
         jX91nXuZ1iidoI+QVdvoIL3PRsNn/LLezr2/KxNfYidWGzDsgcswmwSUWJAm66zBoa62
         0xpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=IXWNVH3FqxRqBWU9126Sc5a4rMf41WC9fOW6q5eGe4Y=;
        b=Trx9n2kzhZcOaVOFopsLUeHdDFN9/OFSz325sq7yQB43IJpgny2qr+GAb8gMSfx1VS
         cL4ntMfW1Ny9nO507jv8qT5vE/eRruMGmALDNSbsL8NYfo7jgrDGzSv40Y7biqniT+x5
         hAujx2luXr3px/KGpqLucyiStCHI6ZtaMLm20dVSifQMTMXOTfUhRQwO3rq9HVov1xoT
         Cqw+uTM+kw8rG/lZYC8zIM68tTWJIIX2LyxISLVs1G48trs6OIaqX7X16b5hh8pBTqDx
         ZgDnDKsC7iXnHnw5QrJZiHrOCaat/q2GjM3K3NjHWPqikWcySaxU9NKVRJuojYWVhk6C
         gDCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=zdl183UY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IXWNVH3FqxRqBWU9126Sc5a4rMf41WC9fOW6q5eGe4Y=;
        b=mYsG3lCO5Htj5kLUVe/oj2notDKgz7t6NN3j6/F10R03hKd9t6z3k0eYu7p4eXTiFV
         4Zr6Ze+HnIaJbiq/CfaaQCm5wCNJ4ekGWVWElpgSS5J3LbN1NivECsGAm3G5vgZT46sd
         k2w1FyKhpQUyrVRegLmF9pYsjCEYEu1JExnhrJb+vyPqQIxp/KEq8HZ+ZgInZR2dOiZQ
         J5o2kPhw52CHRsl1t1q3BSDyzBE+O51ygATPylDK0WeZPpYF2S561dgVSsNIliWOzRzf
         eyY8A9pkyTZlgs5MMBbej6kUkTro9B9PVQJ32izsbU5Gnq8U8T4SandszDLLnzQtdfYZ
         sjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IXWNVH3FqxRqBWU9126Sc5a4rMf41WC9fOW6q5eGe4Y=;
        b=Rn9axAdg1ugshuZHX5ueaccKZv4SkrkMKJAtq7gCR+diaKDJKCm4lUH5oNMlV4kkjv
         hTsgCNnxvUcJC9yRgXFcpk9VTwT/YWbhMkzX5IYvzb3lIlzTLKnZErD56ESsgeiIiSqb
         rj5OEV6gPBiMuqAjVx1QfdUntUQd4zVVjOM2heKU1rcqjuWzjX2Qs4iUQxdctkc9ApCL
         a7+d/u3pe2bqj01jFRTMpjAJ3Rfp3Gd7Mcof/IJqhONch0LkHYv+OIF9w1CNZv56m0ro
         jIIwTHZx1VpB59AuSfv6JDc1sSQ+yeS0CYBo2oDG8TGGUADBhmy3wL91uf2gLrTitUho
         3QWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZJuQUzMthJjNDUmeMlPKDEPwdQ3/HWhbdS4Hlwl5sUyQHZ13E
	zb7hMk1dRwKCpXOMxMRltnI=
X-Google-Smtp-Source: ABdhPJxUViosgKxkKxMgOAYAJLYA0HyKjmHkueUwBbhVBKkKaSjXKF3z98NRPjuGNe4wsUMqKtWe2g==
X-Received: by 2002:a19:5e52:: with SMTP id z18mr118775lfi.234.1611576112157;
        Mon, 25 Jan 2021 04:01:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8e77:: with SMTP id t23ls720355ljk.0.gmail; Mon, 25 Jan
 2021 04:01:51 -0800 (PST)
X-Received: by 2002:a2e:2417:: with SMTP id k23mr16177ljk.373.1611576111190;
        Mon, 25 Jan 2021 04:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576111; cv=none;
        d=google.com; s=arc-20160816;
        b=qazpu0nzrI6galtjdMV58/UT0oXfQlth+ZRioz1h/jLrxFvT825BEnNfXajIlLpHJ9
         f9e0mUF4Nqa58TUpSpVtGweMgKZ4dFmA2IREzmh5LBfDnFVSmExkd1kQ2xQeSqXgO4wS
         CEGW4guF/ZYFXjn5w6VssHxZ0XFsEUd9gKgH6bXyFyuLIbiOulgD7l6Y/FlMH4QZQnRL
         A42rPbkMc3b2NoZVbouiwe0YwaLc0i010leE/4UU7KDIe8GMy3OVkTlKUrmaV5WVqd39
         Rg6JUuEksOT8ds6rYOLt8pHnVay+tcX4EkmBflFtXPfVCkXDPHORD+KzMbm/7+gANePf
         W7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CFARMdwjhFM8FiOBhhVEkeW6gykHV/lS0SVZWOfwhvE=;
        b=PpyeN6iuF1xeJcHGQNAzDSwrWlh1s9BTkGBmq/RANbI16sEyvcd8KSxFwds6GTSxZK
         Cg74/0HZA5lPVcHL5UGznaGoQSD8/wRuEArPuly4z4nleuZQ2xaaNOAIPlx9HFlksAUY
         gh52demCjQ58cdusJPbFlwfy18cjuHIAKEq+wGeqbL9+wy+Rl8SCuf5I1Xka1SSsSVUs
         fqE8TQd4J0zGdHG2CtHm4nkPQhfX+2u2xWKVKb1a7lA0CIopDhStRIxsyopsHOKy6o6g
         ei14ZpOy1CvVr3dFYkmZb9c9jcb/ikKy/+TZ32AdvgSINUBuVhuTHsrzvnaNx0RjYYf2
         pAxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=zdl183UY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id q28si722842lfb.10.2021.01.25.04.01.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT4G5gNPz1081;
	Mon, 25 Jan 2021 13:01:50 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id zJopy9DWPqZq; Mon, 25 Jan 2021 13:01:50 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4G0rhdzyjM;
	Mon, 25 Jan 2021 13:01:50 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 18/23] configs: arm64: add coloring example for qemu-arm64
Date: Mon, 25 Jan 2021 13:00:39 +0100
Message-Id: <20210125120044.56794-19-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=zdl183UY;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/qemu-arm64-inmate-demo-col.c | 134 +++++++++++++++++++++
 configs/arm64/qemu-arm64.c                 |   6 +
 2 files changed, 140 insertions(+)
 create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c

diff --git a/configs/arm64/qemu-arm64-inmate-demo-col.c b/configs/arm64/qemu-arm64-inmate-demo-col.c
new file mode 100644
index 00000000..2d608ae3
--- /dev/null
+++ b/configs/arm64/qemu-arm64-inmate-demo-col.c
@@ -0,0 +1,134 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on QEMU arm64 virtual target
+ * 1 CPU, 64K RAM, 1 serial port
+ *
+ * Copyright (c) Siemens AG, 2017
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
+			.phys_start = 0x7f000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
+				JAILHOUSE_MEM_COLORED,
+			.colors=0x000f,
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
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 2e9fcde6..f064c1b0 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -44,6 +44,12 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = 1,
+			.color = {
+				/* in debug mode, the way_size is autodetected
+				 * if it is not specified */
+				/* .way_size = 0x20000, */
+				.root_map_offset = 0x0C000000000,
+			},
 			.arm = {
 				.gic_version = 3,
 				.gicd_base = 0x08000000,
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-19-andrea.bastoni%40tum.de.
