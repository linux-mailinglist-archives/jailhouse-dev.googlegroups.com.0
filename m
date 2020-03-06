Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCMTRLZQKGQEHQVEUDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB017C47C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:34:02 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id n12sf1302904wrp.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:34:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516042; cv=pass;
        d=google.com; s=arc-20160816;
        b=bzSbWcv5y6IMFzO4s5uQ79g4a5T2+0Hjh8x2UN/cUICeSwYZsIBD067paea6yivqXm
         +nvnDfIoJp7/bb+9OFzxDNC3pWHlolIPWwI37t76Q7yfWjz8cd0KGZVtehu72dEK4glO
         GGebJ0BqzR+uqhh2y8TJAy/N3ypWDLTfhCW4NkAw3PFme4FYxJhwgXterJfwKgrqZYfZ
         Tp0nGbtkr+BZTISZjUKMJX+JmwEMgpR3s7h+CfjJUwhpnaiaZO9zzwGe/pZba2fdo/2+
         UhgrdP5nkUNTQuNYrbwPzexx0Y81OK8pa9DT6ziToDj500rs1/cc7FZ/AU2UYuyycd8k
         5UtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=mk1OVcp3Iwb78k8TEewpdxUsy8S7Mt/LwfUUYoa4ntc=;
        b=IiC5vb9tAwcbFuemqFBu3CCqs7G2oqIZA7rl+IOnJwlFwAZGXV0FaEvFgd5JVysv76
         YZSS1vSy7VC9uWCDAvqbUfp59Cghvix1xrYC5Lpoj4GuwRmHqSzWCdGcTAB1IPz1SftZ
         9r80LbtvPthyYyNtbjKGim5ljTrZGGtb2XYZzAfShwE+kCvnANcW+d9DplRWn3YXaJ1U
         hQeUjw2X8052YVHdqVYX6rek2MkJ8qheM1pGUTPsrQ7x0oZZqngmC/v6fXk8fDo47dH2
         yj2N+w6EOZYiYDFNVLA8eIbrH5vnV81Dc2SnsjXIoO4MU2GBPVPVHIE+0nhcyCz7nmrY
         dpjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mk1OVcp3Iwb78k8TEewpdxUsy8S7Mt/LwfUUYoa4ntc=;
        b=tPRWnBJLy4MfTbadXMlXBFOeoT0hC22EkLRuaWHpOUSqxd4eF74VTb5t4jI2Om4//Z
         LQQ+DthJudhQZXIfmCKCtVYeVyTK7a7kfMKAPX01wS+6vjEUuRQwJQcyMLgaO5PmRNvO
         WDz64UEQdK0hRj936QiJNzQQFEiQ68FbqGbbDZipgilSljp9QBsHPpkm2mg0ysGM1YC+
         N2Z+SUMYYMrLsuZVfG/GXkr+1PuTXXc4enOVeZOE9rHKFmptXirV7LVnSK/LhaVpzz3J
         TLeTTvgxJqdVOUUqCeofENhrgrXhubCXjt566/08fbA22kD2LojWfxRAkwrHkA18rFPp
         EXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mk1OVcp3Iwb78k8TEewpdxUsy8S7Mt/LwfUUYoa4ntc=;
        b=KCLTc9BXAMXZ8RX/+CcLwuTOM2CwkFCABUIOMqxI2KfGGJgmWOmzeRBAo737vo3/Sh
         7gv8UKmdG00qUotDZrzqrkVLjk9vMoNa5Hmt2TyLQLKXG5W2h9UV/XS+h5yaD74EWS4b
         EpHOZJxmcKJh12qj4QCr2A5qWU9tsD7B59b7YoYjpaUuEH07EK7jURuuSWoUxOvyBtvo
         tRyXfJdyATib55bU4AUNvqfBve+06BiWfvXZ5Unn6zoiZpPB6pVD8d4nNeNps2kMRGVe
         rSaswfpsPU5dM8f5wlbi3oSsGTqUDHmjBGY5RaPYJQPy/e4tPpyqStedl8zp6qRWFBU+
         ArGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ23iFLF4IAGAJappTIw5oQej7OExNc97wC17+7AYWYaafsVGFxC
	NjxrM2o5sdCNF7RiVSyaRnQ=
X-Google-Smtp-Source: ADFU+vtoOXrQnsG/Wu0TQsRlmHPjMqjfYKo85mxNb7j16euFue82A8nsUKB5Q83Lr6rmQA77SPfI0w==
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr5289967wmb.154.1583516041921;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a98b:: with SMTP id s133ls1998688wme.3.gmail; Fri, 06
 Mar 2020 09:34:01 -0800 (PST)
X-Received: by 2002:a05:600c:214b:: with SMTP id v11mr5227230wml.13.1583516041157;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516041; cv=none;
        d=google.com; s=arc-20160816;
        b=MUc5C9nqIPza1Kst759ucndeaAgL/XErVpkSsuMnTJhE//7O8D0wghJB3p6rTLFdDc
         5jcK/MoNXl4e64OqI2iQomWvrvtjqhYow55mM/oG+xyT/eWsq0x9Gi0o2gdOo4dHpBoK
         dWpUNDDiSwe4aJUHEEL7ZP2YLs15RSiA8H8MtG/oTBm96250701VkMIPm5Pp+VUMP87D
         mh9pW3mtIAd1DHBwDvf5uLphVZU7BI721ySEVwb40Z957c57QGD4VDe6132miRzvHWmA
         BV1odxWQNIk9mLEmQTnrOwj7RqC8L7WA0ou/A1XsL/hFTKh4/3x67R1OZ4cGHuqbtMs+
         XNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=7RpihBZh8kRFLpFSbubJp2ZXR06WbwhupClDVy6QzGE=;
        b=gqCfsYlftm6tz0m3u9XHr085HAiqtYaUFAFzcyI9+4TwS83vuZQkmdAxF5KvDOKdd7
         QYpwVEc43U2wfi/Xc6XrJce8NufIMZtmOHtImpHWH6qvSkJKpzdLR0yE9wRb+P3dLkfT
         RfNuP2V/Lth8bHxiXjYdJbWA7RFgJVDGSocwogfLG7iPXB4HoqGVNamIwEvkL86qUzgl
         cf4dPji3+UIfGLxe0HJcM+YXC9EtKKPXMNUZFAidMyQvg9+Q6AF7hzUQEQ8h127ZH6CN
         T4XeSwde0nefUW/Cde/U9JV2SMIJRhGi2z4uxxMkQPgzBEgV165Kl9NGE7NYHKhPJupl
         SkEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f1si89575wme.1.2020.03.06.09.34.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 026HY0H3019502
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 026HY0a7016750
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/6] x86: Add proper fence before sending IPIs
Date: Fri,  6 Mar 2020 18:33:54 +0100
Message-Id: <564f354155a3a21e95041c1b8fb79605356abf65.1583516039.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Since 2017, the Intel manual suggests to use mfence plus lfence as
barrier to make data changes visible triggering an interrupt via the
x2APIC interface. Jailhouse was so far not using any barrier
consistently in those cases, neither for internal NMI IPIs, nor for
those triggered via the ivshmem doorbell interface.

This adds the recommended mfence;lfence sequence to all IPIs triggered
via apic_send_irq or apic_send_ipi, at the risk of having more than
needed, e.g. when issuing an IPI on behalf of a guest that already used
a barrier itself. Compared to the risk of missing a cases and given the
overhead that the intercepted IPI submission comes with anyway, this is
the preferable option.

Note that this also ensures proper serialization of data writes and
kicks for the ivshmem doorbell interface on x86. Such a property is
going to be demanded by the ivshmem specification.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c    | 11 +++++++++++
 hypervisor/arch/x86/control.c |  3 ---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index 04b46501..d36c2033 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -89,6 +89,10 @@ static void send_xapic_ipi(u32 apic_id, u32 icr_lo)
 {
 	while (read_xapic(APIC_REG_ICR) & APIC_ICR_DS_PENDING)
 		cpu_relax();
+	/*
+	 * No need for an explicit barrier, the mmio access serves as
+	 * implicit one.
+	 */
 	mmio_write32(xapic_page + XAPIC_REG(APIC_REG_ICR_HI),
 		     apic_id << XAPIC_DEST_SHIFT);
 	mmio_write32(xapic_page + XAPIC_REG(APIC_REG_ICR), icr_lo);
@@ -111,6 +115,13 @@ static void write_x2apic(unsigned int reg, u32 val)
 
 static void send_x2apic_ipi(u32 apic_id, u32 icr_lo)
 {
+	/*
+	 * Intel SDM, Volume 3, 10.12.3:
+	 * We either have to execute a serializing instruction or the
+	 * mfence;lfence sequence to publish data changes before the IPI goes
+	 * out. The latter is clearer and likely also faster.
+	 */
+	asm volatile("mfence; lfence" : : : "memory");
 	write_msr(MSR_X2APIC_BASE + APIC_REG_ICR,
 		  ((unsigned long)apic_id) << 32 | icr_lo);
 }
diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 4f667d43..2aea807a 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -77,9 +77,6 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 			vcpu_tlb_flush();
 		} else {
 			public_per_cpu(cpu)->flush_vcpu_caches = true;
-			/* make sure the value is written before we kick
-			 * the remote core */
-			memory_barrier();
 			apic_send_nmi_ipi(public_per_cpu(cpu));
 		}
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/564f354155a3a21e95041c1b8fb79605356abf65.1583516039.git.jan.kiszka%40siemens.com.
