Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVF76D6QKGQEAV7HDMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE32C16B5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:16 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id s23sf6364452lfi.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164436; cv=pass;
        d=google.com; s=arc-20160816;
        b=eBZ9Co0RwSwMQNz+jFBgieLicVOPk8tRKNtONIBaBSiD8fQLUz6rGiHU0gU2yZW2tR
         7AGQKRGQRZ7Lx8nN5DZuC7OCAOu49y0iamGt2YLdvwckoNZajVhi8aIPomLNOna1deml
         OWHVffvdogelslVCB096WzBArkAR64jNui05Ag7d7rim4ywc1boBtKocZLgUxUA8m/1P
         UX68paRwkYCadNGXaX1ISXJ7d5FW3pAcPoVc9S9rwzaVxeFTmJYLUhjaIUIo9ZFRdJ+I
         OtJQoQFv8/Dml9L4CwKLHRHt31b1b+Z9UCuCBld/bog3+WAoejmU9RlAY6eQkkUJ/L6t
         ldpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=44/LBetxvSTrHzPtiTIamWxXNNM7Zkr3amXsaBuJnmU=;
        b=YYAJYfWzf2iBR+5R+4Rk3ljxQ+UXSh9Q8rKy0IyIdDZrlMLf8xUJ6i47ZLFCPka2m3
         2yiZ5N3IpbahjatBf4jh/CZ8KrEG/V8LrSA6urpNzDdLOdV2c3rmzxd+Xt6qBiV2/B2p
         f+/4xy7BhtipdVSI6iZOehfIXm/HmXUpnShzhlaKwK6i9IAA0pRi6EvGdw8111wh4wgK
         O7aIXu15P/h3/57oCFq8U47HnBJ2dHgJ4fPWa9OMwqDq9zwetuI5YAkYqv0pEWAEeEmQ
         ebZsaUcJcV4Pr3BnR/JPZC4eyzp15Rw6AtditZPmUCRJrcOMxFu/9Lwy6jw87xMti57q
         f4cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=jBDwWfvb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=44/LBetxvSTrHzPtiTIamWxXNNM7Zkr3amXsaBuJnmU=;
        b=G98sZYoVDKMNyerpgXX/w5+fyoO7QYd2iYg7Et5/mZMPD9yS/1J3SojUL9g/ErGFSQ
         HLnis6nnV/UMQyt0sjmcMkwY8HlAKA7pdyq3z8TEJhgDLohcRAmTrks3MtQlH5JxoSQu
         e7N59ZDiZmE5tpuLpxbx6zzpsw84gMWYgd2PxYeIsBLCXAH27L0ITFwF6p9W35Plnya+
         ATeOo74gpSS/Q5K7ZDQj1Pk8HwLFL66pC+tH7apM6V+dMzJcKVdOkonweQM5gyGHTmTl
         cKdMVfcq90m8urlgF7qegfgv2qRU/kfgN6mfHy5XspcgZFJGcvMKD9elcdQTx6Sj2B/R
         tKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=44/LBetxvSTrHzPtiTIamWxXNNM7Zkr3amXsaBuJnmU=;
        b=cYCJhGvJmv2QfzfiwMuEWokZifS5LEiN6rY2XTOxmTZfAUo3uhyHTsTmVRg+7SegUv
         ltAUIAt58fYpIfwY9P0wqVDx3WwLWHsLVTnz9AEyVcr0l5jwr9D1uNr7ro29VIBVg2ep
         9LqJJk78Fs7dCmt20ZWMz7koWroLXR/PhynFagTowftq0hacZzqG4aj9HjAoWB/IkP3b
         oc9W4n2mHltzW0xgI3YO+FkHASgXOmsu331Ah6SH6Uyz/XHg2R6cW+Vz0kCebaciKLEm
         HyQbnMLSdCer/58yBBA/ZJNjGM7tYT3+IktPNKANCVZ2AqxXO2BXW53mKtZnGoDajWj9
         nj6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530wgOh9TekRXvbf8uYcwJ3k879PwTkx8upYaFnQ3S9usCOIMGnk
	YqwBhZEwP5YLbGb/gK9OMHo=
X-Google-Smtp-Source: ABdhPJztP8lW2qFrPdIrZ7TgojRRfKazeEuyD8mLwWQpq18ktP20ttTBM9xk89NMJOTPgiEsJWQ8Qw==
X-Received: by 2002:a2e:9f55:: with SMTP id v21mr508853ljk.288.1606164436309;
        Mon, 23 Nov 2020 12:47:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ccc2:: with SMTP id c185ls4042584lfg.3.gmail; Mon, 23
 Nov 2020 12:47:15 -0800 (PST)
X-Received: by 2002:ac2:5f90:: with SMTP id r16mr376604lfe.594.1606164435017;
        Mon, 23 Nov 2020 12:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164435; cv=none;
        d=google.com; s=arc-20160816;
        b=AevOPpjjnmfSMmP5JBXQud1YcT0QgW3jXKegxhe709w4O058RAcQxNzmzYrclYMHgm
         S608cOVYSAOrXdyW54aEgpT6vZjFE3eclQeVM5MMwJWuf7+xi8MW3ftksTS+jN/w+dmQ
         p4zCKKYgFsHgY4dMcQniTIo8yC2t8n50eqCd1UAjaDBDK2AyA1zIQtz4moYncnPxIQls
         UgeI7dxGKn7f15vvXcbdeBDOYMPCXDgoK9RYiyM+6h0zr/AUydvwPexv9/uKwn+Jm7Ey
         mN1h42WkltC8qo6I1hw+IiY+fHeSGQzU9cnmAmq44FZQp9XzlsPiroiH8Wgx3+CyTVZp
         QlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8TObpBWlWXU4bXhsu3lAM5Tw4G+mqj5/mAQhWh50o7k=;
        b=vFQ6HJWRx/RtELzXgy5X4zCrgGboOXhWdCKeTSx1Mo1A+hwJz9NaVVln6otrxIhHGz
         IhoZl1HADz58gDVh6sFAxb/1JdWYX89mwA9Hao5zPvmrjkgEDh/67lsSeMZq4WCd9ydZ
         rtnznsH4TYiHkYT9D007c7KHix53uQWu2+9hGWp1PLIarJECjTiGzdsmudTbF3plAUQo
         ZI7y7QBFg+e3HfsNGVNw9FWc7ws2h+EyRDTFyh0k84n+53UuIFJ2HWCN9bgpsHZYrWtP
         aeYGHN+rLnCN6Kp6UVnkHXx2EqKUGMuXURIzsCHQL05GW91tK+VcYNSKOHgzqpBmv8m/
         Y1ug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=jBDwWfvb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id x206si388758lfa.8.2020.11.23.12.47.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:15 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CfzjZ3js4zyTf;
	Mon, 23 Nov 2020 21:47:14 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Jsqqn-GVeA4z; Mon, 23 Nov 2020 21:47:14 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CfzjY6bzKzyTj;
	Mon, 23 Nov 2020 21:47:13 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 05/14] configs: arm64: add example configuration for colored ZCU102 inmate
Date: Mon, 23 Nov 2020 21:46:04 +0100
Message-Id: <20201123204613.252563-6-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=jBDwWfvb;       spf=pass
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
 configs/arm64/zynqmp-zcu102-inmate-demo-col.c | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c

diff --git a/configs/arm64/zynqmp-zcu102-inmate-demo-col.c b/configs/arm64/zynqmp-zcu102-inmate-demo-col.c
new file mode 100644
index 00000000..4d3074f5
--- /dev/null
+++ b/configs/arm64/zynqmp-zcu102-inmate-demo-col.c
@@ -0,0 +1,75 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on Xilinx ZynqMP ZCU102 eval board:
+ * 1 CPU, 64K RAM, 1 serial port
+ *
+ * Copyright (c) Siemens AG, 2016
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
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0xff010000,
+			.type = JAILHOUSE_CON_TYPE_XUARTPS,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* UART */ {
+			.phys_start = 0xff010000,
+			.virt_start = 0xff010000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+
+		/* RAM */
+		{
+			.phys_start = 0x801100000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
+				JAILHOUSE_MEM_COLORED,
+			/* Assigning 1/4 of the colors */
+			.colors=0x000f,
+		},
+
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+};
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-6-andrea.bastoni%40tum.de.
