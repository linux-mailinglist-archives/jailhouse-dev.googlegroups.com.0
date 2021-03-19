Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKFG2GBAMGQEGFQTYZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC434169D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:30:49 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id d15sf17571476ljl.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:30:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139049; cv=pass;
        d=google.com; s=arc-20160816;
        b=bXtHR6Cn3Q2Y3dC01nTLdCJRsRPBnbOjP1v3XxEJ0lEajZfW+uucNHrdChaZsABKL5
         p7ufJwguNQf7GGFTq/I1QwSLWmpmWzQUKvub+TMmS3MxPptwCOtpnaCQXJzj0PA1etE2
         Y8DBfQTj+VBUIq5MK+nn9mwznR35glHOBiXyXR3ObDXE5SvRBd2y2Qw4QAOSbBWE1ElE
         do03PiFgUpDU8Io0NSIn0z72f6sA8QIVJFzrHaOC/asvAlHR8Oay2DAdLI5ndqlmZFVm
         x8FRQuTjg11lAt1+WIasUX53KvoLU+pza2ZVo6k0RZTwKl+d9N+l+hJY98vA2axvs+ft
         m0Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=EJSgQNGgxeIIFexkp68oPPFotreWt72snH65dhsjgzQ=;
        b=EBV2xYZXp6wxehkZh4Kja+RpEQHQmVXChjK4WHVlthKEMwrFICyaDLJKIgor+l/bMM
         eui50fnF+wjk1z6psShk5kv4B11PVfTYCRhnT+4r0jT7lE7u25Mg85G92PD+BcqWy6B3
         HAkBZbpbA1TkUWcENntwipChRRYqdzKAoGVKZ5SiXe6fJi19CjwznLTbAmi8tPNA8HOJ
         XyITEyBYkhDhlpOSv69TIpVfjZPdLQVY4Qw0eavG/Ktmjjt1f3mRm4rYP0znmkJ1qjFZ
         wgjWYYIt3KrsefVxqS7kKCZ8aL9PDqIn/LdEClk11VjHuWr6ci0ciGrezNDgrZPeRiIj
         fzJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EJSgQNGgxeIIFexkp68oPPFotreWt72snH65dhsjgzQ=;
        b=epyV0r6NO7QL20z/68f7i5n/W29UA2ANjMTStYrEade5uet8SQv76NsgMpMPmVJ8WI
         QBiFHzvlnFeHyQd3y9rUG8Q6bsNXIgydrhFvn5EsTWaNB5EvtEiU+g0Ld2gH+vq0uQ8a
         UW1vo4HWpe7dh8f3+QIcq5jsVDatL+hELgqfgk8M08o5DXTxB4N0w9UgHUHFPA2NEqcp
         /ZqMArgHLJ5ZbG3aFGVIQ0KVl3K1H3hvYMiLWtHSYMPAooYwqQH+fTAIqXRHDb4s0+tA
         lguKRO65TIa5kYrCNOwoV6l+WLJTQkssJJFjNfXQ35A3E1bTxlyCOcXmlYzkUlbZpUUC
         ZuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EJSgQNGgxeIIFexkp68oPPFotreWt72snH65dhsjgzQ=;
        b=BwpcLhynuTNR1pBQo1HmvOVhon0EMCMrc4uyuD/16ReNBbfRlrtXVhnvQTH8qvun7K
         Q0r71J/azGB1ll59/5sZQnPv+caX0mpdFWypiFG3bQxJVxtN68etX/65lfn+nYuTfkco
         zrEgcpUWSPRKuAsCngF52YJc2C6CU4S6MwyGuLjK4LTntUqyBlPQgPD9luveRcNuWeiF
         c1AaY1TCzppt/0jlX3/LkLmZWA7IVX8k1dNoU2Mw5qhhwHIJ487Wq50jdMLCvYCllrC/
         4IwIWJnT1blwFks7w6XTE69iSdMJP9Sug6slqVpdv5Q/uvcy359rR0AOmRKPKZhrEyOO
         cUfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5307jDnttBlJzuJN7JxMzHGc2zrjb0cAtzf8MBTwXkmXjtqPJmW5
	oKP/tS9uOUaxIxiMJsKPhrY=
X-Google-Smtp-Source: ABdhPJzVBlRYLX1r0pJi/umZkvc2foVD0beR3EiakRJk565UcMo0gnKqVsJxRqpCT+my7AkDaILT8w==
X-Received: by 2002:a19:48d2:: with SMTP id v201mr43022lfa.504.1616139048853;
        Fri, 19 Mar 2021 00:30:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9191:: with SMTP id f17ls1010009ljg.11.gmail; Fri, 19
 Mar 2021 00:30:47 -0700 (PDT)
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr47297lji.71.1616139047670;
        Fri, 19 Mar 2021 00:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139047; cv=none;
        d=google.com; s=arc-20160816;
        b=Ha5IN5sgawWW3OEenQkw02jRSJdYfdLY/MO49OC3Bts591oIv7gWTtHFFk5YXKu1XL
         UWtxCGwziYdD1w+Apb9SrnGMvTKpy0TgJoV/7livGXwMP8f9GCIy6qDWztHjomedBG+V
         GXd7Ra8b9YOobVQTz8jdgDjeMgmKll1Sc1q3tgslcxUnII8YueV+4JEI7maL8pmqaMHX
         fN/SIMtQ9sqmASN7xdFlaF8gH7lYNLNf6OF2DN8lgeyeggk3LnyRF06a16Ee1oe7NQj5
         thDP9/fzMD7i2bD7gEhz1oB/7aRRDbD0GnYZOU6SMtR3TB9QCMCQSS5qg5R6pG7420p3
         +SQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ebnqfoDdJmtvu3+lR4uHNk9hESWHvuZVPOrrlhArdls=;
        b=vd2G6z5bPsh0Ilw3xjE4rccF9ah6LNEgxkeJFMUxh/CORUx89UGy4cB2nSEZpL8x6H
         HltPoFk8GJpm8XgX4DfXLE67q4pS0xHCegHez8b7Chr7Tj7NPZIHh5PcIOuOTrhngFLy
         d/4iILS8dS9vS5HgRxgdgP5VDjwRZ0ZO4jVa4S2QoSdgYGOU/xo7GK4W6YTCqhK2Cvbr
         UggHZneAVp3IqiupJjVARirBnijyoyORekBoTUgp023DDipGPCnaytOMdQxpXA+bT/w4
         VCeGg+/twv1m1SVCukFKS6f20fEBDbylSFLtZ3ppbj6RB0EyzGw2hStEGKeeAfqLyyfr
         QOMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 63si159454lfd.1.2021.03.19.00.30.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7UlRm017221
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:30:47 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC3004384;
	Fri, 19 Mar 2021 08:30:46 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 05/11] arm-common: Add SDEI-based management event injection support
Date: Fri, 19 Mar 2021 08:30:39 +0100
Message-Id: <467e6524fd2f2f58ea11fa7966695cc9d4048bec.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

This is the first building block for switching to management interrupts
using the Software Delegated Exception Interface (SDEI) which will allow
to pass the GICC to the guest.

In this step, the feature flag is introduced - but not yet set -, and
arch_send_event is augmented with sending the event via
SDEI_EVENT_SIGNAL, software event 0.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c           | 9 +++++++--
 hypervisor/arch/arm-common/include/asm/smccc.h | 6 ++++++
 hypervisor/arch/arm-common/irqchip.c           | 5 ++++-
 hypervisor/arch/arm-common/smccc.c             | 2 ++
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index ea6d6534..9fc42761 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -15,8 +15,10 @@
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
 #include <asm/control.h>
-#include <asm/psci.h>
 #include <asm/iommu.h>
+#include <asm/psci.h>
+#include <asm/smc.h>
+#include <asm/smccc.h>
 
 static void enter_cpu_off(struct public_per_cpu *cpu_public)
 {
@@ -40,7 +42,10 @@ void arm_cpu_park(void)
 
 void arch_send_event(struct public_per_cpu *target_data)
 {
-	irqchip_send_sgi(target_data->cpu_id, SGI_EVENT);
+	if (sdei_available)
+		smc_arg2(SDEI_EVENT_SIGNAL, 0, target_data->mpidr);
+	else
+		irqchip_send_sgi(target_data->cpu_id, SGI_EVENT);
 }
 
 void arch_reset_cpu(unsigned int cpu_id)
diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h b/hypervisor/arch/arm-common/include/asm/smccc.h
index 069beecb..0d1ecd86 100644
--- a/hypervisor/arch/arm-common/include/asm/smccc.h
+++ b/hypervisor/arch/arm-common/include/asm/smccc.h
@@ -10,11 +10,15 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/types.h>
+
 #define SMCCC_VERSION			0x80000000
 #define SMCCC_ARCH_FEATURES		0x80000001
 #define SMCCC_ARCH_WORKAROUND_1		0x80008000
 #define SMCCC_ARCH_WORKAROUND_2		0x80007fff
 
+#define SDEI_EVENT_SIGNAL		0xc400002f
+
 #define ARM_SMCCC_OWNER_MASK		BIT_MASK(29, 24)
 #define ARM_SMCCC_OWNER_SHIFT		24
 
@@ -39,6 +43,8 @@
 
 struct trap_context;
 
+extern bool sdei_available;
+
 void smccc_discover(void);
 enum trap_return handle_smc(struct trap_context *ctx);
 
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index eb9ac40f..da03c96a 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -22,7 +22,7 @@
 #include <asm/control.h>
 #include <asm/gic.h>
 #include <asm/irqchip.h>
-#include <asm/sysregs.h>
+#include <asm/smccc.h>
 
 #define for_each_irqchip(chip, config, counter)				\
 	for ((chip) = jailhouse_cell_irqchips(config), (counter) = 0;	\
@@ -529,6 +529,9 @@ static unsigned int irqchip_mmio_count_regions(struct cell *cell)
 
 static int irqchip_init(void)
 {
+	if (sdei_available)
+		printk("Using SDEI-based management interrupt\n");
+
 	/* Setup the SPI bitmap */
 	return irqchip_cell_init(&root_cell);
 }
diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 6bffcfb1..3958b061 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -17,6 +17,8 @@
 #include <asm/smc.h>
 #include <asm/smccc.h>
 
+bool sdei_available;
+
 void smccc_discover(void)
 {
 	struct per_cpu *cpu_data = this_cpu_data();
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/467e6524fd2f2f58ea11fa7966695cc9d4048bec.1616139045.git.jan.kiszka%40siemens.com.
