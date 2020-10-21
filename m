Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGEXYH6AKGQEK3NREJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A722294F1E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id z7sf1719919wmi.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292057; cv=pass;
        d=google.com; s=arc-20160816;
        b=xg3zoQ0p1T0qidTZP5IaWMniHAoLxbG13hhd/jjV1ho4bkAVHNNoU8+CBbklgnKX2i
         P9Cz1HEcxn4HXIRYG0ftoxvfBDeSz3+1CVve5KwdMOwypgxZANmuxPuKah6kUrHmVp0D
         EIjb1zc+4p9VNBn8Tk9YbQE3dz7ARURKk5rKZHZ49FeTQ6is8B1egDCOV1kOQiOY8Zg4
         AsIQLdo9KH4TH2EYm0TOp6x/02bj15rbRgGFPcKt1M/MF1TOj0S6n8ny47s13LA0CGjB
         9qQ68rl2Ipsww+3UpkpQ1PAhhfqaod6dXTI4/z9eErtTZxPNA1z0tD8fdeiwCSFvkbTt
         v/JQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=u8Q4uoWecH7Uvtqr9z5riPPsuImd7rR+rszNCUqk6gk=;
        b=ev6gV40kWMzU6seYq2dYT00gAH9K6lZ9jRAFThrXsIN6vE6Q4Mwg7jtc5AMBTFrvMS
         s1PxzYanbzNtsDqiTthuQUUVkBkW8QHV99WNuV/7gKihEzh4WgOsFQuxccRHmVC+r8CL
         epW1I3PAQ3asU4Aj8UcX6HdC9WHqhNcvaXIEn9D97zf8oP5Vic7/w1UFk9sCYNNYCpkN
         vu/2asRtO+VTVqqKN8bcYst/oHrTHBThurXmGbvhF1ChtWg5T2zxMomw0VqzmyG5zzhx
         s5ZroxejKJfSvrdKVdvIUd9IS0NwamJx9dYFJhlRwfi7c43LGAGlBJCz7SUsxREZVdL6
         Wt/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="Ew/GcaoM";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u8Q4uoWecH7Uvtqr9z5riPPsuImd7rR+rszNCUqk6gk=;
        b=fA+rluFfmlI4w88lYzUHjCY3t/0Tq/KQ0HyDxOJquDyubfDX3KWY4zZUyQiVAzaTnm
         2pDSFlNS9bVBRDmJKQxD8KaAP3y+Y11YIsfF29reInSPpUXWMAtVQTO1UhMp88Gn+zqd
         I3q6ICak++iNIS5MkZU1GdXazT7SQGUrEYsnamxuuNBtWSsB5Lss2ygmhBPws6UEoX05
         XPKMe88mGE+K/YcY2WDf/Eu5rViFHIo9gZ7NlngO+Z4OGBcfhM7NO8WPIb84rYJvOREI
         GVot2sRWGinJKL0M477Di7TXor6c3RPkfGaZn+HDObk2eXBlcwdXTt2N6kkgirLYcplc
         9ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u8Q4uoWecH7Uvtqr9z5riPPsuImd7rR+rszNCUqk6gk=;
        b=RZQsii9/TA/XrIpqX/a5NNop6Sv9xtH14H+Nvzd2RPCvy0KZtUWzPrkK0P1bb93m/7
         EScrJ3YvEuiciRTXa5tnawa2P7gEOtsQfskHGOZK9ZkBu5OUY4JZEjdSit7bjcPhXmCK
         0itbEYC29+6WOBWmuEyFsLFWK2GUTkGE4yCi+esZhj3GklrTfEJOGhsW+3C6xiXEYnVl
         IoOBf6rHMAwOGfqbGulc/9Un0AVHaEngd6T57dCleXlB8vpZ3YWr1hY92UEgnkQJ1wXo
         hgAxcM9irA2pnUi55cAb7XX7iT4/8gLb8xq5DOyk5O/XtWmbmtYMWfGTf3j0Sr9ZdbTD
         ETGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531iW4xh0DvkV3xqCQxFuOnxJCBfR6AXG28wGjEmGRMkqDaapQCm
	qjaHCU5it0yNHR1lu0crX3c=
X-Google-Smtp-Source: ABdhPJwQ+IA4oG9P/Ytbzg1tAAYHGzA+5AKSsZwZ3ZRK6JSRMyT/Pei/o7StLJDlJZ9zH2KVL4eYmQ==
X-Received: by 2002:adf:e88a:: with SMTP id d10mr5512785wrm.247.1603292057169;
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7d02:: with SMTP id y2ls114001wmc.2.canary-gmail; Wed,
 21 Oct 2020 07:54:16 -0700 (PDT)
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr4168078wmy.51.1603292056223;
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292056; cv=none;
        d=google.com; s=arc-20160816;
        b=a9iwc8nHw5ZOV26ywjk9vsnAJV0vinBMT+m4wgenQQEqU8pQgrJtro7HLTGFsXBXTu
         eBWkAu6vt2lmI+s0c2ZSCuBWGpBQi922GO4zLhMgRn9nG1PuARMKWLfip2en+XTROk4E
         5HcJR7hFbNJ0b8a7RRrwPH+AQykV6Jz7M6LXSghd0b3zJ8IDnOLX8jgorJVb9uNQbz1h
         JpdQPmPH76icNusRAv4k7WDpnx0tsjU0TXKRUdTpYUf+q9j7MJ5+H2p42CBTQpJjoDhH
         r/+vzrJnx6tiVehm1Ijcw9hn4yaSXwpoJrnhGqx1bcEyS6eeTYzTjhbFM/9l8+Kw4k2l
         q/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=YksJdokMvH9WLGvjiM5u4m+zKn/0MS6cPoKgrtPfn/o=;
        b=J/hFBThlpocKxqVIYmdCuOcOx0Fycagq8nnS27kZ+5z48Ywmd/IW4U+Xnt5Jg6s7O9
         sHxX50OLeq1MRBgjHPF/s1Q7IZ2p+Tw/hDzqMfw2Frrdy2/qT84d/v2JpQXcCv7GFG0l
         niFOihzqOKmk+mb6JJV1qRHKmzFZhJymM0VU9VH6Z5p/f2wlB5G4ZPLAATR+XF0sfYgr
         0V8XTY4uDbgbxTnKvi18PsZD38w6Yf086Nio7hmi+iVTnvFJWvDjlOsC5DSzz4eyOdQ7
         5eMtoSyBqKudVTwPbklOVOzrTRvyDdqXGXMGZmVKr07XGrn6yHiy9rV6e0CBLcQ6ygY5
         kwZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="Ew/GcaoM";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id w62si35317wma.1.2020.10.21.07.54.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRX0J7jzyWw
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
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
	with LMTP id U2CKufxt1x9l for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRW3sCKzyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 08/26] hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
Date: Wed, 21 Oct 2020 16:53:46 +0200
Message-Id: <20201021145404.100463-9-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="Ew/GcaoM";       spf=pass
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

Substitute the implicit "-1" occurrence for an invalid CPU id with an
unsigned int INVALID_CPU_ID that can be used in all "uint-related"
comparisons.

Fix prototypes, and unused param warnings in the same files.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/lib.c       | 2 +-
 hypervisor/arch/arm-common/psci.c      | 4 ++--
 hypervisor/control.c                   | 4 +++-
 hypervisor/include/jailhouse/control.h | 5 +++--
 hypervisor/setup.c                     | 4 ++--
 5 files changed, 11 insertions(+), 8 deletions(-)

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
index b38ac2e9..81b7614f 100644
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
@@ -884,6 +884,8 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
 
 static long hypervisor_get_info(struct per_cpu *cpu_data, unsigned long type)
 {
+	(void)cpu_data;
+
 	switch (type) {
 	case JAILHOUSE_INFO_MEM_POOL_SIZE:
 		return mem_pool.pages;
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
index 5db00051..c15d789f 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -26,7 +26,7 @@
 static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
 
 static spinlock_t init_lock;
-static unsigned int master_cpu_id = -1;
+static unsigned int master_cpu_id = INVALID_CPU_ID;
 static volatile unsigned int entered_cpus, initialized_cpus;
 static volatile int error;
 
@@ -223,7 +223,7 @@ int entry(unsigned int cpu_id, struct per_cpu *cpu_data)
 
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-9-andrea.bastoni%40tum.de.
