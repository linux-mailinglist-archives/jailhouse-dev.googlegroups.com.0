Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUF5T6RQMGQEOQRIRDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DD70A0C3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:50 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 5b1f17b1804b1-3f429072212sf15090605e9.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528849; cv=pass;
        d=google.com; s=arc-20160816;
        b=BGWyz44n4n0evLew4bHNC32CcfXrMko3g4dvpsqHNjg/6HJk2qMAhlN49acasmrx7N
         CsJ4gPWmLwA5tIA0P4kyfH5yAcx/LlT6RWHgsJKroSEn1H7A8s6pd8YIOfM4uhHTAZXG
         wcn0YzvggSF4PCQ+VhxAdW/jpeg+tj3cfwZmuaCx5EOtAmsnfugBxdAyNWUJ31EWleb3
         4ZhueDlDPY9SV238o9NN2bo+JIsxDjQjpg83HFZEbwiq7LdCeDj7R26yCpTY3XRFh3OP
         9fpUYG5qV+ZG/IXKOE80oiecdwUwp0UJnrrmT3bGZaBC8YQctqcncH2HyTakakT0yEBo
         OYxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=lf3IFC63NpPhzDYUHoaJzcImzHK7/qyc/tAVVUciERc=;
        b=kOTCaXtPPaPdpneBkrdijxMdJbV9WuPzqFJRX8YCef6DNCNfrX9nRLGqQVCJQ0kJE0
         fF/LHF3JoHpMOePdZasft90blEerO1XIlybyy1wNvf7UGhntveRibz60PE1QPcY+R2lZ
         O//gvorGkug+kZZH+KALfBNgty2au/0GRK+GBVajiMoUIdSl47jY51qYjO8dDfKmP24C
         +3wKdyLE0F7IQFf70oQvmNrm6cDZLJU09OFsGFSpmGVd6ng0h2zcw6Mulo6hUbGL0e1B
         tnSVTfiUXuWkOUcL82cL8/GNvkcDyCpgfjwhjGFangxLr19VuXyxXUQVUVxgIGJpmmiQ
         72qg==
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
        bh=lf3IFC63NpPhzDYUHoaJzcImzHK7/qyc/tAVVUciERc=;
        b=g4cfjyPTIM/Sfpk+7304vrJmGGp7/Riabo3yIeOOtEjnlcpd6Pk12frUbJhKlt4g8B
         AIUpWocac1dzIAFW9LTgQITeAzNIxYBtEn7Jzjt60pM2E62zwLRs43hl0UgAGINftxXm
         6WARL8OTk97MEaghhVA+kOJIo+uzIadpFZT7q6PHDOWTjOfi+ThNsDrCCLQmyjmwImBI
         todnwglV1W+OjlK+PbFksmSn7Pysmdqj59Vwal7/npTCmMRifQ3V90Nm6HorGq7ed0pR
         qaq3Hz4+XSJCKVrk7D5xlgJ01oN8XDkaaQ+m9KBnK7V6ndKnkRQcK9yhlqo5wey94vxu
         K1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528849; x=1687120849;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf3IFC63NpPhzDYUHoaJzcImzHK7/qyc/tAVVUciERc=;
        b=gUheXI1S3IjghVWQ1kyzu6B11lVVYHqRQkCQ0I23mXYtKneQqn6OLg+//8Q5Q9Y/kS
         c08yGj8AJIlrK37jrtYlZsZTn/tPz+gCl+VeKxB2KT28tH95Ax+aC3s9hkxcEzvXn3Wb
         RFGRens40UAHKd+XJ+zBa/yI9yyU3z6eoJCO5XYFmd/VNXVpu1F7MdpCIdUmXI6Chf0W
         NwwgxuXE1869MiRpwgqtfjAQ8v47+NNmHGq61UDfOZVTAc+CvOKLpQt3VnRbkgVxiNML
         LLxIU1TkeNFNJbjlPBLprBf5UPQE0bqEmlvzkW2x/widNTY3f5iZT2E8ZQyAT/6D+nbL
         PUQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwSQ3MxNQAsUJcBQ7bWfh3i/epori4KCdCHlrtjLazrTXnCTxna
	Xd2fifey692TcB1krjTkP/Y=
X-Google-Smtp-Source: ACHHUZ5YiqqENOSL5UeTMbA/pf0QDTlZ2J0FeBvxOPqrgIHWGeJ23uCAiB5W6lwRlNmd2lSVGhlOsg==
X-Received: by 2002:a1c:4c10:0:b0:3f5:db0f:3120 with SMTP id z16-20020a1c4c10000000b003f5db0f3120mr523913wmf.6.1684528849283;
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c8a:b0:3f5:21c:95cf with SMTP id
 k10-20020a05600c1c8a00b003f5021c95cfls1743701wms.1.-pod-prod-05-eu; Fri, 19
 May 2023 13:40:47 -0700 (PDT)
X-Received: by 2002:a1c:7911:0:b0:3f5:d3c6:7377 with SMTP id l17-20020a1c7911000000b003f5d3c67377mr2053617wme.36.1684528847377;
        Fri, 19 May 2023 13:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528847; cv=none;
        d=google.com; s=arc-20160816;
        b=l8/NVf18D+62kb8duh4Vte8NuZNHKKeJYRn+NxcYEwYgQ28U1DKUU9PTfnZuF00GJI
         l7t+/29MSVfSMCzFa/FLWjd1ZuskAu/z4dK7yBDYNkjEDyXYihVb+H93IF49qpU+gmf9
         6BUyvVHMfeNXKSY1oouhTySRt4Lkf1pdSNUBRG2B9WG4JIpAihLIBnQtZPL1MGR9gYug
         qe5O0C4uAm5BKqUzDUPm/8TuBE7b33oiJh4vSIHEGQdGr71wzUsiuIPWy4jU+aOOFPQ4
         aD+1pW1eI3Vzqfg9gnI++oUSIlE+AaBrkOKHN46PoWqbZLJYco6kJULat5lNl3cNVBz2
         C+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vqCbBl0Xvgj4q0gE3h8ODS/KKhH6vZJB0hRwTmQ8RBY=;
        b=spv+2iWfJc72yVkOgfE6NeHJptuvBeZPG2u07jH4hRbNscdLiQMLnDVDKn2V7N74xF
         tuFZuesK22noGbBun3mc2tNlYEKih++alcW03/1cTUfzuO71DUMtXY/HVDU5pDUkIrlY
         0nCgSvw+tYn2k37P7nYYV5Tdc9+IcW2LlpHyUYDsrr3D/AA0eCMaJwIDnYU6F9/E2r2C
         MdPTUQvAsF4RRcjBernGqYOj3Brg2iJ1rargWfO4eFtJ7WqjwQkhXlyVsdW5bVABrhUi
         89z4A8KE4xXwmdJ3YghE3CJzkSuXxGmbRBKadnscECJsJILMIJS2AmDzkdfCYwOs2u/m
         OiEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id bo2-20020a056000068200b003062fa1b7a0si725wrb.2.2023.05.19.13.40.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdV65d5zxr0;
	Fri, 19 May 2023 22:40:46 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 17/73] configs: arm: Convert to new CPU configuration format
Date: Fri, 19 May 2023 22:39:37 +0200
Message-Id: <20230519204033.643200-18-ralf.ramsauer@oth-regensburg.de>
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
 configs/arm/bananapi-inmate-demo.c      | 10 ++++----
 configs/arm/bananapi-linux-demo.c       | 10 ++++----
 configs/arm/bananapi.c                  | 13 +++++++----
 configs/arm/emtrion-rzg1e-inmate-demo.c |  8 ++++---
 configs/arm/emtrion-rzg1e-linux-demo.c  |  8 ++++---
 configs/arm/emtrion-rzg1e.c             | 11 ++++++---
 configs/arm/emtrion-rzg1h-inmate-demo.c |  8 ++++---
 configs/arm/emtrion-rzg1h-linux-demo.c  |  8 ++++---
 configs/arm/emtrion-rzg1h.c             | 29 ++++++++++++++++++++---
 configs/arm/emtrion-rzg1m-inmate-demo.c |  8 ++++---
 configs/arm/emtrion-rzg1m-linux-demo.c  |  8 ++++---
 configs/arm/emtrion-rzg1m.c             | 11 ++++++---
 configs/arm/jetson-tk1-inmate-demo.c    | 10 ++++----
 configs/arm/jetson-tk1-linux-demo.c     | 13 +++++++----
 configs/arm/jetson-tk1.c                | 19 +++++++++++----
 configs/arm/orangepi0-inmate-demo.c     | 10 ++++----
 configs/arm/orangepi0-linux-demo.c      | 13 +++++++----
 configs/arm/orangepi0.c                 | 19 +++++++++++----
 configs/arm/qemu-arm-inmate-demo.c      | 10 ++++----
 configs/arm/qemu-arm-linux-demo.c       | 13 +++++++----
 configs/arm/qemu-arm.c                  | 31 +++++++++++++++++++++----
 21 files changed, 195 insertions(+), 75 deletions(-)

diff --git a/configs/arm/bananapi-inmate-demo.c b/configs/arm/bananapi-inmate-demo.c
index 9b13634b..17646e97 100644
--- a/configs/arm/bananapi-inmate-demo.c
+++ b/configs/arm/bananapi-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Banana Pi:
  * 1 CPU, 64K RAM, serial ports 4-7, CCU+GPIO
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
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[5];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "bananapi-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index cf3a2db7..acb7a672 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Banana Pi:
  * 1 CPU, 64M RAM, serial port 7
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "bananapi-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -49,7 +49,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 01089b81..c2b27256 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -3,7 +3,7 @@
  *
  * Test configuration for Banana Pi board (A20 dual-core Cortex-A7, 1G RAM)
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[20];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -57,7 +57,7 @@ struct {
 		.root_cell = {
 			.name = "Banana-Pi",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1e-inmate-demo.c b/configs/arm/emtrion-rzg1e-inmate-demo.c
index 3fdd7345..6fcf05b5 100644
--- a/configs/arm/emtrion-rzg1e-inmate-demo.c
+++ b/configs/arm/emtrion-rzg1e-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "emtrion-emconrzg1e-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index 027d37d4..88e76762 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "emtrion-emconrzg1e-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index 4bfe02bd..7ff0cc93 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -58,7 +58,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "emCON-RZ/G1E",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1h-inmate-demo.c b/configs/arm/emtrion-rzg1h-inmate-demo.c
index 92c669a7..9fa83754 100644
--- a/configs/arm/emtrion-rzg1h-inmate-demo.c
+++ b/configs/arm/emtrion-rzg1h-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "emtrion-emconrzg1h-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index 48d47dc1..164e9755 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "emtrion-emconrzg1h-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 385f45b7..bf4afdfb 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[38];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -58,7 +58,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "emCON-RZ/G1H",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
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
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
+		{
+			.phys_id = 6,
+		},
+		{
+			.phys_id = 7,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1m-inmate-demo.c b/configs/arm/emtrion-rzg1m-inmate-demo.c
index 4c425716..48d1d8dd 100644
--- a/configs/arm/emtrion-rzg1m-inmate-demo.c
+++ b/configs/arm/emtrion-rzg1m-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "emtrion-emconrzg1m-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index bf0775cc..f8f5263a 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "emtrion-emconrzg1m-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 3977968b..70c8e4d2 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[26];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -58,7 +58,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "emCON-RZ/G1M",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/jetson-tk1-inmate-demo.c b/configs/arm/jetson-tk1-inmate-demo.c
index 1dab7ef7..4fa1127b 100644
--- a/configs/arm/jetson-tk1-inmate-demo.c
+++ b/configs/arm/jetson-tk1-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Nvidia Jetson TK1:
  * 1 CPU, 64K RAM, serial port 0
  *
- * Copyright (c) Siemens AG, 2015
+ * Copyright (c) Siemens AG, 2015-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -32,7 +32,7 @@ struct {
 		.name = "jetson-tk1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.cpu_reset_address = CONFIG_INMATE_BASE,
@@ -49,7 +49,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index bbbe1306..d0980d17 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Jetson TK1:
  * 2 CPUs, 239M RAM, serial port D
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -50,7 +50,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 6b37e04c..74355b62 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -4,7 +4,7 @@
  * Test configuration for Jetson TK1 board
  * (NVIDIA Tegra K1 quad-core Cortex-A15, 2G RAM)
  *
- * Copyright (c) Siemens AG, 2015
+ * Copyright (c) Siemens AG, 2015-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[25];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -61,7 +61,7 @@ struct {
 		.root_cell = {
 			.name = "Jetson-TK1",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
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
diff --git a/configs/arm/orangepi0-inmate-demo.c b/configs/arm/orangepi0-inmate-demo.c
index c62a4bcc..a88bb576 100644
--- a/configs/arm/orangepi0-inmate-demo.c
+++ b/configs/arm/orangepi0-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Orange Pi Zero:
  * 1 CPU, 64K RAM, serial ports 0-3, GPIO PA
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "orangepi0-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index fe71b9a9..a1939f35 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Orange Pi Zero:
  * 1 CPU, 64M RAM, serial port 0
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index bb95d2bd..0846de56 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -3,7 +3,7 @@
  *
  * Test configuration for Orange Pi Zero (H2+ quad-core Cortex-A7, 256MB RAM)
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -54,7 +54,7 @@ struct {
 		.root_cell = {
 			.name = "Orange-Pi0",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -64,7 +64,18 @@ struct {
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
diff --git a/configs/arm/qemu-arm-inmate-demo.c b/configs/arm/qemu-arm-inmate-demo.c
index c6838190..da9bf6ab 100644
--- a/configs/arm/qemu-arm-inmate-demo.c
+++ b/configs/arm/qemu-arm-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on QEMU arm6virtual target
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2017-2020
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/qemu-arm-linux-demo.c b/configs/arm/qemu-arm-linux-demo.c
index ce12798a..23ff03be 100644
--- a/configs/arm/qemu-arm-linux-demo.c
+++ b/configs/arm/qemu-arm-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on QEMU arm:
  * 2 CPUs, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2020
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,12 @@ struct {
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
diff --git a/configs/arm/qemu-arm.c b/configs/arm/qemu-arm.c
index 241e0aba..760ea86c 100644
--- a/configs/arm/qemu-arm.c
+++ b/configs/arm/qemu-arm.c
@@ -3,7 +3,7 @@
  *
  * Configuration for QEMU arm virtual target, 1G RAM, 8 cores
  *
- * Copyright (c) Siemens AG, 2017-2020
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -57,7 +57,7 @@ struct {
 		.root_cell = {
 			.name = "qemu-arm",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
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
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
+		{
+			.phys_id = 6,
+		},
+		{
+			.phys_id = 7,
+		},
 	},
 
 	.mem_regions = {
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-18-ralf.ramsauer%40oth-regensburg.de.
