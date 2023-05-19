Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUF5T6RQMGQEOQRIRDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317C70A0C1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:49 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 5b1f17b1804b1-3f42867b47dsf21579595e9.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528849; cv=pass;
        d=google.com; s=arc-20160816;
        b=CwOpNygKCSXUzu4OzXEC5A+vrxU0XKZshs7LJoklwEcPROyUioZluz94T0nHP5/NAg
         VKxT+DQIN/To18IlyZWFb/6Xdg0Z//4QFnTYwFQ0EoKxcmYBTRL8GnXCCuTXcnGOHjEW
         3DEyXttishPQxqHSOvrBtE5+5EJMgoz7DvAt0jBBzccg9Wbrg1RKlvSTRlKSpKaG8zhU
         YLdE9wUA5xnXq3cNfHrWk29EJG9tkKQQyt3MPVgI9WU9OAx0SnnXssmsm0nYDP7QFu9I
         mB7VAndTOaiMg4QeBjbKZ7mXR96RtAzKszOVVscY7I4sqA95lECtu5nRqE3cII8enSST
         fMvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yWg3zR2G7xcW1iKjwXjXTxirAnNiA9bcXQTtimeMus0=;
        b=bwm2drCofL5XuaLXMue1Y6TSM8x/vEc7seP+hyCXSBDwQtikBF6DsGVjRrgR9a3xUt
         L0DoaQrZNgk5DVXtlC6BLNNwSjKKFp4u21wYGMPC+KL7L6+xRG8aFO7VhrE+Ohy8604R
         yltSckwIVu2nKKXV3lyBrz4DHs6hLkTHtEjFLnUxMTLpt4BDxcyUNbbp7S7Acr7GcxtF
         O7+jYzV0JfgWU2L0wPe3di9QvpBpPA80WCCSxpv4fPesISSuENxk4zZgiioT5MQogo9c
         vk2JLImSgtlqfCcOkwGX4YRr270pRzkDVdPSVDh3hxSnJ5ARM0yvzQ5h8G6dPdaHrzc+
         1WPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528849; x=1687120849;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWg3zR2G7xcW1iKjwXjXTxirAnNiA9bcXQTtimeMus0=;
        b=s7XAsxDpnNDeRkabpno2V7i8gkO3VwEsKVix7ZOAjeXhHPubstcuUjXmlgLVjXB6ch
         jDooQeH9qDA64PR9cVKbO2gRpL3C3kX45j0letJA3485DemtiDoUR3rSfqpiG9akxXAe
         5JuuTIh668LlMLihMcRJlrxnXkzMxN/dTUvJoXuvINJkvJhvPfBAC/WmQQqaILGFjims
         jHd/Nbvwuh2dLx8xBm0/iRGzcr6y5Bo3YTAeFsc9/wouX8KzJOVtIwdX0/vHkHBh79YM
         J0zj1l/xJP72l+cSBulN5hfO1Xwct11E4F70OCUUXVQiSQuy6bLCXBod7V7Y1m7nP5hf
         kjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528849; x=1687120849;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWg3zR2G7xcW1iKjwXjXTxirAnNiA9bcXQTtimeMus0=;
        b=ORSCQ6bqrfSPd7u//4BcKtxcbNf5rK+MEVoMkvavAWZ0RSVOyLD9A2o6nhqR+b3z00
         BgZDS2HPmRtFGJCLQ87cDWicS8F7xSjiUesgOC7nLAB/gGbbDMxexCqhwBawmsUJPbz/
         5Ptxp1xJWbaH+pdOiXTthGjG1/E+GIe+s6Z55HAPNE3E45erZWd7T8Q2Qcnxwp+VoGnl
         Gpf4cpMm4gydl9sVMcfZEmCdF1ZT0kY0p7lq/lFOstQINVzLgR71xvXlVbJOGlL15SwD
         hnbFq16Vv21H4QiwDBrE9GJlkKbQ1Vm78LB4AVxclk1jqBHqaQCk0Uth3Zz3FYM2PgrG
         3SRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwUftAE0EMvKc/UPRnpT0UdDMon2BGw4LR5g8fNNx2k82U18r6P
	m+/Uohb7RkwiO05IS8spEMY=
X-Google-Smtp-Source: ACHHUZ6Bf98XjTQU4ZukiUprbzMLb98GLZqxz8yN/qPqNSSsECiFFpF4hN55wCR7SA2a0tHOJXoBTQ==
X-Received: by 2002:a1c:c913:0:b0:3f4:ec32:69fa with SMTP id f19-20020a1cc913000000b003f4ec3269famr541253wmb.0.1684528848789;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4e14:b0:3f4:2d86:4789 with SMTP id
 b20-20020a05600c4e1400b003f42d864789ls1430247wmq.1.-pod-prod-04-eu; Fri, 19
 May 2023 13:40:47 -0700 (PDT)
X-Received: by 2002:a05:600c:2286:b0:3f4:220a:bbf8 with SMTP id 6-20020a05600c228600b003f4220abbf8mr2217202wmf.34.1684528847064;
        Fri, 19 May 2023 13:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528847; cv=none;
        d=google.com; s=arc-20160816;
        b=P0U6XW0W10HPcb7aYr+C42ze5MRhsWUSRNyPWNhXm2vLDxsTLJFD2+trFG+XkIOeIz
         dvcCSeFz6vDI0BjPXjFeAjoldxH57Smf629NPgzym9x9ODKka1caoTrHLF+Cy1ZVJOxU
         P8O8TcWeqnyJEuONeUJOuXHIcO81LcMcH6MogLlJxKi4zzmF3IrWPDpUzqpmFQ7g7Twb
         uA4hHg7kRbLunjMvGuPSglrvG9lVt+xA4pf7ipIVqVKEGEIruRi4kabrLiyG2fPcVa0U
         ZD9X8B6WiagpR78mUzhb68XvPzT04pKwURjGPfP/H00doCbcb82gCwGZyxwLzTXNIIA7
         ro4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WBLhuQrrXN6pv4RQvLFuGS0Min7OM9G4vYhuPS7LFoY=;
        b=VkD4BHXt8hjgIQMRkERBJR5bCkrWPjbpjdmKApPmw6xzYDsL/cOymPCh6VEwYZhpGo
         t9tRxgfwQhoLSV+03E3wWdkEHKsAX/SDO/eEu/BLWuYJ93kkce0w5yAkZ54R83q2JqWv
         QnZk4i2QbhoGWA5KTs3vPjLjssPm7AeZ+6ZhjePma5akh/81pPXDMREhO7Z/1s0CLJo4
         kzSQzeh1d7h9WZ/NOi6rxPjN+4Z63Ti4zhgD6gj4LNnUAsvycjblJ/3o6KxzGek0nMGc
         F1TjL/Q7kuu2FSdLfvBapGTzviYlTxzNiZOFNsWd2IHpwicr1D9gXBKq+Bx5xmWfi9kC
         Sl7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p31-20020a05600c1d9f00b003f16ecd5e6esi612874wms.4.2023.05.19.13.40.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdV3Y2bzxpn;
	Fri, 19 May 2023 22:40:46 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 16/73] configs: x86: Convert to new CPU configuration format
Date: Fri, 19 May 2023 22:39:36 +0200
Message-Id: <20230519204033.643200-17-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/apic-demo.c      | 10 ++++++----
 configs/x86/e1000-demo.c     | 10 ++++++----
 configs/x86/f2a88xm-hd3.c    | 19 +++++++++++++++----
 configs/x86/imb-a180.c       | 19 +++++++++++++++----
 configs/x86/ioapic-demo.c    | 10 ++++++----
 configs/x86/ivshmem-demo.c   | 10 ++++++----
 configs/x86/linux-x86-demo.c | 13 +++++++++----
 configs/x86/pci-demo.c       | 10 ++++++----
 configs/x86/qemu-x86.c       | 19 +++++++++++++++----
 configs/x86/smp-demo.c       | 16 ++++++++++++----
 configs/x86/tiny-demo.c      | 10 ++++++----
 11 files changed, 102 insertions(+), 44 deletions(-)

diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
index c62befee..9609d6f1 100644
--- a/configs/x86/apic-demo.c
+++ b/configs/x86/apic-demo.c
@@ -3,7 +3,7 @@
  *
  * Minimal configuration for demo inmates, 1 CPU, 1 MB RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[2];
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_pio pio_regions[3];
@@ -29,7 +29,7 @@ struct {
 		.name = "apic-demo",
 		.flags = JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = 0,
@@ -44,7 +44,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 58868c0c..05b59663 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -4,7 +4,7 @@
  * Minimal configuration for PCI demo inmate:
  * 1 CPU, 1 MB RAM, 1 serial port, 1 Intel HDA PCI device
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 	struct jailhouse_pio pio_regions[4];
 	struct jailhouse_pci_device pci_devices[1];
@@ -32,7 +32,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index 85f201d2..1517b152 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -4,7 +4,7 @@
  * Configuration for Gigabyte Technology Co., Ltd. GA-F2A88XM-HD3 Rev. 3.0
  * board with AMD A10-7800 APU and 1G RAM.
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[35];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pio pio_regions[8];
@@ -64,7 +64,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "F2A88XM-HD3",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -74,7 +74,18 @@ struct {
 	},
 
 	.cpus = {
-		0x000000000000000f,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
index 02cc0fbe..eac0b91b 100644
--- a/configs/x86/imb-a180.c
+++ b/configs/x86/imb-a180.c
@@ -4,7 +4,7 @@
  * Configuration for ASRock IMB-A180 G-Series (4G RAM) board
  * created with 'jailhouse config create imb-a180.c'
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
@@ -21,7 +21,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[42];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[8];
@@ -52,7 +52,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "IMB-A180",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -62,7 +62,18 @@ struct {
 	},
 
 	.cpus = {
-		0x000000000000000f,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
index a224036b..3edf3af5 100644
--- a/configs/x86/ioapic-demo.c
+++ b/configs/x86/ioapic-demo.c
@@ -4,7 +4,7 @@
  * Minimal configuration for IOAPIC demo inmate:
  * 1 CPU, 1 MB RAM, serial ports, 1 ACPI IRQ pin
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[2];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[5];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index 8738c70a..3ca32b66 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -4,7 +4,7 @@
  * Minimal configuration for ivshmem inmate demo:
  * 1 CPU, 1MB RAM, serial ports, 4K shmem
  *
- * Copyright (c) Siemens AG, 2013, 2014
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Henning Schild <henning.schild@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_pio pio_regions[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -32,7 +32,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index b24a1d16..31a713ed 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Linux inmate, 1 CPU, 74 MB RAM, ~1MB shmem, serial ports
  *
- * Copyright (c) Siemens AG, 2013-2015
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
 	struct jailhouse_memory mem_regions[24];
 #else
@@ -41,7 +41,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -51,7 +51,12 @@ struct {
 	},
 
 	.cpus = {
-		0b1100,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index 137fd2e9..775fe9a1 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -4,7 +4,7 @@
  * Minimal configuration for PCI demo inmate:
  * 1 CPU, 1 MB RAM, serial ports, 1 Intel HDA PCI device
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 	struct jailhouse_pio pio_regions[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -32,7 +32,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index cdd3dd6d..369e0b8b 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -4,7 +4,7 @@
  * Test configuration for QEMU Q35 VM, 1 GB RAM, 4 cores,
  * 6 MB hypervisor, 74 MB inmates, 1MB shared mem devices
  *
- * Copyright (c) Siemens AG, 2013-2016
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -21,7 +21,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[31];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[13];
@@ -61,7 +61,7 @@ struct {
 		.root_cell = {
 			.name = "QEMU-VM",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -71,7 +71,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
index 98b32bd7..056cc614 100644
--- a/configs/x86/smp-demo.c
+++ b/configs/x86/smp-demo.c
@@ -3,7 +3,7 @@
  *
  * Minimal configuration for SMP demo inmates, 3 CPUs, 1 MB RAM, serial ports
  *
- * Copyright (c) Siemens AG, 2013-2015
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[3];
 	struct jailhouse_memory mem_regions[2];
 	struct jailhouse_pio pio_regions[3];
 } __attribute__((packed)) config = {
@@ -29,7 +29,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -43,7 +43,15 @@ struct {
 	},
 
 	.cpus = {
-		0xe,
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
index 6d5fbac9..2b50d803 100644
--- a/configs/x86/tiny-demo.c
+++ b/configs/x86/tiny-demo.c
@@ -3,7 +3,7 @@
  *
  * Minimal configuration for demo inmates, 1 CPU, 1 MB RAM, serial ports
  *
- * Copyright (c) Siemens AG, 2013, 2014
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[2];
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_pio pio_regions[3];
@@ -31,7 +31,7 @@ struct {
 			JAILHOUSE_CELL_TEST_DEVICE |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = 0,
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-17-ralf.ramsauer%40oth-regensburg.de.
