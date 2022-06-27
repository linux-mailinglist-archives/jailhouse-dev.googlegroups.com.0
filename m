Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBO242KQMGQEZRK6R5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0E355B9C3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:42 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id y35-20020a0565123f2300b0047f70612402sf4697913lfa.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335621; cv=pass;
        d=google.com; s=arc-20160816;
        b=GnN8sRg31VDoHGbtR5MOa9X0dlQjcYDE+tnHikmhfa5vSrhM4YoAt+qtQ1Kh9/1ivy
         QDFP8UrTYyYKOH8Z+/EFjlXazoOOxixQ1V3C3zjZjH3WWoi17DfTzp7oL+U4m4nYj8NG
         84Y2qYS8juX0AbCUtilEsJTEhnvIxj5CWCn9Ip3QfGCcOM0xcjN/bTvzNEWemL2lyXlJ
         DwZ20fwZk568QVBF7X+F8hKUpyojD2M6aZy04iUtLPuR6hYOlEebnS9vxe6Of9aSa24R
         uuMc141lCp7T+alwzYOde69aSqJWFJfGtHisgVFn72sTtCCnjnFD2vKyNCl3QrGCFhrX
         Jb6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=w+oj9EjzHLsvqUB0UvMspcJzCNDtkG0TMo9E9VZdMeQ=;
        b=mOgoQb4Inf5YmXWk0iGx/LjyNYtJTPKnEWAVl3ABKEkk15tw1D/U2vEfdEpuhn63qp
         v7XvcZI5i+Z6DqKatjRocwE/dNXHxxHXj7MeyQL3LEtRtbjgDWx3zBA8k98xMtpsEPYm
         wLg6vr1bu22/ZcRa0APfmeS6UUeXzk7pFqioDU98I1cahRuIZ1uplyvIpa6P8HjslR+f
         DqkOurod4LbLi8Qmf8YPph3jMwLpU/obhQ6eg8tLEapkbLoRmLaFoKcCbao+MW+RQifi
         McynfvGItzOuaExtt73Nj3g5QjYzAoxWbu2whI4HbsoZuF3lgSfiW6u98xGMjj0eqPaM
         PJzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=HTUVTTZF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w+oj9EjzHLsvqUB0UvMspcJzCNDtkG0TMo9E9VZdMeQ=;
        b=I14nsXXBV4HXPmuIFmwGY2sSPB35qHgLiOdE2pYqbfE5NINBKW7Px+h1m4U595nlZ/
         mUIk9Rr7dsSKJNYK8U69XiPg9cxd7mYbfPukymve99+f+Fiz0TmWXqNs0UlnmcbeI7GA
         FOTM8exai+UFriNk9+Jf8oLLJwFlmQI2hNKRcCusJywfJd4GcXnZG83nzYPb+QKsqOnv
         vBi4k04ffeVhZs2Pz1egVOF6uE9fLpY4piLQ9NK4uPqJWGADg+TKjtJzvtsIJKwGdqnn
         nmbNcWu3YSP28xCEvw9ikpr3LS6XhegY3uI6jzXoNkKX8sR4WygRCTfaazU1rIU51eDb
         rgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w+oj9EjzHLsvqUB0UvMspcJzCNDtkG0TMo9E9VZdMeQ=;
        b=QzI7IxGb0UCNb4ngwtNJQTv5hj/VCQj/GfmSDt8hn6tFgR/Cgq7gPX+8JddeeyhL68
         DP0FEN3XEs44z/YIw1G2oHl4JF497RMbbb0tI6gw/A/DvCy85Doqyh7IwfIlLOzBk61F
         FbI7OnqX1Had3oeYCn9u/vPzjbw//PfzEqvbhO8BIx98yLjDBw3yoGVWGl5nCsJwO93N
         zMxB9vO+VMw4O4p5WwETdQbsGopLs9JsZ0/K8cYnjsPO+c+fuNaQWAhrDZbiRFGoBFwO
         xHRpY5RqXSWwRGeOa9X7VaGS/wSTTvKyAS5AO7qsMNcaGlsWG7A3VyC91eHRRszRruPN
         NI5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8KZmci/vZonIZNpLwZ9jLyO6EQqOKm5WZkwIBQ9JDVBM8kcQRF
	DRdWFcbjc7jREzZ23Kor4Yw=
X-Google-Smtp-Source: AGRyM1srJred8ZlmEjNiT/h+3/KfJC/B9sAmQM7+6gX9GCZAIHukiMedSSYtkMjP0UWX1fYdmQ84Aw==
X-Received: by 2002:a05:6512:3b2:b0:47f:9ffb:e7a0 with SMTP id v18-20020a05651203b200b0047f9ffbe7a0mr8088597lfp.208.1656335621550;
        Mon, 27 Jun 2022 06:13:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e81:0:b0:25a:a178:9815 with SMTP id f1-20020a2e9e81000000b0025aa1789815ls1124110ljk.6.gmail;
 Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
X-Received: by 2002:a2e:7d16:0:b0:25a:99c2:b2b6 with SMTP id y22-20020a2e7d16000000b0025a99c2b2b6mr6598950ljc.220.1656335619193;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335619; cv=none;
        d=google.com; s=arc-20160816;
        b=w0dQMqt+7i5JM4PLW7VF+I+D4lmZ0XP8BGKldyW16RsJmZc3gzUJ5LLJMKRxFOJml8
         3ISo90Oo3p8QrDDmNXJfSIIHz3Cq+N58ExRJLOlgRcdbepL/oewLU+vkeF61oUAqkUux
         CEJR4nJGJYp3W1uAxrF7H1P+JXlwSNTGW7R6pXvTDMYQ8sbfy/9c0CSq4u7R3JXSdpzw
         TVSrOVoThT8ZN38b0hda+Hta27gRW2/Xg2bq2NqWD6B+YXyKho6xYDdiAIow6CjeUPvA
         vBvFoQL61BxWShI/lM3Cc9db/7jnmOtTR7eG9JY96xLKj1G59U5v2ubdkk4dxsFfJC4I
         xUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G53y+G6jlIhqJt2gV1NJJk8Rm6bxxxsNgCAPAyLNIrs=;
        b=hikh9EjDV6Mx55bt3FNh3dQ3pOOX/+LkaQAfXQe1uKiNs4cY91VCB+O+4uVLnLcQnu
         QHyOmpp/AMQ/fBfhiXCQsR6asX0mvJJN6aRuNB5yzNCszLSHOnjBroTPKB6ynDKRuw8G
         JJXEXR07noheMfeqFPUH0AOmdsoipFZllmGqsVwsG8uTZDxWpI6fQ9dl1GUGNRJtMHuL
         ulG1Im7Z8JzjLXowQEMJD/QQrHAfTDaERLbSYqJSuBM4cWZ1B4UWsQlBgp3KNFT64snD
         OIzTqhCgBsAKfTxRLPmehtl+CVPzTHAhXpQAry2fFn24c58PXTcQ1+k2POrAlGdjXzd8
         dwhQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=HTUVTTZF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id p16-20020a2eb7d0000000b0025a71229262si380777ljo.3.2022.06.27.06.13.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp824GsTzy6H;
	Mon, 27 Jun 2022 15:13:38 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:38 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 16/20] configs: x86: Convert to new CPU configuration format
Date: Mon, 27 Jun 2022 15:13:25 +0200
Message-ID: <20220627131329.3659-17-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=HTUVTTZF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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
index d014f267..5d6666a2 100644
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
@@ -28,7 +28,7 @@ struct {
 		.name = "apic-demo",
 		.flags = JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = 0,
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 8ae31220..99db56b8 100644
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
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index b529e6a6..d44897fa 100644
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
@@ -63,7 +63,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "F2A88XM-HD3",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -73,7 +73,18 @@ struct {
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
index 05f7279a..ce1b9179 100644
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
@@ -51,7 +51,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "IMB-A180",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -61,7 +61,18 @@ struct {
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
index 863b3ea7..a964823f 100644
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
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -44,7 +44,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index ce05b6b5..0c0a2377 100644
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
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 47cb6517..4b22a257 100644
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
@@ -40,7 +40,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -50,7 +50,12 @@ struct {
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
index a4115744..8bfb00e6 100644
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
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 9ca5c528..387a1514 100644
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
 	struct jailhouse_pio pio_regions[12];
@@ -60,7 +60,7 @@ struct {
 		.root_cell = {
 			.name = "QEMU-VM",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -70,7 +70,18 @@ struct {
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
index 35bf9504..b2c80951 100644
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
@@ -28,7 +28,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -42,7 +42,15 @@ struct {
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
index 464c7acb..cad21951 100644
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
@@ -30,7 +30,7 @@ struct {
 			JAILHOUSE_CELL_TEST_DEVICE |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = 0,
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 2,
+		},
 	},
 
 	.mem_regions = {
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-17-ralf.ramsauer%40oth-regensburg.de.
