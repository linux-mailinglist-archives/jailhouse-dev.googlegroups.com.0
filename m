Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBXHH4OBAMGQE4NAFMPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7A345031
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:33 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id si4sf20465218ejb.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442333; cv=pass;
        d=google.com; s=arc-20160816;
        b=cj5b2V36jvg2c8TwQgWcd4M8xKc/R+GeJ1S86xsqsMgAAy5j/C7Lm/TviAHK6VfS+U
         irgUmCGr/i/j+mzitknDHOWWDTsucP6zDO2vh0DWT4LbPqEqf/toYpFypZUUJ/CIZHJm
         Nzy+C0dor+xsyPkA1HBPQYGXZSp66Ow2KT+pkMNGccB8lXYbI0RFCDa9zbhgLU3eYpBa
         y4T9hKfmAJPx+GPnEGojtxC+xyHTgnYeStDde+o6nG+0aoM6Cf5AYyjtV7Ss3zvAAyHQ
         9lYhoFWeNyxOIBVv2lHnn/6BoyXeIcbdgGTGgFAjTU/IIu7IYdDnazaOGxmd6mzRbLBD
         S+6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=M15aQKCGSJmYlk1d0HaUNXmvC7RNrz8+MKH6ZzPASfw=;
        b=CFJU/jqNFxBLGTB1bVw22VaGyHMOEKdYcKqXsR5g4kFxHuSLOl+AxTQ21/XQ3k3Od9
         8qdtWcR2HmjMpaW7VIavQ3LX/gFw1B7nx3ArUaWVjpQ6XFBC2RrId5PD/vmm2sqAo8vf
         PaCAoSNWEXBO5fxAY5eJRMr7ZAV7N0xv0z3qisxbWPeNXv1WbQBm+4Q11ZXlrF2aa/5P
         4wAZQ6EWO1J/sJb2gT1xwtFKYqxlWvF9iu5SncpxlyDo9vqrFY7EwF7kFwyfMSgBm/rq
         HZbEFeEpVSVQfBr+/zLL8JPtTd8in4L3GIbyN2VETC2PK3mLuh1ECt9RDHf6fMZdn8ex
         91Cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=qIUS41a2;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M15aQKCGSJmYlk1d0HaUNXmvC7RNrz8+MKH6ZzPASfw=;
        b=H0jjDh9NYGqg6B/VXQ5exLiX8dmxbJiekv21t6rp1zAR0btfnmlb6xR1ivJ984RycO
         FZT0RHPmCEeoXw+Np9O2XvvuWs9WpY3w4fGYXrg/8ciDdqe9FUvKWakAGYZdNXgDfJPN
         +eEGqyhXFI05xPzEiXKo4AQO+nuviyPRB3kryEloXUFMyvSTasWBUTzuIqIEU8Y3tCI5
         zGUWmWnn8EmJX5k4GWAvMDltFxn+6/nWg1FkVv4Wag8MljjZ1vPeLiKvrT/WAoYu48bE
         90hsL3In8BNqI2WUBeC38PDTITWBA1V3NWRHnarM8GEeCfKGiN44gAOlVfWDPMyEiyKK
         69rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M15aQKCGSJmYlk1d0HaUNXmvC7RNrz8+MKH6ZzPASfw=;
        b=cJjggDTzrkP2nfCu86qF6zqK5k5woVxrJCCuozyWcCLrePgHOblFi8cnm8sI9+CHq2
         Lpk8vYULjum4LzeDmc6MXHGBz2OX0f018UgY42THKc6+UoMxk1yIjJGujAMweQA+v5h5
         8tGXdt6HqTxKEXSMP2BSplsV4LARP0Y55Lsfr4hbPgfGKViafSwze/R031cIWW9XmtUS
         WorKmBB+aSkfeB8eC58pYroOVUzH06XGT67sgUIOVWv4atAMrYLG71++G+rfgdY7HYCe
         tqBfasjIZYZSoRFURSPcjnyPi4f3oxmzI8a87KyyAj7ThsYU4FDvbcaNS1inYXlAAEWA
         YH0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533asXz9kkBzhMCRe8k8f1KDoX+7GU/qK8OBQ+3736fZQfP/LS3d
	AbYhA2wuv3yzTWNpxk01AHc=
X-Google-Smtp-Source: ABdhPJxwd8Mu0ach1n7mGN8MIChcCnDyVyHI4E/IyWQ9SH1Yky6hhikNhlizDxEp4jVkDwv7/WnA7w==
X-Received: by 2002:a17:906:3385:: with SMTP id v5mr1342777eja.539.1616442332957;
        Mon, 22 Mar 2021 12:45:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d788:: with SMTP id s8ls2904041edq.1.gmail; Mon, 22 Mar
 2021 12:45:32 -0700 (PDT)
X-Received: by 2002:a5d:4582:: with SMTP id p2mr232325wrq.34.1616442332096;
        Mon, 22 Mar 2021 12:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442332; cv=none;
        d=google.com; s=arc-20160816;
        b=QBlUH8q3d/rc5RBxaHiJ+ZIBiHZEi4qZ/ZA2FPpel++OBReTmncu3JWTbbxzChZsOh
         22KNMscAdKaOz8rd9rf9VALZR4MDr78ZoPPlFtEuXlM1WCY8lf4Zz+dBn6xYJXfLwK/I
         KSntbIIHPpGmi7ZJ3ua6o8EoTqV0UYyDKpE1Df5GynlKcNrNgDoFXqxgOBWn4aggve1H
         kRCgEd4h92vjFYibrnT47//968VlhlVqfW4woI2n0ljH4mdsl5unCLkUe0VWTlQ9YgBq
         T0KjLfpyrGUSWL33O3C0koAh+8QRWtqERHjQOIjI4PHPMHZa3GCCZYQZa7LLBxOghxS3
         E4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hYuQtPZh3/BMMZD1h+WEsTaxmjJ1f0EWyeXDFyjEmGY=;
        b=hBNbtxO09EOYR22SZy1C107RofIiWQLK3H7uC3yK7HnkWBVNUMmFuc3XmKRkCgUqfV
         Cz4LzW9heOZJ/qJzIJ9pYTgpO2WBsYMLd/eDX/diClDQ/bGwDSEZ4hHgVtiLDXpBSSKt
         F4nsNvYC78vbMqWQEwRPOSZXq+YitqjbGYyh8j17YQpbMkTx7HlxzknX9plzQm2JFzvu
         u8GmCTeq1bxcxnCfMV8MRX484C0QxS5oP0Uym+IHeOKMkfVYYYcUMJ7tszu57LgsvsK1
         VXtZ/IuiIHkH24BHrATHo0/EXi+DTh8LyhSrEspyFiN5/X4PjKrE218V06dbKIvRmrkc
         FEKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=qIUS41a2;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id k83si15355wma.0.2021.03.22.12.45.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jR6VLCzyXg;
	Mon, 22 Mar 2021 20:45:31 +0100 (CET)
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
	with LMTP id 248VhwGxtOdn; Mon, 22 Mar 2021 20:45:31 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jR29GHzyVB;
	Mon, 22 Mar 2021 20:45:31 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 7/9] configs: arm64: add example configuration for colored ZCU102 inmate
Date: Mon, 22 Mar 2021 20:45:05 +0100
Message-Id: <20210322194507.82643-8-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=qIUS41a2;       spf=pass
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
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-8-andrea.bastoni%40tum.de.
