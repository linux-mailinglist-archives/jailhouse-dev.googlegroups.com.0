Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIF5VDUQKGQEXID5EFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 5246B67B9B
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id b67sf5009443wmd.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=d7/75wEEt6XgzwXn54hYnEGev1MJuRtsfp+GLREj7J6m63EWopNUUNb5usQnFaka6B
         /rG5zaVgXbagVlJpRpQ2nwwWuLm8CvtddvhItyprZ512tVjAy+iF//D/Lft+lMhhFHAd
         Lw47htTbuSqt/y1JItNXdjfE+IytizoP9wayrp4kjhJyHoFZQkDmodA0UU4aDAmSuVE2
         3oCb4/8C75KKvmBIbJpzM9b26bfGil9oU4pkWvMLruEeIxXq7gIR5Vi1GY9TDfgBGuC8
         HZHelHvl5/VlD9AJdldzzXjFVX1PLzJ6L2Mnnfr1QU6JfSOTiV4SX+SqEr8HNQ15xfFe
         MSRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KtvK17x/cSQy38mHD1qFFjdc8E2fK+fg7N9KX6HTQik=;
        b=PZ5NBan9O3fOO/aDCY5Tq1cmAr/rNqBPm8QwZB2zk4F+KjD8OuCDh7rqQ+/wMPBL0i
         /6o2UXcdxbDiE8dKaf7+hlv9UcfklOO2I0wuV0ZVzQ8vD4Vb2RmjXINUNe6STUYK1UzS
         IO72ejmSA8UzmHKvW1XTRHqNCE0I+Jo14sFz+9QX+E9PDR7CU67+uAN6FIp1I5it6aRT
         setkjFvhJUr5sdtiyEidLMPaNLys51wk9eavlX93z0Bj8VnGwwpu7hluDZgWaXZrK/iv
         ANmi9vdbr5xJ7ZlYolyrPqqPrdW3+ExvUp5MpYzoaZr6XeM45A6hOxRH1XspN7HXuQwb
         h/2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KtvK17x/cSQy38mHD1qFFjdc8E2fK+fg7N9KX6HTQik=;
        b=AFQ1umDI/vPy7UMZozjf2YlqxquDn/c4SsH5ATd8wDAgjqXV48BflQPLvQwc6BmTG0
         5s3KlJdTWjHNSetoEF3fm8/O7kMB9W3lLv6k/Pu3Z6MH3mpcaHmwc5MvswWgFVu0dUYw
         xjCwv5NXxbLQIHjXw7kAelLmQZpXKplNBTvbqasGVrBKgcgJEoGpV5yMgZ41q+IjLVgJ
         lJM/zREvkThqlejlQgTQU/j45sTAcIFUIQNWqoMGmPIZYo6H5YnlCHmWDkNZN9WfA6Uf
         04Q9qjJYIVoVxLOMVDXHVyVtAXt8jgMImOtytr9HCCsLbjcog37ca6G1/Qrp0L3b2QMC
         iB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KtvK17x/cSQy38mHD1qFFjdc8E2fK+fg7N9KX6HTQik=;
        b=rRCoK0yiUo0Uh976C3YKwajJ7q+c3I/4rX+c7iaIdudojZ8P+5CdMLcHXnkhVCxMj8
         96TqJCR7XfDLZtzukr7SJ5/ozta/mM+d3Z+QFc4snhWP7EGCLJWmTOjdXszcU1Xk/IPM
         /UQG38btC4HWbhMo19OaebhltnnruI5zJUFQsWzUGCxXF3s/Jb8IR/+k9XtIrCmxd7WF
         AN2SO3vSiEbEGCPlThqzKVn3/XWsB5Vsy4lp2ZStttesZZ31j1EHT/4DGxGgfg78MMrG
         H7vAqhaqIbDDwYnDMOFBE5T6H5RKvvoId+4L5dG3YzdoCrbHu/acHnLKFRy1uDsjsyiR
         35Dg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrDCOpI1Woglqfk2kMaVNh56UDx+wORdXJlcQugL/KnsEeVJ7M
	T4LIg5vKM1iyxvpLwBsAWzk=
X-Google-Smtp-Source: APXvYqwn1yF/CuYFFJD/VnIptgH/Oi/4mZRLOPRfHKMb+Ic2LGvCNm5mOyYckXKdJc5YSnImU4L8xA==
X-Received: by 2002:a1c:a01a:: with SMTP id j26mr15659935wme.112.1563041441047;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c05a:: with SMTP id u26ls4844753wmc.4.canary-gmail; Sat,
 13 Jul 2019 11:10:40 -0700 (PDT)
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr15834662wma.120.1563041440190;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041440; cv=none;
        d=google.com; s=arc-20160816;
        b=euu+P/Q2d9IjgsVTQ0GqMNDnNKbHYWJFGLrF3cJhUlTpn34u/ZwAAAB3GQhzlRgyhK
         m30DPY8vKUSPl00EMoVahqVDgvm+MztapKCf94XFxOY9lgiOSNRC8XXkj4nfG6SCUL6V
         clF8cwdKc4faxj+fXcN+Jf4qsjB0CMIX0zDmhqeeNPWC0aQ1Jvv6JdIRQ5QV8Eze9f5k
         4WW8kf1t6tjvOL/Cau3g3HT1ymHJW0JjJemCg3jWtMTplv4GGdwkT3zPQsXvtR5IaJXO
         Evz5Sd1hhNMeRURr7J3W3SnPrm1pOH4aq6N1ZrQCYxpwt0k8JxWvuUSRbkv2uKnbAzRb
         Bv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=CLlxRTFAH1JsjLky42R/FLDBwsQ9ftB52vMaZl0daOY=;
        b=TJ0h2LZ87GK8eCfW/M3OWFWsubZProcjzuAYHeEp2kZz6gS9dyJRW3/lQ9C+mVB12U
         Vya/NaT7g2o4dy01Y+fAwH02pRejmfdsqVB6fCrSDX7dFfm3fKQYQHHywEtpKcv1QokA
         ibgG75TZ9HZNNez+10rOamSshc0Gjwqwzn7GN/3G59+y+7zNJ45cceS2qDyUInT+4TsM
         HePirJwDnczqZhmVbrkw4A9XEy4Ozu5D4XAIi86oxsLAx0WhCU79tvK2Fg/q5ZF42gaV
         eUGXriCLvFwDmPSMvwNitHCKfr/n0vpqjRLZxvAmMVu2Am3SiRbu933ZoauHElMsh+Nj
         SsBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id z24si589534wml.0.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsC5Y4jzy2b;
	Sat, 13 Jul 2019 20:10:39 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 04/11] x86: consolidate io_bitmap allocation
Date: Sat, 13 Jul 2019 20:10:30 +0200
Message-Id: <20190713181037.4358-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

It's pretty much the same, besides the number of pages that have to be
allocated.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/include/asm/vcpu.h |  1 +
 hypervisor/arch/x86/svm.c              | 34 +++++++++-----------------
 hypervisor/arch/x86/vcpu.c             |  9 ++++++-
 hypervisor/arch/x86/vmx.c              | 31 ++++++++---------------
 4 files changed, 31 insertions(+), 44 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/vcpu.h b/hypervisor/arch/x86/include/asm/vcpu.h
index b18b2b3a..24872f55 100644
--- a/hypervisor/arch/x86/include/asm/vcpu.h
+++ b/hypervisor/arch/x86/include/asm/vcpu.h
@@ -90,6 +90,7 @@ void vcpu_skip_emulated_instruction(unsigned int inst_len);
 
 void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
 		                    struct vcpu_io_bitmap *out);
+unsigned int vcpu_vendor_get_io_bitmap_pages(void);
 
 #define VCPU_CS_DPL_MASK	BIT_MASK(6, 5)
 #define VCPU_CS_L		(1 << 13)
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index aa0f7820..f2ea313e 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -320,14 +320,8 @@ int vcpu_vendor_early_init(void)
 
 int vcpu_vendor_cell_init(struct cell *cell)
 {
-	int err = -ENOMEM;
 	u64 flags;
 
-	/* allocate iopm  */
-	cell->arch.io_bitmap = page_alloc(&mem_pool, IOPM_PAGES);
-	if (!cell->arch.io_bitmap)
-		return err;
-
 	/* build root NPT of cell */
 	cell->arch.svm.npt_iommu_structs.root_paging = npt_iommu_paging;
 	cell->arch.svm.npt_iommu_structs.root_table =
@@ -338,25 +332,16 @@ int vcpu_vendor_cell_init(struct cell *cell)
 		 * Map xAPIC as is; reads are passed, writes are trapped.
 		 */
 		flags = PAGE_READONLY_FLAGS | PAGE_FLAG_US | PAGE_FLAG_DEVICE;
-		err = paging_create(&cell->arch.svm.npt_iommu_structs,
-				    XAPIC_BASE, PAGE_SIZE, XAPIC_BASE,
-				    flags, PAGING_NON_COHERENT);
+		return paging_create(&cell->arch.svm.npt_iommu_structs,
+				     XAPIC_BASE, PAGE_SIZE, XAPIC_BASE,
+				     flags, PAGING_NON_COHERENT);
 	} else {
 		flags = PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE;
-		err = paging_create(&cell->arch.svm.npt_iommu_structs,
-				    paging_hvirt2phys(avic_page),
-				    PAGE_SIZE, XAPIC_BASE,
-				    flags, PAGING_NON_COHERENT);
+		return paging_create(&cell->arch.svm.npt_iommu_structs,
+				     paging_hvirt2phys(avic_page),
+				     PAGE_SIZE, XAPIC_BASE,
+				     flags, PAGING_NON_COHERENT);
 	}
-	if (err)
-		goto err_free_iopm;
-
-	return 0;
-
-err_free_iopm:
-	page_free(&mem_pool, cell->arch.io_bitmap, IOPM_PAGES);
-
-	return err;
 }
 
 int vcpu_map_memory_region(struct cell *cell,
@@ -1030,6 +1015,11 @@ void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
 	iobm->size = IOPM_PAGES * PAGE_SIZE;
 }
 
+unsigned int vcpu_vendor_get_io_bitmap_pages(void)
+{
+	return IOPM_PAGES;
+}
+
 #define VCPU_VENDOR_GET_REGISTER(__reg__)	\
 u64 vcpu_vendor_get_##__reg__(void)		\
 {						\
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index a1fb8660..4c074669 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -78,6 +78,7 @@ out_err:
 
 int vcpu_cell_init(struct cell *cell)
 {
+	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
 	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
 	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
 	struct vcpu_io_bitmap cell_iobm, root_cell_iobm;
@@ -86,9 +87,15 @@ int vcpu_cell_init(struct cell *cell)
 	int err;
 	u8 *b;
 
+	cell->arch.io_bitmap = page_alloc(&mem_pool, io_bitmap_pages);
+	if (!cell->arch.io_bitmap)
+		return -ENOMEM;
+
 	err = vcpu_vendor_cell_init(cell);
-	if (err)
+	if (err) {
+		page_free(&mem_pool, cell->arch.io_bitmap, io_bitmap_pages);
 		return err;
+	}
 
 	vcpu_vendor_get_cell_io_bitmap(cell, &cell_iobm);
 
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index ae696e1d..8552cabd 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -334,13 +334,6 @@ unsigned long arch_paging_gphys2phys(unsigned long gphys, unsigned long flags)
 
 int vcpu_vendor_cell_init(struct cell *cell)
 {
-	int err;
-
-	/* allocate io_bitmap */
-	cell->arch.io_bitmap = page_alloc(&mem_pool, PIO_BITMAP_PAGES);
-	if (!cell->arch.io_bitmap)
-		return -ENOMEM;
-
 	/* build root EPT of cell */
 	cell->arch.vmx.ept_structs.root_paging = ept_paging;
 	cell->arch.vmx.ept_structs.root_table =
@@ -348,20 +341,11 @@ int vcpu_vendor_cell_init(struct cell *cell)
 
 	/* Map the special APIC access page into the guest's physical address
 	 * space at the default address (XAPIC_BASE) */
-	err = paging_create(&cell->arch.vmx.ept_structs,
-			    paging_hvirt2phys(apic_access_page),
-			    PAGE_SIZE, XAPIC_BASE,
-			    EPT_FLAG_READ | EPT_FLAG_WRITE | EPT_FLAG_WB_TYPE,
-			    PAGING_NON_COHERENT);
-	if (err)
-		goto err_free_io_bitmap;
-
-	return 0;
-
-err_free_io_bitmap:
-	page_free(&mem_pool, cell->arch.io_bitmap, PIO_BITMAP_PAGES);
-
-	return err;
+	return paging_create(&cell->arch.vmx.ept_structs,
+			     paging_hvirt2phys(apic_access_page),
+			     PAGE_SIZE, XAPIC_BASE,
+			     EPT_FLAG_READ | EPT_FLAG_WRITE | EPT_FLAG_WB_TYPE,
+			     PAGING_NON_COHERENT);
 }
 
 int vcpu_map_memory_region(struct cell *cell,
@@ -1243,6 +1227,11 @@ void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
 	iobm->size = PIO_BITMAP_PAGES * PAGE_SIZE;
 }
 
+unsigned int vcpu_vendor_get_io_bitmap_pages(void)
+{
+	return PIO_BITMAP_PAGES;
+}
+
 #define VCPU_VENDOR_GET_REGISTER(__reg__, __field__)	\
 u64 vcpu_vendor_get_##__reg__(void)			\
 {							\
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-5-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
