Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP5X5D5QKGQE3FK25RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE0282CC5
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:15 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id dc22sf2366806ejb.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838015; cv=pass;
        d=google.com; s=arc-20160816;
        b=UJDUu+8sP0bSmSBgOs+HmJOoKxY3cWd5stYY6eHtLVSXE4HDe0U4BrMMyKrpcOoQCl
         ib18Xmho2slJiwz5xnizFMToa01z8pzp3xd2PSt4y9XF4BKD2auBgt6bhrGEJLj7E03r
         el4DtIn2LLEpeXMd+JHxBWL9OgQgzuxfFG0iwuXV2jmMfAK9udFtHbNBMtQPTsm6vv8w
         vo78cukz7TwUVF3WrdPrPMoMsLEGmHsd4TnSxv8XtELXVGzYtlr6UBphUAX1G2i/TfWe
         UZHZrmF91HZndwitYB2iwTlGTohfmugxDLx1B5iw5IiPpY1VJ+P9nftb99KMgkLoHkrZ
         P+CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4HtMJ2O2k5WwS8UXUIIr4bwRP31V7ZvnTxualZ1K5yI=;
        b=eVK0/ip9BMvwpa6g8kK9sZcMsFJy/fVr3VEKsVmWlamChbp9zZau3BV01Gc/vBOqfS
         3sSsjZj2ER6VeIkWKXX3OQDJzSCx+t71owvaTzCPynlBy2iHk/t+gXulQD16rKINChgu
         lVhxmhReJpm9bcN+l0F0615azritNiovHaiixfiIHKq9CnaU37h18Sp9HrjdaTq75XnZ
         tuARWuaYgLkGJSj+/ysI8GQqPtbEqd9PPVp8lDz4d5Nt/Bu2N6HfWg3E1mrKm4jm8OF2
         4LkVlv+l4ZkXvQo3CFBBADZJGcTX+IHeVl/5SH6RpSeLugJBumQD0iB0CZ1TaB3IsaSw
         iv9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4HtMJ2O2k5WwS8UXUIIr4bwRP31V7ZvnTxualZ1K5yI=;
        b=psbdYh82a6CkgFCgmcdbHMU/sYxg0APnbMOO1vdQI68MI8V24zI/jUeaV2buXn6Htd
         LHlrMi4aFTnoRckIfrr21nZ3xFGzNgP2mFo7a7v6/VIlsfBEKMSmaUKqS2fzaF8X1gQm
         VcDhNX3SwxrOjn5UA2J43gqkQO/bTad4rKJwN8yGskMGRyuFHUAD74hdu27OhdC0Q1Q1
         A15+vzmMHeF248/ktso7bofjiU7CsFPU+2U/g7X/Duq8jhLmEZ9gKA3HYHxoBqFWyoR3
         ES5Vx3I45bcC4+HoC4SwNuA8sDyIa67vG1+bkQeLrrf9Q0YAiXqwzbTsky9+JhuCvkKY
         fQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4HtMJ2O2k5WwS8UXUIIr4bwRP31V7ZvnTxualZ1K5yI=;
        b=Awk4ewopW2QrnyP1IJc9c+c4mtYJWSKTYl7AEOkP6v84r+tjjT5+Xj+gQj+N1wjFKO
         5UTYseeW1ETUWMD5eoy9FuQFVJYum8AfGZQGY9OqeoBboy7Eh56XA3yPVQ53y9lJHTff
         hzZsVyvPkNItoMTs2cFfbELPKf704jLSr811/jtF3j++Q0P8qjpkJSWdFBjtoFjCRRaW
         KYbSS2K1V4CzS46Qt1gYIomQA8J3Y/ObsGYfuMfL2oZdZ/39I2PYRXi/xSWD/22SmSny
         +JQQq8aL7GznKFeCpW34DJjOg/kuFjhPe+SlzzUmN9TLz1jJ1OAPvZ1H3M9HioCmTMze
         7TwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xxpXFnvOBzmXffwOoq/056B6fQRKcsglhz2Gwh69ww/sqlJSE
	R689sayR9FwZnM4vIzO4fx4=
X-Google-Smtp-Source: ABdhPJxPp9KyIgoh2neNCMi0daITM/ekjK0qqXTreXe4/KVP1+Zpn7UaodqAfO0tI8RB0h0dpQAI/A==
X-Received: by 2002:a17:906:515:: with SMTP id j21mr11751191eja.105.1601838015504;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:39d8:: with SMTP id i24ls3130691eje.11.gmail; Sun,
 04 Oct 2020 12:00:14 -0700 (PDT)
X-Received: by 2002:a17:906:7d0d:: with SMTP id u13mr12491994ejo.448.1601838014414;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838014; cv=none;
        d=google.com; s=arc-20160816;
        b=BlEEJfrD9op9b5Forxec0RSndOf62gYY4whcqgltCBUQSFN8j5oaxP8AQV3yVadO13
         rlmXp7rLhkjrwtUiqzM+2+7a706qFdONA3Y4RMfwHuPxGjSqWDpQYBsqsKjNVXeEZvPs
         cYg2whZs9NjikgOve70oq1uosvun7Gz+1HTTJhQVxfN+QGP/VFuZu6IwKj62N9rF/g59
         4iZiLjIrbPlNwyiKjiLyq2UWBAqdofk+rll/Bbxlg4zc77L6gaQSgaIHbQqkEDxE3gYh
         sM1Mnj+WHp/Oh+fZJTN9Y+Wg7WJE3fXaG54Fdxk7O7U3wZrbFw14507dngAPA7SvYtR1
         KAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=pLSnddz6EG5US94GLrhFo/PzzmGb1OiefUfl9pjbYZk=;
        b=llPwWc7fa03tX7J6uD5al50ODXdV8MdAubru3soLlu1/JsYZ5LVRQwjSQR2ohpD9rF
         6L7BSHzsm1gey2jxHwD49ydOL1tdwxNklsANcL+6v6PYPs4mjz/NIaE3cwu2xS7A10RE
         toKhyyCqoPpCW1oe+9XrID+3xoy1lGCjpf0BIOA2D0BuSQhbtXeClp8lmqZxc1mqbKgd
         dwDcntJbYkytqwOdkTWsRejej/CAIMAzVs0hIwfFp4bvdmW/2F4RugG/j0iCvf+XZfgC
         3vvfURR8PS9ksOQd8Bbx7CxcaaGkczRQReMf70f4j9zjm6yT/WDdwhNLhIxglzWBX2+U
         +ERw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id dk15si271237edb.2.2020.10.04.12.00.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0EI0004376
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060e017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 28/45] arm64: smmu: Drop dead ARM_SMMU_OPT_SECURE_CFG_ACCESS
Date: Sun,  4 Oct 2020 20:59:49 +0200
Message-Id: <07546f0ef191d4b10f65be22aa97147fd211f6c9.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

In Linux, this is set for a caldexa device which we do not support. So
ARM_SMMU_OPT_SECURE_CFG_ACCESS was never set. Simply replace
ARM_SMMU_GR0_NS with ARM_SMMU_GR0 and remove dead artifacts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index f71c5a81..5becec19 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -17,22 +17,12 @@
 
 #include <jailhouse/cell-config.h>
 
-#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
-
 #define TLB_LOOP_TIMEOUT		1000000
 
 /* SMMU global address space */
 #define ARM_SMMU_GR0(smmu)		((smmu)->base)
 #define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
-/*
- * SMMU global address space with conditional offset to access secure
- * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
- * nsGFSYNR0: 0x450)
- */
-#define ARM_SMMU_GR0_NS(smmu)						\
-	((smmu)->base +							\
-		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
-			? 0x400 : 0))
+
 /* Translation context bank */
 #define ARM_SMMU_CB(smmu, n)	((smmu)->cb_base + ((n) << (smmu)->pgshift))
 
@@ -185,7 +175,6 @@ struct arm_smmu_device {
 	void	*cb_base;
 	u32	num_masters;
 	unsigned long			pgshift;
-	u32				options;
 	u32				num_context_banks;
 	u32				num_s2_context_banks;
 	struct arm_smmu_cb		*cbs;
@@ -319,8 +308,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	int ret;
 
 	/* Clear global FSR */
-	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
-	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR, reg);
+	reg = mmio_read32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sGFSR);
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sGFSR, reg);
 
 	/*
 	 * Reset stream mapping groups: Initial values mark all SMRn as
@@ -377,7 +366,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	/* Push the button */
 	ret = arm_smmu_tlb_sync_global(smmu);
-	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0, reg);
 
 	return ret;
 }
@@ -650,7 +639,7 @@ static void arm_smmu_shutdown(void)
 	unsigned int dev;
 
 	for_each_smmu(smmu, dev) {
-		mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0,
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0,
 			     sCR0_CLIENTPD);
 	}
 }
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/07546f0ef191d4b10f65be22aa97147fd211f6c9.1601838005.git.jan.kiszka%40siemens.com.
