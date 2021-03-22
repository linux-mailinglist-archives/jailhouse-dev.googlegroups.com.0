Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBXPH4OBAMGQE2NAXIRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 53362345032
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:34 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id o9sf10348wmq.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442334; cv=pass;
        d=google.com; s=arc-20160816;
        b=deJ7Y3r1pc32hH/PNGcCMBDeiY8GYWsKmFb7btMSE3oTlKpgGIMIH0ZeVArZlHMdQ3
         6t3UT46sXRXsvo/NJYEOtRXV0ZHXB30osQCuYT8ssMoN7ATwAUOxlm0/xntArdG7rKzg
         7MBliigtdqjklD3zJhqo/zSHkDCDzb8Uv0hksdQ1Im0cbNAtwm7r45WJUpa+5F/yGCMm
         tjdJFgwMsy8hMxkwBUJOTSeXIn4puN64HtfX8/SPZDOs5lf/PFiDL/gIQTHdkMSaHOdl
         f2pBhUa/5zYZafzHD3tk1uvk2ghuqnDDMXGbQMrX80M8h/inXVBO4jZ5rwW7Kptf6/i6
         s61g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g0DQjepp/3/IQNPoJg8hoYi8Jh4ClBA7ZzeyZz3uNRs=;
        b=mjZjs9SS+6BjA5qD9NjS3cMsmlWK77NUS8actX16W8qZsTjf5GUPCzw0Bp0psPoCB/
         zrqaCHFyrSgUft4xyI7xKXqWzFRN2500VQB948GCvTjLi3we/ayquLfftvpgavi0LWPu
         mztKMCXQBbRNQq/zSLJOsQNZC3uyBbQoWwj2bUr8WB7oplBlxnDTAZ76IFQ4qgdwVvUR
         OulgQ6OeHua0oQ7M5fM9xgxa+DxbNR3BhVsChCH+rU20wbHyo5+0DBrijSQQ4qcaSFKb
         pWCxnwfRkMnruOP3ZSfkNqqcVBtgYi/uSlm2ebMJG18GJBsdnuLjTXSOgqgWluJbhIt2
         vtMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="dVfEm/Z2";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g0DQjepp/3/IQNPoJg8hoYi8Jh4ClBA7ZzeyZz3uNRs=;
        b=sY53P3pSFV/AB2N500Zi5Lm2UGlIigVYAJQjv2T9QS30EjzgNBEjLD5KNZBu1hh8RX
         AC/vDPli6O7BbmfEIBOEM4vFrWLyp6ISdQQyrlLuAmDgjyvQ/uRvwyO6ijdEGsaK1gG6
         z5+VqcPNSdhck/WsMZgO1EuU+ZXMAhfg2EVaVby457obfvDKOJY3QlBr+r8kHgnsUWwH
         b1uZUqcTP2csfjl2bywbIbXGjyEY9j/SUzUqCYD86oZOUMsw9qw3nxf+qmxjP0jz4vpi
         ehq3M+DgwiC5zr7E8TQeeMZgUBF2z+4u6BiKLWNWx1kJpThZcaAfdp/MQG9pU+6cWCnJ
         eYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g0DQjepp/3/IQNPoJg8hoYi8Jh4ClBA7ZzeyZz3uNRs=;
        b=pR5uLWEHmChQENjp9qV9WrvypD1oazSBlIbzcNpOsALQliEaNw5+Ec4tzz6SFCh4Rh
         jMi10kxm3aABGePYLgTgPmew+87wwnBuQH3mLY4SPZA9uXfp1bWVScvKjioIcYx7h5PZ
         y/lzcN6Un4ExwyCJvLOp97x02PA75RM9EASDDmrEBajJNZe3/drOvzHznAB3XagnaP33
         fV/b9Py2NVo25M7VnAhUnuc9G65y6UyNvJKK9LHb6cQ5FYCm4H5iHfr5DwIIhLUXCyvU
         lPwspSCe/AuURbv+sOr7mE92H0zCeWY3DBNhwG1xdSyRY2YjSkoQjvEdZZJAtaE64HkJ
         sc+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531nM15YXLNWUsLIAHGjbJ245HP+ShkttmB73fhnN0Hfyx05TpJK
	yMzbtB0RwZV5Tt9g93Ub4kM=
X-Google-Smtp-Source: ABdhPJxrHJBqcJYXnWMYq2KH8uLKi9bEWsA+c/sk2PegC28vPqwsdDi1RaOyq48IYLBzFOQYIrDO/w==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr78334wmg.53.1616442333999;
        Mon, 22 Mar 2021 12:45:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f8f:: with SMTP id n15ls183737wmq.2.gmail; Mon, 22
 Mar 2021 12:45:33 -0700 (PDT)
X-Received: by 2002:a05:6000:114e:: with SMTP id d14mr219435wrx.236.1616442333101;
        Mon, 22 Mar 2021 12:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442333; cv=none;
        d=google.com; s=arc-20160816;
        b=WV13CH1xfLfFuTDPuV2dhj1Bv2v62ErKng8esSZ9J+caav0qi0OU69yEpDrKoA1EgN
         nk1jAnBxFvy0z4u7d6oo3jNvw7gH6/PqRZoegq2nZVd6anbkg7izU/zvjkgi4SaK6ZAS
         xGJ0irpuo8NQ9Enu3nk/Gf8znKvM7Up+Is7ixBcozvCHuTcUOFj3HJGqHxV3qzJCaUAo
         Eh9vZSbVYKWf3zh8ud3Y/ZYIzLoXJhcMJLwSdRhCV6LklEMhFqG1l0fPW6tR5FP670kn
         dC0x4JwkknILRU2EXKhytSGcGtQZgP0HWKZnbNgYZqmR3yroZZBpUSsW7hsA4wLByEZO
         yufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u8FYJdPRgzngopZewn2FTUPsP6c1+LctpjkFEH1UNSY=;
        b=rGbTvNRkT4FwQp5fYcKUAFNW2HI+KHppt+6uPhcdtbgSMC0ac7RkVrcyXQSUiVZqr9
         PwC3pbnIwyoI0wwhjPVRl/R47/Y5tMreb1938gkgX4Tt1VV82B4uGFuIrFmxldcqAXmL
         WFZF1rpc/SOSO8aE7vK9OMkQtY41HsS6O+qt5eJTyEU2njBI2NUgWVMayDHAU85xHeyP
         XtrapXc8D4YOyM6ofze4Utw6vVnmfVo25gn7VhcDFXD5v/sYGDvTZxYSt4JYyKQIJ7Xg
         QWysVBIpMCWk/jkpfa/5rlIu4sza0CdMmQ2KPwpq7RZxYz1hVlVDQXKFDdVQ82ZjfRMh
         SOcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="dVfEm/Z2";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id s1si409456wru.4.2021.03.22.12.45.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jS6XVlzyVG;
	Mon, 22 Mar 2021 20:45:32 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id krE7fhNgvfgV; Mon, 22 Mar 2021 20:45:32 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jS1ntLzyVB;
	Mon, 22 Mar 2021 20:45:32 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 8/9] configs: arm64: add coloring example for qemu-arm64
Date: Mon, 22 Mar 2021 20:45:06 +0100
Message-Id: <20210322194507.82643-9-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="dVfEm/Z2";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
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
 configs/arm64/qemu-arm64.c                 |   4 +
 2 files changed, 138 insertions(+)
 create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c

diff --git a/configs/arm64/qemu-arm64-inmate-demo-col.c b/configs/arm64/qemu-arm64-inmate-demo-col.c
new file mode 100644
index 00000000..45bdf568
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
+			.phys_start = 0x7fa00000,
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
index 2e9fcde6..ff4bcb25 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -44,6 +44,10 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = 1,
+			.color = {
+				.way_size = 0x20000,
+				.root_map_offset = 0x0C000000000,
+			},
 			.arm = {
 				.gic_version = 3,
 				.gicd_base = 0x08000000,
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-9-andrea.bastoni%40tum.de.
