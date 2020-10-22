Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVUQY76AKGQE7CZPKMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 20724296449
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:47 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id p129sf436659lfa.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389526; cv=pass;
        d=google.com; s=arc-20160816;
        b=PrACrcVv//AivlHRqFaVyqwGzffr6Sy+f1Q8Eh+LThhQaARJucpkaAzXfFYr4PyZI/
         aYNHpkW7vbO6+c7moe2fWtJy2w0LG5KHjX+Bg22ofwR4+R8hJK0wGPMxPN7imB3Wk2vx
         Gsuqu1YeUSot7Z5f6Zs9TOe+D8v0/psbv8w3mKuyalInthalszCMAltEpaHWgHWMEskV
         iad2+pjvobgp5nr4EZ5On27irWDbXAyuDKGR55vOJNjzZLX4t8Eyu8VSBOm96hA5QNpP
         cv2nK2xUwoAfjklf5z1059OG9I1FjrAFnJT+i7fO7yUp9vJ+98vPZ8R92PqT6ATm+B/g
         Sn/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ecQXNdDdFBUAyo95aKJTqWhsLLLdtZ2ufRi3eQbypeY=;
        b=pRDwQcdIEGBgUx3VluaYhfhHHagj28hmwyauCRZzWjdQF7ozkWj1Z8IvRw2JAJWn7O
         P4s/FykyojqrZ2bctt3ft1OHIEXubwFWKTKgiGlVWdGLFB8983L1bmn0K2i5j9JDHcIZ
         BYgMIu6jeqJsMTXRwjoSrhrpEnmYPj1GFjhk53ADKFhWL0eUU55IxKTZ2UYHw4bKN2VJ
         7KoKhKQA0EBMiaNK80K5DjmO42etFZyvp7Fj23JRkz2jgh612p58wqmPfNlsWw+WTZw1
         oDB0am3X/AWeW7R5u9sZacVT3/0zhpm4og7r61SwTWOwmEfvTl5Tpq2fpqzzCvDNMb0e
         tT0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JzFXIvqT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ecQXNdDdFBUAyo95aKJTqWhsLLLdtZ2ufRi3eQbypeY=;
        b=tcTZe0ug8LUoMWvY2sMRrTEAhZy7kxAO0fCTuxW6O8ZS42UFIoNGZ+YiWKt79B8Iov
         oucJLR26TxroAjhe3M7wOrqZHtmOZaaiBPuK/W8qPKBmrwbhMqcQnp7+SW08/Il1No9n
         F2MaxleAJWt3/WiWbTP8MonAUgdbJqBXfdb2bu+HEIocBQObgHtJopf4gTQ0myeyYkzn
         I45mumGRttxMs9shobj/5wyyzVRY/YSFeDJgH0AtNCYRRG4ptXwn4wvnZ4dCoYgmrdb5
         PcRhqHs82dVF804yNq/Hw6IBJ+gfJjk/1yWmrVJMyHCBKNqVcvcBV0SG263gotLOlWOD
         sIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ecQXNdDdFBUAyo95aKJTqWhsLLLdtZ2ufRi3eQbypeY=;
        b=VAuMqot20BZUtXBA+xQrJGRA8fbqjEV1vFT39VOmNFjhtpWatJAeImDycSYxPdwVD9
         0r+fvJfq4GUuv7cQvU78AEg1Xv5jcfnUOqK8BuDNAUMNfjyEaTfjVEml2gSIgXDYFBrX
         L8mNwoFU/FjzQRSbIFW2vOQCmQgnL04O1DvC6ygDSaYXUzMmVXIiBt2AvQZ6mYf/oBTl
         XnuUR3Zfnx+7ZSAu1EQ24hicKXyhpdDnjXMxrnYBx7BfGUlQWRHogVuIDrW+wTddFqWs
         hSiKVIwy2guEt5oSVRqXqv73PQaJD10BpNOXK8MI4bSa+nCMMmIzQyuvyf005biHfigF
         URuw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532FSL6v2LemnFZU/oo4BTiKjdu9Ukrzu0jgz13oC7UPePTtuxy9
	3LhB6ChsYQZJMerGP/Hppoc=
X-Google-Smtp-Source: ABdhPJwI/LtdJa4ET6Ta7znN9/yxBIsARlrHWiv8XB9jI1j4TJDnJ4/2+oVuJtXWumEwfi62gPTD3w==
X-Received: by 2002:a2e:9a0e:: with SMTP id o14mr1533257lji.340.1603389526688;
        Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls1746697lfr.2.gmail; Thu, 22 Oct
 2020 10:58:45 -0700 (PDT)
X-Received: by 2002:a19:609:: with SMTP id 9mr1143360lfg.289.1603389525706;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389525; cv=none;
        d=google.com; s=arc-20160816;
        b=S+OUBn8mKhIYQoDWud9FQWCJqNU+aXC4uM55t9VkutW/GQSgdnImIOBj1Mny2jFoBu
         ikFog1BA7ab19QoA/KkQ/iFHeVo+Z9nZY7EevPD/f7uv7sC3aTTaWV8Ovr3TVU5n8fez
         qCg2HvkhlYS7MMsWoD2pYjnVJMTGl4o1zoXBemV9eyViNx8bIz4bhzCPkG5/W+97m9wg
         BjKZwf7OsXdvvxNaKTlUrVUWppN9F3cldiJCtrcIhD4k0BSYsCLYlcgrOa2DCNq0i42E
         OaTWN6w/lDm7IUtEJm591ANc4SdWL/GzugeHwEDnwglZKbzDsLqoeQk3lPdmqilc8szW
         Po5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=gsUliSA8OGpMdmX5qNq/yEM4bBchKfdVBrNMLqSI1/E=;
        b=NEr5YY63Abh51gXT/zmhTfhPGNisrsGJ3hPC5Gn9L69oJB457uC7k8IK3+grq/JsF1
         bXQfO5VcYEQoZ2YS71CsfZ5rivNtAmsmsm9MajrtTNMNh2F5ZxHlwqr+oz9DHO/Gv6Z4
         se8HgLORdHOIeRb9Aaw5UDCaoUtavA25U0FsFbTu/i7UC+PhOZ/7JCSGh05/Ib77jpvw
         HxmSRUX7CLkn5t8RORrKhqke+SQsaV8asSx5v8UbfsDYR+qDWzDoQnVCu3BRacWYd9Eo
         umVtGN/OMLy2Jy5BUsZKQNSD0MAS5USOvMeduYL4Z39Dhke+5HOD6hBBSBvpml/dNNI2
         5roA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JzFXIvqT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id o4si107892lfn.12.2020.10.22.10.58.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTx1drMzyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:45 +0200 (CEST)
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
	with LMTP id arD5dRD-jecm for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTw604lzyXW
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 29/33] arm: -Wunused-parameter: keep compiler happy
Date: Thu, 22 Oct 2020 19:58:21 +0200
Message-Id: <20201022175826.199614-30-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=JzFXIvqT;       spf=pass
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
 hypervisor/arch/arm/control.c | 2 +-
 hypervisor/arch/arm/iommu.c   | 5 +++++
 hypervisor/arch/arm/mmio.c    | 1 +
 hypervisor/arch/arm/traps.c   | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
index cd68dd9a..c1a0a308 100644
--- a/hypervisor/arch/arm/control.c
+++ b/hypervisor/arch/arm/control.c
@@ -20,7 +20,7 @@
 #include <asm/psci.h>
 #include <asm/sysregs.h>
 
-void arm_cpu_reset(unsigned long pc, bool aarch32)
+void arm_cpu_reset(unsigned long pc, bool aarch32 __attribute__((unused)))
 {
 	u32 sctlr;
 
diff --git a/hypervisor/arch/arm/iommu.c b/hypervisor/arch/arm/iommu.c
index 2c02c812..307daa97 100644
--- a/hypervisor/arch/arm/iommu.c
+++ b/hypervisor/arch/arm/iommu.c
@@ -20,15 +20,20 @@ unsigned int iommu_count_units(void)
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
+	(void)cell;
+	(void)mem;
 	return 0;
 }
 
 int iommu_unmap_memory_region(struct cell *cell,
 			      const struct jailhouse_memory *mem)
 {
+	(void)cell;
+	(void)mem;
 	return 0;
 }
 
 void iommu_config_commit(struct cell *cell)
 {
+	(void)cell;
 }
diff --git a/hypervisor/arch/arm/mmio.c b/hypervisor/arch/arm/mmio.c
index 1c492b43..120312c7 100644
--- a/hypervisor/arch/arm/mmio.c
+++ b/hypervisor/arch/arm/mmio.c
@@ -29,6 +29,7 @@ static inline unsigned long sign_extend(unsigned long val, unsigned int size)
 /* Taken from the ARM ARM pseudocode for taking a data abort */
 static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 {
+	(void)ctx;
 	unsigned int lr_offset;
 	unsigned long vbar;
 	bool is_thumb;
diff --git a/hypervisor/arch/arm/traps.c b/hypervisor/arch/arm/traps.c
index 10b3fdbf..103dbbb8 100644
--- a/hypervisor/arch/arm/traps.c
+++ b/hypervisor/arch/arm/traps.c
@@ -96,6 +96,7 @@ static bool arch_failed_condition(struct trap_context *ctx)
  */
 static void arch_advance_itstate(struct trap_context *ctx)
 {
+	(void)ctx;
 	unsigned long itbits, cond;
 	u32 cpsr;
 
@@ -404,6 +405,7 @@ static enum trap_return arch_handle_cp15_64(struct trap_context *ctx)
 
 static enum trap_return handle_iabt(struct trap_context *ctx)
 {
+	(void)ctx;
 	unsigned long hpfar, hdfar;
 
 	arm_read_sysreg(HPFAR, hpfar);
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-30-andrea.bastoni%40tum.de.
