Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBG242KQMGQEGXTVKHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 177FD55B9C2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:42 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id bp15-20020a056512158f00b0047f603e5f92sf4674528lfb.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335621; cv=pass;
        d=google.com; s=arc-20160816;
        b=AERKChNLhF81m8BrVzzdo1SnMQiw9Epbjro9xoM0iRFrSXGnqalC1Pg2uqk3bon3WK
         PMx0Jk9+5FXrGqt0fO60QE3SOZ5suvHtb0lEFq0lYQO+5dFDx8+ph158t9t1FzEBvV4T
         bPrYiNAteXCxfyepu47w8xTVnAT970J1HwIPGJ4INMwLkU2JgNv79K6AaVovz6MjoE5H
         knUig6ra48OuYUSp+4SLcOFgDwaB+zOah4mJ9rjktddxt3FQBEn7Wxh4FBiRqdCvJNh7
         DqXPmjKDb/n8joxz9YWvOiRaCtVUExS3S5+Si8A9zupfVobQREgPEQyCn76+Fu3pZtMD
         XcHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=JfGsnwX6gZ0F7cOM5ddapwktb7zNO/FwfyZupjSSf5g=;
        b=srqzYw413qmo0wjq136luK2ceQTlqigNFhNir2WQf5tHlDcf0vkCLuu+KF/YHYMmJD
         SmUvEyZg9uHGu1dZH+z9W1oF4YicaZBL6SbF2U9OA7BECyvSvMBKRQrOL0ZKxvbzQ3Xe
         3uStoGhdeiUJZouTnQ5eb5YV6feUdNbbwfEwGV1GFLsjsAA82qBpYVf5coejxiNtLh4/
         mlB8UKCVydisf9qf67xUaEtqlSgIPdMYuObzE4y8CHJ7Y9tjYerIcruT+OQYmL5jESUO
         kN+Ukg1uCByr3eH6GKk4SGfrrOsAxLnn02AnWDY1EiGy2t2LOyoB70F0Rlc6f2NPIEN7
         zfNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=gFLiyVRE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JfGsnwX6gZ0F7cOM5ddapwktb7zNO/FwfyZupjSSf5g=;
        b=V+JbD+Sk4mfPDBCiM4nua2idK8s5zPjeC8oGxQrfaXdCrJ/rptQ/f72PnZtmf/Us53
         d3/J0miSkJWSPNc5lC2cNs6YIIF9Na324GaQFSn8VrW1xiwsJ96ppXyxlaZieVS04fcn
         sKK8u2SWPczc6HLH0PFEMbAse0rK9X0+POmMw0ZqzCB7yNzZoc6ujvefH1alsmISTAM9
         X/t1g/uugzVMWOZ2dXxSDWNUfGxqkSE0QAjbQTF619GxsauZci5kO5PY/YeWzODS5OIb
         Oglkj0FMWAl9SZY+m8Nm5GHc8QnCU2MKhWJ9ew25QnG8R7JQm381D3GaDw6nvJXTWf+K
         Scbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JfGsnwX6gZ0F7cOM5ddapwktb7zNO/FwfyZupjSSf5g=;
        b=uz21+LGJm9oacJCId3NiTrH6885Hv3RnPQBpdHmuaXBxTwLxPxbU1RIe1AwElUpKab
         Q2FiwarmDPgbxP5LidmfcJ1GpUjOPYUG8JtT9991MNwqEVMUgUslvT/cc39a+Q2lw+4K
         d9XPqFnUI8lXtG+XumKwy4hbzgL1hrdDHS45mJBr/tpoicrNo+WkOPtsSIRpFSP+/ZXt
         g1/UxLa9aTUZoFOD6SR1MwNY6n80Nz66SFK9QD/ZaOzadFqJJKZs0fPcK6ZSO0GKoxrG
         QprKVKVYcO93FT3tgtunf50nXE7O9xW2szSsj0Oq+HXalpQO65Azhh6J3YVkpQJte3um
         sP1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9kbL4BE7RN0k5S9OC0fnOBejeJGuLBiGYFWmzkWEVucd1ImvFu
	d3OU+iX86Jj9kkHDl4f75GI=
X-Google-Smtp-Source: AGRyM1tueBxTif0BpXo3A0YoRpDD5XJJITc3cNKsCMb4Wh1Om6Evb7X716ojvaUudMouZBCNIWSRYA==
X-Received: by 2002:a05:6512:1329:b0:47d:c488:419b with SMTP id x41-20020a056512132900b0047dc488419bmr8743144lfu.398.1656335621116;
        Mon, 27 Jun 2022 06:13:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:238e:b0:481:2fa:2826 with SMTP id
 c14-20020a056512238e00b0048102fa2826ls186359lfv.0.gmail; Mon, 27 Jun 2022
 06:13:39 -0700 (PDT)
X-Received: by 2002:a05:6512:22cd:b0:47f:6e84:f51c with SMTP id g13-20020a05651222cd00b0047f6e84f51cmr7951120lfu.175.1656335619487;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335619; cv=none;
        d=google.com; s=arc-20160816;
        b=o5aTyxWJSYp1T0RfqAKOnRVlRqMhmuWR8HmumXdSV+TD5NV2TyS/mcHU6TvvxRK5Lz
         JMOLvb8EPNnNXfmwz+75JkEYNnryecy4BoZaKCEHxNFj4hvPzkRh5JlunpJfNmMIkAQ3
         wYSbt8JY65UwCPmK8H40DIvpCv6ZsNUewC25kSVmHYCknp3gqJqzmdganRNTkjV7MD6+
         U0o/XhGYnPFc59TGN9SkhXg/5PNgmDePZ6A1Hd+SjvwMTpw4KiBtsmZHGbq1jzj08hXx
         kE4irjsxLdOg44XnQmmN9HfXL9h03uknUPMIuuM408/K/rOjqhwtdqatc4Tkat1fOnEP
         WrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eNVnjtusQ5aYLKdJsk/dBn5CTIcXi8gEVCedv9JIu2s=;
        b=QS77zktl8HVx2Olh3LyyIFonAMBUFdUeUyUasofc/ouxm8vrxd0q5vh1bwHZNV5P2w
         LqWJ2pIzgHWPGvePcjIwE6lvjVYqj+BzM5fZ+sehm7qVdWuEu79y63grKPRvp4nY9h+M
         HdaQFjdt21IIDK4iVRVZRek2FWnzmdLdASLx8zdT9IhxSKM0P0eTJlwiQu0zyhobbixK
         0Gl69jsrbb55ordRkH9I5Irz/h5a68RIjyrmFZwpprC514af8G/x+4oeQ89QVyPK/5VJ
         h+F7UuvAs/gurS1oDwretnZSXW7r+HPj/rFUF/Kev/RSXJrLPxrIz39dW9zp59I3ox+5
         YJeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=gFLiyVRE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id o19-20020ac24c53000000b004810d3e125csi208195lfk.11.2022.06.27.06.13.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWp825zZTzxwx;
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
Subject: [RFC v1 17/20] configs: arm: Convert to new CPU configuration format
Date: Mon, 27 Jun 2022 15:13:26 +0200
Message-ID: <20220627131329.3659-18-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=gFLiyVRE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

At this chance, move the jetson-tk1-inmate-demo from CPU 3 to 1,
avoiding the overlap with its linux-demo and aligning it with other
systems with 4 or more cores.

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
index a83aff88..9d217ddf 100644
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
@@ -27,7 +27,7 @@ struct {
 		.name = "bananapi-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 9819091e..021cb9b1 100644
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
@@ -29,7 +29,7 @@ struct {
 		.name = "bananapi-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 4e566380..fd58c3a5 100644
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
@@ -56,7 +56,7 @@ struct {
 		.root_cell = {
 			.name = "Banana-Pi",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,12 @@ struct {
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
index d8f21a70..fb33cd50 100644
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
@@ -27,7 +27,7 @@ struct {
 		.name = "emtrion-emconrzg1e-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index b76b8e84..4ee382dc 100644
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
@@ -29,7 +29,7 @@ struct {
 		.name = "emtrion-emconrzg1e-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index f392bf00..42dea0a7 100644
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
@@ -57,7 +57,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "emCON-RZ/G1E",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,12 @@ struct {
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
index 11695b75..5c52398e 100644
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
@@ -27,7 +27,7 @@ struct {
 		.name = "emtrion-emconrzg1h-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index a41c94dd..e21dabf3 100644
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
@@ -29,7 +29,7 @@ struct {
 		.name = "emtrion-emconrzg1h-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 26fa624a..67e5955e 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[40];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -57,7 +57,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "emCON-RZ/G1H",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,30 @@ struct {
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
index b406b8bd..603b8338 100644
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
@@ -27,7 +27,7 @@ struct {
 		.name = "emtrion-emconrzg1m-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 75f34e72..bd2911bc 100644
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
@@ -29,7 +29,7 @@ struct {
 		.name = "emtrion-emconrzg1m-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 4ee1a40c..76fd857b 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[27];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
@@ -57,7 +57,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "emCON-RZ/G1M",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			/* .num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,12 @@ struct {
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
index a4dd0a34..08ed6724 100644
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
@@ -31,7 +31,7 @@ struct {
 		.name = "jetson-tk1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.cpu_reset_address = CONFIG_INMATE_BASE,
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 52e11c1e..ccdbac81 100644
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
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -49,7 +49,12 @@ struct {
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
index f815218d..1d3d91f2 100644
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
@@ -60,7 +60,7 @@ struct {
 		.root_cell = {
 			.name = "Jetson-TK1",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
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
diff --git a/configs/arm/orangepi0-inmate-demo.c b/configs/arm/orangepi0-inmate-demo.c
index bcbf4823..8f9d8287 100644
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
@@ -29,7 +29,7 @@ struct {
 		.name = "orangepi0-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index af0dd1a6..3c327f47 100644
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
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
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
index c24344e0..3930561d 100644
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
@@ -53,7 +53,7 @@ struct {
 		.root_cell = {
 			.name = "Orange-Pi0",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -63,7 +63,18 @@ struct {
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
index 3f835d9e..a35dbf19 100644
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
@@ -29,7 +29,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm/qemu-arm-linux-demo.c b/configs/arm/qemu-arm-linux-demo.c
index e0124baa..c7223d8c 100644
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
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
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
index 4a3eac7b..cb6ef930 100644
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
@@ -56,7 +56,7 @@ struct {
 		.root_cell = {
 			.name = "qemu-arm",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,30 @@ struct {
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-18-ralf.ramsauer%40oth-regensburg.de.
