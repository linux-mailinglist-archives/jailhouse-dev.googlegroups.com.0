Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJ7H4OBAMGQEZXSCF4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id B065B345025
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:39 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id i14sf41043wmq.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442279; cv=pass;
        d=google.com; s=arc-20160816;
        b=GQTeskXql70318j7xDIWAXp/Pb2swWFM4694SfJ8//UX0Ej3ZJBideEO3XdMDoKeeC
         eVVYIUawc6AtqMaafrG0V3PiuAiJl2CSUhrtptqh5RW9QgN+fVclo9klvRpD/7uo0o0m
         tMG8g4XljSXCitx9JgciqjSJrTnSxWyxOtDg77nTCNi1FUrlbgqKi+/HOtrig9yWCwGy
         MqVGftUGgdyNrUi42Sju/+TkT29DIFR4vOvO/LT/L9R63xfsr3CCf0vxeH8v80kqcbOj
         tMhBhVU4IEvCKYdusxIh4bRp4RrTCCyELAdIgzpjsL19m0M+fnOU/f0GzlpPOY+KwB79
         0cdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yRLNs5DiIERjdCKnx2npgSIezQHgPHM1vPphNKkDq8g=;
        b=sf4vl9HHux3Zzo3Wm4HFMsABUrFygdSQm82ZNdvTXTRGuUiTv1/LE/OcQSqOyTscPQ
         Ijvnjf3gLNcfM9tEosjhMIN6B7Cp/E5MeJsiCFMTny6eOvAndly2ajxa7K8tDQdipVWY
         xzcpRm7gykOhPHgzMNW7a2NJ2EN5acBNRAss/PTPwV4ZUCEwpPZ90SgM0uSxYm66AwSC
         c2kD7aLHKbVhoR59cKLvtGhv+7FZ74Ld1JPrbrSLV7bsll0xNU8+dTbVSLDLI54YmHiH
         YSF8BqmoExi1CAAdk8st+V5civCr+VD1SlE2WT0Y2t/CSxrMv1khqRD9lpxuQYJbcvtV
         caDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=dtL+j0yO;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yRLNs5DiIERjdCKnx2npgSIezQHgPHM1vPphNKkDq8g=;
        b=IwsLXiFU3xLUX8KSILPz7oOo1GPRiJBf75Dd8MjsFCnEaBgXKy3gfkTM4TkKhpxoOm
         VeQ0+Esj81Flp1XPxtarG/5a5tnXQjc6RcePor2bBrkVr3VGNk+LDdzvODj4fjFKbItW
         CZ05YH9o8Tw8l9zmgROU4NZSKA13jbbIpd/KxWsB4HWKupOuYhBZj3Q0A10HTLHY7HyL
         j/DPEXwSo2LHFaIScbg0xIqynSlYPymmvw6dvqOWoB5P4oBmOYg5M50f5ZxRUOrPfnAa
         Y/V+55Y7WAtWAWHFBqGE3QJEr12P5x2EAlyJT60Nn2/WgYxREzjJU0CgOYcMNnrqVTZV
         4T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yRLNs5DiIERjdCKnx2npgSIezQHgPHM1vPphNKkDq8g=;
        b=UuecRXBAEZFXiptRoct7TnucpfoGEwFSeKsbjKVU9QMInqYZmXt0KJM9Rni/IflT+s
         cmS9uLutA9wq11PNJPxDYeMajc1XWZfRMAfL/OeRxVmDAf5zW4u7pBaR3fMT+80DV8a2
         IcyaidlQd83Hd0mdK9Q/wTJlIxyNEJ53WQQV8Jp299eiIEsj3uXPFcogKvbmQZ49Mmu+
         KX4c9HEqUFdIn9d0kiOEGjpbeIwWx1ze9Lbz+5ghfpJTlFkcDBcccglJqgwtaROTf/M8
         LPb9qCD+O8BfuJVRElGHSSvvNvp7d1q9SrChqyETxuXDCUtPeuXFlfj99hEuFeXlD1ya
         UoUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530F9eFLSa1T7uIXYnxJweZkzhS4plPr40xVIs6g2NKVW57UCmsC
	1NdbsHDyGuewo9WimReROY8=
X-Google-Smtp-Source: ABdhPJwRVQw3wkg14vP/XO9az/00CinjEiJwIXItJHnrjqx65BTMA8Jl1ksCrPGkCmNvZ4y3miNnRQ==
X-Received: by 2002:a5d:6a11:: with SMTP id m17mr167847wru.361.1616442279466;
        Mon, 22 Mar 2021 12:44:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:58f0:: with SMTP id f16ls893312wrd.0.gmail; Mon, 22 Mar
 2021 12:44:38 -0700 (PDT)
X-Received: by 2002:adf:828e:: with SMTP id 14mr188272wrc.123.1616442278654;
        Mon, 22 Mar 2021 12:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442278; cv=none;
        d=google.com; s=arc-20160816;
        b=tAYdmwfKEm0WHSwslDURz0gXSSuIENRex5Vk4zvqZ6DAq9JWxqv9xYmghDmPhbcL+Q
         Zn+hC4zUBT+Zj2oks9u9ajtWfVOV21VzdNREpUhA/U0g+RaliEy97meXYNstShea8dpg
         Ku4c/raoXOmORe7DCM0MgSsnRFInkgCLVPltc/1xkT8iJkAhtNoWGY/MBNVb2lCQz4ZD
         ipSdXX16M57ctA7DkFuzUjjLmmj2fU7pMIKaBDe+rZOCaVgJ8iFTJFcp2UQJGleoNdiV
         3vq4pQt2M9Dk7WXK5KQm4XmnBW+dYvX1aJmoKhXAU+NzAxc0ZZCHIdM7i+0FaDx8tCJW
         EwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hYuQtPZh3/BMMZD1h+WEsTaxmjJ1f0EWyeXDFyjEmGY=;
        b=a7AsjciSe+GuB7c/b9luQG7B8BokIrJtPDMqeQrk12Pu3rUUevviH4/H649jm3XEqD
         oYj+un7iySi4auMQ0arJY8Ds8eujvuXbA/at3pjQKM0PMBz+d7VYYeXd56SIutEKPgwh
         /EoXFdno4d+oINkbkgSdfaLje7KG4UntOmz3zhYquAsnWpMe7svUaxTzXtlX5fD4IvT5
         ohpQMjUD/L3qyJUCsflUNIQG7fFgnDNlmpf03kTPbApPfrm6lKZ5VOiJRDl1qY4xWYJf
         hv2P2bb1KYr3lbmHydl5H6rdll2Rdqn4zI4OkrE4ZDi+/27KCm23K+9Wag3IQqmEKRU8
         kyvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=dtL+j0yO;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id h16si534023wrx.2.2021.03.22.12.44.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hQ3FDpzyXm;
	Mon, 22 Mar 2021 20:44:38 +0100 (CET)
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
	with LMTP id pS-u45xdY4vD; Mon, 22 Mar 2021 20:44:38 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hP5sfTzyXl;
	Mon, 22 Mar 2021 20:44:37 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 7/9] configs: arm64: add example configuration for colored ZCU102 inmate
Date: Mon, 22 Mar 2021 20:44:08 +0100
Message-Id: <20210322194411.82520-8-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=dtL+j0yO;       spf=pass
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
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-8-andrea.bastoni%40tum.de.
