Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHNRVHZAKGQEQUYOM5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A5160E21
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:53 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id dd24sf12613629edb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:10:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930653; cv=pass;
        d=google.com; s=arc-20160816;
        b=gUa6TvG2rqo49VfY2hK5xtGLvjtLyLS9pmHDrP1w7o4Q/YPoHSPtaCsICAbyX+2M6D
         u6Zd3qXxDXQIvLLObHs2EUZwu9U2nNg/9WsHDkS7mRn2xGiCYce1Ojil5hssn71JuZUQ
         Qs2lFC1odlMNEU6FuqfLO4hQXXT9b/6AFCQq7K+RrWn5ZDTPoWkzts4I9exoGyAxc1VD
         t6H5PWqtprHiFE5hfc2j7WdKNv632n0o6TqhZJNQVp58bZCgd4EiAbL6GS/X0f/Z6cnr
         8r2RyfovcNjxawewHuI+K4OMGdcZMFK32JlrEisn9cZVXTE6qLir4r2GR8MYgLiAetGD
         iDVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=wGk1RlI4BrdZlqyZg/4H/LhFu1rN4cN/H/8WYKD6hOE=;
        b=G81OijuC7lDyIRPAYei3U3qEyiDyej7LkLpcpoYhVzADzfvcA4/qK8Qxdm9v53bDip
         byTe0HiOnuuPhHCP/X8U/gvghzzXoZjH0qg8NW/P+KnYza7BxxzpaeTDUevXMJjWoE5h
         L7dGBAGyeouRFoKQfQMExkZiYzRjOtGoPU7G4VE3JBFn/Ge65EQk37lbTf/XWCCeX2jI
         HLQmNa4c+Mv9yob+jVrLdGfq3yrobsA9mYdBYRCu8Yvq+8sBOM4dSKz9Ni9quOzcRxdy
         qxH4abOJ4XkQGyYFLLLMkq8GZ+U2EW4mSDz7Sp4RYGovprPrZ4wj4mqR+yJQB6BVh/+d
         MBFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wGk1RlI4BrdZlqyZg/4H/LhFu1rN4cN/H/8WYKD6hOE=;
        b=ZlhFcHWPcJd8A+P3ci/osfLG1DERrttUxtT64L3Xq3O3I+3mUWbxcPQIy1lt7VIB1b
         W80GMLrLhR+NYvs9CHwty0bj8UvVzNtg42jYdHBPyYz9jgG6cI2IXczWU9ocGPAwiu2w
         Pv/J6AhKO5IyhzNvGQx+ankWDCPeskDsWx79o2a3qwN9ocySlzO1hFlA02y7VIvPnnUk
         JsRN7onEvRZK2H/Q8ftroCU1LPv5pqGlY9Ehj8hGZV0LnlsRM7fAaBnNp8At6VUsDW3z
         cQFZDnKzwQuo4kwaafkzXqj9kKfOnP6NvyxXdXiSae96pdKsEEJOC2bCY0jmA0nDNM01
         SQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wGk1RlI4BrdZlqyZg/4H/LhFu1rN4cN/H/8WYKD6hOE=;
        b=giJzrfjYXb2Qbn8jmy+g/7zE3G+/XTfaMA0iLdPGqNLeTWMMjb9gGSNzJ8KozyGdPu
         h6cieEJ5a18RDWekUWTRX+aabup61mYmuHknL2fb0aBZkEe1Usq4O4G9GyV/8LyQp99X
         Zz5Um02F6c8MUZwkJQ0+j4ymObGkkQhDe2wd3EiO8bwwB+FF9swqsI+a9xfZk32//KTh
         D8E17EvRBYM59tS4vnFDRzligXtbHZMC7zMaI8WoucBgR4O+cLlPHSaNIwKesDjgFv3p
         28VGV514u9lLh5b9K55JeQl/qFdxuwOcdtK2+xnd/a5Hoa3iRMF/bXszWsZZg7We7mC2
         hueQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVBy63notkh0kvt9G4pftWZUe9d1xNIHFl/q4I8RGLYAmg+Zy2y
	unNbvA8+SdWfsir3+F08dGo=
X-Google-Smtp-Source: APXvYqyClJgr2Lpdsg3pmoCJvKA/V+HyKtyKHulkrqGqUunpGbG5m42eMxbLSzJKep4xrjGLZ0NgTw==
X-Received: by 2002:a17:906:1d1a:: with SMTP id n26mr13434202ejh.98.1581930653662;
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e20e:: with SMTP id gf14ls3389425ejb.10.gmail; Mon,
 17 Feb 2020 01:10:53 -0800 (PST)
X-Received: by 2002:a17:906:8595:: with SMTP id v21mr13985941ejx.28.1581930652976;
        Mon, 17 Feb 2020 01:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930652; cv=none;
        d=google.com; s=arc-20160816;
        b=o88QsUFboGr7Kx30pRSOn8lBotLbdFM9R7lkq0ceYUCL3PFRkRkpZ0fRKIIH8qLPVs
         tjcO51lAwm+FcFqhJraSkR6EW97of+oG/D/QPR3GhEmKAMyTFKCOa+bFx9g9Si/Kz/w+
         B76MkAqXJL9VJWzKwtAK7g4TMLB7MPsJyNxUfWXM5Vh05T5HK6p7qrivif7byZ8beagN
         04h0OX1NklmuI9lYROBGm1+dT84qjLTNSF4Ct82WbNVOtzdNQrkV/dwLwZoVrWESv/T6
         ZocFV23QuWOJb7iuYOY6fiUinEVoBAgG43ka8bBuImy/Qv5UsJJR8DfZ4cQK4Wz4uRRm
         WGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=Chj+UiYhHJ1J84Wmtbzli+/lGvDkNfFlKqw6lD9HZ50=;
        b=JhkzliVjrAhgytiXs50Gr7xXRXUKu3q4xwj/TIeQKpuMqj87MuSY+B8MQ3msQHJOmN
         wlXEBjK+6xn41nxyYPCNgAqMHj6kzg604840liY9pHBVU+M48t9wDbMHCIfh21L6AGAW
         Ujq9QSFn6CRqSyagwsWfzOQoyHdKaux0ua7kgBswCrt19NxOTW1PM+C76SjIUPS52SjX
         yxPcGnpRAgccYtjtQqB9BQlupTHDZ9De+TkySwsnIV2Qa9eZVONj4A9jAkhIlJ2tHvje
         Fevy+lgTGj9BRehu0oz3UcxtaUpzfjj4r2yQ3fYYMERSKfxv2GK5Ydiy13eemKnyEhy+
         n66Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s16si642078edy.3.2020.02.17.01.10.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 01H9Aqb9027762
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:52 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.42.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01H9Ap3b020534
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/6] arm, arm64: Move sign_extend out of bitops.h
Date: Mon, 17 Feb 2020 10:10:47 +0100
Message-Id: <46430c0f31887600ed4f11189dec4e25e1901fdb.1581930651.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

This is arch-specific, and it only has callers in mmio.c.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/bitops.h   | 12 ------------
 hypervisor/arch/arm/mmio.c                 | 12 ++++++++++--
 hypervisor/arch/arm64/include/asm/bitops.h | 13 -------------
 hypervisor/arch/arm64/mmio.c               | 13 +++++++++++--
 4 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
index 34b1fe1b..3b5d0a89 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm/include/asm/bitops.h
@@ -121,17 +121,5 @@ static inline unsigned long ffzl(unsigned long word)
 	return ffsl(~word);
 }
 
-/* Extend the value of 'size' bits to a signed long */
-static inline unsigned long sign_extend(unsigned long val, unsigned int size)
-{
-	unsigned long mask;
-
-	if (size >= sizeof(unsigned long) * 8)
-		return val;
-
-	mask = 1U << (size - 1);
-	return (val ^ mask) - mask;
-}
-
 #endif /* !__ASSEMBLY__ */
 #endif /* !_JAILHOUSE_ASM_BITOPS_H */
diff --git a/hypervisor/arch/arm/mmio.c b/hypervisor/arch/arm/mmio.c
index 726ea751..fcc7fdf2 100644
--- a/hypervisor/arch/arm/mmio.c
+++ b/hypervisor/arch/arm/mmio.c
@@ -18,6 +18,14 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+/* Extend the value of 'size' bits to a signed long */
+static inline unsigned long sign_extend(unsigned long val, unsigned int size)
+{
+	unsigned long mask = 1UL << (size - 1);
+
+	return (val ^ mask) - mask;
+}
+
 /* Taken from the ARM ARM pseudocode for taking a data abort */
 static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 {
@@ -103,7 +111,7 @@ enum trap_return arch_handle_dabt(struct trap_context *ctx)
 	if (is_write) {
 		/* Load the value to write from the src register */
 		access_cell_reg(ctx, srt, &mmio.value, true);
-		if (sse)
+		if (sse && size < sizeof(unsigned long))
 			mmio.value = sign_extend(mmio.value, 8 * size);
 	} else {
 		mmio.value = 0;
@@ -119,7 +127,7 @@ enum trap_return arch_handle_dabt(struct trap_context *ctx)
 
 	/* Put the read value into the dest register */
 	if (!is_write) {
-		if (sse)
+		if (sse && size < sizeof(unsigned long))
 			mmio.value = sign_extend(mmio.value, 8 * size);
 		access_cell_reg(ctx, srt, &mmio.value, false);
 	}
diff --git a/hypervisor/arch/arm64/include/asm/bitops.h b/hypervisor/arch/arm64/include/asm/bitops.h
index b7dd6204..aad70f29 100644
--- a/hypervisor/arch/arm64/include/asm/bitops.h
+++ b/hypervisor/arch/arm64/include/asm/bitops.h
@@ -124,18 +124,5 @@ static inline unsigned long ffzl(unsigned long word)
 	return ffsl(~word);
 }
 
-/* AARCH64_TODO: we can use SXTB, SXTH, SXTW */
-/* Extend the value of 'size' bits to a signed long */
-static inline unsigned long sign_extend(unsigned long val, unsigned int size)
-{
-	unsigned long mask;
-
-	if (size >= sizeof(unsigned long) * 8)
-		return val;
-
-	mask = 1ul << (size - 1);
-	return (val ^ mask) - mask;
-}
-
 #endif /* !__ASSEMBLY__ */
 #endif /* !_JAILHOUSE_ASM_BITOPS_H */
diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio.c
index 4961b030..e6933716 100644
--- a/hypervisor/arch/arm64/mmio.c
+++ b/hypervisor/arch/arm64/mmio.c
@@ -24,6 +24,15 @@
 
 /* AARCH64_TODO: consider merging this with the AArch32 version */
 
+/* AARCH64_TODO: we can use SXTB, SXTH, SXTW */
+/* Extend the value of 'size' bits to a signed long */
+static inline unsigned long sign_extend(unsigned long val, unsigned int size)
+{
+	unsigned long mask = 1UL << (size - 1);
+
+	return (val ^ mask) - mask;
+}
+
 static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 {
 	int err __attribute__((unused)) = trace_error(-EINVAL);
@@ -71,7 +80,7 @@ enum trap_return arch_handle_dabt(struct trap_context *ctx)
 	if (is_write) {
 		/* Load the value to write from the src register */
 		mmio.value = (srt == 31) ? 0 : ctx->regs[srt];
-		if (sse)
+		if (sse && size < sizeof(unsigned long))
 			mmio.value = sign_extend(mmio.value, 8 * size);
 	} else {
 		mmio.value = 0;
@@ -87,7 +96,7 @@ enum trap_return arch_handle_dabt(struct trap_context *ctx)
 
 	/* Put the read value into the dest register */
 	if (!is_write && (srt != 31)) {
-		if (sse)
+		if (sse && size < sizeof(unsigned long))
 			mmio.value = sign_extend(mmio.value, 8 * size);
 		ctx->regs[srt] = mmio.value;
 	}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/46430c0f31887600ed4f11189dec4e25e1901fdb.1581930651.git.jan.kiszka%40siemens.com.
