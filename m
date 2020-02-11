Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBB2HRRHZAKGQEQSHVRCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F48158C18
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 10:50:34 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id z62sf6709578otb.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 01:50:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581414633; cv=pass;
        d=google.com; s=arc-20160816;
        b=RLRYEJZL74sBK0H50TaWKuYRdWmq6Gt10bN9HkxKyEzOk2S2fMCG0rZVexdyAfuljW
         QZG4nJlaki9cWwiVfFTTJEOvEtCqPS3A6NKpXF3RAeUX5RCoehGgdAvhvO/zSyvNDjoM
         02OWnp1vIc6SiRO0mGrqrv/9gaE3/xIjj6bTOSyXNvjpmfUEOwyJK3MJpzotEFAJlHLY
         zk4h7Rd3NjraedkIfrLTRmDr3r1UJLws6tNcxIzwNUB8Cq7yj4cI7zwLmTRczIOhhnev
         CGFK4SM9N8Q9Jrqh9ZzldTmXysc0lvK4g1Gm6+3399eTNusjDVuf+fUpQFThJ06zYe8g
         Nnrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=ceCTk8iZUcLm+PHl1gAOjNu0UZP6h9ao2M0KjV5ELVQ=;
        b=JNxqE0j7MyLVP3bEwHw1tDFeh1vXBY4hYN/a/NU7p+7U4wBT9dILO9jxFsxyuL1ih3
         ITbWaAY3ygZFoTTzbyihfGVbMTuNbS4zNd+BF8vDRReod6LniUDgS29+/PpxlrX9cJWs
         yhoCtsCBRIdF0n730LGl7Op6SKQTeIX7BejH+hg0GbxCGii57dE3j0rJcgKh/P1psTsF
         6vSPzPUy4M4zJy4a4Nn1d2uUdf3cI65SlAVP5NlyK8rSkMJtl2s3+0nz2qrCq6kaOIdP
         L9Wqg9qizVe1mnOBxy06B8jfChuMvxIA45OtMB/6fvs8IK1JRarbhyXUGARk+rbwcnGW
         qHrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SXsERWNY;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ceCTk8iZUcLm+PHl1gAOjNu0UZP6h9ao2M0KjV5ELVQ=;
        b=PIYffOJUC4IziM9ok7N5sVh0vkDvEGNCCH/mFPUXCdwNUxp8+J++wGKtxVEEZeBw43
         v7TqFgkaxwOC8Zv1u+u3MS4iXQ5nIKEITsSqQw3xyckOLLR6ZgX436NKDZdWMxbQ6qBx
         V3088pIkLVDllI844ZsyOoLPlEhA68Mfu+J9t1mAF4NapI8sKCOHNGAjpo/ai2ynlxvy
         9Iqf1UHauFA4IciH1TXxRouoFhYfr83e+40PI9m+AnK2G5ISrJ1miIrRrXINyTG6UJj2
         5PkY91uIqCFnTN3zlTKLP3xGuswyek4d9Fut4Qoc9mA2WfYd1f8RIGrJEG8G1nW0qoZL
         AnGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ceCTk8iZUcLm+PHl1gAOjNu0UZP6h9ao2M0KjV5ELVQ=;
        b=jV4ad0sSfKPQdQ38CrtiELzBm/By8p87jzSYl4SXutI4xiXTw3miE6zsp0W2t3qz0R
         udpq0SO/JB1jov3mNIIg3SEWIH3vCGA+w6Mv/gOroCWvEp2gKOFRSX0gCCw+EDXdkRFl
         nSLm3YjpLBtU7UTdwZl4pxmsu0WKuCMDDCu2ZCPEeQVWH5t0vp158xYvOYiK5R77pNit
         aQzvnMgTr7IAA5jdzsg6nLSe5SkaaREZ+C8RMkULGMw63UH3yU40xd2H+IwcIxNGzlcQ
         pLj/VEk354C0VCXAIMG6e0FFw85t77XKL1c0ycS/4hxtR8VZfsFOMWbDMsrCSLLGgEWQ
         QGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ceCTk8iZUcLm+PHl1gAOjNu0UZP6h9ao2M0KjV5ELVQ=;
        b=XtMjFwXJyi66qKbQ8sLQsN2OJK3A011SVbsQBVG9IawumxTIU1iVkZQk0baxBXQBCp
         C6s8IP1M+8vsmk8C5+Fye7PNObVZUSkxMhUNk7dL4x1VL2voc/FIu0mCX0rCzB/85FRz
         gbmJ3dvwzd8FbdK4XdzgXll5N0mmTksT8KLAzT4e18rwIUjJbmKtsTHsLWMoCm5adsrt
         cumsQV4OosFJhN3YNjyf1V6ynizj2o6nAaE5ujJ0szZq/OsxjWIz/UHKwJnXe7/FMqJa
         xmMejkGAg8ccVWuYA2WtKurWx2d6YGowGO4PU5a9Bc29eTOxJBxiuSEmMt3ggCgqpMpI
         lnFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU7+TJ4hnZ0gE0Uo2qZYL/3cIBy6S9R/2DXD3ZSx+k6Aq5DRA7i
	MGMnAFKltMQ8avZavPSOw1M=
X-Google-Smtp-Source: APXvYqwiBWzGrS4GQoGoONJKKxa9hTkgJOOs/c8YnBoXZ2myHWwJ5so75A1GjFB99RI0JxrShn6cVQ==
X-Received: by 2002:a9d:674f:: with SMTP id w15mr4510441otm.243.1581414633010;
        Tue, 11 Feb 2020 01:50:33 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a01:: with SMTP id g1ls3146364otn.6.gmail; Tue, 11 Feb
 2020 01:50:32 -0800 (PST)
X-Received: by 2002:a05:6830:1615:: with SMTP id g21mr4710234otr.49.1581414632340;
        Tue, 11 Feb 2020 01:50:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581414632; cv=none;
        d=google.com; s=arc-20160816;
        b=LvKVWXvddIs2f52LCpUFlLLNC5rTnPy42B+z2V8huy2F7rO2F5BQl64RIh+tS02xqP
         FKDshcEBUqxW4eLBVBCjds83YURRKaniRaDsfOp+sxnrQ+er9osxKXa93vEUKxiMdNfm
         tKNtFbRrdOcR5tDJWYUdXVjL+CjFiAukD7XuSEiqztVk9ebkmDD5HTORH72Z3+I+gMYN
         bj33KJwihJzmSqYpRRcjkG0RO8GEvAubqumaYBF7xaIEZR7IkahnK+HI+wgsIpsOl5QS
         EbiQZ7j171Zb+v4FB0xHp/Fz7//kA8CrMYVmwlbu1ZSH/+ZMtYPb3PpUYvL8P6ZjAC/p
         0KpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Gw1shReILEDpoK872+BavZ+ZOUMTv7V4SX4phsRLu8A=;
        b=E3+p1zrejutj5k01oLx4VbjqLj94HLuEQDFvZXrNkAfgGSsmfdVbowP+2r+h3GAqrm
         I2Mf1Sv0L1J5Wu4JCAi27vOByWeC0ipGelmx0d6GepWKVVWOYvgsQiCOghk1r78cuISE
         8rs1s0Hiw1lBKTSmQxmy2YyCuzhGtf9mvBXJ0+hoWJjBe5OLxJ8CZjyd9UcFrojidXip
         7klfCfjIFHUM0u/cCyUMGhXeKPANJwkRr8UsSxh5UeHsBusCNUhWGsGHInbV2CwXXOE1
         WEolcRuJuB2ezurIXSVmuEEDcL/lVhxkkcq+BS8P8M7bSjfNUGvhQ6tiHZvTSOQlKwEw
         6ygg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SXsERWNY;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com. [2607:f8b0:4864:20::1044])
        by gmr-mx.google.com with ESMTPS id 14si86870oty.3.2020.02.11.01.50.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 01:50:32 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) client-ip=2607:f8b0:4864:20::1044;
Received: by mail-pj1-x1044.google.com with SMTP id gv17so1019283pjb.1
        for <jailhouse-dev@googlegroups.com>; Tue, 11 Feb 2020 01:50:32 -0800 (PST)
X-Received: by 2002:a17:90a:9311:: with SMTP id p17mr2656183pjo.140.1581414631307;
        Tue, 11 Feb 2020 01:50:31 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id v8sm3269354pgt.52.2020.02.11.01.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:50:30 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v4 2/3] configs/arm64: Add inmate demo for pine64-plus board
Date: Tue, 11 Feb 2020 15:20:09 +0530
Message-Id: <20200211095010.11234-2-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211095010.11234-1-vijaikumar.kanagarajan@gmail.com>
References: <32b59107-d919-a2c8-0761-4e03f5138209@siemens.com>
 <20200211095010.11234-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=SXsERWNY;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::1044 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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

- GIC demo and ivshmem-demo are validated.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 configs/arm64/pine64-plus-inmate-demo.c | 130 ++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 configs/arm64/pine64-plus-inmate-demo.c

diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
new file mode 100644
index 00000000..73cde95c
--- /dev/null
+++ b/configs/arm64/pine64-plus-inmate-demo.c
@@ -0,0 +1,130 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for gic-demo inmate on Pine64+ board
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
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.vpci_irq_base = 125,
+
+		.console = {
+			.address = 0x1c28000,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
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
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Output (peer 2) */ {
+			.phys_start = 0xbbeff000,
+			.virt_start = 0xbbeff000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART */ {
+			.phys_start = 0x1c28000,
+			.virt_start = 0x1c28000,
+			.size = 0x400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xbbee1000,
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
+			.address = 0x01c81000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				(1 << (157 - 128))
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
+			.shmem_dev_id = 1,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200211095010.11234-2-vijaikumar.kanagarajan%40gmail.com.
