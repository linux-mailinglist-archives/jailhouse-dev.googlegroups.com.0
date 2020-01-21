Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ76TTYQKGQEIDZLK6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F21144416
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 19:13:24 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id f10sf1781847wro.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 10:13:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579630403; cv=pass;
        d=google.com; s=arc-20160816;
        b=vbx0dU4foeRB+zFMXFCKr2sDIWQcSMJXlSQYur9MaC33Y0QHtnQkJCuR7APn7FuqeL
         7euirSOiQqQMmAFWzFyY4KGJP2JlAnh5wPJbd5hajTJ/Gqtsmko1DEBTpN4MZKOoygFS
         5oZgweOmM/lNEvxbwJ2MS/sE4Bl3ArV9DWnveipLl1ttGFVu8AfuaC8uNUT0UYoCurTP
         YjtKu/h6s3HNML24LVfZMhUezajQUupidJOJ6qP6kxQe3bBBtAusEs19zGyFnQmn3pk0
         4vDwWFgXXxXsN5+RZcyRxtal7xEo8LLtA8/3PDILJl65Ozxj2abH6AdAWGBCAlEXOFOv
         R9kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=N0EGmJVmFP+n68gn2rI582Uo7nfetGPaPlK2UWHdDPc=;
        b=PZdK2oNGa4drF0LHQ2kSD8+BU3b7vfef3N+sehTZkSH2PGfDwT+hQ9ZLSD1NQ6VB7W
         qGJli8z1gRDaMd/gHCKyXjL+x5t4a+dRGf1AzB+E1GE5Bo5jAk39stMPnFOlTc+IPYEK
         wOxEaWGPEaNtwXHhlsTjhHDICW1SIROlXZ1+EYWmakqL6j5RMo2uYvsAeEaPFfbXKk46
         YF7RACr9Bw84MWXYN0x1txJb/cuo7TuynsVxVyXXQEHcTsJyTs2o93YU3zIimJoSfdJC
         9elJQitHACEN+VqsAzOr/vlpHaYre0/PjEpKzLXGaFYduEsD9FK9dli7b6ofNwVxoFDM
         /FQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N0EGmJVmFP+n68gn2rI582Uo7nfetGPaPlK2UWHdDPc=;
        b=CsPzpBnmhrNpWyEWE4KkOIaqHHZPb8JUim7CInvcwHo5HcvrUGDGmSRtQ4XgE7u1IV
         L1uvDYQW6lM4i6U+kLgg8Duj/T4ovZjt1oRcsWPWqSqIyYsgpYyamF15OQAO1mCmIGag
         y3eS+qmPyHhE54jtwxYB5GIM80BD3pnWBKpHCliyj2rDdxWR1Z0ngZXAsAn80EhbEs06
         t5mfFh8qGw6lerWElOD3wVzremEeyS2MOIqWEt+JryrtU135leSX5zmh4pjnlG17mK7M
         EYBGEIFUAAPG9nFrE5TyLdpT/Oouk/pgX7o4fmsziq9q3/RJSWU9WoKFwL9CGzsDmMB6
         nEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N0EGmJVmFP+n68gn2rI582Uo7nfetGPaPlK2UWHdDPc=;
        b=Z+EPwUz6wx7jK3aUaL2GLwETqOFnMwHg2boy3nhGWsRTGqGS5gxJ9hB+Rp3GsdX9eC
         dQl+IRAqxWrby+gIJtfJaQKCA6h9THlE2VaXTuHmvF0kGfNuHfeh/JnSAa9MdWD4oD1e
         mi+di6PpYTYaRgUFYJQOYgjm2ratb4QzluCeuULYL554aoZB13YARiBye6WKPaA+llVO
         b0wH6ziAsDj5tT87Rz3YoS63hYmVgoOVXXWUsrxzt7n0yNlSdVdyQcQQQTR1AXC4ubWN
         L7/0MUnTEYtXYtJmBvZWvT65jN4MIgLLrdpIpK6a/ClaiBDJcUMfYRb99TP1b+UUOCb5
         x2sA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVRDCw7M8pHHpk1IGLlRlxMtKMqSdg37HctLDMrNQ5h0M0OVWNi
	7VuclD0ijHAvmkEK3OZDxTA=
X-Google-Smtp-Source: APXvYqx1VUe+rMlwZwsr6NOugX3dEZa1kSiID8iLGVKxt7MAF6n+pkFk2qhMzTaw3xO3EGSa1uDIVQ==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr6718924wrw.188.1579630403736;
        Tue, 21 Jan 2020 10:13:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:55cd:: with SMTP id i13ls4285081wrw.0.gmail; Tue, 21 Jan
 2020 10:13:23 -0800 (PST)
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr6479453wrm.241.1579630402972;
        Tue, 21 Jan 2020 10:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579630402; cv=none;
        d=google.com; s=arc-20160816;
        b=ViZ5RLVtTRJnouHYZWSbmQMNSpU/9zkGGYbxnjXdv4ss5Xe+RxtlHSPoP7KoYF/GOh
         OuuGRWXmHVdOENVvnUr5nrZ9LXVeJAM7CbTHo0qqKBH5K5B+UT7GyqOrqJO8ShBs9mLD
         g1K+jqs3ZX+ZEBmB2DlS5oIgf4YUSexXVziVkLM4EfOY2lmWDddToQf6SP0g/evtdIiT
         19H5ISOgUHLiD2IVqWAfYwpk5UfUykZ6IjXHDs5vAFFHXZWrSIUY/8eVzZSlSlIFZSLK
         szA1WMcfQ/j2RfPDwOo9IHGe7rNlPvFV9zbhuschZGrb+zXWvMx78g3iAwgewOEg5zdq
         yddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=XV2HvbKmKC9Qgdjl3EKhVYeKHZjaPcZyNkLljKmc480=;
        b=o/G2+rTn37G8APvaXtqQKS9DX+aiNp5vpA6x8o7eUfi+kZN07bAxj2kvXM6G3ArrP/
         NAVw1uOUM0NPGEgLbyWac0Zrxp9fkMS1T5d/MkRiwsqSgEQfhFGu+EOmDHqvRzLejyDc
         tFowbJe0/E95xoY9vPrFaSdj/YmBb2uukSVL5h0cTbWwMQ6CpOOc2yMJ6inQ5kojIJWU
         M/JA6jogqANzzbY8rNlSeeys2fa7pDoi5My7xxJORV/R6KDybB1ar+XsXNebH6/QGVmQ
         d3KGySb7WIRMphw+CmNyiUKATJLkaFpjIFZn79RPGab+r2/4c6Yq3X3ngYVyEKnyDo2T
         gLnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u9si1427713wri.3.2020.01.21.10.13.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jan 2020 10:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00LIDM7E008759
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2020 19:13:22 +0100
Received: from [167.87.4.158] ([167.87.4.158])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00LIDL86025723;
	Tue, 21 Jan 2020 19:13:22 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory region flag
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <9ca086db-d475-938c-f362-62d325eadec7@siemens.com>
Date: Tue, 21 Jan 2020 19:13:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

This allows to mitigate CVE-2018-12207: On affected Intel machines, a
guest can trigger an unrecoverable machine check exception when running
a certain code pattern on an executable huge page. The suggested
mitigation pattern of Intel involves on-demand break-up of huge pages
when the guest tries to execute on them and also consolidating them into
non-executable huge pages dynamically. This pattern is not compatible
with the static and deterministic behavior of Jailhouse.

Therefore, this introduces a memory region flag to exclude huge page
mappings for a region. System configurators can use this flag for
executable regions on affected CPUs, while still allowing huge pages for
non-executable regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Almost forgotten, but it should go into a release. We "just" need a 
reliable reproducer to validate...

 hypervisor/arch/arm-common/mmu_cell.c | 5 ++++-
 hypervisor/arch/x86/svm.c             | 5 ++++-
 hypervisor/arch/x86/vmx.c             | 6 ++++--
 hypervisor/arch/x86/vtd.c             | 5 ++++-
 hypervisor/include/jailhouse/paging.h | 5 +++++
 hypervisor/paging.c                   | 3 ++-
 hypervisor/setup.c                    | 5 +++--
 include/jailhouse/cell-config.h       | 3 ++-
 8 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index a00997c3..56db2e8c 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -22,6 +22,7 @@ int arch_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	unsigned long access_flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
+	unsigned long paging_flags = PAGING_COHERENT | PAGING_ALLOW_HUGE;
 	int err = 0;
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
@@ -38,13 +39,15 @@ int arch_map_memory_region(struct cell *cell,
 	if (!(mem->flags & JAILHOUSE_MEM_EXECUTE))
 		flags |= S2_PAGE_ACCESS_XN;
 	*/
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;
 
 	err = iommu_map_memory_region(cell, mem);
 	if (err)
 		return err;
 
 	err = paging_create(&cell->arch.mm, phys_start, mem->size,
-			    mem->virt_start, access_flags, PAGING_COHERENT);
+			    mem->virt_start, access_flags, paging_flags);
 	if (err)
 		iommu_unmap_memory_region(cell, mem);
 
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 513c696c..d85d2b50 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -349,6 +349,7 @@ int vcpu_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	u64 access_flags = PAGE_FLAG_US; /* See APMv2, Section 15.25.5 */
+	u64 paging_flags = PAGING_COHERENT | PAGING_ALLOW_HUGE;
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
 		access_flags |= PAGE_FLAG_PRESENT;
@@ -358,6 +359,8 @@ int vcpu_map_memory_region(struct cell *cell,
 		access_flags |= PAGE_FLAG_NOEXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;
 
 	access_flags |= amd_iommu_get_memory_region_flags(mem);
 
@@ -367,7 +370,7 @@ int vcpu_map_memory_region(struct cell *cell,
 	 */
 	return paging_create(&cell->arch.svm.npt_iommu_structs, phys_start,
 			     mem->size, mem->virt_start, access_flags,
-			     PAGING_COHERENT);
+			     paging_flags);
 }
 
 int vcpu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index f0a2534b..1cbc6417 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -353,6 +353,7 @@ int vcpu_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	unsigned long access_flags = EPT_FLAG_WB_TYPE;
+	unsigned long paging_flags = PAGING_NON_COHERENT | PAGING_ALLOW_HUGE;
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
 		access_flags |= EPT_FLAG_READ;
@@ -362,10 +363,11 @@ int vcpu_map_memory_region(struct cell *cell,
 		access_flags |= EPT_FLAG_EXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;
 
 	return paging_create(&cell->arch.vmx.ept_structs, phys_start, mem->size,
-			     mem->virt_start, access_flags,
-			     PAGING_NON_COHERENT);
+			     mem->virt_start, access_flags, paging_flags);
 }
 
 int vcpu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index e5f9bfb0..51649662 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -751,6 +751,7 @@ int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
 	unsigned long access_flags = 0;
+	unsigned long paging_flags = PAGING_COHERENT | PAGING_ALLOW_HUGE;
 
 	if (!(mem->flags & JAILHOUSE_MEM_DMA))
 		return 0;
@@ -762,10 +763,12 @@ int iommu_map_memory_region(struct cell *cell,
 		access_flags |= VTD_PAGE_READ;
 	if (mem->flags & JAILHOUSE_MEM_WRITE)
 		access_flags |= VTD_PAGE_WRITE;
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;
 
 	return paging_create(&cell->arch.vtd.pg_structs, mem->phys_start,
 			     mem->size, mem->virt_start, access_flags,
-			     PAGING_COHERENT);
+			     paging_flags);
 }
 
 int iommu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index dcf77829..96e3fdbc 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -63,6 +63,11 @@ struct page_pool {
 #define PAGING_NON_COHERENT	0
 /** Make changes visible to non-snooping readers, i.e. commit them to RAM. */
 #define PAGING_COHERENT		0x1
+
+/** Do not use huge pages for creating a mapping. */
+#define PAGING_NO_HUGE		0
+/** When possible, use huge pages for creating a mapping. */
+#define PAGING_ALLOW_HUGE	0x2
 /** @} */
 
 /** Page table reference. */
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 94ca1812..6d0cbcc8 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -302,7 +302,8 @@ int paging_create(const struct paging_structures *pg_structs,
 
 		while (1) {
 			pte = paging->get_entry(pt, virt);
-			if (paging->page_size > 0 &&
+			if (paging_flags & PAGING_ALLOW_HUGE &&
+			    paging->page_size > 0 &&
 			    paging->page_size <= size &&
 			    ((phys | virt) & (paging->page_size - 1)) == 0) {
 				/*
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 99a2b0c3..a49d857e 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -128,7 +128,8 @@ static void cpu_init(struct per_cpu *cpu_data)
 	/* set up private mapping of per-CPU data structure */
 	err = paging_create(&cpu_data->pg_structs, paging_hvirt2phys(cpu_data),
 			    sizeof(*cpu_data), LOCAL_CPU_BASE,
-			    PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT);
+			    PAGE_DEFAULT_FLAGS,
+			    PAGING_NON_COHERENT | PAGING_ALLOW_HUGE);
 	if (err)
 		goto failed;
 
@@ -141,7 +142,7 @@ static void cpu_init(struct per_cpu *cpu_data)
 	err = paging_create(&cpu_data->pg_structs, 0,
 			    NUM_TEMPORARY_PAGES * PAGE_SIZE,
 			    TEMPORARY_MAPPING_BASE, PAGE_NONPRESENT_FLAGS,
-			    PAGING_NON_COHERENT);
+			    PAGING_NON_COHERENT | PAGING_ALLOW_HUGE);
 	if (err)
 		goto failed;
 
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index b8e1f038..30ec5d06 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -113,7 +113,8 @@ struct jailhouse_cell_desc {
 #define JAILHOUSE_MEM_COMM_REGION	0x0020
 #define JAILHOUSE_MEM_LOADABLE		0x0040
 #define JAILHOUSE_MEM_ROOTSHARED	0x0080
-#define JAILHOUSE_MEM_IO_UNALIGNED	0x0100
+#define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
+#define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
 #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
 #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
 #define JAILHOUSE_MEM_IO_16		(2 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9ca086db-d475-938c-f362-62d325eadec7%40siemens.com.
