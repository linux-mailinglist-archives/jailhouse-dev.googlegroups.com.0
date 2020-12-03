Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBP5JUT7AKGQEDYKNXUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8932CDB60
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 17:39:27 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id r16sf1169848eds.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 08:39:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607013567; cv=pass;
        d=google.com; s=arc-20160816;
        b=p1izXSX1tUTv7Gpo47YPykWNsmdGi7xGn9z92srmF+NdbxEorJQ0FRXuhMUw6Uk7Lc
         OyxRHXlPx6IlFtFXf1K/PRGKeSou4JMgwezHuiJuBYMKPM6zf8HieQmnB13zG1W+UoJv
         LF/ZF92NtX39TE0NpY2yyBdwUl3smRNEVh/c34fpSSv593rwKhqqkH9MaIq8l7RTguUv
         6nq1fQoteQxSLWa6OaJ+EPhhswB5L+ZrRVUGypmbMovHbJiCfvhVc0/Zg8DkZcIU2H/m
         NoJeJ8daErMRRP05GT/j9mISIjOIAuHXAM+Xu5EaJc7LAeFU9+Pry79kHBiP8Z8zJBLX
         D5ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=nhnYuEPoTtpR7mMdkyoF0MGhO2QfaLMobAbHuzCc4e8=;
        b=A7GbNkkNq0TqyVMbbo8ks9erL+bPOohrv/vr9MQdNev6M8bSbkSYyY7T1A+ggRUDwn
         xvJhILwPDK+ylqVGYGfeTsjliHwx3WTlRKlU5b/JvoeWGjLjlHUXLH4Qcl2ryInHHCyK
         PWeQ8LpnllScnheMaJzsWxYT85F4KVms7Xh0pyS0gm+rWncRjrRmQzfpyYI3ljY87hdD
         lrA4eu8TMM47VvFxDZ62cCU9NX67RexPzI2K8WOpDOCORcnw8eYwygY17LOghR5fXHFh
         3qIQAg9+893gc1/3cCTZvjfAG0ubMew/CTrTnfk2rx2WNk2Klko2de4Wu/BjUuloQLh8
         g8dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bbQ2pldS;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nhnYuEPoTtpR7mMdkyoF0MGhO2QfaLMobAbHuzCc4e8=;
        b=J/rovdKUOfzpjnxSiZQEINqWKHsNprGfqjKCRu1gtzJ/BZTvfMAgvnz+CDegWQgrom
         LfvKIr1jK/mNcL/37ELvupyCd2ZIuDMf+g6UbQ57U15bdJZuDJgculyOXlYbzXVjeuw3
         0n92O1GXc8hCWG1lLNoSqTPboDCY0PJgcDPEH6RZ1qZuMi+1fGknkdWZ8EakxR05LUFa
         DAwKiUesSZhBkOiv6//uR7WNW5hJTnrZKwVyeplvMHEevJ316I+ti+uaGpDkpKVuj6Xl
         iY2wBjwAywnY4nstDe0mvHCvhJlgG0wp9HsqIucB7oOFR7MUrz4Hy/POgHJdAXOtZqPn
         DB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nhnYuEPoTtpR7mMdkyoF0MGhO2QfaLMobAbHuzCc4e8=;
        b=PxbcT+wjfBZzl+fxVBNwvyAQHyLwUaQDk9SbelmNFKDMgO5FFNG/LPZck6W/ImybSG
         r2au+XodUtOJ3OYXAU6ygyjXyWvuhFMGM+X0WbZ87t+7ALYncDPNbUvEWb7nL8Bcm85n
         gj1Zpn0c+ruFYf6QlfOHlD3JqKMymX/XVEtlzKULn+NrfJFJVzYB7rpdXZytFE8av8iK
         KPa7snnJ/yYe0LyLo0KMb0iT6E+Z03h1weKEFE2+vi8YfiNGj+IlhYe/rKESky7/EhND
         ubWEoWDnegn+Wj3Ui5J0HOIVjkiNBHaXNyqADXG61qsOlQokp0n2ZIhUWttLSd+4bIOq
         BaQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532yo1gVcW9GI7W1FEnCjKwa6m28AmSczNL/LPVb8/FeftIB0ien
	FbHcLt+auees7P7H4c30wgc=
X-Google-Smtp-Source: ABdhPJw1eHvL7c6UU8i4PXlLyzjnoln1iCXiSVIjg8dfQd21o2aBeYj4f3Tr67h6lQkcMnQbQH91Vw==
X-Received: by 2002:a50:c406:: with SMTP id v6mr841406edf.367.1607013567530;
        Thu, 03 Dec 2020 08:39:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls2094204edt.3.gmail; Thu, 03 Dec
 2020 08:39:26 -0800 (PST)
X-Received: by 2002:a50:955b:: with SMTP id v27mr3550322eda.324.1607013566403;
        Thu, 03 Dec 2020 08:39:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607013566; cv=none;
        d=google.com; s=arc-20160816;
        b=Pe8HgDotCm2peC6bsRkE3bb5/6XSxWC0y/vXlJ1G7XKHDFaZmv+xSIXr8vhThOjuA1
         +1+R2DRbgkvGjEzNc7oAUs4HHny+QpGHr1kXGW+BxE4akOuJ3HmAR+loAvnyQRRyU8gj
         BUNFEF1cN4c+A47smvJDHKyq94MnTbvi5qF/Yk07/7OgC6CtvOMEx5b3fD2lQsQ44bHY
         VH6uvQl/KU+7oK1oqgKYSUIcU2nX/FquHPhdZvLlmtxCM9RJJ5WPJ7mgOaB6WCxc0Iqa
         tTnJiXm3x8aUecu3f9rjrWVOlXcvUNsuMdq6xFWlNHpjHM9YwXtbKB0ap6NO2DW9czLB
         GHQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=wQ9pPXxeXEM27zrrp0UaZumBa/r5198RuUe+4lONsqY=;
        b=Bt1/5XcNTFc6VRvEnj+ZebFRegM/UvtLDB2J3rCsW6RfUEA/0eh3HsCA+VZvXypuRK
         2phgn8h9SWJl6u1LRZcAcnvxcscQCRPf6xSxt8hdL57v24LX9blgZMOjnz0ZNKTfpWl3
         EdO0Yn68m2sDtRzV5gmCewhzVxrF1910rSGrb7rW0o5v1pyGBiLdgSoREDj0pNj16AQh
         AsEiIbYtV3DnDH8hFRWAWEMWU9yIb+t4JfW4DYT3oPQS4+QVLLQzPtnBBKILXgLXtVAC
         Fk5pN/KY3Tww2IDFqA0913ITDfIntUNoBv1w1kiSiqVFXw33MOBDADJJhMl0MYe6ZFV0
         IamA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bbQ2pldS;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id z13si50987ejb.1.2020.12.03.08.39.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 08:39:26 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cn1l16gn1zyWj;
	Thu,  3 Dec 2020 17:39:25 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id AF8CDePCuyUO; Thu,  3 Dec 2020 17:39:25 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cn1l03t0qzyWf;
	Thu,  3 Dec 2020 17:39:24 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	nikhil.nd@ti.com,
	peng.fan@nxp.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v4 1/2] arm64, configs: SMMUv2: Separate stream ID's mask and id
Date: Thu,  3 Dec 2020 17:39:13 +0100
Message-Id: <20201203163914.54762-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=bbQ2pldS;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
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
- for the SMMUv2, provide an explicit mask_out + ID.
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
 include/jailhouse/cell-config.h         | 21 +++++---
 12 files changed, 117 insertions(+), 55 deletions(-)

diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
index f13ca7bc..0d2d91c9 100644
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
+			.mmu500.id = 0x10,
+			.mmu500.mask_out = 0x7f8,
+		},
 	},
 };
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index d63c73cf..00f5c402 100644
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
+			.mmu500.id = 0x11,
+			.mmu500.mask_out = 0x7f8,
+		},
+		{
+			.mmu500.id = 0x12,
+			.mmu500.mask_out = 0x7f8,
+		},
+		{
+			.mmu500.id = 0x13,
+			.mmu500.mask_out = 0x7f8,
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
index db65ae01..93e2ee83 100644
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
+			.mmu500.id = 0x870,
+			.mmu500.mask_out = 0x0,
+		},
+		{
+			.mmu500.id = 0x871,
+			.mmu500.mask_out = 0x0,
+		},
 	},
 };
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index bdcb04b3..492dc566 100644
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
+			.mmu500.id = 0x860,
+			.mmu500.mask_out = 0x0,
+		},
+		{
+			.mmu500.id = 0x861,
+			.mmu500.mask_out = 0x0,
+		},
+		{
+			.mmu500.id = 0x870,
+			.mmu500.mask_out = 0xf,
+		},
 	},
 };
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index d4b7529d..5a76a68d 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -1045,8 +1045,9 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int ret, sid;
+	union jailhouse_stream_id sid;
 	unsigned int n, s;
+	int ret;
 
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
index df92fb7a..7869b66b 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -84,6 +84,10 @@
 #define SMR_VALID			(1 << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_ID_SHIFT			0
+/* Ignore upper bit in ID and MASK */
+#define SMR_GET_ID(smr)			((smr) & BIT_MASK(14, 0))
+/* Mask is already specified from bit 0 in the configuration */
+#define SMR_GET_MASK(smr)		((smr) & BIT_MASK(14, 0))
 
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
+	union jailhouse_stream_id fsid;
+	unsigned int dev, n;
+	u16 sid, smask;
 	int ret, idx;
 
 	/* If no sids, ignore */
@@ -421,19 +426,22 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		smr = smmu->smrs;
 
-		for_each_stream_id(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(sid, smmu);
+		for_each_stream_id(fsid, cell->config, n) {
+			sid = SMR_GET_ID(fsid.mmu500.id);
+			smask = SMR_GET_MASK(fsid.mmu500.mask_out);
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
+			printk("Assigning SID 0x%llx Mask: 0x%llx to cell \"%s\"\n",
+			       SMR_GET_ID(fsid.mmu500.id),
+			       SMR_GET_MASK(fsid.mmu500.mask_out),
+			       root_cell.config->name);
 
 			/* We just need to update S2CR, SMR can stay as is. */
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
@@ -471,7 +483,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
 {
 	int id = cell->config->id;
 	struct arm_smmu_device *smmu;
-	unsigned int dev, n, sid;
+	union jailhouse_stream_id fsid;
+	unsigned int dev, n;
+	u16 sid, smask;
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
+			smask = SMR_GET_MASK(fsid.mmu500.mask_out);
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
index 98c1fb5e..5da85b5c 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -444,7 +444,8 @@ int pvu_iommu_unmap_memory(struct cell *cell,
 
 void pvu_iommu_config_commit(struct cell *cell)
 {
-	unsigned int i, virtid;
+	union jailhouse_stream_id virtid;
+	unsigned int i;
 
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
@@ -470,7 +471,8 @@ void pvu_iommu_config_commit(struct cell *cell)
 
 static int pvu_iommu_cell_init(struct cell *cell)
 {
-	unsigned int i, virtid;
+	union jailhouse_stream_id virtid;
+	unsigned int i;
 	struct pvu_dev *dev;
 
 	if (pvu_count == 0)
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
+	union jailhouse_stream_id virtid;
+	unsigned int i;
 
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
index 472cb4bb..6b54e34b 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -279,13 +279,21 @@ struct jailhouse_iommu {
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
+		/* Note: both mask_out and id are only 15 bits wide. */
+		__u16 id;
+		/* Mask out irrelevant bits in id:
+		 * if mask_out[i] == 1, then id[i] is ignored.
+		 */
+		__u16 mask_out;
+	} __attribute__((packed)) mmu500;
+} __attribute__((packed));
+
 struct jailhouse_pio {
 	__u16 base;
 	__u16 length;
@@ -424,10 +432,11 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201203163914.54762-1-andrea.bastoni%40tum.de.
