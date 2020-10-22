Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBT4QY76AKGQEBXPVRNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CF296438
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id l23sf641824wmg.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389519; cv=pass;
        d=google.com; s=arc-20160816;
        b=ximUpUu/VrGvL7dvUX9jOIpvLyJQbwoy/q2dtRJI6BFD6xH8y9bgY3HZMhfpXQouM6
         WzBsgD8Vjf9k1658GWd6Uj7ytmqm0StY3E/JurPJCwD53HYwOBmJB2WJ3rxOyPRtzbka
         0UJCUk2059CM9VP8qsFaMwuZxnspj5JjxdgZOXg4afdnGsdFa9tdxj1+XqEshURCe3+O
         KJVZmhgBzuIYiI7q8woHeNKhn75rOHZYGUBmDJoSfA0RAg7BegRjlXOwinSg56jygek5
         K22rqOXgLHsNvu/9Iqfc6VGZxd556CXz+yBKIW4v9Gs1+joQfvq5c85StTbUE5KJ+Jzg
         lY5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=g42HBNIazKhUL7bTqFwaDIhdTE0+dkfpAXYWjjHAMlk=;
        b=LHPOpGhV9/IbardAUzHnfNx7NJ4g+OawdQQY628T8y6Mmredm/56qzaSyh/nRg0OGM
         JpsqPXLekN5N+vNR1GkxZfMTT14cBOaTK4TLRBxfT5SldM2sW0ZLmdFsukefr8QXO2pZ
         Ke8eRAbLQ8mHAvMFSG4jcDy01m8VD5NM5OFmUE+Q3p9purfmMgLmH1oC3WyTKrT6YZ0C
         IjGDn4qHY78pWTalVCLm1WDy8ztOPfEBXGspxQ95Bmk7voNvWWttcEVNDHUnZVJEXy9F
         rWmRw5WJg8kC6TsEzkGu3RjlgZ3oJRPZQQ/DNLbK/n5+G5Ri8R1ekAtgW4TSxkzGJPlO
         RovQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ljoD9nrH;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g42HBNIazKhUL7bTqFwaDIhdTE0+dkfpAXYWjjHAMlk=;
        b=TPErm1NEKd7VsvjJsKt0SnIK5clWEbaR2XVkRYVeiW83P9o7A6p5Y2rV+TZFDiNUIZ
         iqSbsh3ddstcOIz1Cj2/R5yFuWpMWSutsWp6LJ4FXFM5RqIuog+oz2/t5v5eokB00KOC
         HQNDFz8X/tr2LyjVEtTX0clDtg7FEOVFlU62buB82eQ7lUf2KWMlAG5xk5rvxg9SrzTZ
         vx2YMFt0BntipIj33Xp4aHgyy0qcnjnwmUXNYtuyZ7J2So1vubq9mDDAmaNmYXtom3x/
         QxcTLpfccJj1XdTQsSikozKi6OpMainDxB/YTaAtPeOGsZEXnkoo7AXC+NJEwwvHHdMF
         jWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g42HBNIazKhUL7bTqFwaDIhdTE0+dkfpAXYWjjHAMlk=;
        b=YFq+LhBZ/DQlWfomK7/oTetX4PEl/uGbWgu2oraPR1SCNoe9X9M06huVkjLbXXDJP8
         rXdwvUPyhMx2J//Medu+ANMXOM0Phdfc807RK0V+JBufJsDrco/Jm7IFIoSOsDEluU8N
         Z/jmlH9thf0nLiWsygkQ6ys6L4jIMNwMs9DzXO3UphheAW2Wrzyo4MFVMoNvhsUPhnKr
         ze+diwqp1sAEv+R/hlcltXFf5MlgUeKSpz3EHOxP8Pj/pSxh/YLIpxqSbnTlwfd1GbYa
         XbnA49+S8PsmopcRqgxUbNeDP/KKzx7mNRj/O33DurUeXom1jTISCvoTq3XBRoDQ2I/F
         918Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530mG3Wb0WYKVsxeYhXPkKP+5Gn6iRViZkCyrbO0f/E89ghVaRFA
	D39sXn/4ZlkS+QGRh0gm4HY=
X-Google-Smtp-Source: ABdhPJxbcBtHS/E9CfZSznB4K4ooO/yhp3y1F5Hb/SPrX1yffPFW1mIAtak2OY+4B//SA713mcQynA==
X-Received: by 2002:adf:f643:: with SMTP id x3mr4249012wrp.180.1603389519368;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4184:: with SMTP id o126ls198635wma.0.gmail; Thu, 22 Oct
 2020 10:58:38 -0700 (PDT)
X-Received: by 2002:a1c:4306:: with SMTP id q6mr3876110wma.189.1603389518319;
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389518; cv=none;
        d=google.com; s=arc-20160816;
        b=sUvvj9UUMsj+uKY6k2ESNpdXwquZeZv4oPSDmd87LM8BWs/1VfqWtlY87PhJkxWDZV
         p42SAL4Va6Cgw3qNFjKlYzhGWKaoGxhVF3oKeX4gijBD6CT2FOxHyGzucOXit62p9oyU
         2VJKpPfsX9UFuiJfSJLN3ZGwTYjG94lf7HuXo09Gbtdn0K3GHPCA/E73qyBnULTPYPzX
         r0V+CPn0hZnc9ogA2g9FBTHD0TpG9zQidcjrM53EittZuEetEhXUmYrcNx0yEj8jXyzg
         Ng1AxEnEnhtLb6szBUgWHWp3PSVEhpIBOipFVRlzfhLhFLEQPJXr6sjJSuY+GmR5W+LS
         YqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=gdkZ39xBhBNAqSGezsKs7kbEJDA3dT5WvYdKNJYi/lw=;
        b=dpyTHJfueEXpi5fkL2Y62Lte2/lDoRENM19VnyZ4DUZswWiC8AYcB4ULBgYpYBY/hy
         noPqJBAmr8WrJeUT4FHULpXOq7TW2BkUBbqxIYjgjPIYi9QBaaDfKN8HPV7J3pbUUtua
         EFUHV0OQlcSy3Y9ktjfCcehPqC03ZHPpwQ/p8D9XjvNVtblnco467GR3bcpI6r8rXWs2
         Y3B/fK2ATAzrakdnCbvb0fQC8CtlEQtoo71c5rl5GnXUuldnvxPElebn+tVWdBN7uoxc
         hyrPzB1V0YSXKwdrUHS1v/rlj8Hu4DdRBk+expVo1OqGmZXM2vcIgrrGWeK4qcmaeEyy
         pzKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ljoD9nrH;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id 11si79624wmg.0.2020.10.22.10.58.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTp10ywzyZt
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
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
	with LMTP id 7zQdnccTVdVX for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTn4CXVzyZp
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 12/33] hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
Date: Thu, 22 Oct 2020 19:58:04 +0200
Message-Id: <20201022175826.199614-13-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ljoD9nrH;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
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

Substitute the implicit "-1" occurrence for an invalid CPU id with an
unsigned int INVALID_CPU_ID that can be used in all "uint-related"
comparisons.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/lib.c       | 2 +-
 hypervisor/arch/arm-common/psci.c      | 4 ++--
 hypervisor/control.c                   | 2 +-
 hypervisor/include/jailhouse/control.h | 5 +++--
 hypervisor/setup.c                     | 4 ++--
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm-common/lib.c b/hypervisor/arch/arm-common/lib.c
index 916cd54f..889b3d14 100644
--- a/hypervisor/arch/arm-common/lib.c
+++ b/hypervisor/arch/arm-common/lib.c
@@ -31,5 +31,5 @@ unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr)
 		if (mpidr == (public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK))
 			return cpu;
 
-	return -1;
+	return INVALID_CPU_ID;
 }
diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
index 6a9abf60..242cad5b 100644
--- a/hypervisor/arch/arm-common/psci.c
+++ b/hypervisor/arch/arm-common/psci.c
@@ -27,7 +27,7 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
 	long result;
 
 	cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1] & mask);
-	if (cpu == -1)
+	if (cpu == INVALID_CPU_ID)
 		/* Virtual id not in set */
 		return PSCI_DENIED;
 
@@ -63,7 +63,7 @@ static long psci_emulate_affinity_info(struct trap_context *ctx)
 {
 	unsigned int cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1]);
 
-	if (cpu == -1)
+	if (cpu == INVALID_CPU_ID)
 		/* Virtual id not in set */
 		return PSCI_DENIED;
 
diff --git a/hypervisor/control.c b/hypervisor/control.c
index b38ac2e9..0078ef19 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -48,7 +48,7 @@ unsigned long panic_cpu = -1;
  * @note For internal use only. Use for_each_cpu() or for_each_cpu_except()
  * instead.
  */
-unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, int exception)
+unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, unsigned int exception)
 {
 	do
 		cpu++;
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 9b94f563..32a1ca2e 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -17,6 +17,7 @@
 
 #define SHUTDOWN_NONE			0
 #define SHUTDOWN_STARTED		1
+#define INVALID_CPU_ID			~(0U)
 
 extern volatile unsigned long panic_in_progress;
 extern unsigned long panic_cpu;
@@ -34,7 +35,7 @@ extern unsigned long panic_cpu;
 extern struct jailhouse_system *system_config;
 
 unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
-		      int exception);
+		      unsigned int exception);
 
 /**
  * Get the first CPU in a given set.
@@ -42,7 +43,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  *
  * @return First CPU in set, or max_cpu_id + 1 if the set is empty.
  */
-#define first_cpu(set)		next_cpu(-1, (set), -1)
+#define first_cpu(set)		next_cpu(INVALID_CPU_ID, (set), INVALID_CPU_ID)
 
 /**
  * Loop-generating macro for iterating over all CPUs in a set.
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 6f4e22c5..f0ee0896 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -27,7 +27,7 @@ extern u8 __text_start[];
 static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
 
 static spinlock_t init_lock;
-static unsigned int master_cpu_id = -1;
+static unsigned int master_cpu_id = INVALID_CPU_ID;
 static volatile unsigned int entered_cpus, initialized_cpus;
 static volatile int error;
 
@@ -224,7 +224,7 @@ int entry(unsigned int cpu_id, struct per_cpu *cpu_data)
 
 	spin_lock(&init_lock);
 
-	if (master_cpu_id == -1) {
+	if (master_cpu_id == INVALID_CPU_ID) {
 		/* Only the master CPU, the first to enter this
 		 * function, performs system-wide initializations. */
 		master = true;
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-13-andrea.bastoni%40tum.de.
