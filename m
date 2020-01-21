Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBE76TTYQKGQEUV5RI6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id B89CC144413
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 19:12:35 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id w205sf1021865wmb.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 10:12:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579630355; cv=pass;
        d=google.com; s=arc-20160816;
        b=TWttrmGGV1n+roKi4AifxtFh8zklvcqZwx4Sjn5iEphACV8okMHCLIGC+KwrrTB7Yx
         kd27xzVEa6wEi04nEoOdBvcRq82cvn4ZHqJ9U0vf0bK3mHMpgSeJ8DNixUNDxxFHL55D
         JrYHIAXRNqAVrrZ2DoYjJU8k2VHPczel9tMluvNIakxrecvOiXHEqqXEv2IZhv9L1lXN
         H+pdFNaYJbhTvSljA8uu+CgfaMdffUXsTMcAwdKHx3llLnS2Fv/3gJgXSBv7FF0sKPPG
         OtFtdG4wAw/7ujdHcLODbeHJPTPiHfmifRmdUr6A5YFCQrDg54EQ25sOdP4mfl214/YM
         iiDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=OVtRah19KUvzEmrxYoaG053n/nZWzQO3+atGoRm3bok=;
        b=tqQAHJDHah0YwdDDbEtzDrnh0CcL7TYPACoFIQGoUGBP6ciOkDsTDls2TSJB2xWvn0
         MYNwrw6ZrTeyvMUlKkjWhjQ89h91xDN41vKIq3KtYD6d0JeZJT9ReooO2fCGm7dn86b4
         0SyAyJToy4mbbylY0qiN/ld4r0mRwUGk3moHcNkrqiozYCXMv2k7eu7pPciPHOrmmY+b
         3hOAZFwyUFdSFT3sGZQAjV7gxkyGDFjCZTE4eBbeR1oyG+9VH2MI9oyVqhi48VIQuFlA
         x1N+7Hs3VQ1SnMg8cZIqNuTbnYO3/IP+G0R3fCE80lCx620PpbZiiDRAh1fXYdu+tdd3
         BxmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OVtRah19KUvzEmrxYoaG053n/nZWzQO3+atGoRm3bok=;
        b=oeDTA3psEiCvW2nXHrg0u4rZjTa1SlocO6IX+Gkdpe7f2rVi6NU7WF14BeD8dKg69I
         q0zAD+ZnUVbAH6w9RyVHFZp9fH6GQZjAJt8qDM03yyzFBSRrvWD/8hcbXGXTD0EW6eMB
         92p9YgOW0SirctkFGv6rEAfEGnCpoWFaKGY24/eZ7txgwOu9kWyhl1lUmjSeZlQySyeL
         fVrzpLCpZZVi6zTGOWUSDoN7WAPFIzsjQoORlMqA1cErSArjTet6ejrxRItCzC2a4D+T
         uaWEjMcxAZKhpZ87+NTmf/XB/Ib0uY9CO+gG4BUOn0WmeUdwA7fCwiqEF169W9Zojet2
         Xz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OVtRah19KUvzEmrxYoaG053n/nZWzQO3+atGoRm3bok=;
        b=PfW4Niu04mqiKi+0wiPQB7jTgtiurI9WdrzThmIL2eL9Vy0uCWKJJ4AieyRySQ/9Zy
         f4IzDAPtd9rOTbLd36IfUQwQ+NAwoYrI9N1/oIahBAI2ylFm5OKSFb+vHz3TEToLiCDS
         fv3O7PLCnlRnzAr1WsH/zvmc0RAn3Asp1+uuyAipkKAb57FvfhZ/akj+bgBwEGl9Gmum
         VVODVBUrQ+uAK3uCJNSaFT88VecWZe6SKySrcvUtP2KIovStLH/9IlSWZIgzBC2asv2u
         wW3K0ZP03zDjZ8N6mbBDlgcLfKp9PD+muUa3BF/w/EdbkVJCfsgKMc7+VTvyd/59NO5N
         HVyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWJWnwZV5Q1ZQoef8TJSr6qa4OOd35fITTT4ZsWiDmJKVXR4M7Q
	7RZkO2L0cGkbF6fso5rqNvE=
X-Google-Smtp-Source: APXvYqz1FbLQpwJUnNw3EwPtHso7HCstEN4SPsAIUS9nWAwiGxEm3snvKzn0hkV6toMrFti/8kPIvg==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr6510153wrj.68.1579630355401;
        Tue, 21 Jan 2020 10:12:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb4c:: with SMTP id u12ls4281541wrn.6.gmail; Tue, 21 Jan
 2020 10:12:34 -0800 (PST)
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr6767771wrt.229.1579630354648;
        Tue, 21 Jan 2020 10:12:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579630354; cv=none;
        d=google.com; s=arc-20160816;
        b=koP58/+vULK77hKTWYe4TEN/U2gfoFzjl4Egh5dPH6IVcrZSYM1XMVbBLjOuwsDdj9
         e0uX8oaKWGXkHL0uuou3DoA3kLcuIxauw/K61dFgC3KiLmpho2wStdyYOBz74JkLrXb6
         XTdDFTnvRbygzVh2BLhxMyMA5Huee1niBZsLpj+DrmtVJFIXAQN25rpiXvel6hmI0m8T
         M20IXm9jEsYhmi1hsBLnEE2eMkLYnTQzIkLZ9YUiuSzt+rbnGO/UhgeKFNvGDrY+yZhs
         eunlq7tLb+bwjErhFzx0SbVfDMJ/76INHoAWJv9SkKG1mybbwTpUVwa8YLcYpqamUvkI
         51Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=xGk2b5grokvxqjr6WxptvkONy8py9dOPzqkctpafMPU=;
        b=l09FYkV1HQqDPHpVnoq0B0lwbeVryLsJ06/NkqJmaV/qRLX3TCtBemoWlDPOdYYnh9
         HPXzoV73y3YelATBGPqV/kB/ZvETdL/4IXZhhJPNvJP5uBJI0/twxGtDuwtcI/9jcT0k
         Iv7EIEzP2C+zhuiIl5H6rTqHgbsSpF8CTsPp0sG85mjSAEXcm66d1NkLQQc00hFJhaD3
         zx7ZDDKE9yoLBfnecY8u0O1mHu7xLjrTjEZPuP9fXtxKXJzS+5ZZdRPoxK6/PkrR2XIc
         OV/TGbMekravjF717NdijfqDAGojpa8w+Ln++b1Z5Kghf3NhOTscarQIXyJYrxRHb5Gu
         DH8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w11si8445wmk.0.2020.01.21.10.12.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jan 2020 10:12:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00LICYl1023596
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2020 19:12:34 +0100
Received: from [167.87.4.158] ([167.87.4.158])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00LICXEo023754;
	Tue, 21 Jan 2020 19:12:33 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 1/2] core: paging: Refactor paging_create/destroy parameters
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <b75f9bda-d9ab-31ea-5b1c-ac8093421662@siemens.com>
Date: Tue, 21 Jan 2020 19:12:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Change the coherent enum into paging_flags in order to allow adding more
in the future. Rename the flags parameter to access_flags for better
differentiation.

Use this chance to align the names and types of local vars that are
forwarded to access_flags with that parameter.

No behavioral changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/mmu_cell.c | 12 +++++------
 hypervisor/arch/x86/svm.c             | 12 +++++------
 hypervisor/arch/x86/vmx.c             | 11 +++++-----
 hypervisor/arch/x86/vtd.c             |  8 +++----
 hypervisor/include/jailhouse/paging.h | 30 ++++++++++++++------------
 hypervisor/paging.c                   | 40 +++++++++++++++++------------------
 6 files changed, 58 insertions(+), 55 deletions(-)

diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index 0607374e..a00997c3 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -21,17 +21,17 @@ int arch_map_memory_region(struct cell *cell,
 			   const struct jailhouse_memory *mem)
 {
 	u64 phys_start = mem->phys_start;
-	u32 flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
+	unsigned long access_flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
 	int err = 0;
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
-		flags |= S2_PTE_ACCESS_RO;
+		access_flags |= S2_PTE_ACCESS_RO;
 	if (mem->flags & JAILHOUSE_MEM_WRITE)
-		flags |= S2_PTE_ACCESS_WO;
+		access_flags |= S2_PTE_ACCESS_WO;
 	if (mem->flags & JAILHOUSE_MEM_IO)
-		flags |= S2_PTE_FLAG_DEVICE;
+		access_flags |= S2_PTE_FLAG_DEVICE;
 	else
-		flags |= S2_PTE_FLAG_NORMAL;
+		access_flags |= S2_PTE_FLAG_NORMAL;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
 	/*
@@ -44,7 +44,7 @@ int arch_map_memory_region(struct cell *cell,
 		return err;
 
 	err = paging_create(&cell->arch.mm, phys_start, mem->size,
-			    mem->virt_start, flags, PAGING_COHERENT);
+			    mem->virt_start, access_flags, PAGING_COHERENT);
 	if (err)
 		iommu_unmap_memory_region(cell, mem);
 
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 74abe652..513c696c 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -348,25 +348,25 @@ int vcpu_map_memory_region(struct cell *cell,
 			   const struct jailhouse_memory *mem)
 {
 	u64 phys_start = mem->phys_start;
-	u64 flags = PAGE_FLAG_US; /* See APMv2, Section 15.25.5 */
+	u64 access_flags = PAGE_FLAG_US; /* See APMv2, Section 15.25.5 */
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
-		flags |= PAGE_FLAG_PRESENT;
+		access_flags |= PAGE_FLAG_PRESENT;
 	if (mem->flags & JAILHOUSE_MEM_WRITE)
-		flags |= PAGE_FLAG_RW;
+		access_flags |= PAGE_FLAG_RW;
 	if (!(mem->flags & JAILHOUSE_MEM_EXECUTE))
-		flags |= PAGE_FLAG_NOEXECUTE;
+		access_flags |= PAGE_FLAG_NOEXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
 
-	flags |= amd_iommu_get_memory_region_flags(mem);
+	access_flags |= amd_iommu_get_memory_region_flags(mem);
 
 	/*
 	 * As we also manipulate the IOMMU page table, changes need to be
 	 * coherent.
 	 */
 	return paging_create(&cell->arch.svm.npt_iommu_structs, phys_start,
-			     mem->size, mem->virt_start, flags,
+			     mem->size, mem->virt_start, access_flags,
 			     PAGING_COHERENT);
 }
 
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index c4b7dbb6..f0a2534b 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -352,19 +352,20 @@ int vcpu_map_memory_region(struct cell *cell,
 			   const struct jailhouse_memory *mem)
 {
 	u64 phys_start = mem->phys_start;
-	u32 flags = EPT_FLAG_WB_TYPE;
+	unsigned long access_flags = EPT_FLAG_WB_TYPE;
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
-		flags |= EPT_FLAG_READ;
+		access_flags |= EPT_FLAG_READ;
 	if (mem->flags & JAILHOUSE_MEM_WRITE)
-		flags |= EPT_FLAG_WRITE;
+		access_flags |= EPT_FLAG_WRITE;
 	if (mem->flags & JAILHOUSE_MEM_EXECUTE)
-		flags |= EPT_FLAG_EXECUTE;
+		access_flags |= EPT_FLAG_EXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
 
 	return paging_create(&cell->arch.vmx.ept_structs, phys_start, mem->size,
-			     mem->virt_start, flags, PAGING_NON_COHERENT);
+			     mem->virt_start, access_flags,
+			     PAGING_NON_COHERENT);
 }
 
 int vcpu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 377aa00d..e5f9bfb0 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -750,7 +750,7 @@ static int vtd_cell_init(struct cell *cell)
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
-	u32 flags = 0;
+	unsigned long access_flags = 0;
 
 	if (!(mem->flags & JAILHOUSE_MEM_DMA))
 		return 0;
@@ -759,12 +759,12 @@ int iommu_map_memory_region(struct cell *cell,
 		return trace_error(-E2BIG);
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
-		flags |= VTD_PAGE_READ;
+		access_flags |= VTD_PAGE_READ;
 	if (mem->flags & JAILHOUSE_MEM_WRITE)
-		flags |= VTD_PAGE_WRITE;
+		access_flags |= VTD_PAGE_WRITE;
 
 	return paging_create(&cell->arch.vtd.pg_structs, mem->phys_start,
-			     mem->size, mem->virt_start, flags,
+			     mem->size, mem->virt_start, access_flags,
 			     PAGING_COHERENT);
 }
 
diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index 2c37de49..dcf77829 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -54,14 +54,16 @@ struct page_pool {
 	unsigned long flags;
 };
 
-/** Define coherency of page creation/destruction. */
-enum paging_coherent {
-	/** Make changes visible to non-snooping readers,
-	 * i.e. commit them to RAM. */
-	PAGING_COHERENT,
-	/** Do not force changes into RAM, i.e. avoid costly cache flushes. */
-	PAGING_NON_COHERENT,
-};
+/**
+ * @defgroup PAGING_FLAGS Paging creation/destruction flags
+ * @{
+ */
+
+/** Do not force changes into RAM, i.e. avoid costly cache flushes. */
+#define PAGING_NON_COHERENT	0
+/** Make changes visible to non-snooping readers, i.e. commit them to RAM. */
+#define PAGING_COHERENT		0x1
+/** @} */
 
 /** Page table reference. */
 typedef pt_entry_t page_table_t;
@@ -88,7 +90,7 @@ struct paging {
 	 * Returns true if entry is a valid and supports the provided access
 	 * flags (terminal and non-terminal entries).
 	 * @param pte Reference to page table entry.
-	 * @param flags Access flags to validate, see @ref PAGE_FLAGS.
+	 * @param flags Access flags to validate, see @ref PAGE_ACCESS_FLAGS.
 	 *
 	 * @return True if entry is valid.
 	 */
@@ -98,7 +100,7 @@ struct paging {
 	 * Set terminal entry to physical address and access flags.
 	 * @param pte Reference to page table entry.
 	 * @param phys Target physical address.
-	 * @param flags Flags of permitted access, see @ref PAGE_FLAGS.
+	 * @param flags Flags of permitted access, see @ref PAGE_ACCESS_FLAGS.
 	 */
 	void (*set_terminal)(pt_entry_t pte, unsigned long phys,
 			     unsigned long flags);
@@ -115,7 +117,7 @@ struct paging {
 	 * Extract access flags from given entry.
 	 * @param pte Reference to page table entry.
 	 *
-	 * @return Access flags, see @ref PAGE_FLAGS.
+	 * @return Access flags, see @ref PAGE_ACCESS_FLAGS.
 	 *
 	 * @note Only valid for terminal entries.
 	 */
@@ -242,10 +244,10 @@ unsigned long arch_paging_gphys2phys(unsigned long gphys, unsigned long flags);
 
 int paging_create(const struct paging_structures *pg_structs,
 		  unsigned long phys, unsigned long size, unsigned long virt,
-		  unsigned long flags, enum paging_coherent coherent);
+		  unsigned long access_flags, unsigned long paging_flags);
 int paging_destroy(const struct paging_structures *pg_structs,
 		   unsigned long virt, unsigned long size,
-		   enum paging_coherent coherent);
+		   unsigned long paging_flags);
 
 void *paging_map_device(unsigned long phys, unsigned long size);
 void paging_unmap_device(unsigned long phys, void *virt, unsigned long size);
@@ -289,7 +291,7 @@ void paging_dump_stats(const char *when);
  */
 
 /**
- * @defgroup PAGE_FLAGS Page Access flags
+ * @defgroup PAGE_ACCESS_FLAGS Page Access flags
  * @{
  *
  * @def PAGE_DEFAULT_FLAGS
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 42e8f9f6..94ca1812 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -202,7 +202,7 @@ void page_free(struct page_pool *pool, void *page, unsigned int num)
  * @param pg_structs	Paging structures to use for translation.
  * @param virt		Virtual address.
  * @param flags		Access flags that have to be supported by the mapping,
- * 			see @ref PAGE_FLAGS.
+ * 			see @ref PAGE_ACCESS_FLAGS.
  *
  * @return Physical address on success or @c INVALID_PHYS_ADDR if the virtual
  * 	   address could not be translated or the requested access is not
@@ -232,15 +232,15 @@ unsigned long paging_virt2phys(const struct paging_structures *pg_structs,
 	}
 }
 
-static void flush_pt_entry(pt_entry_t pte, enum paging_coherent coherent)
+static void flush_pt_entry(pt_entry_t pte, unsigned long paging_flags)
 {
-	if (coherent == PAGING_COHERENT)
+	if (paging_flags & PAGING_COHERENT)
 		arch_paging_flush_cpu_caches(pte, sizeof(*pte));
 }
 
 static int split_hugepage(bool hv_paging, const struct paging *paging,
 			  pt_entry_t pte, unsigned long virt,
-			  enum paging_coherent coherent)
+			  unsigned long paging_flags)
 {
 	unsigned long phys = paging->get_phys(pte, virt);
 	struct paging_structures sub_structs;
@@ -261,10 +261,10 @@ static int split_hugepage(bool hv_paging, const struct paging *paging,
 	if (!sub_structs.root_table)
 		return -ENOMEM;
 	paging->set_next_pt(pte, paging_hvirt2phys(sub_structs.root_table));
-	flush_pt_entry(pte, coherent);
+	flush_pt_entry(pte, paging_flags);
 
 	return paging_create(&sub_structs, phys, paging->page_size, virt,
-			     flags, coherent);
+			     flags, paging_flags);
 }
 
 /**
@@ -273,9 +273,9 @@ static int split_hugepage(bool hv_paging, const struct paging *paging,
  * @param phys		Physical address of the region to be mapped.
  * @param size		Size of the region.
  * @param virt		Virtual address the region should be mapped to.
- * @param flags		Flags describing the permitted access, see
- * 			@ref PAGE_FLAGS.
- * @param coherent	Coherency of mapping.
+ * @param access_flags	Flags describing the permitted page access, see
+ * 			@ref PAGE_ACCESS_FLAGS.
+ * @param paging_flags	Flags describing the paging mode, see @ref PAGING_FLAGS.
  *
  * @return 0 on success, negative error code otherwise.
  *
@@ -287,7 +287,7 @@ static int split_hugepage(bool hv_paging, const struct paging *paging,
  */
 int paging_create(const struct paging_structures *pg_structs,
 		  unsigned long phys, unsigned long size, unsigned long virt,
-		  unsigned long flags, enum paging_coherent coherent)
+		  unsigned long access_flags, unsigned long paging_flags)
 {
 	phys &= PAGE_MASK;
 	virt &= PAGE_MASK;
@@ -318,16 +318,16 @@ int paging_create(const struct paging_structures *pg_structs,
 						pg_structs->hv_paging;
 					paging_destroy(&sub_structs, virt,
 						       paging->page_size,
-						       coherent);
+						       paging_flags);
 				}
-				paging->set_terminal(pte, phys, flags);
-				flush_pt_entry(pte, coherent);
+				paging->set_terminal(pte, phys, access_flags);
+				flush_pt_entry(pte, paging_flags);
 				break;
 			}
 			if (paging->entry_valid(pte, PAGE_PRESENT_FLAGS)) {
 				err = split_hugepage(pg_structs->hv_paging,
 						     paging, pte, virt,
-						     coherent);
+						     paging_flags);
 				if (err)
 					return err;
 				pt = paging_phys2hvirt(
@@ -338,7 +338,7 @@ int paging_create(const struct paging_structures *pg_structs,
 					return -ENOMEM;
 				paging->set_next_pt(pte,
 						    paging_hvirt2phys(pt));
-				flush_pt_entry(pte, coherent);
+				flush_pt_entry(pte, paging_flags);
 			}
 			paging++;
 		}
@@ -357,7 +357,7 @@ int paging_create(const struct paging_structures *pg_structs,
  * @param pg_structs	Descriptor of paging structures to be used.
  * @param virt		Virtual address the region to be unmapped.
  * @param size		Size of the region.
- * @param coherent	Coherency of mapping.
+ * @param paging_flags	Flags describing the paging mode, see @ref PAGING_FLAGS.
  *
  * @return 0 on success, negative error code otherwise.
  *
@@ -370,7 +370,7 @@ int paging_create(const struct paging_structures *pg_structs,
  */
 int paging_destroy(const struct paging_structures *pg_structs,
 		   unsigned long virt, unsigned long size,
-		   enum paging_coherent coherent)
+		   unsigned long paging_flags)
 {
 	size = PAGE_ALIGN(size);
 
@@ -406,7 +406,7 @@ int paging_destroy(const struct paging_structures *pg_structs,
 
 				err = split_hugepage(pg_structs->hv_paging,
 						     paging, pte, virt,
-						     coherent);
+						     paging_flags);
 				if (err)
 					return err;
 			}
@@ -419,7 +419,7 @@ int paging_destroy(const struct paging_structures *pg_structs,
 		/* walk up again, clearing entries, releasing empty tables */
 		while (1) {
 			paging->clear_entry(pte);
-			flush_pt_entry(pte, coherent);
+			flush_pt_entry(pte, paging_flags);
 			if (n == 0 || !paging->page_table_empty(pt[n]))
 				break;
 			page_free(&mem_pool, pt[n], 1);
@@ -557,7 +557,7 @@ int paging_create_hvpt_link(const struct paging_structures *pg_dest_structs,
  * @param gaddr		Guest address of the first page to be mapped.
  * @param num		Number of pages to be mapped.
  * @param flags		Access flags for the hypervisor mapping, see
- * 			@ref PAGE_FLAGS.
+ * 			@ref PAGE_ACCESS_FLAGS.
  *
  * @return Pointer to first mapped page or @c NULL on error.
  *
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b75f9bda-d9ab-31ea-5b1c-ac8093421662%40siemens.com.
