Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHXGXKAAMGQERSXREFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ED030248D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:35 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id f30sf5455167ljo.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576095; cv=pass;
        d=google.com; s=arc-20160816;
        b=mxDcneD1NK43kAqVbL3bXRgAn9fzZec098QsqrqwR+jndLUDBrtGh69rUT6EaT9syD
         KZpiUq1ks644zmjO1qsCMkOW1yoYvTlimDZxa6pCJ1hx/Y7VedcrpxrDIFcIEmn2ZrOK
         vZQz73jHr2Yz0lo2azOy/5R23NgfkZjQzkNC7h6SP4aTTm7KkK779Y2wI0fT6pDUZEXw
         j8YkwLBVAbzwDwkPLjKw75zRioQg6Ew03WoNr+wru7Cn0zV3Iae+d0xMUqCQu63+ZPDh
         QWmKzO1Khe20x/9i1Uf65JpJmtvkeyMNWplGZjlfIvxvJtLXNq2WFAROaXZxT8erA7LR
         C1MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+/BdJA8olBnOV2pJQDWVP7cayhg0WP7BQ5kYWguUw4I=;
        b=mWLNhQnDpM3iUtF/W3QI263fVNni+N5kZap0E1O1inDnOQO5CyR0osE6csv63IrVy9
         gQZrmbuhV0fbzqy9WkA7b/sJqkHx0tc4HQatf/QKCZi+F97tHnIFuGfisQ1i8JqLHJP0
         +WX90bDaIEZv6CD4DQ+Ypyt0PXc5HjZcAHmpFmwUsazms+oESct7m4kqm5bPBdqS/41J
         T9NpYvfOoqdCYbeOts29rRK9lpM18WiTG08mK3GSiA0eTo8yBgTM+r3kEt9t6XkQc18w
         Au0/d56a3zErRBYk5dIuNIbu8DhAxBNy5Tt+L197nYLU/B/0nVEI0aVu73sksDXImXMX
         JMBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ordW6+mx;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+/BdJA8olBnOV2pJQDWVP7cayhg0WP7BQ5kYWguUw4I=;
        b=O89Z/Cwnfp6MY4AbZj9gSrl+ZPOpMlZ53yps5rHFX43Jb18RuIgGee3kEtARKUl/xP
         Pc0Oz6D62dfuRYS2hw0yZo9yie1cL01dzGquDqKmpkQtTpeAHPTQBjCakfV2kCbUMRBW
         LJkzTstmtxKKqiH5POYUrNqN3wDjPnFG4SXHEsygMG6aRe6F86bRah4M1KYx1Ulyg3CG
         9hkdzj95CW0hHwjgdaERxb7Eh1gR85wfNEFyhkb8dZcoM/H0JMp+UxFQQ73+rSD4Ue4Z
         UDAKBttQVEQ3jQTeYlS8YJjs5lcL6/7JrSgRw4Dq/IxH0jqpz5WKRanox94v9EtN+LEW
         s74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+/BdJA8olBnOV2pJQDWVP7cayhg0WP7BQ5kYWguUw4I=;
        b=troB5e6xIAy3RlxN2Rq+G2Fa+cpvMEFwfyrPHwzJcmOljvI57RmFguUwE14ee8c3bA
         E4HPsarMmPZzeUXzHqvealKHpd6rHz72CcRsiltShPhW9PznFoDE1iabroQCqoI4Vzfx
         BU/01MSblUolJXr22Zt02Uwc9hGp11OQfHZtsZT6j7+1LLb8XJg6r9pMyKWjV9sUg76Z
         y93zVAgSb9HVEAhv3p6XxA1HPq3CNhL94yqyCbNagZDHld65RTgpddhWMqfWg3eRQU1l
         aogPuXM6Mq8uZgdmvJtUX3YEZWHOZBPpxoIVkfITuqI8VnpiyuLv2dALLDHuxt0e32EE
         +EkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Wo80RWbGG/KDLFAnF+lz8SKYWPfO55zHMuvBPU3DIV5NtB5Cu
	xRTkYNQMcLVkfBZ5ZL3EGGw=
X-Google-Smtp-Source: ABdhPJy0Cgmhif8w9clJEhlWBZK6pix8qsqxQsEAvcBaKXZb8sR5YGjAAna8uMaCbAnQuajcAptygQ==
X-Received: by 2002:a05:6512:3194:: with SMTP id i20mr108463lfe.283.1611576094846;
        Mon, 25 Jan 2021 04:01:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls4215143lfu.3.gmail; Mon,
 25 Jan 2021 04:01:33 -0800 (PST)
X-Received: by 2002:ac2:44da:: with SMTP id d26mr119607lfm.306.1611576093868;
        Mon, 25 Jan 2021 04:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576093; cv=none;
        d=google.com; s=arc-20160816;
        b=c6D4A5alsica/yQ291fadFulxbGU1lcwN0KIZTWZzpwY2P6PSaL/w2JG+E0FkT2Ew9
         e8CuNWsAZb/1gNWxmSRbeKcPwXu8pck1AQclgSPiRl8kzJLSLDAPDXZd5Ou/LeUL7hUw
         r7QCajVTOO2yaJQMcnQ77JbRTdFWxdOivEHGRu1UQXHg9und94m7NUH/4LTgfvsE7m3g
         kSk0Tzg190BLkewR44bSVChOhWNW8OWftcM1TwzhngOwt0ziCFvP6yHniGGBBLZ4wJQF
         8EOEzcwh+mxAFKyqwgLnbh3sYdCu8HhoW4yKAiUWMwJVLjduYYtKzMz0AMD+quPyONO3
         FZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8TObpBWlWXU4bXhsu3lAM5Tw4G+mqj5/mAQhWh50o7k=;
        b=V8mH6xiRjZpKN1pQ7eHXxy2jJe2IRpIf0azepDWc0r9rnjO1gAHpRZnsqtxYSbsLfK
         zv4Jb8pL3LqRaSyatHkQzQmVFqSqo/7M6FEMZljS+cd1soIIBqIAgdFv4KE/D/DiEqpc
         zQQsNRgSZaTvJzGsMm9ac8gsWQdSF4eUXcLNxopZryl3+PIWGoQwrpu5nlkGGjS5Mdbj
         24wCrSonNrXF3fLKo3UcdULaT25ciS3pepmPn81A2BoOVFsp+6/c7Sz0NttHGOY7p1+j
         Wcspv98ldVUfCPQJX5zYMTW4JrZovTj39sCYtUq9CLzpBISD/0DWD97Glh0laYUDPZvH
         77Ig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ordW6+mx;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id l22si376638ljh.4.2021.01.25.04.01.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:33 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3x21Gkzydb;
	Mon, 25 Jan 2021 13:01:33 +0100 (CET)
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
	with LMTP id cfgpjOVvqgAu; Mon, 25 Jan 2021 13:01:33 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3w4crrzyd8;
	Mon, 25 Jan 2021 13:01:32 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 05/23] configs: arm64: add example configuration for colored ZCU102 inmate
Date: Mon, 25 Jan 2021 13:00:26 +0100
Message-Id: <20210125120044.56794-6-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ordW6+mx;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-6-andrea.bastoni%40tum.de.
