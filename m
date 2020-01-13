Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB34V6HYAKGQEWAAPIZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13a.google.com (mail-il1-x13a.google.com [IPv6:2607:f8b0:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A14138F86
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 11:48:17 +0100 (CET)
Received: by mail-il1-x13a.google.com with SMTP id o13sf7474862ilf.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 02:48:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578912496; cv=pass;
        d=google.com; s=arc-20160816;
        b=l3Vq3neXn1BhGr86W6mhrnSHk6cGjlir6gy4Q1JoeuGpY5xsdSXYblbthzAPKsr7Ea
         T6eWokSI3zvewm3AY8eg0zOuiA0h7uQRCBO1IQzcAt5FkSR6580F8qFf1b0+qny7ahca
         vYSP8ocCj/9DO2BeOSXcG0SzjSVTJwPM+fLI4p0rwwRddunHxJmNtw8beSMggv/hBXm9
         kFb3/DBqwutSZXwnaTVBLHXeSE3hFHSEhfl0fAHQUW1voJBreR6KioxXxQJr6tXZiVI7
         f1RnlhWrSwvIwZK2jaTJ0Ec+jrfn8zeRqe84i4t9Oc49WbJrMBmmcmoOa/FKYHLNdLc6
         y8zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=H68H8P6bXJdD8B41bo18gCd5BfYG41xlTaJqclNoNxk=;
        b=wo1TRe9gFEjugt83XPGpUbVBAC6Du1ggJWDzIJ+ayOb1tkuNJkmkxvcBS9G7+pdn5+
         MncKAcruH1pm8B9ghaqeY+DdwGfJEDfDtbfb6rnU9jgZOKz5trG361oEInKiTCy8T1G7
         OEXZUfuhIAr9AWUhECD8hYf9gSYh2RLYWNPZh+61qQ7bkuCrY88gRKSlmp8HNo+s4z3X
         5d9QtdTcNlxCXpNsEUF0YI83X+KC9YvqbFStmgK91rVGidJ0hKIv/cyHhs1FdlhcLj6S
         VbA+If6mfh2hfbhv5q5Y7t11/qHtUZ3h2pkljPycdTJ3CCPWZ58A282BSPUMnJqCTsfq
         7bMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FE3BYdlG;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=H68H8P6bXJdD8B41bo18gCd5BfYG41xlTaJqclNoNxk=;
        b=ZdIVxVmE/JfjqOrqoGki4O10OeyfxCZJLC17k92G9/yxeQ+whHsmcmwaFKnAXRMI7/
         4nx2WgQR1e67IVxa8AaPe57VjT+lSxj/c9LzDYWvZawLgzV9A/0ggyzeKhCxoex6aPB7
         qfWUX0nd4VePobHxRhv8jM/qFOTJ9P/DW/kbavyWAbxWrCfuhHthKuUNmG3TQtRT1Ncd
         UCBlGRArHZH5P+fIUietPc0Vw5sw+1VCY4V/36OqhCckFSWXxLgCFgZ4zwZlEl7SJeVy
         1kz+tcVTt61b5ENYcvflP4nxhqyuhqaqid+nOjVew9bWhBoDxmpPMPl3YLLL9IbdPVYl
         AInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H68H8P6bXJdD8B41bo18gCd5BfYG41xlTaJqclNoNxk=;
        b=hx5tZwegVUMZDoPJ86EvliZRcBFUSanAAkCRDt2tCpHrlpXfRzYnuG5JHGDSW3veLJ
         tMRWnjv/i2NobEuFnFi/vDLEMtpFeg/yi1kBaDbLB0Nz8Svk6AgTx7iR8TsgQZTE8GNd
         sYYfF1YE9aqS3oMLFoXCO0yAWCO9TlNARl76OGwe8TjpilEf/hJmg4bK9oE5u+tsO0BM
         pX9JdOqAG98PD/R9J4f4dTbhm7HJBZCPtjQpdB7vt43ZNt60ylFiX/pQoPD2bebTna1G
         AeWmOd0dy8MStqRUmzYqH3KUGH2r9mluqskEiGgx1yVOziL9z5teY+1n46+NzV4QOVOp
         4ZqA==
X-Gm-Message-State: APjAAAXDA71x21USo3xpNQ8V4Pu+vBi7tVpV4a/kiOfX1Bs0HOKDpOT7
	2pf5R95Vq8SbydWF3ouzZGA=
X-Google-Smtp-Source: APXvYqw/EoQ7iPORcJfMVNIFHcO0TLRZY5/oHT+lRKBjF9Hzz8NqCAj50z8GxqdmkLxgObFN7TMFfQ==
X-Received: by 2002:a92:489a:: with SMTP id j26mr14987010ilg.226.1578912496077;
        Mon, 13 Jan 2020 02:48:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5e:9807:: with SMTP id s7ls1749228ioj.13.gmail; Mon, 13 Jan
 2020 02:48:15 -0800 (PST)
X-Received: by 2002:a5d:8c8c:: with SMTP id g12mr12239350ion.23.1578912495637;
        Mon, 13 Jan 2020 02:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578912495; cv=none;
        d=google.com; s=arc-20160816;
        b=d8lRh6eQe0o6/5usVq6fJRenTC+GYERLbJQJ/AtmUQuF2wXk3dkLKRRsACMDiqGR19
         sE6OCYxQ1otMymfEl41S7m7AG8uDGEfudorUZkzl6CkuajEMit29RtaeOfJYWYafr6/5
         rC4imNIwK0ViB8jtOcKwRhWlagKI/7uUbKBrGb+/bdiFOezZH3AF36MCh97XEvsQcp5e
         Fc5nZuJOo3xwMZ0fqHSZ0cmjXeLLCE81UQLaT7MTXHixfV7phF36J2XdjmHr379tVUqI
         heF/rF+4c1IuQl1nPO7r+N2VsWdeFR4y7Ro0igrbmHlClY7phQmO0mUmRqb9yLMs0Waw
         Jiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=26kKbm357nKSSiv7KhIsz+QhqEr5yk+DMs+2VJlFt/U=;
        b=pT7tk3ohYNEWSHHKTQwuVWSNsBENQdCLB+zmvJeiZhAGpBztvyXB4nHVNjXCb1FW4N
         imAwGc8HGhjoW9bodqDvxnEFMlPW5aGiUA1iPcm0mi5XOblCOxdJ3eNh04i1DM5bIymW
         tRk8Y9fEtlg4HRkJqDOJseWoRr/hMHPQIq8oHMw5+clAu3Asfpcb+Wsoa7hAgGHBzwmy
         7dOmQW6zHgBIXgWrNRLstqlVpZcWHvWznkWpCHktyrXlZB4s3xX5yubfNabGDfRSYo8c
         ZzKyDb6NvIiECnW65M1GIqCW0u9+/nmzqhasuLtx8F4f5OXtkSh8PXgNoefFfzQf9jiw
         enmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FE3BYdlG;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id z7si463805ilz.1.2020.01.13.02.48.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DAmFSa043894;
	Mon, 13 Jan 2020 04:48:15 -0600
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DAmFIk106762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2020 04:48:15 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 04:48:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 04:48:14 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DAm9MI011219;
	Mon, 13 Jan 2020 04:48:13 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 2/5] configs: Move amd specific fields in separate struct
Date: Mon, 13 Jan 2020 16:16:44 +0530
Message-ID: <20200113104647.25884-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113104647.25884-1-nikhil.nd@ti.com>
References: <20200113104647.25884-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=FE3BYdlG;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

Create a union for all vendor specific fields and move the
amd specific fields in separate struct.
Also update the amd unit references of these fields.

This is to handle multiple iommu devices and their custom fields
separately.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v2:
    * Use named structs for amd specific fields
    * Update the references in the amd unit

 hypervisor/arch/x86/amd_iommu.c | 26 +++++++++++++-------------
 include/jailhouse/cell-config.h | 12 ++++++++----
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 2fc6d033..6161ccf8 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -448,14 +448,14 @@ static void amd_iommu_init_fault_nmi(void)
 		    &system_config->platform_info.x86.iommu_units[iommu->idx];
 
 		/* Disable MSI during interrupt reprogramming. */
-		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
+		pci_write_config(cfg->amd.bdf, cfg->amd.msi_cap + 2, 0, 2);
 
 		/*
 		 * Write new MSI capability block, re-enabling interrupts with
 		 * the last word.
 		 */
 		for (n = 3; n >= 0; n--)
-			pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 4 * n,
+			pci_write_config(cfg->amd.bdf, cfg->amd.msi_cap + 4 * n,
 					 msi_reg.raw[n], 4);
 	}
 
@@ -637,14 +637,14 @@ static int amd_iommu_init_pci(struct amd_iommu *entry,
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
 	    ((hi << 32) | lo) != (iommu->base | CAPS_IOMMU_ENABLE)) {
@@ -654,11 +654,11 @@ static int amd_iommu_init_pci(struct amd_iommu *entry,
 	}
 
 	/* Should be configured by BIOS, but we want to be sure */
-	pci_write_config(iommu->amd_bdf,
-			 iommu->amd_base_cap + CAPS_IOMMU_BASE_HI_REG,
+	pci_write_config(iommu->amd.bdf,
+			 iommu->amd.base_cap + CAPS_IOMMU_BASE_HI_REG,
 			 (u32)(iommu->base >> 32), 4);
-	pci_write_config(iommu->amd_bdf,
-			 iommu->amd_base_cap + CAPS_IOMMU_BASE_LOW_REG,
+	pci_write_config(iommu->amd.bdf,
+			 iommu->amd.base_cap + CAPS_IOMMU_BASE_LOW_REG,
 			 (u32)(iommu->base & 0xffffffff) | CAPS_IOMMU_ENABLE,
 			 4);
 
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
 
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 9b018de1..68446853 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -251,10 +251,14 @@ struct jailhouse_iommu {
 	__u64 base;
 	__u32 size;
 
-	__u16 amd_bdf;
-	__u8 amd_base_cap;
-	__u8 amd_msi_cap;
-	__u32 amd_features;
+	union {
+		struct {
+			__u16 bdf;
+			__u8 base_cap;
+			__u8 msi_cap;
+			__u32 features;
+		} __attribute__((packed)) amd;
+	};
 } __attribute__((packed));
 
 struct jailhouse_pio {
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200113104647.25884-3-nikhil.nd%40ti.com.
