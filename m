Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBKHH4OBAMGQEPHAHLAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E314345027
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:41 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id s17sf37623ljs.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442281; cv=pass;
        d=google.com; s=arc-20160816;
        b=dFCi2n+sXYGEQ8Lfc6NAIZPDy3YEuyaNz+3PxX4Dk5l/aCbsmO+U59KyRMlSamb9JQ
         yinMQEES0a9/VZevbgdG2aFFK//b40fe83VP8KKoSGMQEkb8M1H95G2S1nMcNFVwOgOy
         aqK1LV4zv/R5f3uDhgmTHH1LBbKhNgBX6XggXXKJR7R6MjZGNGkDSzmSxlPf4UCbSC/P
         duCZQdTdzVrcWEjpHFRWbKpHed/naJqe3zzeZKfGrCBByzfnsGNdzr4xG0oKpDN4Xlu0
         p5/Sios9frBWQ14vCePFp3lRRuwmWcXt07DM3ofbs0GiIYApsQGjz+Zw7EAG+VsGY4b/
         AtOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Ch+7rZfOeOr+nkefinecALw/vBtYyAn1tL65hXFwCbg=;
        b=i7eUDoJqYorbujAv7XIGMLZoCi+tpSgYTkAxQdvUfpghiwBY47+JfkvQ4BmgfBv6DQ
         EzZFhcXpvAUfDatGgbsd42ka8XXB4lApVHAfGKyVb14jLMQaLbr2EahxppgW4ZA2bMNj
         n3Jgd/A/EutLpCUe/fiAvvefoWkBI8EAzXtquaBtSaN0lfEx+5pJsDaZptpXoogzJqRh
         8BzKEBSg9o2Ltx+MjevyVTjInRrwCOQYu9pM8Z9pU5PSvwALsGdAxTMI506SVwnLIayY
         rXRAsLywDE533yu8CwjxrbHOuVMvOb/FqCAQJIXGn483CY53IoRYwIzWblQntJAi0HI3
         BCWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=n71Znci5;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ch+7rZfOeOr+nkefinecALw/vBtYyAn1tL65hXFwCbg=;
        b=p+Lh/nOlblGezEABcgcQ0qBLrn37gvhHShHA1ffPXbhP+qhK32EVsC7+YG7XXcvyyU
         VQ7pdrSDRK3W3cGPzK8J9quFFAeQ5ZUnxlSGIBZ0nqDtMpW1JzDP1y30ps/6TKt5TGRs
         MevQaq4Nk8zIiET2K0PDMgikud/Dg6iWn/46jDggkTPa9u8pqPUiPexSl5D6gBTKJcU+
         OSkaszpdoi+fshjuOIS4ksHiRItWka1ogjaYEpezHdywhvD79e9EjGKVmljtcczTlKYR
         50Nuzm6HanUVhCDJmVBuDQyldjfHasHym8VPuU/GDgeXukKZAabD6n5D3L1nT+SqRohc
         +qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ch+7rZfOeOr+nkefinecALw/vBtYyAn1tL65hXFwCbg=;
        b=TRArgQ7aOu2jvDKlyAZf9qSqPjoJZeQBv/EXOGsI7nIbJcBs29Vqwq/EaxwcKTC0i7
         aoGrQHNluSK7l8luYoAQNNJIc3TbxcW1+Vxs/Osou9zD9rY8WM0rPnOc+yFmBDXqQAbs
         lK95tCnsbQfR6VGTlwBCAxr7QZfl7H0F2Mxkx6PDe4qQT29ydwA0n9oXEaEAF2/kaaix
         edUieBX8nY87m5OYFD95RgS8hQHubCDHWjNPD8toun1Sl6Y9esCIEfNY3sGSEiqE9/0s
         xHiw/dHP5ZJyqidxedsePG5urDAZURU2DFY7vAx9PXyX31S+Ipo4lj3yGOVV+F/CpV1T
         IZ8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JH0QSPWqb8kGbPgHxRBR1J0Bq6u98gpXGD96X1ykCFJlfU4iR
	hJvsyzHKjg2qe0sk+WtRBnU=
X-Google-Smtp-Source: ABdhPJz9JpHX2Qepd6Eh/86BxbYxL071Iul7oCKDTi7qMkGjzc331Hi3Id7gigXVN8Dq7415tL5Tpw==
X-Received: by 2002:a2e:6816:: with SMTP id c22mr675522lja.59.1616442280979;
        Mon, 22 Mar 2021 12:44:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b54d:: with SMTP id a13ls2670061ljn.3.gmail; Mon, 22 Mar
 2021 12:44:40 -0700 (PDT)
X-Received: by 2002:a2e:9758:: with SMTP id f24mr650419ljj.404.1616442279972;
        Mon, 22 Mar 2021 12:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442279; cv=none;
        d=google.com; s=arc-20160816;
        b=aTTQIbPAnbicr4V8IyEGXvQXJ/iWTbmPSFtBG0AJKZxEms3BYMeuUtJgK2s7rJ138Y
         qWfEGkDbWSOX+G3Q/PxHLkAEs8vu5R5cQpJWyyz75Jr8MjEiePwCFSpb7qiflqcHg+G/
         4RtoaIZRHZUEt3c5ju7WbPokE54TPXsZ8K5xHH6xNUI83JUx1KqH18j1EfNyJwOigPvP
         YJ/b1NBse6tBtOsMoA26DdERxnJkeKGeNeCLKQbrHXjut7v3CeIhForUeROaLoF8MnV/
         OKGNQYcPRaeitU++8XcpfgTzQwBn38GiSviKf6v+i7jWjsr8cVeyO7J2HyMGFXqL+W83
         SuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Tl/VTcxHkL8qmMOKvZyds50IYjdxJw+z3srsT6T9nGA=;
        b=P+5SiHZTk1hs0dJDX3RsbmXWy/OlbxuhTjhT9BSJ4yWAayDRMLBrS2nJWOkn7lzYCp
         9vYnu4d/nOjKt2BfRnK2AzwGWFmA82zm/qyY5YJn+EqU6Lt/D63Pt/aazuvCveVUcWDt
         dGOO38mTsT6K9HWee8OrWDcLTy3WtshNdpgmR+ljpJbbGwkR9yUuz5pMw766LdO7QqXa
         MlG+R7jV4K7n/LkIl56RTHTpMb2Zg7d6GILksQ5IJKT/jdNl+0k04SsDYc7TIMYtUTK8
         Slriwfl1en9TRKPqYlcyswXxzDBg568ZkzoGwLa6V+6lGp99vebS7KUJPyeb4M6nACh0
         /uMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=n71Znci5;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id q26si509366ljj.4.2021.03.22.12.44.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hR3P5kzyWm;
	Mon, 22 Mar 2021 20:44:39 +0100 (CET)
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
	with LMTP id hcNrH9IoGhek; Mon, 22 Mar 2021 20:44:39 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hQ5njSzyXl;
	Mon, 22 Mar 2021 20:44:38 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 8/9] configs: arm64: add coloring example for qemu-arm64
Date: Mon, 22 Mar 2021 20:44:09 +0100
Message-Id: <20210322194411.82520-9-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=n71Znci5;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
 configs/arm64/qemu-arm64.c                 |   3 +
 2 files changed, 137 insertions(+)
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
index 2e9fcde6..8e6e46fd 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -44,6 +44,9 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = 1,
+			.color = {
+				.way_size = 0x20000,
+			},
 			.arm = {
 				.gic_version = 3,
 				.gicd_base = 0x08000000,
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-9-andrea.bastoni%40tum.de.
