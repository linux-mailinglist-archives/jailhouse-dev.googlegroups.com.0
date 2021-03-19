Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVNI2GBAMGQEOLCRYSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE23416BC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:35:50 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id s17sf17594057ljs.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:35:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139350; cv=pass;
        d=google.com; s=arc-20160816;
        b=EtAzghe88AWKE/414vDUBetDAwXp0Munth0W7txtCH4n5WkAT5VyQ1RIh2ws4/b/mD
         s1tFkcW7I7AjRxuR7EQi8gcYJBrpwPZPj/odrpmPD0XCyGVNtkIOti3dwEHhqfZvrD4B
         JCWas5XsX4qCaIVy9gaRFBztntpbWyRWGNex9OExqpvK9rRK8F5EYgdeTzkvc1dVjXTl
         IVCiwOxTwmd/DSo4um20LHaQM5k5pJQkDBo5GKxZdYWfBfSHOrLQS2a0fc3r/jSngGw+
         hYokAypAaqJaxK5YgENdSLUfijRa9PLxpHEwCLS7f/vxuwb8+82+f/lcX7xmqI6LEelw
         Mt9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Iew3tsN9hA84o183S0q8Trqb/eYZWujJYQO1trooq34=;
        b=Kg1goiolIfSYJSodjXoZmnn3YsDFsHngMjR7S+08w1h3jAiu6i1DD/z3vPWHlRX7vM
         Dh+S3O6kEkiVR4EMz9iUF0dco9sUG8vlF/rdGfDwbovowWLMonr+pUa/qbc9QDET54f/
         VapvvUvAlpNpDbwOY4QDHrPBwEPQ5yGVBVdXRAMOQJa1euOkhqPPNbR54AOFLpg8+8mo
         jgnyD61vtdYn3HXKDPM9qMkHx1gBTfOLPNnATVWRyqoQFa5S0bxBZ+uDT/qwY4FmrEkF
         9idnxIkBH8sRIMZZdXZRDpwYqkA3DYyh13z8oWRDg40dTemsVRpxXjG7FNEYGBpWKmAN
         xpBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Iew3tsN9hA84o183S0q8Trqb/eYZWujJYQO1trooq34=;
        b=bxWog07YD4Rt5J1vGDtxqoeczGib+DFSUfRNRu4wxynJMSJJ9ezfklsjiWvdqSQ97X
         rC1+3AfH5WyWuDVS9ITqKUXh5zprZkZvFRU3IrRcCR/MSMIJbDvtFuYx9qlg4qax8Hil
         eJYCjqvBMIM5S+IrggBEMIcemBkLiTb2HdonSOOZLNuuGrTHZI2OzQbObslbxQz7jzzR
         s2NTtgEe6FWW5XrVr4cF8Fdlc/sagkMvR3Ly6qbtlx5LooVGrW9WBINVSTMXMZIaU9rI
         B6kgTV9+Il+6AAMkSnT3cVigu/EmL13bbjrqjagElFLplfbUwC7PPbfev9V4wEktAFtD
         ZkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Iew3tsN9hA84o183S0q8Trqb/eYZWujJYQO1trooq34=;
        b=JnZxLmkgLzeOtxs3JtZpDEIsMuLD8Xr7dl+9P+tFEvTJ6L+0dqAFB76i7Y84/9AFy5
         wDlpkIFdSu1to2tH+YpsUp5BWvB6GDAveovMhcFNCHyfIPgEYAkXDQJY57Cdm2+9I+b8
         lYmHr0fxwA+6mkRDea/Gt24uw3imxg2w2xBaKwOVqzt0CoAEdZdNy57/z9nCGUSmEx22
         gjcQF3J5PORYBM4FUDt98UZHtDTIvBH57SvuYvubAYyMmaIChD3t3mYYE05UcGKLTQwg
         8tsK57ruiyjbWOq+4HSV2kxoly2SSnfA6GGd6r7rKRm50eNxAFRKTYemke2JeTHbjeQh
         PtwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315ltAljinfTlC7Z0HkfUM71Ykgrsp/5MU0FaPtnefyU+Z0SQtC
	d26ckyvTcwsC2YYV3WMb2Ng=
X-Google-Smtp-Source: ABdhPJw+NsiU5HLkCdAt5w0+ZPCxeTk9AqpQHAesoK2NZOlrtUUcvnw3Xg7HF+pZdwfRS94o/gUrsg==
X-Received: by 2002:a19:5055:: with SMTP id z21mr39192lfj.297.1616139350201;
        Fri, 19 Mar 2021 00:35:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls3700009lff.1.gmail; Fri, 19
 Mar 2021 00:35:49 -0700 (PDT)
X-Received: by 2002:a19:6a11:: with SMTP id u17mr33268lfu.501.1616139349151;
        Fri, 19 Mar 2021 00:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139349; cv=none;
        d=google.com; s=arc-20160816;
        b=lrlhFnRe5D2OEmDODWCWfGsnLNqNuLfReMlWHwKneETgyGwF66iOFe48aMX5w7nSQI
         WVrG5JpSKyPWCGRj9V4L9FXJ9u4aFYkl0q1J9SL4x2TfjzCHnb6W2pY18+PWbsNMRyku
         yS8TnlB0+147RpIdeVORXUtCFB+0pKikaKBKDxfLdY384OoeipGTArct/j6wGHtFzTY1
         ik2fFRv6dz3DUmgY8egt986jBg3N5d7WftDfv9s12HBYF47TotjUHJU75NZeEZFvf6V6
         xQ4PXmQHzu1kfNao83YtkVxtcP+Hp4N9rxKloOf7qRKvKTBbWaDdhgqyocw9XhJuT8KZ
         D8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hVdZg3CJ1vr2ibOptNEBViFsQGd62geWiAEn3R02SJQ=;
        b=SENtfbkLS3mSEFpzfmq3H6Nzf6pCUC97kNbtgtPfvyl18g30oyx7xTuemJxy584n8C
         rx5HKZgSSsU0t+9hOcxS2k2tja4bAKkfDt+3ReLQNK05zgFW17qY5rTIGLC1F2XaQric
         2eXhn9X7maoQqCaLcdF4JjNDWgWdCcnShBXX2VoOyKZ+M2yiDlx3PEemxwIDdfUH37F2
         9bKMLW7MvGrhptsnWw0a+z1K66x1B3vqDzXTvy9VhRTCE9q58kqe/EEAtEI65FLmsxeC
         ylZS961oxBXFRqnLK0b04Trl2qiF/4p1zMeIN4dG4ENB40B2RERC1gksM2AfiqJFtul8
         DN1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 63si154027lfg.9.2021.03.19.00.35.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7ZmYK022867
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:35:48 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC9004384;
	Fri, 19 Mar 2021 08:30:48 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 11/11] arm-common: Detect availability of SDEI on arm64
Date: Fri, 19 Mar 2021 08:30:45 +0100
Message-Id: <ee0e5c42c9baf1389481c372693cd8fab0e1cb88.1616139045.git.jan.kiszka@siemens.com>
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

Enhance smccc_discover() to detect if SDEI is available on all CPUs on
arm64. Fail on inconsistent availability, now returning and error code.

SDEI is practically only available on arm64 and also only implemented
there in Jailhouse. So skip the probing on 32-bit.

This activates the previously introduced SDEI paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arch/arm-common/include/asm/smccc.h       |  5 +++-
 hypervisor/arch/arm-common/setup.c            |  6 ++++-
 hypervisor/arch/arm-common/smccc.c            | 25 +++++++++++++++----
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h b/hypervisor/arch/arm-common/include/asm/smccc.h
index fdfe49a2..871244c1 100644
--- a/hypervisor/arch/arm-common/include/asm/smccc.h
+++ b/hypervisor/arch/arm-common/include/asm/smccc.h
@@ -17,6 +17,7 @@
 #define SMCCC_ARCH_WORKAROUND_1		0x80008000
 #define SMCCC_ARCH_WORKAROUND_2		0x80007fff
 
+#define SDEI_VERSION			0xc4000020
 #define SDEI_EVENT_REGISTER		0xc4000021
 #define SDEI_EVENT_ENABLE		0xc4000022
 #define SDEI_EVENT_COMPLETE		0xc4000025
@@ -25,6 +26,8 @@
 #define SDEI_PE_UNMASK			0xc400002c
 #define SDEI_EVENT_SIGNAL		0xc400002f
 
+#define ARM_SMCCC_VERSION_1_0		0x1000000000000L
+
 #define SDEI_EV_HANDLED			0
 
 #define ARM_SMCCC_OWNER_MASK		BIT_MASK(29, 24)
@@ -53,7 +56,7 @@ struct trap_context;
 
 extern bool sdei_available;
 
-void smccc_discover(void);
+int smccc_discover(void);
 enum trap_return handle_smc(struct trap_context *ctx);
 
 #endif /* !__ASSEMBLY__ */
diff --git a/hypervisor/arch/arm-common/setup.c b/hypervisor/arch/arm-common/setup.c
index c16fe27a..9ff03250 100644
--- a/hypervisor/arch/arm-common/setup.c
+++ b/hypervisor/arch/arm-common/setup.c
@@ -39,12 +39,16 @@ int arm_init_early(void)
 
 int arm_cpu_init(struct per_cpu *cpu_data)
 {
+	int err;
+
 	cpu_data->public.mpidr = phys_processor_id();
 
 	arm_write_sysreg(VTCR_EL2, VTCR_CELL);
 	arm_paging_vcpu_init(&root_cell.arch.mm);
 
-	smccc_discover();
+	err = smccc_discover();
+	if (err)
+		return err;
 
 	return irqchip_cpu_init(cpu_data);
 }
diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 3958b061..65639b59 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -19,7 +19,9 @@
 
 bool sdei_available;
 
-void smccc_discover(void)
+static bool sdei_probed __attribute__((__unused__));
+
+int smccc_discover(void)
 {
 	struct per_cpu *cpu_data = this_cpu_data();
 	long ret;
@@ -32,28 +34,41 @@ void smccc_discover(void)
 	/* We need >=PSCIv1.0 for SMCCC. Against the spec, U-Boot may also
 	 * return a negative error code. */
 	if (ret < 0 || PSCI_VERSION_MAJOR(ret) < 1)
-		return;
+		return sdei_available ? trace_error(-EIO) : 0;
 
 	/* Check if PSCI supports SMCCC version call */
 	ret = smc_arg1(PSCI_1_0_FN_FEATURES, SMCCC_VERSION);
 	if (ret != ARM_SMCCC_SUCCESS)
-		return;
+		return sdei_available ? trace_error(-EIO) : 0;
+
+#ifdef __aarch64__
+	/* Check if we have SDEI (ARMv8 only) */
+	ret = smc(SDEI_VERSION);
+	if (ret >= ARM_SMCCC_VERSION_1_0) {
+		if (sdei_probed && !sdei_available)
+			return trace_error(-EIO);
+		sdei_available = true;
+	}
+	sdei_probed = true;
+#endif
 
 	/* We need to have at least SMCCC v1.1 */
 	ret = smc(SMCCC_VERSION);
 	if (ret < ARM_SMCCC_VERSION_1_1)
-		return;
+		return 0;
 
 	/* check if SMCCC_ARCH_FEATURES is actually available */
 	ret = smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_FEATURES);
 	if (ret != ARM_SMCCC_SUCCESS)
-		return;
+		return 0;
 
 	cpu_data->smccc_feat_workaround_1 =
 		smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_1);
 
 	cpu_data->smccc_feat_workaround_2 =
 		smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_2);
+
+	return 0;
 }
 
 static inline long handle_arch_features(u32 id)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ee0e5c42c9baf1389481c372693cd8fab0e1cb88.1616139045.git.jan.kiszka%40siemens.com.
