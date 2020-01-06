Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOMEZXYAKGQEVNGPPNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E05E13137F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:42 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id z2sf5689691ljh.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320441; cv=pass;
        d=google.com; s=arc-20160816;
        b=k9hdctV9MDBD1pQLK45XTIzp6V5PNs/P+p6vk5wWQP14iOiKDgsc/anmI3LlguJoc6
         G7bco3uqH9cOqp1oN/zKmDmQgjadxLtnQxp3M0EDXxnX/Sz5mv3ZGV284rYOWY0vPRFD
         71ivsMTY2qOjtDgfmuSNox5tFzSB09LsannKicwyUnuuUTKRnwmpQkURTI3pHYQxyb+a
         AQGpbL4asqTBhUp1u6cg7qOXMB485TRco6TOieAH9CjRal7RMAjNMO6k0O4O2fVskL+T
         aq1mGQWn/9EVJqQ8CwhzLMAE17nSfBEccD0+jd6oFedsjf54IT6erRi+AvEWJrWJnG3x
         mZAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=L+jSbPNkPiMfZvD+thmQ8Ur88Ac2aHgkbZKOHzi11V0=;
        b=yl75zyjrZVIDetPT4c5qzeTTYGg4ahDUv1A0a8OkWTXGw3fnMTp9cUvNZfr6hHk6lc
         lSBTOOcrbGHF6DKdUQ6P/E82MnT+Dy4TroRxIiV6InMvyw71/HBpjunKu9SS4kX2YQPQ
         6FP+rlqtuDzn1Mw7j1He0fvFjTCkmM8VbpJ+lij8rRLqtNvjgz5UoXmU2+HzGSl8yRky
         S4MdcqApiCAKjs1CEAAJVjCDJvkAIHIpSd+/qUqSvPUisDcdivtQ4qB+qaK+mLmKt5WP
         IzQAPZU+1TlVAbZJ91TfPeM90tDGudOZy3A9J9ihRZ5GhauKIT9XLfPGzB7BdFGRFmOu
         eOOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L+jSbPNkPiMfZvD+thmQ8Ur88Ac2aHgkbZKOHzi11V0=;
        b=ZNFwdtIwXI1eJRMXvMorIpj45V+Q+RjCVLj4M/+8zM4DNTMbzU3PK+XAthS1kVYhvR
         jGn1gRWXmqt435v2ippakvSCDnHQlB7+0PodbTkaphlcAEglEQn8MxuPpUXQJYrQ/0bS
         L0gwkHcQcRfKW6dv3G5stZoFqJZbFjsNiZATMJ6prRyH6GsEYU3byU9gSAmcy520mQOb
         RLM4Y9c8NCV2biuBF+2lFB/3mbHJbVXm1VeSYsW8b3ezPZPa4I39OyKxBJaqM/aslEQK
         4LHcQ8Fwul+Va2NdFkayh3s0d+ct3a7cds7+q6mDInuOhihrhlvC6/ndkPTpa12MBN0C
         mLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L+jSbPNkPiMfZvD+thmQ8Ur88Ac2aHgkbZKOHzi11V0=;
        b=ljDPaGBIHv3XN77vn9/psoCW8OYuYlVsjRndU/GZLDN4ZkRqtqcTkscxNUjBwMpr28
         lntKC1EuUl8pxQC7oVU4s/bwJBZkQLRQkMU6JwzdYQ+Ug+uz0mXFF7BIVmAZ0mNM2rAs
         heMEHk0kTCnBTums17en6zUDESZjhTgcDI/tB+CNK59dY9rdUxKToh5ZIaC2DQfDy+HK
         OtAp5Hz4VppPuCrx8vprlsm2Mawgsrkcb2s2V55X3O7XzmT2XnenEOihXtUHpI/iNviE
         3Igsu4mb7gpyJ2mOCdtB8bmUA822Tq3oHNEkqaD+jkHnnCpwHSoJiOjNLkdtJ/RDzOEm
         qFEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU7bOjNPtCzLPtZ49Hbc6T8Wv31czuK5mtlS/MoMAKg+3svjG5V
	Nw8Ztr+88WzlAyMCSEmh3is=
X-Google-Smtp-Source: APXvYqwGLTKcPlmSzh+evKejtxktCsyCO6RrbZwcnLM+FGFYFSBJ9sbxls0PftoIn07EFx90DwU1Gw==
X-Received: by 2002:ac2:5147:: with SMTP id q7mr56800947lfd.87.1578320441789;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e01:: with SMTP id e1ls5833574ljk.15.gmail; Mon, 06 Jan
 2020 06:20:41 -0800 (PST)
X-Received: by 2002:a05:651c:8f:: with SMTP id 15mr60326215ljq.109.1578320441078;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320441; cv=none;
        d=google.com; s=arc-20160816;
        b=QSrY7Tez141/iM1EFAUQYVEqp8dKQe9pJ5p3hszE+wO6HJupMVvxy9sfrKHOKkPH+R
         DJ4S4RwAAlsgM7/Odpgpl/UK9/2dtMk+eq1/XKEGL2sQlf+G9vZxgJl92O1A0msIHhZk
         rJayaCDhpkOpLLh6Ux++BDaDxRQeLq9T7t6bm7FMFOBez15sT7sQ/rT4ozyce0YJJ0UL
         pJY5+hfwGasSV2ST4EbkRQUtBLCVlsiFkmESJxGbeoIsJVLiblq9Ls25PBFk+N5S5IIy
         6roCkeQ6mos41IZ0ZkNQihXbV/7TtRMXeaCh8CnJaeujatpPeKXseIsWsFAYCSSTzyAa
         5K5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=hPLU6axciaygPe81ucJ/UrfxdiqT31UycbKdj7knGTE=;
        b=n9EnXtTQddrLpnTU3QH3OORUcJmtTQXjmZ7eaYjKOsiz075tmtFWzPlRbZXsBGtAKW
         kf9233BwSBASQmzHqRu9HB6DO9HKDX8dw18XJc6lwWt3ktqu8pWEeSh8oECHe1lURVed
         Pf3EQUruV7kcUKjOCxYOLtzUmPbGD007F+6JPvyNlXj89ZbInKL3mBWlPkIyef2WiAY1
         XASk+7v02FKI3OqDIASMq9JOsSIggDcVz+fo6Gv924dqUdR5gRPeCW/LUhq0ejegjPhb
         ZkV0BGnuA9doQjwWHDQIBCASJvVMzyEA+WFLGAxiekExixzZD25G8VcbQvMQgDp3RExj
         0Q6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o24si2876512lji.4.2020.01.06.06.20.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKeNF016666
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:40 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjN008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:40 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 15/19] configs, Documentation: arm/arm64: Rename gic-demo to inmate-demo
Date: Mon,  6 Jan 2020 15:20:31 +0100
Message-Id: <e2dad765c4a86de6e24b2beb67d13effdd9605b5.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This expresses that the configs can already be used for gic and uart
demos, soon more and more also for ivshmem.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/setup-on-zynqmp-zcu102.md                           | 8 ++++----
 README.md                                                         | 6 +++---
 configs/arm/{bananapi-gic-demo.c => bananapi-inmate-demo.c}       | 4 ++--
 .../{emtrion-rzg1e-uart-demo.c => emtrion-rzg1e-inmate-demo.c}    | 4 ++--
 .../{emtrion-rzg1h-uart-demo.c => emtrion-rzg1h-inmate-demo.c}    | 4 ++--
 .../{emtrion-rzg1m-uart-demo.c => emtrion-rzg1m-inmate-demo.c}    | 4 ++--
 configs/arm/{jetson-tk1-demo.c => jetson-tk1-inmate-demo.c}       | 4 ++--
 configs/arm/{orangepi0-gic-demo.c => orangepi0-inmate-demo.c}     | 4 ++--
 .../arm64/{amd-seattle-gic-demo.c => amd-seattle-inmate-demo.c}   | 4 ++--
 .../arm64/{espressobin-gic-demo.c => espressobin-inmate-demo.c}   | 4 ++--
 .../{foundation-v8-gic-demo.c => foundation-v8-inmate-demo.c}     | 4 ++--
 configs/arm64/{hikey-gic-demo.c => hikey-inmate-demo.c}           | 4 ++--
 configs/arm64/{imx8mq-gic-demo.c => imx8mq-inmate-demo.c}         | 4 ++--
 configs/arm64/{jetson-tx1-demo.c => jetson-tx1-inmate-demo.c}     | 4 ++--
 configs/arm64/{jetson-tx2-demo.c => jetson-tx2-inmate-demo.c}     | 4 ++--
 configs/arm64/{k3-am654-gic-demo.c => k3-am654-inmate-demo.c}     | 4 ++--
 .../arm64/{k3-j721e-evm-gic-demo.c => k3-j721e-evm-inmate-demo.c} | 4 ++--
 .../arm64/{macchiatobin-gic-demo.c => macchiatobin-inmate-demo.c} | 4 ++--
 ...ac-sbc-ls1046a-gic-demo.c => miriac-sbc-ls1046a-inmate-demo.c} | 4 ++--
 configs/arm64/{qemu-arm64-gic-demo.c => qemu-arm64-inmate-demo.c} | 4 ++--
 configs/arm64/{ultra96-gic-demo.c => ultra96-inmate-demo.c}       | 4 ++--
 .../{zynqmp-zcu102-gic-demo.c => zynqmp-zcu102-inmate-demo.c}     | 4 ++--
 22 files changed, 47 insertions(+), 47 deletions(-)
 rename configs/arm/{bananapi-gic-demo.c => bananapi-inmate-demo.c} (96%)
 rename configs/arm/{emtrion-rzg1e-uart-demo.c => emtrion-rzg1e-inmate-demo.c} (94%)
 rename configs/arm/{emtrion-rzg1h-uart-demo.c => emtrion-rzg1h-inmate-demo.c} (94%)
 rename configs/arm/{emtrion-rzg1m-uart-demo.c => emtrion-rzg1m-inmate-demo.c} (94%)
 rename configs/arm/{jetson-tk1-demo.c => jetson-tk1-inmate-demo.c} (94%)
 rename configs/arm/{orangepi0-gic-demo.c => orangepi0-inmate-demo.c} (95%)
 rename configs/arm64/{amd-seattle-gic-demo.c => amd-seattle-inmate-demo.c} (95%)
 rename configs/arm64/{espressobin-gic-demo.c => espressobin-inmate-demo.c} (94%)
 rename configs/arm64/{foundation-v8-gic-demo.c => foundation-v8-inmate-demo.c} (94%)
 rename configs/arm64/{hikey-gic-demo.c => hikey-inmate-demo.c} (94%)
 rename configs/arm64/{imx8mq-gic-demo.c => imx8mq-inmate-demo.c} (96%)
 rename configs/arm64/{jetson-tx1-demo.c => jetson-tx1-inmate-demo.c} (93%)
 rename configs/arm64/{jetson-tx2-demo.c => jetson-tx2-inmate-demo.c} (93%)
 rename configs/arm64/{k3-am654-gic-demo.c => k3-am654-inmate-demo.c} (95%)
 rename configs/arm64/{k3-j721e-evm-gic-demo.c => k3-j721e-evm-inmate-demo.c} (95%)
 rename configs/arm64/{macchiatobin-gic-demo.c => macchiatobin-inmate-demo.c} (94%)
 rename configs/arm64/{miriac-sbc-ls1046a-gic-demo.c => miriac-sbc-ls1046a-inmate-demo.c} (95%)
 rename configs/arm64/{qemu-arm64-gic-demo.c => qemu-arm64-inmate-demo.c} (94%)
 rename configs/arm64/{ultra96-gic-demo.c => ultra96-inmate-demo.c} (95%)
 rename configs/arm64/{zynqmp-zcu102-gic-demo.c => zynqmp-zcu102-inmate-demo.c} (94%)

diff --git a/Documentation/setup-on-zynqmp-zcu102.md b/Documentation/setup-on-zynqmp-zcu102.md
index 535933ff..613d7bcd 100644
--- a/Documentation/setup-on-zynqmp-zcu102.md
+++ b/Documentation/setup-on-zynqmp-zcu102.md
@@ -103,15 +103,15 @@ running:
     Activating hypervisor
     [   39.844953] The Jailhouse is opening.
 
-    # jailhouse cell create zynqmp-zcu102-gic-demo.cell
+    # jailhouse cell create zynqmp-zcu102-inmate-demo.cell
     [   55.351670] CPU3: shutdown
     [   55.354303] psci: CPU3 killed.
-    Created cell "gic-demo"
+    Created cell "inmate-demo"
     Page pool usage after cell creation: mem 56/993, remap 69/131072
-    [   55.388029] Created Jailhouse cell "gic-demo"
+    [   55.388029] Created Jailhouse cell "inmate-demo"
 
     # jailhouse cell load 1 gic-demo.bin
-    Cell "gic-demo" can be loaded
+    Cell "inmate-demo" can be loaded
     # jailhouse cell start 1
 
 Second UART starts showing jitter data:
diff --git a/README.md b/README.md
index de70a8c7..2413aba2 100644
--- a/README.md
+++ b/README.md
@@ -381,6 +381,6 @@ Jailhouse can be started after loading its kernel module. Run:
 
 The corresponding test to apic-demo on x86 is the gic-demo:
 
-    jailhouse cell create /path/to/qemu-arm64-gic-demo.cell
-    jailhouse cell load gic-demo /path/to/gic-demo.bin
-    jailhouse cell start gic-demo
+    jailhouse cell create /path/to/qemu-arm64-inmate-demo.cell
+    jailhouse cell load inmate-demo /path/to/gic-demo.bin
+    jailhouse cell start inmate-demo
diff --git a/configs/arm/bananapi-gic-demo.c b/configs/arm/bananapi-inmate-demo.c
similarity index 96%
rename from configs/arm/bananapi-gic-demo.c
rename to configs/arm/bananapi-inmate-demo.c
index 855a72a7..a83aff88 100644
--- a/configs/arm/bananapi-gic-demo.c
+++ b/configs/arm/bananapi-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on Banana Pi:
+ * Configuration for demo inmate on Banana Pi:
  * 1 CPU, 64K RAM, serial ports 4-7, CCU+GPIO
  *
  * Copyright (c) Siemens AG, 2014
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "bananapi-gic-demo",
+		.name = "bananapi-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm/emtrion-rzg1e-uart-demo.c b/configs/arm/emtrion-rzg1e-inmate-demo.c
similarity index 94%
rename from configs/arm/emtrion-rzg1e-uart-demo.c
rename to configs/arm/emtrion-rzg1e-inmate-demo.c
index 42c74127..d8f21a70 100644
--- a/configs/arm/emtrion-rzg1e-uart-demo.c
+++ b/configs/arm/emtrion-rzg1e-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for uart-demo inmate on emCON-RZ/G1E:
+ * Configuration for demo inmate on emCON-RZ/G1E:
  * 1 CPU, 64K RAM, serial ports SCIF4, CCU
  *
  * Copyright (c) emtrion GmbH, 2017
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "emtrion-emconrzg1e-uart-demo",
+		.name = "emtrion-emconrzg1e-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm/emtrion-rzg1h-uart-demo.c b/configs/arm/emtrion-rzg1h-inmate-demo.c
similarity index 94%
rename from configs/arm/emtrion-rzg1h-uart-demo.c
rename to configs/arm/emtrion-rzg1h-inmate-demo.c
index f20c94cb..11695b75 100644
--- a/configs/arm/emtrion-rzg1h-uart-demo.c
+++ b/configs/arm/emtrion-rzg1h-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for uart-demo inmate on emCON-RZ/G1H:
+ * Configuration for demo inmate on emCON-RZ/G1H:
  * 1 CPU, 64K RAM, serial ports SCIFA0, CCU
  *
  * Copyright (c) emtrion GmbH, 2017
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "emtrion-emconrzg1h-uart-demo",
+		.name = "emtrion-emconrzg1h-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm/emtrion-rzg1m-uart-demo.c b/configs/arm/emtrion-rzg1m-inmate-demo.c
similarity index 94%
rename from configs/arm/emtrion-rzg1m-uart-demo.c
rename to configs/arm/emtrion-rzg1m-inmate-demo.c
index c89c1d82..b406b8bd 100644
--- a/configs/arm/emtrion-rzg1m-uart-demo.c
+++ b/configs/arm/emtrion-rzg1m-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for uart-demo inmate on emCON-RZ/G1M:
+ * Configuration for demo inmate on emCON-RZ/G1M:
  * 1 CPU, 64K RAM, serial ports SCIF4, CCU
  *
  * Copyright (c) emtrion GmbH, 2017
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "emtrion-emconrzg1m-uart-demo",
+		.name = "emtrion-emconrzg1m-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm/jetson-tk1-demo.c b/configs/arm/jetson-tk1-inmate-demo.c
similarity index 94%
rename from configs/arm/jetson-tk1-demo.c
rename to configs/arm/jetson-tk1-inmate-demo.c
index 57ea5a3d..a4dd0a34 100644
--- a/configs/arm/jetson-tk1-demo.c
+++ b/configs/arm/jetson-tk1-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo or uart-demo inmate on Nvidia Jetson TK1:
+ * Configuration for demo inmate on Nvidia Jetson TK1:
  * 1 CPU, 64K RAM, serial port 0
  *
  * Copyright (c) Siemens AG, 2015
@@ -28,7 +28,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "jetson-tk1-demo",
+		.name = "jetson-tk1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm/orangepi0-gic-demo.c b/configs/arm/orangepi0-inmate-demo.c
similarity index 95%
rename from configs/arm/orangepi0-gic-demo.c
rename to configs/arm/orangepi0-inmate-demo.c
index 51b3bf8b..5b77f1ba 100644
--- a/configs/arm/orangepi0-gic-demo.c
+++ b/configs/arm/orangepi0-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on Orange Pi Zero:
+ * Configuration for demo inmate on Orange Pi Zero:
  * 1 CPU, 64K RAM, serial ports 0-3, GPIO PA
  *
  * Copyright (c) Siemens AG, 2014-2016
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "orangepi0-gic-demo",
+		.name = "orangepi0-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/amd-seattle-gic-demo.c b/configs/arm64/amd-seattle-inmate-demo.c
similarity index 95%
rename from configs/arm64/amd-seattle-gic-demo.c
rename to configs/arm64/amd-seattle-inmate-demo.c
index 7cc871a7..d920804c 100644
--- a/configs/arm64/amd-seattle-gic-demo.c
+++ b/configs/arm64/amd-seattle-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on AMD Seattle:
+ * Configuration for demo inmate on AMD Seattle:
  * 1 CPU, 64K RAM, 1 serial port
  *
  * Copyright (C) 2015 Huawei Technologies Duesseldorf GmbH
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/espressobin-gic-demo.c b/configs/arm64/espressobin-inmate-demo.c
similarity index 94%
rename from configs/arm64/espressobin-gic-demo.c
rename to configs/arm64/espressobin-inmate-demo.c
index e5da1997..921b93b0 100644
--- a/configs/arm64/espressobin-gic-demo.c
+++ b/configs/arm64/espressobin-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on Marvell ESPRESSObin board:
+ * Configuration for demo inmate on Marvell ESPRESSObin board:
  * 1 CPU, 64K RAM, 1 serial port
  *
  * Copyright (c) Siemens AG, 2017
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/foundation-v8-gic-demo.c b/configs/arm64/foundation-v8-inmate-demo.c
similarity index 94%
rename from configs/arm64/foundation-v8-gic-demo.c
rename to configs/arm64/foundation-v8-inmate-demo.c
index 44402a18..2dda3adf 100644
--- a/configs/arm64/foundation-v8-gic-demo.c
+++ b/configs/arm64/foundation-v8-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on Foundation Model v8:
+ * Configuration for demo inmate on Foundation Model v8:
  * 1 CPU, 64K RAM, serial port 1
  *
  * Copyright (c) ARM Limited, 2014
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/hikey-gic-demo.c b/configs/arm64/hikey-inmate-demo.c
similarity index 94%
rename from configs/arm64/hikey-gic-demo.c
rename to configs/arm64/hikey-inmate-demo.c
index 48a9634f..ce5eb91b 100644
--- a/configs/arm64/hikey-gic-demo.c
+++ b/configs/arm64/hikey-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on LeMaker HiKey board, 2GiB:
+ * Configuration for demo inmate on LeMaker HiKey board, 2GiB:
  * 1 CPU, 64K RAM, 1 serial port
  *
  * Copyright (c) Siemens AG, 2016
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/imx8mq-gic-demo.c b/configs/arm64/imx8mq-inmate-demo.c
similarity index 96%
rename from configs/arm64/imx8mq-gic-demo.c
rename to configs/arm64/imx8mq-inmate-demo.c
index 02a2b480..8c1ad624 100644
--- a/configs/arm64/imx8mq-gic-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -1,5 +1,5 @@
 /*
- * iMX8MQ target - gic-demo
+ * iMX8MQ target - inmate demo
  *
  * Copyright NXP 2018
  *
@@ -21,7 +21,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/jetson-tx1-demo.c b/configs/arm64/jetson-tx1-inmate-demo.c
similarity index 93%
rename from configs/arm64/jetson-tx1-demo.c
rename to configs/arm64/jetson-tx1-inmate-demo.c
index b16b9ba7..1cfbe7f7 100644
--- a/configs/arm64/jetson-tx1-demo.c
+++ b/configs/arm64/jetson-tx1-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo or uart-demo inmate on Nvidia Jetson TX1:
+ * Configuration for demo inmate on Nvidia Jetson TX1:
  * 1 CPU, 64K RAM, serial port 0
  *
  * Copyright (c) Siemens AG, 2015
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "jetson-tx1-demo",
+		.name = "jetson-tx1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/jetson-tx2-demo.c b/configs/arm64/jetson-tx2-inmate-demo.c
similarity index 93%
rename from configs/arm64/jetson-tx2-demo.c
rename to configs/arm64/jetson-tx2-inmate-demo.c
index d500e124..ed1a7d97 100644
--- a/configs/arm64/jetson-tx2-demo.c
+++ b/configs/arm64/jetson-tx2-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo or uart-demo inmate on Nvidia Jetson TX2:
+ * Configuration for demo inmate on Nvidia Jetson TX2:
  * 1 CPU, 64 MB RAM, serial port 0
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
@@ -19,7 +19,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "jetson-tx2-demo",
+		.name = "jetson-tx2-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/k3-am654-gic-demo.c b/configs/arm64/k3-am654-inmate-demo.c
similarity index 95%
rename from configs/arm64/k3-am654-gic-demo.c
rename to configs/arm64/k3-am654-inmate-demo.c
index 9ced1007..00367471 100644
--- a/configs/arm64/k3-am654-gic-demo.c
+++ b/configs/arm64/k3-am654-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on K3 based platforms.
+ * Configuration for demo inmate on K3 based platforms.
  * 1CPU, 64K RAM, 1 serial port(MCU UART 0).
  *
  * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
@@ -25,7 +25,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/k3-j721e-evm-gic-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
similarity index 95%
rename from configs/arm64/k3-j721e-evm-gic-demo.c
rename to configs/arm64/k3-j721e-evm-inmate-demo.c
index 0c122fee..7440a258 100644
--- a/configs/arm64/k3-j721e-evm-gic-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on K3 based platforms.
+ * Configuration for demo inmate on K3 based platforms.
  * 1CPU, 64K RAM, 1 serial port.
  *
  * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
@@ -25,7 +25,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/macchiatobin-gic-demo.c b/configs/arm64/macchiatobin-inmate-demo.c
similarity index 94%
rename from configs/arm64/macchiatobin-gic-demo.c
rename to configs/arm64/macchiatobin-inmate-demo.c
index 2bb1d85d..9c76f606 100644
--- a/configs/arm64/macchiatobin-gic-demo.c
+++ b/configs/arm64/macchiatobin-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on Marvell MACCHIATObin board:
+ * Configuration for demo inmate on Marvell MACCHIATObin board:
  * 1 CPU, 64K RAM, 1 serial port
  *
  * Copyright (c) Siemens AG, 2017-2018
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
similarity index 95%
rename from configs/arm64/miriac-sbc-ls1046a-gic-demo.c
rename to configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
index 73e8e891..39e97888 100644
--- a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * GIC-demo for Microsys miriac SBC-LS1046A board
+ * Demo inmate for Microsys miriac SBC-LS1046A board
  *
  * Copyright (c) Linutronix GmbH, 2019
  *
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/qemu-arm64-gic-demo.c b/configs/arm64/qemu-arm64-inmate-demo.c
similarity index 94%
rename from configs/arm64/qemu-arm64-gic-demo.c
rename to configs/arm64/qemu-arm64-inmate-demo.c
index 7752167e..502e3705 100644
--- a/configs/arm64/qemu-arm64-gic-demo.c
+++ b/configs/arm64/qemu-arm64-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on QEMU arm64 virtual target
+ * Configuration for demo inmate on QEMU arm64 virtual target
  * 1 CPU, 64K RAM, 1 serial port
  *
  * Copyright (c) Siemens AG, 2017
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/ultra96-gic-demo.c b/configs/arm64/ultra96-inmate-demo.c
similarity index 95%
rename from configs/arm64/ultra96-gic-demo.c
rename to configs/arm64/ultra96-inmate-demo.c
index 23bad983..b9524c37 100644
--- a/configs/arm64/ultra96-gic-demo.c
+++ b/configs/arm64/ultra96-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on Avnet Ultra96 board:
+ * Configuration for demo inmate on Avnet Ultra96 board:
  * 1 CPU, 64K RAM, 1 serial port
  *
  * Copyright (c) Siemens AG, 2016-2019
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/zynqmp-zcu102-gic-demo.c b/configs/arm64/zynqmp-zcu102-inmate-demo.c
similarity index 94%
rename from configs/arm64/zynqmp-zcu102-gic-demo.c
rename to configs/arm64/zynqmp-zcu102-inmate-demo.c
index 138b3e44..304b4cda 100644
--- a/configs/arm64/zynqmp-zcu102-gic-demo.c
+++ b/configs/arm64/zynqmp-zcu102-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for gic-demo inmate on Xilinx ZynqMP ZCU102 eval board:
+ * Configuration for demo inmate on Xilinx ZynqMP ZCU102 eval board:
  * 1 CPU, 64K RAM, 1 serial port
  *
  * Copyright (c) Siemens AG, 2016
@@ -24,7 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "gic-demo",
+		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
 		.cpu_set_size = sizeof(config.cpus),
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e2dad765c4a86de6e24b2beb67d13effdd9605b5.1578320435.git.jan.kiszka%40siemens.com.
