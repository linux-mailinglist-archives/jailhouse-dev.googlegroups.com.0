Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBAOMQP7AKGQETZFPPQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 056072C6401
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Nov 2020 12:41:55 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id i3sf1893018ljj.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Nov 2020 03:41:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606477314; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZCfdwUfK8PfmQznCP9X3A8ao8W2YRmxMXE9o4RQ9+Phbif2SPs2TIOq5DxYlTwynGp
         Uxm7CQnUyzoRXOopnZgm4R6R8jG4ItAWnj3qyPj19lxQlGWBDwo5xNg+1Jk4IayTOe9U
         Rlo4RtquJ8Q10c9q8Ml/LknfSGcwmWnzTmsw81pWggdqQjduesT4f81CUM3oWznFf1nJ
         3tHmUdqETgJwpCoVxQ7HujRc/ZW0QjgyYymE+L4Zuy4yVcQKdmrlBU3Su++iKwOt9zGD
         RBvQNF3sdpVhzxXNPxK5m2tlBxeZRWBQyvyMo8h1Gi9ZJvL8KBbanb+KYZ+ZpK3WuMC5
         BLRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=ntCn128XslDpJ5df81dOvIrfUWqxvv8uZ4Z6wFOi7WE=;
        b=C1+d3I+d+eaThL1EdcfLHhhNqmWF5RVgoSHMDhlIrEWy8vWuV0iYbk2gogs9BqPNKA
         8MiLGShvVDSy/V3PaR16VJ+eF3HaOTnDvgmP5m6fhFCQfFtExAyh8grSdwqwOnmLRAQF
         EyBiXHPBPokl4+CaIoFzHVWPv5WhAAfn4kObrFoWJIYq5pUBONqRzr4ODLJXC6bXVcHK
         vRv5hsQdTaBVkGMyYDe5vnUwCClgxxUgLWiu8Xk1TNsDwPYYzRLAu2D0yiroMoYc+4MC
         iEozwhYgrp2CaY/0nfSt32JuZskMs8fDPh6RMhf/fyq6XAYuS2M1uFnsOGX+/eFfivZS
         Jd9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=UEPljnF9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ntCn128XslDpJ5df81dOvIrfUWqxvv8uZ4Z6wFOi7WE=;
        b=EQPoQDbK76i3guGclTY1qExVV9DF25W9vz3xq2tSZ86o/psU+ysDauRhOxUbKYDnPv
         K6VxjP8CYgyS2jH3Uk+u2n/Wv1jS/Rs+Q4ybhdtiNnWzmjWRe+J4R+oeaZZllxNv6hlX
         ZVW1cZ6iEkKtnB8O1Vzto7IkRKHMUUmiJJmdwbBJG2FVyNihmxkfHQL+/r4HIg+/D1ZJ
         Jk3lJ9iQQZKerOIhKsgLhX390FYsGNoAAdBOx8P0MUOP1vBSRr73OH2CLJbuzvxZL2qC
         ToOVDMzQPSmbvIWXzQ7e587gQmcr/crMIYSuTu5jF6CZNMy++7Gqpp/Bn0JDLJuVjlLa
         Dy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ntCn128XslDpJ5df81dOvIrfUWqxvv8uZ4Z6wFOi7WE=;
        b=MHCOWxxaIzuwgNWqtYDjPK4a5TpwKJimpCWm6wpkzxruOEu/NKHKd26J/f0yrdRZWj
         1GJVb0Ki0MeaNQUMHribHSvd252+f9/ZwexeQXfcnT4284LoE6dQoOG6StxV/fzsG2L1
         2XKpye/qTHSK7AszNOcBLbravjVnhXqy+Sr+eKszuFKM82Uxoy0wtdcseiz2QNDPAfWN
         IfvGtIKEo//bx9FaNwo3vJCfXHXTIpY1cgqBEaZA0xoFfyyAYkawDy1DyHvth+6BWRm6
         4rreFpy5nIDq0f919dArVFm+NhTa6ssKFbyLungXzA8UJ7YRW3TLkaxoLfgwgt5Am8Wh
         B7oA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532IMmnF3QkN7sfSb8C5HsTWcIKIs3J6TNnjugHeEET5Wbt/xA/u
	FLdk1NHyxhRItaOGiJigKxk=
X-Google-Smtp-Source: ABdhPJxpteVNDOOG64jZULn1CIA8kLI3JgcKwlzxvQNAZUOdS3Bufvg87Gq3zc1+wM2zANHBxddXAw==
X-Received: by 2002:a05:6512:3587:: with SMTP id m7mr3223376lfr.149.1606477314535;
        Fri, 27 Nov 2020 03:41:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9895:: with SMTP id b21ls804127ljj.6.gmail; Fri, 27 Nov
 2020 03:41:53 -0800 (PST)
X-Received: by 2002:a2e:9207:: with SMTP id k7mr3158186ljg.71.1606477313023;
        Fri, 27 Nov 2020 03:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606477313; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVwZlq+SM11gq3gv3LuR0AWyrijpM04WyJ8oIyJUsw3qHP9BnK+pzTYMq/qx0lwbA0
         kM9v050ZuIg48vteGsG5Jk/UCewo7p60lzQ5vIGzAIWWnOj63MMXbDQwFRCCp8VfA6kl
         Rq2KNHUZinzxRDt/wwiOed8h/lsenklEMM101O+rB/ty9RCupEqttWTzIjQEO0BIdLQs
         /URE3a7Lpw7GnCdKdc1hYuJnufAsCYlM9cDlFFRI2h6s9sR+JZ/k7wgJ3kBAWgmUkBUX
         LtNwExSb0OwMUSxBtnqJeXTKATMZN2/JwbJoxsdm4o2VbZ4yiGv+NLAQe3BYp4hmOrsl
         m4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=UKVN77R6iDcvhzu4HoV3BiyaoQXimb4axBFHP9AoIPU=;
        b=pi3vva1E8YRa/nsJ4Dsr1a4276azc1eE6JC2TwahOY2/OWD5wLz6sODr6WHjshSOYn
         OTjj34VMp41bCQxFNlIQAluelnaUkmvKtRdINKy4y+jHC1c81XXDea78LwNFffmFBBPA
         AdSjDsJADJLZllREvu3H1xNW0L6XdVON7ynkrmmIDpzV8zHWRVBblH9fqPRUhWlSvvc+
         A2tmmyFpKzVsgsdtvb1Myo+j8oHzl5l15Br4WQWugBToarqX0M2QUmJFe0BA2dsQYYty
         KbtA+V2fFVrwnmKOC2KjVMthPT4LuigGluQJXlSBkZ8qGJFTEodzfaqJoXO8NzY4NXWv
         Jt0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=UEPljnF9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 26si198195lfr.13.2020.11.27.03.41.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 03:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CjCQS3N97zySf;
	Fri, 27 Nov 2020 12:41:52 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.867
X-Spam-Level: 
X-Spam-Status: No, score=-2.867 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, T_FILL_THIS_FORM_SHORT=0.01]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id jsgThm-hyYC5; Fri, 27 Nov 2020 12:41:51 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CjCQR3xQYzySw;
	Fri, 27 Nov 2020 12:41:51 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask and id
Date: Fri, 27 Nov 2020 12:41:39 +0100
Message-Id: <20201127114140.37179-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=UEPljnF9;       spf=pass
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

The SMMUv2 allows filtering bits when matching stream IDs before they're
passed to the TCU. In this way multiple streams legally get the same
translation.

On boards such as the ZCU Ultrascale+, the master ID needed to identify
the corresponding SMMU stream ID may be dependent on a specific AXI ID
that is set by the PL (and could be IP specific).

One single fixed mask to pass to the SMR to compact multiple stream IDs
before they "hit" the TCU is not flexible enough. The use-case is to
compact similar PL-originating masters and have the SMMU behaving the
same for them (e.g., they're assigned to the same inmate). At the
same time, one needs a full stream_id to assign e.g., different GEM
ethernets to different inmates.

Update a stream_id to support two different interpretations:
- for the SMMUv2, provide an explicit mask + ID.
- for the SMMUv3, keep the current single ID.

This commit updates the SMMUv2 / v3 --including configuration--
accordingly.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/imx8qm-linux-demo.c       |  7 ++-
 configs/arm64/imx8qm.c                  | 16 +++++--
 configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j7200-evm.c            |  2 +-
 configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j721e-evm.c            |  2 +-
 configs/arm64/ultra96.c                 | 11 ++++-
 configs/arm64/zynqmp-zcu102.c           | 15 +++++-
 hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
 hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
 hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
 include/jailhouse/cell-config.h         | 18 ++++---
 12 files changed, 114 insertions(+), 55 deletions(-)

diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
index f13ca7bc..e8e8b217 100644
--- a/configs/arm64/imx8qm-linux-demo.c
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -19,7 +19,7 @@ struct {
 	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[1];
+	union jailhouse_stream_id stream_ids[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -194,6 +194,9 @@ struct {
 	},
 
 	.stream_ids = {
-		0x10,
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x10,
+		},
 	},
 };
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index d63c73cf..2ec4f4dd 100644
--- a/configs/arm64/imx8qm.c
+++ b/configs/arm64/imx8qm.c
@@ -20,7 +20,7 @@ struct {
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[3];
+	union jailhouse_stream_id stream_ids[3];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -54,7 +54,6 @@ struct {
 					.type = JAILHOUSE_IOMMU_ARM_MMU500,
 					.base = 0x51400000,
 					.size = 0x40000,
-					.arm_mmu500.sid_mask = 0x7f80,
 				},
 			},
 
@@ -209,6 +208,17 @@ struct {
 	},
 
 	.stream_ids = {
-		0x11, 0x12, 0x13,
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x11,
+		},
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x12,
+		},
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x13,
+		},
 	},
 };
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
index 90a0ce4c..ace9cd3a 100644
--- a/configs/arm64/k3-j7200-evm-linux-demo.c
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -26,7 +26,7 @@ struct {
 	struct jailhouse_memory mem_regions[19];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[1];
+	union jailhouse_stream_id stream_ids[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
index c3ac331d..d0c8aee3 100644
--- a/configs/arm64/k3-j7200-evm.c
+++ b/configs/arm64/k3-j7200-evm.c
@@ -21,7 +21,7 @@ struct {
 	struct jailhouse_memory mem_regions[32];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[1];
+	union jailhouse_stream_id stream_ids[1];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 5b6aa82e..1b8b3c4c 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -27,7 +27,7 @@ struct {
 	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[2];
+	union jailhouse_stream_id stream_ids[2];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index ab13fedd..aa5b47a9 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -22,7 +22,7 @@ struct {
 	struct jailhouse_memory mem_regions[40];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[30];
+	union jailhouse_stream_id stream_ids[30];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index db65ae01..19be84ae 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -21,7 +21,7 @@ struct {
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[2];
+	union jailhouse_stream_id stream_ids[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -161,6 +161,13 @@ struct {
 	},
 
 	.stream_ids = {
-		0x870, 0x871
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x870,
+		},
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x871,
+		},
 	},
 };
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index bdcb04b3..1a5d29b3 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -23,7 +23,7 @@ struct {
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[8];
+	union jailhouse_stream_id stream_ids[3];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -147,6 +147,17 @@ struct {
 	},
 
 	.stream_ids = {
-		0x860, 0x861, 0x870, 0x871, 0x874, 0x875, 0x876, 0x877
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x860,
+		},
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x861,
+		},
+		{
+			.mmu500.mask = 0xf,
+			.mmu500.id = 0x870,
+		},
 	},
 };
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index d4b7529d..d306818e 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -1045,8 +1045,9 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int ret, sid;
+	int ret;
 	unsigned int n, s;
+	union jailhouse_stream_id sid;
 
 	if (!iommu_count_units())
 		return 0;
@@ -1057,7 +1058,7 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 			continue;
 
 		for_each_stream_id(sid, cell->config, s) {
-			ret = arm_smmu_init_ste(smmu, sid, cell->config->id);
+			ret = arm_smmu_init_ste(smmu, sid.id, cell->config->id);
 			if (ret)
 				return ret;
 		}
@@ -1076,7 +1077,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int sid;
+	union jailhouse_stream_id sid;
 	unsigned int n, s;
 
 	if (!iommu_count_units())
@@ -1088,7 +1089,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 			continue;
 
 		for_each_stream_id(sid, cell->config, s) {
-			arm_smmu_uninit_ste(smmu, sid, cell->config->id);
+			arm_smmu_uninit_ste(smmu, sid.id, cell->config->id);
 		}
 
 		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index df92fb7a..9c625c54 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -84,6 +84,10 @@
 #define SMR_VALID			(1 << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_ID_SHIFT			0
+/* Ignore upper bit in ID and MASK */
+#define SMR_GET_ID(smr)			((smr) & 0x7fff)
+/* Mask is already specified from bit 0 in the configuration */
+#define SMR_GET_MASK(smr)		((smr) & 0x7fff)
 
 /* Stream-to-Context Register */
 #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
@@ -152,7 +156,6 @@ struct arm_smmu_device {
 	unsigned long			pgshift;
 	u32				num_context_banks;
 	u32				num_mapping_groups;
-	u16				arm_sid_mask;
 	struct arm_smmu_smr		*smrs;
 };
 
@@ -360,7 +363,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
+static int arm_smmu_find_sme(u16 id, u16 mask, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
 	int free_idx = -EINVAL;
@@ -388,7 +391,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 		 * expect simply identical entries for this case, but there's
 		 * no harm in accommodating the generalisation.
 		 */
-		if ((smmu->arm_sid_mask & smrs[n].mask) == smmu->arm_sid_mask &&
+		if ((mask & smrs[n].mask) == mask &&
 		    !((id ^ smrs[n].id) & ~smrs[n].mask)) {
 			return n;
 		}
@@ -397,7 +400,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 		 * though, then there always exists at least one stream ID
 		 * which would cause a conflict, and we can't allow that risk.
 		 */
-		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | smmu->arm_sid_mask)))
+		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | mask)))
 			return -EINVAL;
 	}
 
@@ -409,7 +412,9 @@ static int arm_smmu_cell_init(struct cell *cell)
 	unsigned int vmid = cell->config->id;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_smr *smr;
-	unsigned int dev, n, sid;
+	unsigned int dev, n;
+	u16 sid, smask;
+	union jailhouse_stream_id fsid;
 	int ret, idx;
 
 	/* If no sids, ignore */
@@ -421,19 +426,22 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		smr = smmu->smrs;
 
-		for_each_stream_id(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(sid, smmu);
+		for_each_stream_id(fsid, cell->config, n) {
+			sid = SMR_GET_ID(fsid.mmu500.id);
+			smask = SMR_GET_MASK(fsid.mmu500.mask);
+
+			ret = arm_smmu_find_sme(sid, smask, smmu);
 			if (ret < 0)
 				return trace_error(ret);
 			idx = ret;
 
-			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
-			       sid, cell->config->name);
+			printk("Assigning SID 0x%x, Mask 0x%x to cell \"%s\"\n",
+			       sid, smask, cell->config->name);
 
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS, vmid);
 
 			smr[idx].id = sid;
-			smr[idx].mask = smmu->arm_sid_mask;
+			smr[idx].mask = smask;
 			smr[idx].valid = true;
 
 			arm_smmu_write_smr(smmu, idx);
@@ -449,14 +457,18 @@ static int arm_smmu_cell_init(struct cell *cell)
 }
 
 static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
-					     unsigned int sid, int idx)
+					     union jailhouse_stream_id fsid,
+					     int idx)
 {
-	unsigned int root_sid, n;
+	unsigned int n;
+	union jailhouse_stream_id rsid;
 
-	for_each_stream_id(root_sid, root_cell.config, n) {
-		if (sid == root_sid) {
-			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
-			       sid, root_cell.config->name);
+	for_each_stream_id(rsid, root_cell.config, n) {
+		if (fsid.id == rsid.id) {
+			printk("Assigning SID 0x%x Mask: 0x%x to cell \"%s\"\n",
+			       SMR_GET_ID(fsid.mmu500.id),
+			       SMR_GET_MASK(fsid.mmu500.mask),
+			       root_cell.config->name);
 
 			/* We just need to update S2CR, SMR can stay as is. */
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
@@ -471,7 +483,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
 {
 	int id = cell->config->id;
 	struct arm_smmu_device *smmu;
-	unsigned int dev, n, sid;
+	unsigned int dev, n;
+	u16 sid, smask;
+	union jailhouse_stream_id fsid;
 	int idx;
 
 	/* If no sids, ignore */
@@ -479,10 +493,16 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		return;
 
 	for_each_smmu(smmu, dev) {
-		for_each_stream_id(sid, cell->config, n) {
-			idx = arm_smmu_find_sme(sid, smmu);
-			if (idx < 0 ||
-			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
+		for_each_stream_id(fsid, cell->config, n) {
+			sid = SMR_GET_ID(fsid.mmu500.id);
+			smask = SMR_GET_MASK(fsid.mmu500.mask);
+
+			idx = arm_smmu_find_sme(sid, smask, smmu);
+			if (idx < 0)
+				continue;
+
+			/* return full stream ids */
+			if (arm_smmu_return_sid_to_root_cell(smmu, fsid, idx))
 				continue;
 
 			if (smmu->smrs) {
@@ -546,8 +566,6 @@ static int arm_smmu_init(void)
 			continue;
 
 		smmu = &smmu_device[num_smmu_devices];
-		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
-
 		smmu->base = paging_map_device(iommu->base, iommu->size);
 		if (!smmu->base) {
 			err = -ENOMEM;
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index 98c1fb5e..bbc633a0 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -444,7 +444,8 @@ int pvu_iommu_unmap_memory(struct cell *cell,
 
 void pvu_iommu_config_commit(struct cell *cell)
 {
-	unsigned int i, virtid;
+	unsigned int i;
+	union jailhouse_stream_id virtid;
 
 	if (pvu_count == 0 || !cell)
 		return;
@@ -459,10 +460,10 @@ void pvu_iommu_config_commit(struct cell *cell)
 			   cell->arch.iommu_pvu.ent_count);
 
 	for_each_stream_id(virtid, cell->config, i) {
-		if (virtid > MAX_VIRTID)
+		if (virtid.id > MAX_VIRTID)
 			continue;
 
-		pvu_iommu_program_entries(cell, virtid);
+		pvu_iommu_program_entries(cell, virtid.id);
 	}
 
 	cell->arch.iommu_pvu.ent_count = 0;
@@ -470,8 +471,9 @@ void pvu_iommu_config_commit(struct cell *cell)
 
 static int pvu_iommu_cell_init(struct cell *cell)
 {
-	unsigned int i, virtid;
+	unsigned int i;
 	struct pvu_dev *dev;
+	union jailhouse_stream_id virtid;
 
 	if (pvu_count == 0)
 		return 0;
@@ -484,10 +486,10 @@ static int pvu_iommu_cell_init(struct cell *cell)
 	dev = &pvu_units[0];
 	for_each_stream_id(virtid, cell->config, i) {
 
-		if (virtid > MAX_VIRTID)
+		if (virtid.id > MAX_VIRTID)
 			continue;
 
-		if (pvu_tlb_is_enabled(dev, virtid))
+		if (pvu_tlb_is_enabled(dev, virtid.id))
 			return -EINVAL;
 	}
 	return 0;
@@ -515,17 +517,18 @@ static int pvu_iommu_flush_context(u16 virtid)
 
 static void pvu_iommu_cell_exit(struct cell *cell)
 {
-	unsigned int i, virtid;
+	unsigned int i;
+	union jailhouse_stream_id virtid;
 
 	if (pvu_count == 0)
 		return;
 
 	for_each_stream_id(virtid, cell->config, i) {
 
-		if (virtid > MAX_VIRTID)
+		if (virtid.id > MAX_VIRTID)
 			continue;
 
-		pvu_iommu_flush_context(virtid);
+		pvu_iommu_flush_context(virtid.id);
 	}
 
 	cell->arch.iommu_pvu.ent_count = 0;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 472cb4bb..c94385b8 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -279,13 +279,18 @@ struct jailhouse_iommu {
 			__u64 tlb_base;
 			__u32 tlb_size;
 		} __attribute__((packed)) tipvu;
-
-		struct {
-			__u32 sid_mask;
-		} __attribute__((packed)) arm_mmu500;
 	};
 } __attribute__((packed));
 
+union jailhouse_stream_id {
+	__u32 id;
+	struct {
+		/* Note: both mask and id are only 15 bits wide */
+		__u16 mask;
+		__u16 id;
+	} __attribute__((packed)) mmu500;
+} __attribute__((packed));
+
 struct jailhouse_pio {
 	__u16 base;
 	__u16 length;
@@ -424,10 +429,11 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
 		 cell->num_pci_devices * sizeof(struct jailhouse_pci_device));
 }
 
-static inline const __u32 *
+static inline const union jailhouse_stream_id *
 jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
 {
-	return (const __u32 *)((void *)jailhouse_cell_pci_caps(cell) +
+	return (const union jailhouse_stream_id *)
+		((void *)jailhouse_cell_pci_caps(cell) +
 		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
 }
 
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201127114140.37179-1-andrea.bastoni%40tum.de.
