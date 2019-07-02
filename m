Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBUWX5XUAKGQEANNQBZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA15D1D0
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:36:03 +0200 (CEST)
Received: by mail-pg1-x539.google.com with SMTP id d3sf9719674pgc.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:36:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562078162; cv=pass;
        d=google.com; s=arc-20160816;
        b=U4BK8b+a/e95W6FsoMAcJrDb857uSVzuLS8iQL9XQyPV7J/7kyBGih8wcyZ8s0pG6f
         kRaI6CWJgOVsQfltEPGPQ4ykRpfADCrIs0zAiFQ2jDINARRROdMhdGV6LVUtWUrlfXuv
         qOTedIKXtfRlacTAQpyz2Y5StbxUE6I81fZ1HstqgIozKMazr4+9ifeiQqvzrmlxzOUL
         1Ndp2FHL5yaDacOtJotAW32IrTVakCxfpJJ6pATn6FeAxX8DoktIW2g5dzDFcmVHie5E
         CS6QS59iMYwrw+lYKJ8VmMTlVCbsHeancMx0OmXKrzE4/Z58VK6KrSNFijusNqDiy0O5
         n35g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=htavd280lJTBxvJUWkLx4BzP39DBSPtz5rwceZdww0k=;
        b=isemDiQqGe7EHcpMCl2/MgQNsSWRwxPQ/Yzkdj0FYkkcdHCu8znmFt/S/6CE5eyvX2
         TaOw2PmjtNKYStn+R9p4bL7dVNAMEVM0eCJ5MFEjtP5DfeY7CkEAHPawGsdNPOzShm5A
         I/813J3Kj6j2eG4SuiufGHPwD4dvdesdyk1d9qx5Wi6DUd3+QiV83S2ZIV7JBLnwi9zx
         IIRSNsMbvzfp17hGt+UTX79cZ/0bQhAnovEI1/bdIKsorIW2TMG8MzFLhO5cfbiPn4oi
         7hLpE6fbUiCSRKuqpYHziWJhoHcY+NYFcP2Rz0vBxz/YpsfrAKLgkIZehtCv799swkBE
         b4pg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vVRRCTJI;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=htavd280lJTBxvJUWkLx4BzP39DBSPtz5rwceZdww0k=;
        b=s56Q/ARDciYGqsnDFrtF0bsea8jBznsOkmTP5Br9rNq++GRqduVDOj4KkRbpkoSm12
         4gbMNr6L5CfCXI0dE28yidjrhTgOr3TjMbSqHCR0wV2hPjiM1x1xXJZPuwmIgwLsCqd1
         hC3xVQfVt6bdBvP2d+BfdTge3hsn4MsD4vPNIKs0fxkIE0gzcw8bWZRBjU2Z71rW+bKg
         PAXOXPqrK6Nc8mWDz7DKHrGTzFUblqflM/b5zpzoUR4/Mk5TPljftTN8hE5F8YvnvoTe
         V7t/zxIAEXa8IUw6NPPGTrOyOUFAMjNN+PPxaT+r+QCouJIkdt9RV8WszFudqjiQgoDM
         Rvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=htavd280lJTBxvJUWkLx4BzP39DBSPtz5rwceZdww0k=;
        b=kGhjIDzIblh9Wy0R07W/DHTUK/K1T5Zjapodfdkux3dRx8RLPZvPBdA1+TvmrvQabk
         rLt7QQo4S0mRGgW4HTjq93nkfJR1bIR3zgm3aH5J9+Zew1JzKmjObKh9QeID+CsPabLz
         vo/0ga29LzkqgzhsMtLL/XVMREPyvxYTkMMetcAPpnCcUJf7TzRvB6ndaZX6Mk7As6Mr
         XGUTl+8Z3G7Y+R3uQa/VjImuvGxPizRVT7b8A402k19FBBhx5zv73migggQs2+mhJl/I
         l+MrI5MTgRPScIuLbOd7rU4a4FwYfWLDptULsciXNSGK+wBs8475t6IfzmJi4BWYqKaX
         ky4A==
X-Gm-Message-State: APjAAAU409kw2B4HS0G5a0LTRhdC5AkM6NGKrxfkjqiHThTf1S4YYIxQ
	QmJtoMvqtAylOrhXG9q6mlU=
X-Google-Smtp-Source: APXvYqwBLLY3B1520TMVFEqdNeVv+FZNdyKv8ctlDpo+4qXhimZ3/n2zVGfMTQF/jPBPU3l+ON4+aQ==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id a14mr5917373pju.124.1562078162606;
        Tue, 02 Jul 2019 07:36:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:63c1:: with SMTP id x184ls2570353pfb.5.gmail; Tue, 02
 Jul 2019 07:36:02 -0700 (PDT)
X-Received: by 2002:a63:3481:: with SMTP id b123mr31191268pga.358.1562078162100;
        Tue, 02 Jul 2019 07:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078162; cv=none;
        d=google.com; s=arc-20160816;
        b=DyvqImqd4cw16qTUIj3RIvyz5lr7bDHABN9Pag9AMkEfe4XsuebdQHnlVnP+z/iEML
         2UWwYerqq6iDZK/z5fNHGpTg1uhcs9P5+Sn4JRITnc5OELmVQDaq/5xNKIGexteNjVsn
         H+ZKe80JP0nSPzSUHXyBK5Yd8XzxEkVI0zNyPE57yCC/dXJOcXwJEEGE/egZQ5SzbJwx
         gF9N0Pa5dpatU9igwjRGzJVZL1tu8d6PGhYT84suYjp8BRS+Pzc6bbm1jVxKY4J92mRF
         j/EUQcrHre94CdA9Up7aWTv2bMy+y14aUqzwHP4k+0aTsNsO0vlwj5w6gubhfnd9e7D1
         qjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DKEyda2M71Mr4uhdfSJMJQT0NjZ4uOwiNuD4UEaqVJ4=;
        b=s1L7IFHphGQND/PaM4yumAsCU7FtqoeuVLAuPV1njF1MuOKVAF5deilflvxr7sTzSK
         yTxU/Yy6fZ4m9vog2Bx8YsfTbCYbFvzNALsBe+yS7C6hi4bCzc10bIiawT5f+Dy0TvZH
         //K/Z7yRJ3LLQV6PZTgoldf4SpKyUHHlfjIArAj0Z9Hx4HIW9xGnSb6v+vdqlp7TeYfd
         Huo359kM5qB9hsosq7fAVEISFQTebPzczoGiog6gpAV6s5BAD8VkTOW8lTh8g76+zWCm
         aLb9wYkvxJgK4YnuLzHEcrLQYv+sFuh1t5luL0Yl14QedJ4nofQSkzPPEoeOqx63/k/S
         RpMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vVRRCTJI;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id ck6si568519plb.4.2019.07.02.07.36.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62Ea1us084299;
	Tue, 2 Jul 2019 09:36:01 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62Ea1eF079684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 09:36:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:36:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:36:01 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EZtHX022917;
	Tue, 2 Jul 2019 09:35:59 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH 1/6] iommu: x86: Generalize iommu definition
Date: Tue, 2 Jul 2019 20:06:02 +0530
Message-ID: <20190702143607.16525-2-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702143607.16525-1-p-yadav1@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=vVRRCTJI;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Right now, jailhouse only supports iommu for x86.
Generalize the data structures to support iommus of different types

Assumption is that each jailhouse_system can define iommu
instances of different types. Extend the jailhouse_iommu
to add type info and add a type specific struct

Move the AMD specific details in the jailhouse_iommu_amd and Intel
specific details in jailhouse_iommu_intel and update the code
accordingly.
Update the x86 config files which to reflect updated data
structure and define the new type field.
No code changes, just replace iommu->xyz with iommu->amd.xyz or
iommu->intel.xyz

Also get rid of the iommu_count_units and implement
simple logic to process iommus of the desired type.

[p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
VT-D]

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
 configs/x86/f2a88xm-hd3.c               | 13 ++++---
 configs/x86/qemu-x86.c                  |  5 ++-
 hypervisor/arch/x86/amd_iommu.c         | 52 +++++++++++++------------
 hypervisor/arch/x86/include/asm/iommu.h |  2 -
 hypervisor/arch/x86/iommu.c             | 10 -----
 hypervisor/arch/x86/vtd.c               | 17 ++++----
 include/jailhouse/cell-config.h         | 28 ++++++++++---
 7 files changed, 70 insertions(+), 57 deletions(-)

diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index 315d0e29..026f974a 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -50,12 +50,13 @@ struct {
 				.pm_timer_address = 0x808,
 				.iommu_units = {
 					{
-						.base = 0xfeb80000,
-						.size = 0x80000,
-						.amd_bdf = 0x02,
-						.amd_base_cap = 0x40,
-						.amd_msi_cap = 0x54,
-						.amd_features = 0x80048824,
+						.type = JAILHOUSE_IOMMU_AMD,
+						.amd.base = 0xfeb80000,
+						.amd.size = 0x80000,
+						.amd.bdf = 0x02,
+						.amd.base_cap = 0x40,
+						.amd.msi_cap = 0x54,
+						.amd.features = 0x80048824,
 					},
 				},
 			},
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index fdfa8915..549deed9 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -50,8 +50,9 @@ struct {
 				.vtd_interrupt_limit = 256,
 				.iommu_units = {
 					{
-						.base = 0xfed90000,
-						.size = 0x1000,
+						.type = JAILHOUSE_IOMMU_INTEL,
+						.intel.base = 0xfed90000,
+						.intel.size = 0x1000,
 					},
 				},
 			},
diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 02712571..999590cd 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -448,14 +448,14 @@ static void amd_iommu_init_fault_nmi(void)
 		    &system_config->platform_info.x86.iommu_units[iommu->idx];
 
 		/* Disable MSI during interrupt reprogramming. */
-		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
+		pci_write_config(cfg->amd.bdf, cfg->amd.msi_cap + 2 , 0, 2);
 
 		/*
 		 * Write new MSI capability block, re-enabling interrupts with
 		 * the last word.
 		 */
 		for (n = 3; n >= 0; n--)
-			pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 4 * n,
+			pci_write_config(cfg->amd.bdf, cfg->amd.msi_cap + 4 * n,
 					 msi_reg.raw[n], 4);
 	}
 
@@ -633,37 +633,37 @@ static int amd_iommu_init_pci(struct amd_iommu *entry,
 	u64 caps_header, hi, lo;
 
 	/* Check alignment */
-	if (iommu->size & (iommu->size - 1))
+	if (iommu->amd.size & (iommu->amd.size - 1))
 		return trace_error(-EINVAL);
 
 	/* Check that EFR is supported */
-	caps_header = pci_read_config(iommu->amd_bdf, iommu->amd_base_cap, 4);
+	caps_header = pci_read_config(iommu->amd.bdf, iommu->amd.base_cap, 4);
 	if (!(caps_header & CAPS_IOMMU_EFR_SUP))
 		return trace_error(-EIO);
 
-	lo = pci_read_config(iommu->amd_bdf,
-			     iommu->amd_base_cap + CAPS_IOMMU_BASE_LOW_REG, 4);
-	hi = pci_read_config(iommu->amd_bdf,
-			     iommu->amd_base_cap + CAPS_IOMMU_BASE_HI_REG, 4);
+	lo = pci_read_config(iommu->amd.bdf,
+			     iommu->amd.base_cap + CAPS_IOMMU_BASE_LOW_REG, 4);
+	hi = pci_read_config(iommu->amd.bdf,
+			     iommu->amd.base_cap + CAPS_IOMMU_BASE_HI_REG, 4);
 
 	if (lo & CAPS_IOMMU_ENABLE &&
-	    ((hi << 32) | lo) != (iommu->base | CAPS_IOMMU_ENABLE)) {
+	    ((hi << 32) | lo) != (iommu->amd.base | CAPS_IOMMU_ENABLE)) {
 		printk("FATAL: IOMMU %d config is locked in invalid state.\n",
 		       entry->idx);
 		return trace_error(-EPERM);
 	}
 
 	/* Should be configured by BIOS, but we want to be sure */
-	pci_write_config(iommu->amd_bdf,
-			 iommu->amd_base_cap + CAPS_IOMMU_BASE_HI_REG,
-			 (u32)(iommu->base >> 32), 4);
-	pci_write_config(iommu->amd_bdf,
-			 iommu->amd_base_cap + CAPS_IOMMU_BASE_LOW_REG,
-			 (u32)(iommu->base & 0xffffffff) | CAPS_IOMMU_ENABLE,
+	pci_write_config(iommu->amd.bdf,
+			 iommu->amd.base_cap + CAPS_IOMMU_BASE_HI_REG,
+			 (u32)(iommu->amd.base >> 32), 4);
+	pci_write_config(iommu->amd.bdf,
+			 iommu->amd.base_cap + CAPS_IOMMU_BASE_LOW_REG,
+			 (u32)(iommu->amd.base & 0xffffffff) | CAPS_IOMMU_ENABLE,
 			 4);
 
 	/* Allocate and map MMIO space */
-	entry->mmio_base = paging_map_device(iommu->base, iommu->size);
+	entry->mmio_base = paging_map_device(iommu->amd.base, iommu->amd.size);
 	if (!entry->mmio_base)
 		return -ENOMEM;
 
@@ -687,9 +687,9 @@ static int amd_iommu_init_features(struct amd_iommu *entry,
 		return trace_error(-EIO);
 
 	/* Figure out if hardware events are supported. */
-	if (iommu->amd_features)
+	if (iommu->amd.features)
 		entry->he_supported =
-			iommu->amd_features & ACPI_REPORTING_HE_SUP;
+			iommu->amd.features & ACPI_REPORTING_HE_SUP;
 	else
 		entry->he_supported = efr & AMD_EXT_FEAT_HE_SUP;
 
@@ -777,20 +777,24 @@ static int amd_iommu_init(void)
 {
 	struct jailhouse_iommu *iommu;
 	struct amd_iommu *entry;
-	unsigned int n;
+	unsigned int i;
 	int err;
 
-	iommu = &system_config->platform_info.x86.iommu_units[0];
-	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
+
+		iommu = &system_config->platform_info.x86.iommu_units[i];
+		if (iommu->type != JAILHOUSE_IOMMU_AMD)
+			continue;
+
 		entry = &iommu_units[iommu_units_count];
 
-		entry->idx = n;
+		entry->idx = i;
 
 		/* Protect against accidental VT-d configs. */
-		if (!iommu->amd_bdf)
+		if (!iommu->amd.bdf)
 			return trace_error(-EINVAL);
 
-		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->base, iommu->size);
+		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->amd.base, iommu->amd.size);
 
 		/* Initialize PCI registers and MMIO space */
 		err = amd_iommu_init_pci(entry, iommu);
diff --git a/hypervisor/arch/x86/include/asm/iommu.h b/hypervisor/arch/x86/include/asm/iommu.h
index 848feb77..92051673 100644
--- a/hypervisor/arch/x86/include/asm/iommu.h
+++ b/hypervisor/arch/x86/include/asm/iommu.h
@@ -23,8 +23,6 @@
 
 extern unsigned int fault_reporting_cpu_id;
 
-unsigned int iommu_count_units(void);
-
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem);
 int iommu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/iommu.c b/hypervisor/arch/x86/iommu.c
index 68ca323f..aeaf21e5 100644
--- a/hypervisor/arch/x86/iommu.c
+++ b/hypervisor/arch/x86/iommu.c
@@ -15,16 +15,6 @@
 
 unsigned int fault_reporting_cpu_id;
 
-unsigned int iommu_count_units(void)
-{
-	unsigned int units = 0;
-
-	while (units < JAILHOUSE_MAX_IOMMU_UNITS &&
-	       system_config->platform_info.x86.iommu_units[units].base)
-		units++;
-	return units;
-}
-
 struct public_per_cpu *iommu_select_fault_reporting_cpu(void)
 {
 	struct public_per_cpu *target_data;
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index a43632f5..1e817b36 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -207,7 +207,7 @@ static bool dmar_units_initialized;
 
 static unsigned int vtd_mmio_count_regions(struct cell *cell)
 {
-	return cell == &root_cell ? iommu_count_units() : 0;
+	return cell == &root_cell ? JAILHOUSE_MAX_IOMMU_UNITS : 0;
 }
 
 static unsigned int inv_queue_write(void *inv_queue, unsigned int index,
@@ -959,7 +959,7 @@ static int vtd_init_ir_emulation(unsigned int unit_no, void *reg_base)
 
 	root_cell.arch.vtd.ir_emulation = true;
 
-	base = system_config->platform_info.x86.iommu_units[unit_no].base;
+	base = system_config->platform_info.x86.iommu_units[unit_no].intel.base;
 	mmio_region_register(&root_cell, base, PAGE_SIZE,
 			     vtd_unit_access_handler, unit);
 
@@ -1008,9 +1008,7 @@ static int vtd_init(void)
 
 	int_remap_table_size_log2 = n;
 
-	units = iommu_count_units();
-	if (units == 0)
-		return trace_error(-EINVAL);
+	units = JAILHOUSE_MAX_IOMMU_UNITS;
 
 	dmar_reg_base = page_alloc(&remap_pool, units * PAGES(DMAR_MMIO_SIZE));
 	if (!dmar_reg_base)
@@ -1022,11 +1020,13 @@ static int vtd_init(void)
 
 	for (n = 0; n < units; n++) {
 		unit = &system_config->platform_info.x86.iommu_units[n];
+		if (unit->type != JAILHOUSE_IOMMU_INTEL)
+			continue;
 
 		reg_base = dmar_reg_base + n * DMAR_MMIO_SIZE;
 
-		err = paging_create(&hv_paging_structs, unit->base, unit->size,
-				    (unsigned long)reg_base,
+		err = paging_create(&hv_paging_structs, unit->intel.base,
+				    unit->intel.size, (unsigned long)reg_base,
 				    PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
 				    PAGING_NON_COHERENT);
 		if (err)
@@ -1036,7 +1036,8 @@ static int vtd_init(void)
 		if (version < VTD_VER_MIN || version == 0xff)
 			return trace_error(-EIO);
 
-		printk("DMAR unit @0x%llx/0x%x\n", unit->base, unit->size);
+		printk("DMAR unit @0x%llx/0x%x\n", unit->intel.base,
+			unit->intel.size);
 
 		caps = mmio_read64(reg_base + VTD_CAP_REG);
 		if (caps & VTD_CAP_SAGAW39)
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 5739f332..f492e409 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -196,13 +196,31 @@ struct jailhouse_pci_capability {
 
 #define JAILHOUSE_MAX_IOMMU_UNITS	8
 
-struct jailhouse_iommu {
+enum jailhouse_iommu_type {
+	JAILHOUSE_IOMMU_AMD,
+	JAILHOUSE_IOMMU_INTEL,
+};
+
+struct jailhouse_iommu_amd {
+	__u64 base;
+	__u32 size;
+	__u16 bdf;
+	__u8 base_cap;
+	__u8 msi_cap;
+	__u32 features;
+};
+
+struct jailhouse_iommu_intel {
 	__u64 base;
 	__u32 size;
-	__u16 amd_bdf;
-	__u8 amd_base_cap;
-	__u8 amd_msi_cap;
-	__u32 amd_features;
+};
+
+struct jailhouse_iommu {
+	__u32 type;
+	union {
+		struct jailhouse_iommu_amd amd;
+		struct jailhouse_iommu_intel intel;
+	};
 } __attribute__((packed));
 
 #define JAILHOUSE_SYSTEM_SIGNATURE	"JHSYST"
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190702143607.16525-2-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
