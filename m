Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWUQY76AKGQEAWCGBRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2729644D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:51 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id u18sf1020869ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389530; cv=pass;
        d=google.com; s=arc-20160816;
        b=sBUWQv0MCqqBj7pxXgA/sHAyxSlFzA1H8Or6cYWqC5gck3+aNbd8vRTIeKfP7K2/Hh
         V1vPszPlpy5fdToATcCjEqKNAwU42A3zhoI0GyNPNEM+5xggdOhorMQNtpDWsg+WOHdO
         hwRkUmLQJrbKflGVvnCKvLoEoLjuirqyZ2ACKv6XxXoJgl54L9qa9il5ASIqRzW4CPeW
         QsM1Y9i5pfsduRPMQqFDQpbrV/9QQRD8VxLLV2RS5XcNFBDKkVt2U9SgaM+T+ESRjYrI
         GYeyKTDf3bbB3NltFwSICuZD59Fzix6OztDanKE42B/aLbQxDyUpBkE/i/hRC2CI4Fbn
         dVwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=PgzTdHPvODLY0Yu3653xlKDWhBGeMZ8CzhhaTMftBos=;
        b=U8DgDUUel9Egi9a5j0i8IVJy2tCiDvCUheVpVL66osO29yVsXk6maKyHOIeVbOnZaS
         PAUJLuqZsQvMh30N2Y0nzQSghErR+jPLguIT53oGXxhsJqluQUehhtJ9ntQP3oZKBxTi
         FnoABOlqaScm5xqG0snnh2iE5D2fO3bSUG3s19eWzEKK4mz+y86HEJKYsC7sVXNoM294
         3h16HOet4qEteLc5HtTmEEfy18J6umG0AKhyLjMQIuqLr/jrqnEzdRypfHCttWFjWjiD
         jy0ssHIuPNgCWcQbMMFiJtObbBKv+TeQDX685BsX+tchUEpgmK8eO5HsDwPUF/3PMlge
         Xd1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=dH7l3eiV;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PgzTdHPvODLY0Yu3653xlKDWhBGeMZ8CzhhaTMftBos=;
        b=JirDMWEh+ITMbU2cxAeIH7sRQlJaOaWXFOHgkovtFPXrW5vvmP8Vl1UU82wKoLru4r
         ngUzQ0f22uRN1ReHPJXU0+HM1rCBZRqGUU0EYSpeL/HvXHF6yMmaefVF9I6/CQUVaetr
         pr+G9lYfBea6JwdufsJGAOhWOzRpKlUgZV5oyi8xY1zbenjV1k1FT7LODlYTJDLAkQTl
         /Mz4YaFxzCdGFK8snzWeD1Bfvj8l2aI160PIGkIXPCI4hx9A1eKgdZ8FUInc/HaDY7TX
         q+uN6G4ianyhHhj+jLSoq8lkR/i1Wq/wlsAPslsbXCjtKGdxTmZ8CLSB3COrhh9pE8Fl
         RACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PgzTdHPvODLY0Yu3653xlKDWhBGeMZ8CzhhaTMftBos=;
        b=IIZAglC+U4iHbmMIKCu80pcpnIBf9mzMQ8G3PQA4SKoJCC4a4rM9KpmMkD7aKTLWOx
         5t2/7VyRU1MfWt8Wh0uN2QuVQS5zHJ50LwOPfsEL/xzYeYsCnx24hspXRiqKJ3GDBMGf
         FduOQywBU2dHc8CMahw51tylj8A/KOzuZTsIxjO0Itot/8Ja3LpWijDSaVSm62AR8EZ/
         EnxQNc8f500Ele2uuGL0KRBVlWtW4F7BBZQg6syGs5S6OGFelese8TaDiC1ueYmlSSUz
         dncEO1lXL7r3cNQ8D2Rfe1lnclUV93MQvepqPOYsmxD62xAfazxQOYwNEd4repJxtVO5
         XxTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532loXe3FVdvv5k2a1yoJ59ncOjVHhztPbdjZmmOHIhHU0wdLVct
	zqoaHWKBbFgCRCc5+DhP3OE=
X-Google-Smtp-Source: ABdhPJxkLA8R+bSTZN3NO1ovcMzDCwBTKOkiQvTU58jxHa0Elphslof3ohkPl/1dYU3vPXVcIR5f5w==
X-Received: by 2002:ac2:5f9b:: with SMTP id r27mr1349168lfe.486.1603389530751;
        Thu, 22 Oct 2020 10:58:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:890b:: with SMTP id d11ls493325lji.6.gmail; Thu, 22 Oct
 2020 10:58:49 -0700 (PDT)
X-Received: by 2002:a2e:910a:: with SMTP id m10mr1540603ljg.385.1603389529627;
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389529; cv=none;
        d=google.com; s=arc-20160816;
        b=m7SEzOpExw+irnpA1Q4erSkBDifJgL1xCFqh4kMNz0kFwUH+XSkvpiiIBE6Pby13rG
         hWF/QDQUW9iUlP68/m+c+RZQEnmXx9/qeFkk09IXgBltqAOA8Y4Ym4pA/gQhRlFQSJFS
         U5jwAgvBkzxHJpEwJ6h563izlpBrxIof5c1vKupk0QWTq94k9oe4Aqd9A17zTREutT2I
         aQr8TdEaiYm5ulOHyPkc7WKMjCZ+eznQWL8xtrlwJ8xMnvf+4DSyRjV9XZrlQ/u0AMSk
         U5PqWP3bz4o2iMxP8p5/opXxb814UqvmJLAp67gR/tS75H+q0yOzQx86m48AzjDkiYDi
         ZngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=loRiy9MwUMyqcTsf3919hvnkZVEvv1Ozs+/EcKHe/Lg=;
        b=r6xDrenXw9QRBmcoe5NwqrTEUgqwv84wcwgO/DEXf+OrsevAcAGXuR1fMezvFsQEk6
         Mf4u70fqAr0vBzFAO/NkVdqgXTo9wAhLFziua3l9VgqkhfWAQEgaE6Zo7bUTZmJAjhEb
         6Ez2Kldp1+6fBzFhX+/uJ4Uzifcr7WuPH9MRf7VC3xn1WxYE2AaxUbUIhoihA5xC8LF/
         d+WddLoYM6yVLcD4XDYuqwgIy3KJcpcfnrl6Wp1KzDu2PwceuAoj5CHCEmfk6afHeDUG
         LQ4vN17RcjGa59A/a8S8oiWRwyV4Xw1bIr4RkFs4LCF2vDZyG/8y51nU7Bg/IEEvz2FU
         2eCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=dH7l3eiV;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id n5si81791lji.5.2020.10.22.10.58.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFV10TKWzyZt
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:49 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id YyTLWat8tEBJ for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFV03R2HzyZv
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 32/33] x86: -Wunused-parameter: keep compiler happy
Date: Thu, 22 Oct 2020 19:58:24 +0200
Message-Id: <20201022175826.199614-33-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=dH7l3eiV;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/amd_iommu.c | 14 ++++++++++++++
 hypervisor/arch/x86/ivshmem.c   |  2 ++
 hypervisor/arch/x86/setup.c     |  1 +
 hypervisor/arch/x86/vmx.c       |  1 +
 4 files changed, 18 insertions(+)

diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 40ec4e20..8ee8031d 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -151,6 +151,7 @@ static unsigned int iommu_units_count;
 
 bool iommu_cell_emulates_ir(struct cell *cell)
 {
+	(void)cell;
 	return false;
 }
 
@@ -211,6 +212,7 @@ u64 amd_iommu_get_memory_region_flags(const struct jailhouse_memory *mem)
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
+	(void)cell;
 	/*
 	 * Check that the address is not outside the scope of the page tables.
 	 * With 4 levels, we only support 48 address bits.
@@ -225,6 +227,8 @@ int iommu_map_memory_region(struct cell *cell,
 int iommu_unmap_memory_region(struct cell *cell,
 			      const struct jailhouse_memory *mem)
 {
+	(void)cell;
+	(void)mem;
 	/* vcpu_map_memory_region already did the actual work. */
 	return 0;
 }
@@ -380,6 +384,7 @@ void iommu_remove_pci_device(struct pci_device *device)
 
 static void amd_iommu_cell_exit(struct cell *cell)
 {
+	(void)cell;
 }
 
 static void wait_for_zero(volatile u64 *sem, unsigned long mask)
@@ -504,6 +509,10 @@ struct apic_irq_message iommu_get_remapped_root_int(unsigned int iommu,
 {
 	struct apic_irq_message dummy = { .valid = 0 };
 
+	(void)iommu;
+	(void)device_id;
+	(void)vector;
+	(void)remap_index;
 	/* TODO: Implement */
 	return dummy;
 }
@@ -511,6 +520,10 @@ struct apic_irq_message iommu_get_remapped_root_int(unsigned int iommu,
 int iommu_map_interrupt(struct cell *cell, u16 device_id, unsigned int vector,
 			struct apic_irq_message irq_msg)
 {
+	(void)cell;
+	(void)device_id;
+	(void)vector;
+	(void)irq_msg;
 	/* TODO: Implement */
 	return -ENOSYS;
 }
@@ -740,6 +753,7 @@ static int amd_iommu_init_features(struct amd_iommu *entry,
 static int amd_iommu_init_buffers(struct amd_iommu *entry,
 				  struct jailhouse_iommu *iommu)
 {
+	(void)iommu;
 	/* Allocate and configure command buffer */
 	entry->cmd_buf_base = page_alloc(&mem_pool, PAGES(CMD_BUF_SIZE));
 	if (!entry->cmd_buf_base)
diff --git a/hypervisor/arch/x86/ivshmem.c b/hypervisor/arch/x86/ivshmem.c
index 62c1808e..c55c4d24 100644
--- a/hypervisor/arch/x86/ivshmem.c
+++ b/hypervisor/arch/x86/ivshmem.c
@@ -60,4 +60,6 @@ int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
 
 void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
 {
+	(void)ive;
+	(void)enabled;
 }
diff --git a/hypervisor/arch/x86/setup.c b/hypervisor/arch/x86/setup.c
index a3e1f9ed..98624052 100644
--- a/hypervisor/arch/x86/setup.c
+++ b/hypervisor/arch/x86/setup.c
@@ -221,6 +221,7 @@ void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
 
 void arch_cpu_restore(unsigned int cpu_id, int return_code)
 {
+	(void)return_code;
 	static spinlock_t tss_lock;
 	struct per_cpu *cpu_data = per_cpu(cpu_id);
 	unsigned int tss_idx;
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index bf25d00d..e8e8b338 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -1028,6 +1028,7 @@ void vcpu_get_guest_paging_structs(struct guest_paging_structures *pg_structs)
 
 pt_entry_t vcpu_pae_get_pdpte(page_table_t page_table, unsigned long virt)
 {
+	(void)page_table;
 	return &this_cpu_data()->pdpte[(virt >> 30) & 0x3];
 }
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-33-andrea.bastoni%40tum.de.
