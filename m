Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHV4476AKGQELIVKQWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC529D23C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:50 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id h6sf287049ljl.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919390; cv=pass;
        d=google.com; s=arc-20160816;
        b=q0P7RitWjrf5d0FLBWYLWNJt9SrISmtXcpdPy8HVPQMNNl9dAlasUOj3zTv8cIJ86Q
         yT8USdXx1/uxMI6mEiBHJPXuvStr7L10Ou2vdB3hvwCrtChamDn/S/SOwbaVg9XFB/p+
         Np6Km68QJL0kyT0x0aT3kclk1C0RTAswRbRWZQ1T5q39w2XlpZ3889WYSRrHjKV9TEHh
         SwmJ1VUdcpYWl6kFniOgmRo2grRaADr0kTvBPcbKwgcMNETHakQJSPoxz/3GgYS4vsYi
         lSk78Qs2aRwkKDKd5cADI8lPimTuRlKEjKhCLR71dNw8QS6x84pTHG6oHJYolURzdMFM
         oeqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=yBzbF7jQgxccgjiFbMUQtaKjPmDLTUxTMjbn6hpfXFw=;
        b=PL83a1EnlNVqXNxZe0gvuDal+ckhH7jZ/K6Soe2M/7K8kW4QcsGEYeXPqQl34tKl8Q
         HYOrsbXuflVnwMMb+7D5AzC1kNoi1gOnZP73WVK1NbVokXMxtZKBHrrlSSbpVq3wpQIm
         XSXxW0Qnrx0JdGNIkLISK1upArStAB82On92iSElsx9CKuLsr7WHngWDAZur/XgbK/wh
         mgGcL3Ca+49Ds5Syid98SgoKK3aTRqVU86dkHrs5kiCz+9nzR3NeFBbfDTG++zPSbdld
         GfKvRnhmqCjh2lxQDkG4lP0bsdVcX2MyhUhIBi5K3LAgwgW6AGTrHdKaqwtUuaHeIUUn
         DQbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Yu0YClWb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yBzbF7jQgxccgjiFbMUQtaKjPmDLTUxTMjbn6hpfXFw=;
        b=tPaFijorsxw4HxSCkQXh2u9C2rr5uTAV7qdGSlx8LIVGrSAFHTYvzQ9HQsn9R6h/Rt
         FoYFghqVyBk4P33/qRs6anuO46KWwzup9Xz3tTSKE2rDNycfNHxhp+28KqcXqGA9R8nr
         1CXDbUnDbApldaYv1WuuTMryWz+DtW2lU6w2n/gw1KSS/pbSr2CxjMD4WYKQGXY1r1JT
         VNF2fSNVueQ/cW8tVKpVKaz4OukvB/O8ljnbx5jcqFtap5e5jEsXq6XZbbluz0YhDnCy
         8xV4kZJRh364X6CpVJ0l3HBdSBGle8fQi9m/YGdhw845yV31DqxmuqkPssvJ6SH8kmyx
         kdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yBzbF7jQgxccgjiFbMUQtaKjPmDLTUxTMjbn6hpfXFw=;
        b=QpIMEibGTOhafVbUDpG2E36E9hj7kK2lts/X5OJ22g6O3Ez+sQ1UPFAoMKCuqi6pMC
         XvbTwN7F5PdDTMyj0T+34T1pW7YWASW1K5N5kxPrRXCEGzMoUsxxgcvknq7PETWmEn35
         BZOxSbZoctQ91vXwnFWZ9G7Bp2OrtMj4aEXzfpcOiyJeZGHL0MGvyY356j0Qa/RdX30s
         i8eVE/YAfX7YX3DUK/BqgwMI3YtLKLa8/PInR0RnYgtpCX8VTwxx5p+txoD4vuZW8aRH
         2D10PZ3/8+2K+dO3E9DrBVaJPlB4VNRn1hyKJwNhOkJFMLN/gBOVq7wnpWolyxwODFxF
         VLog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ppVmoIV6boN80WsIqhuMFVCyf+BJlBS6x8W7LIJqtbTX1Tq5r
	OAxSfvbhClqe5PQaQnOdh98=
X-Google-Smtp-Source: ABdhPJzLWB+3CIwv3zv5jAAjI+U8OOeqEHOtIiq8f0Vsfz+uwkNGt05L5Az204C17zy/4JvGc8NB4w==
X-Received: by 2002:ac2:5301:: with SMTP id c1mr398579lfh.71.1603919390466;
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a86:: with SMTP id p6ls141126lji.0.gmail; Wed, 28 Oct
 2020 14:09:49 -0700 (PDT)
X-Received: by 2002:a2e:b0fa:: with SMTP id h26mr423319ljl.243.1603919389212;
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919389; cv=none;
        d=google.com; s=arc-20160816;
        b=QHMiubuzgKVRFjkiI5QFAz/KoirWH/bpJuGHDGd8ZE83HoHXRBYZjkEcUM82dbSlwc
         wxCaiUYiAgwX1XbnDxoqrveYdJRpIHqjsM32elnhaldB2ppVW0OIkoFqBOLJANOn6L8w
         cWsCy/+JxxtRfq7byqaYBGqfNuUpaUDyHpduIBfM53NFATmUHVZD5NhqdoJdNDBO7bSI
         ESV+c/V6N23Edo/AmcgRXuFpKJEEtJpWJy7jy6p4D8fDLohr63oGpIx50TxVq0pJVK5e
         Gmo8CvnO0PhbaNQHUCQO0lK2kiE5X264H0o+ntNCxEOckMmvwd6glVJGzxAqheEltYwS
         6ICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=/F+RlFklJAP+8Fcs3e+8TZ2oVah0ud8/cpO96NLHTq0=;
        b=cNyHYHM+7aedN4tO0t5ymy6h6RkEobgt/4g2rM1gLqE3H/ISjI9bAEF0QEiiHiq2NC
         DxpYw5AHeYndT55vEEatl/mLHrRKfeA1VUdyw0735ZJH4fH2mK6FkcUS4DvXMkJ0LZp6
         vzrNpQpKueHWACiODiUgJlV3DzQtYx07bE6mCxjLNawNgsIcmWkxiEsUjsB2CJiHrSdR
         dED/SGj2Mm+F7vl1uI4y9s7G5q3WsgKpC5x3fXgXzYh536y5ATGRjk3XBH3nuxOwJHXP
         KXIto/JcwzXIbUAtTGdEPCPhKg/vRVpmCKxDMd/rWN5H8x6kSGcjtxjlQw1bhXLTtyzh
         h7Sg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Yu0YClWb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id 24si13396lju.8.2020.10.28.14.09.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rc4pkSzyWR
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
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
	with LMTP id JXgwPd0fYoxx for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:48 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rc1SvZzyWn
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 03/22] hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
Date: Wed, 28 Oct 2020 22:09:14 +0100
Message-Id: <20201028210933.138379-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Yu0YClWb;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

Substitute the implicit "-1" occurrence for an invalid CPU id with an
unsigned int INVALID_CPU_ID that can be used in all "uint-related"
comparisons.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/lib.c       | 2 +-
 hypervisor/arch/arm-common/psci.c      | 4 ++--
 hypervisor/control.c                   | 3 ++-
 hypervisor/include/jailhouse/control.h | 5 +++--
 hypervisor/setup.c                     | 4 ++--
 5 files changed, 10 insertions(+), 8 deletions(-)

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
index b38ac2e9..2214406f 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -48,7 +48,8 @@ unsigned long panic_cpu = -1;
  * @note For internal use only. Use for_each_cpu() or for_each_cpu_except()
  * instead.
  */
-unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, int exception)
+unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
+		      unsigned int exception)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-4-andrea.bastoni%40tum.de.
