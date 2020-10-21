Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGUXYH6AKGQENUAHRCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CA1294F22
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id t3sf2838436wrq.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292058; cv=pass;
        d=google.com; s=arc-20160816;
        b=RR66F+dq5ooHqo+EoCWbGoQbaXoTY2dwj3aoWWxx3CWATdg065xirKsS2Ln45dAByM
         3gFIVxpEjDqcMDOiFummjAiTZnYb6y8uisAa9j8oZClla5+Q0ScnrpWUistqvVemqOlh
         muMEC8X3b5xQJU4UJPGQFwI6aab/cdve8dGUHIgwL+N3xE6mrwQaASERbIxDgw+VTAk0
         +A+XXnvoNx4Ste0wGZ0bMVU7zNEu4T0Zgz2bPYWHaplZ2H/H0OwK5+irCm7Hxkomh5Ek
         gaeqGSG/cKYtsZpaAmwVKosHEXh4byyuutlDVVZ60h9mxzDbc+ezDNMtCQrQhFPTaHO4
         ZBNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=fSkDn/H85mYqCxt6riAS8IYf9kt9S12JyebJm+0GA4Q=;
        b=UztIECa9qPEo6aCy+01xPhHK6gW7qQFpt8dKvhSFU7ieuK9y+goW4vBXqMIhmxHv7t
         NmV2p+7xxFiAIeYrcQJjv0dF1e5iUgYN+wwBRHxlJCdkfybs5LJFtvI1r21FY8npvW5b
         EPx3pTegw/5kfbUIQy1JDYqHrAcydgzFqB7GtEux1+/TVqBE4RWM49g94a/RLjcpHkyr
         2z/o+FWnDTMKER2kPVHXNK3S004iz7jiNw7oYTCRb3jrZ0jqjSNWHDcnLjMmg2/hxxWN
         2ToO7vJe9JY9zgOXJ5q0lt6uvK9BNhWhzx79u3CEFMSo4gdAOUrriWklCc9s2TMAXJ+y
         ir4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JvkbxSvU;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fSkDn/H85mYqCxt6riAS8IYf9kt9S12JyebJm+0GA4Q=;
        b=MnkWd1omkg59c/enaQI98aQTUueg10hrliYCifKqiD0hbocVQC+pZLaqIWOY/ofL3C
         b1g4/9cb/5h+KNTjkjulV12Rxr1jGWv2oWCULjnEhJF9Lu6Lie02cgja1z50A/WrLA7E
         N9OkQ1oDPfBdE0SIkxqvKXQ+OPPjEnuEPJkpdWg4YauvQaJaCT0id2spFtqTbJlMElQL
         oIuktgMphwsW4+1S41I2bkY1hJgA6r2xqVT3w2+YN8Ib5jSCXDatfA8m6hWK2BjYNVzK
         Flkf29+mtUYlyYUhNbS4qUZAJ3hDqrkxF/3jRrElVdPDsVts6JLstXulxbb2X0OYUYjX
         ub4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fSkDn/H85mYqCxt6riAS8IYf9kt9S12JyebJm+0GA4Q=;
        b=Gk1o6RmpabWOpouJqKEY6UGAptguwjODGCftvPJ47U4oqEQeTpnvl7s4vFdHJPxxGK
         HF8gCZ3Wl2C3Ks2u7GOloIl9lhnAE62eNXBD5KBKg2/qc9NAAJwp969Cpa6nJyaAGbOc
         HO9Zv6TCsAcKdVQheHTAN0juH2ZGTcQc+yU/pIb4wn+71ns2rqxFEdE2TxU93L8QzLLS
         RZ/9Gr/fu4A/hWq8jstFTIOqEzWls4WNeGamJsyFPP11emvLd3ogv8en6kBY5TEnVasD
         gaZaovf1rBMNR1fFeb5yFMkEM6i2lxXVpoO4m2AupVbK9iUNl+bkTl8sOfdaxPSo+vpT
         l2wA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qxSStYmXdhlib38pje8hCEkLwcGQRe39W5mdFcg7VsHVnVkvg
	6n0N62L7p9tNy4GyG48z8w4=
X-Google-Smtp-Source: ABdhPJzS+7Mo0jx+PjtKXqpnAnnVCTnJR0/6LE8zD11co/IWo51RfsPgIu1zDQmhftfgQOXNgRAjcg==
X-Received: by 2002:a1c:e154:: with SMTP id y81mr4054619wmg.111.1603292058751;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1c2:: with SMTP id 185ls112533wmb.3.gmail; Wed, 21 Oct
 2020 07:54:17 -0700 (PDT)
X-Received: by 2002:a1c:a90e:: with SMTP id s14mr4097033wme.46.1603292057837;
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292057; cv=none;
        d=google.com; s=arc-20160816;
        b=jAWKtUE4VcobXx7iQwlcMV/S0dF47Q1GGinMaWwJ3vFtKrnQjBVgEK1CSIyzPJMhlX
         PCzhoIChR7GnAd1eLlIS5a9aKzwFjUGPG+5kaQ0ayhwvCan4O1pk1DBkwxK3hTamwTXZ
         s/FlCACsNpoQm9ZFcjEbJr0nir3p+011OQyRo726ocCkFKpU2aCCimLqOMKnYquVuXDt
         iPyHpVZzyqM8DxT1lVef66B47FVILIL33SLzDqS1UfZ5I38CvXQO96KcHO6o/VUCAzJu
         WnGIQr1Cuj8PNgnyxBhjLduaE65+0au4Nu4494PiToh0Ohy1bfY7+3Lq3dwhwtEdL0dN
         LoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=loRiy9MwUMyqcTsf3919hvnkZVEvv1Ozs+/EcKHe/Lg=;
        b=LvJA+U+lM41lBR6o6FLPmy13Y4ERVrfOx6kI/fo1h9Nat2OcD4N08HtxowpCC45wB0
         k8ergp4KAKd9C9yQz0IqSocQCGuJCdC8Jz1NdMPq0l1sGrmmbcqOAdRx0bize5IxjVX6
         Cv5nsSS+i4f4rVBRioOVupsb9DIlJKER0SWJiWm4kJ+6FfNJ94f5O/wuN8M14DgOcsyV
         VU0UBf1wDshc22Qw6WPNTTfI6Bld/Sq9G3A/nb06xCBYE64+iriaJ0lPKbcX8m6wyi7X
         MM7c+WUkDszTAFO+N3579dmi/+/LO2kuAv05VVg/oKecAr14QteNBYCSZjlOLYEinr4B
         ptgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JvkbxSvU;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id w6si94175wmk.2.2020.10.21.07.54.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRY4mQhzyRN
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id DrbmUmGe04Jc for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRY1QfdzyWw
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 14/26] x86: unused parameters. Keep compiler happy.
Date: Wed, 21 Oct 2020 16:53:52 +0200
Message-Id: <20201021145404.100463-15-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=JvkbxSvU;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-15-andrea.bastoni%40tum.de.
