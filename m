Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIF5VDUQKGQEXID5EFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id E803F67B9A
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:40 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id k22sf10580836ede.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041440; cv=pass;
        d=google.com; s=arc-20160816;
        b=LnRCTLgXaoyD2rvm5nEeU3nWhYNaqTGu9CuHcMN3h/H3IxNCf8BNzbF81ReKkpUJw9
         uyoz3MgWav9VwoRsgK6gkPAuFcL1cC2hXwLaeXvYh+Aq1s0efKvCBMLva5e2U4iI6wLq
         QtB2/jKurdfRKQBLC9MTUyyhzwz8eg5bUvLpjZpQwWb9LSRaTAtHNEDyTrFP/tObfglA
         A5M8c3I6MmzXTTbKBcJpiLjYUXlF7nu+j/ha/D7Y1TLh/OK6NaQ1+/L1Uil6SwEXP4Lf
         KQWVm/fpuH5PqNO794YFkrWF5ygd5MjXn/2MQi3WiNvDEkf6s6b402OG7dD8EnaZ3KWW
         mrew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=beWMbijzqqDNqgTnneHyeOoNCEAlHLyzBxHLvtG0HqQ=;
        b=L+wFjiqOFJ/X20h1YfW46sHjdKEqXhUbuFz0kcbtJMBdPrteTeD6Au4sFBWbUPLjvP
         zKswqfu0tEHzdvNIMdN7ql6FdSUzOePEsElWwH4GptKRMUKXlPJyvft4JEjMcDlSPEZc
         PY4e7WAEvRN1PWsPoGbNgDsTONipT+7Y8i/97vIwwk7IY9d29mVAbnIZ068s1q8ihJPy
         2Ycy+ORnc2oCgheW4xqyPrz1uUZrykYpwz7HqYyZR9xGP9bq5iK1z5hR7yqiBHhsGRMd
         DneddnttcRjqcuazGKhOA/r67GxdvQmaRs7uhhmBL1msyy2BwIMSktqIQWpUwNexs7w0
         PU2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=beWMbijzqqDNqgTnneHyeOoNCEAlHLyzBxHLvtG0HqQ=;
        b=qdWaAxu0gjjTSyn2KgkT0oT6ji5YVnGG4lWshTS2N3x5Nc0f7FmrIOsrXgeOy7wsUu
         glrXRchdJWM192J19gbvUUO7O8+Ayv6Ukso6c5xfssG0VbneJ8pNKHnLUo/sLtfMFuKi
         VvReUDXQPugsMumqsWUvaPsq5TJHI8KStXN6nOMNCY78Jj3N4pRegGSGVUBOImCBhxYM
         k6kEdwDpRHV5edmVzuEIda0cY3x7bnkMNPyqc6RQznjim5Z6A94D0Ft5o9v23JxURT5M
         Qldg0EoukntdYsVEp5Z+baYlzhGalQy91bSF0hfIb4JgpiHvdWc+57+7yN1pxyF+qi8Y
         0txg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=beWMbijzqqDNqgTnneHyeOoNCEAlHLyzBxHLvtG0HqQ=;
        b=FfWAB8q+oLgc3g0x29iK2cwKJHQuX3wP2ikGUFAN6DEHaZz3AscskL0xRT0ZRJ4m8g
         1YtLZWASAJV7I5rFMGKJ2uV5C6sD1zSzg49GcCYzXNRoqVw+HuKoXhABjfNH2PGBhxTn
         xf4rbpfaH5A4VtdKMnaFZ8EEcmitrml6T8lG/KX8En7T/Z5xW2lFKfmMr5bGoheclqp9
         PGvH9IsBoVoIvLgZ7OAOKDro4zrWTeyo02bWfyttnQF3oBF6QWwo0VGzbFUUrwzyZIXU
         Va0df3P0Vsal8VCzNARscYo1PRQe00tyR0xulgpaNj3ozqlDRnrKTY8/BaycDkGAoS0x
         UddQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVSre2P3wgvm2Dp1MOprvJImAjz+QvOntkEvCxaYxOkccRIKqlL
	ULs3xOSwi8G2Z4LqmornfCc=
X-Google-Smtp-Source: APXvYqxJxSCvXstCSIRTuzJJpbjwTyQ0+l/X2Jya5Xy6gqYgS6oIhJztNL6uhJjVAPeAgQ91qZkU9A==
X-Received: by 2002:a05:6402:1707:: with SMTP id y7mr15123167edu.223.1563041440642;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:aeee:: with SMTP id f43ls3074193edd.15.gmail; Sat, 13
 Jul 2019 11:10:40 -0700 (PDT)
X-Received: by 2002:a05:6402:1285:: with SMTP id w5mr15578021edv.36.1563041440050;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041440; cv=none;
        d=google.com; s=arc-20160816;
        b=HnHc9JfYmnZgCUT1VyMvU8XptOT81oEQIUdZAfgH5oePI4t5aaArAlAixey7mCglPq
         1SHkqCMYDOhZ7dGLI+9JcSOf8HhcnRgc6hwYhwfGFfqWnsppkAj13VJjPtNSNDbaNeFg
         pb/CQLdx/sp3JfOI+deW7/ARIluTo9dl01tzqBjClwmgDmOREvQQ67u7PT0R2wqzzCGt
         nz+ALIYEIioFdKBTO6lKF5s/3ljVnoordzG2AFlF57gMbx+/wJoi7bltg2Ve+4cYJr5A
         p2Ouq7NfiNbiy+/NyUnjHF2GcYnmRS7gy79fW89G3ZdSwMzWrJAa+aApR77BSRFFdZFt
         ak6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=M37hxbkXRPifmMaD1A3gieor8OWg2IHuapcZDo+9Wak=;
        b=ukGfKTwE66wQ+/GNSSBLwkID+6ju21gcemu3ovJ4+Zg6BgS9YcvN+lxfLuA46J9Ml0
         isChgQNQ5/TRleK7YjwajDnhSLSEmVuvGuFihsDW1qQvHHQ393D9O3WK/lM26Ype17aU
         B1bzm+WgA4C9LBXCz3D2m7x8bk0Dp/DxLbTv/WZX2IhRueBjbfkaaLWBdZmRcm9HGPVk
         akyzY8nVzFJ9ItRW70m6AtLswjsDR4aaNFEHr5BuOMSUJbXzlADnH55debp/z5fRAxHj
         nOf6MKr9jAS0qx9T77mve40PoP+HYj4JdX6d+YVeS0wxHKC+EK8/SnScsM4t2QQsCDTF
         bocg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id 91si366757edq.3.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsC3mwnzy6F;
	Sat, 13 Jul 2019 20:10:39 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 03/11] x86: use the variable io_bitmap for both
Date: Sat, 13 Jul 2019 20:10:29 +0200
Message-Id: <20190713181037.4358-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Semantically, SVM and VMX don't differ that much in those regards. Let's use
the same variable for both.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/include/asm/cell.h |  7 +++----
 hypervisor/arch/x86/svm.c              | 12 ++++++------
 hypervisor/arch/x86/vmx.c              | 12 ++++++------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/cell.h b/hypervisor/arch/x86/include/asm/cell.h
index 2223532a..71bd9976 100644
--- a/hypervisor/arch/x86/include/asm/cell.h
+++ b/hypervisor/arch/x86/include/asm/cell.h
@@ -26,16 +26,15 @@ struct arch_cell {
 	/** Buffer for the EPT/NPT root-level page table. */
 	u8 __attribute__((aligned(PAGE_SIZE))) root_table_page[PAGE_SIZE];
 
+	/* Intel: PIO access bitmap.
+	 * AMD: I/O Permissions Map. */
+	u8 *io_bitmap;
 	union {
 		struct {
-			/** PIO access bitmap. */
-			u8 *io_bitmap;
 			/** Paging structures used for cell CPUs. */
 			struct paging_structures ept_structs;
 		} vmx; /**< Intel VMX-specific fields. */
 		struct {
-			/** I/O Permissions Map. */
-			u8 *iopm;
 			/** Paging structures used for cell CPUs and IOMMU. */
 			struct paging_structures npt_iommu_structs;
 		} svm; /**< AMD SVM-specific fields. */
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 67169e39..aa0f7820 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -137,7 +137,7 @@ static void set_svm_segment_from_segment(struct svm_segment *svm_segment,
 
 static void svm_set_cell_config(struct cell *cell, struct vmcb *vmcb)
 {
-	vmcb->iopm_base_pa = paging_hvirt2phys(cell->arch.svm.iopm);
+	vmcb->iopm_base_pa = paging_hvirt2phys(cell->arch.io_bitmap);
 	vmcb->n_cr3 =
 		paging_hvirt2phys(cell->arch.svm.npt_iommu_structs.root_table);
 }
@@ -324,8 +324,8 @@ int vcpu_vendor_cell_init(struct cell *cell)
 	u64 flags;
 
 	/* allocate iopm  */
-	cell->arch.svm.iopm = page_alloc(&mem_pool, IOPM_PAGES);
-	if (!cell->arch.svm.iopm)
+	cell->arch.io_bitmap = page_alloc(&mem_pool, IOPM_PAGES);
+	if (!cell->arch.io_bitmap)
 		return err;
 
 	/* build root NPT of cell */
@@ -354,7 +354,7 @@ int vcpu_vendor_cell_init(struct cell *cell)
 	return 0;
 
 err_free_iopm:
-	page_free(&mem_pool, cell->arch.svm.iopm, IOPM_PAGES);
+	page_free(&mem_pool, cell->arch.io_bitmap, IOPM_PAGES);
 
 	return err;
 }
@@ -396,7 +396,7 @@ void vcpu_vendor_cell_exit(struct cell *cell)
 {
 	paging_destroy(&cell->arch.svm.npt_iommu_structs, XAPIC_BASE,
 		       PAGE_SIZE, PAGING_NON_COHERENT);
-	page_free(&mem_pool, cell->arch.svm.iopm, IOPM_PAGES);
+	page_free(&mem_pool, cell->arch.io_bitmap, IOPM_PAGES);
 }
 
 int vcpu_init(struct per_cpu *cpu_data)
@@ -1026,7 +1026,7 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
 void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
 		                    struct vcpu_io_bitmap *iobm)
 {
-	iobm->data = cell->arch.svm.iopm;
+	iobm->data = cell->arch.io_bitmap;
 	iobm->size = IOPM_PAGES * PAGE_SIZE;
 }
 
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index 5b3c5b8f..ae696e1d 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -337,8 +337,8 @@ int vcpu_vendor_cell_init(struct cell *cell)
 	int err;
 
 	/* allocate io_bitmap */
-	cell->arch.vmx.io_bitmap = page_alloc(&mem_pool, PIO_BITMAP_PAGES);
-	if (!cell->arch.vmx.io_bitmap)
+	cell->arch.io_bitmap = page_alloc(&mem_pool, PIO_BITMAP_PAGES);
+	if (!cell->arch.io_bitmap)
 		return -ENOMEM;
 
 	/* build root EPT of cell */
@@ -359,7 +359,7 @@ int vcpu_vendor_cell_init(struct cell *cell)
 	return 0;
 
 err_free_io_bitmap:
-	page_free(&mem_pool, cell->arch.vmx.io_bitmap, PIO_BITMAP_PAGES);
+	page_free(&mem_pool, cell->arch.io_bitmap, PIO_BITMAP_PAGES);
 
 	return err;
 }
@@ -394,7 +394,7 @@ void vcpu_vendor_cell_exit(struct cell *cell)
 {
 	paging_destroy(&cell->arch.vmx.ept_structs, XAPIC_BASE, PAGE_SIZE,
 		       PAGING_NON_COHERENT);
-	page_free(&mem_pool, cell->arch.vmx.io_bitmap, PIO_BITMAP_PAGES);
+	page_free(&mem_pool, cell->arch.io_bitmap, PIO_BITMAP_PAGES);
 }
 
 void vcpu_tlb_flush(void)
@@ -459,7 +459,7 @@ static bool vmx_set_cell_config(void)
 	u8 *io_bitmap;
 	bool ok = true;
 
-	io_bitmap = cell->arch.vmx.io_bitmap;
+	io_bitmap = cell->arch.io_bitmap;
 	ok &= vmcs_write64(IO_BITMAP_A, paging_hvirt2phys(io_bitmap));
 	ok &= vmcs_write64(IO_BITMAP_B,
 			   paging_hvirt2phys(io_bitmap + PAGE_SIZE));
@@ -1239,7 +1239,7 @@ void vmx_entry_failure(void)
 void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
 		                    struct vcpu_io_bitmap *iobm)
 {
-	iobm->data = cell->arch.vmx.io_bitmap;
+	iobm->data = cell->arch.io_bitmap;
 	iobm->size = PIO_BITMAP_PAGES * PAGE_SIZE;
 }
 
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
