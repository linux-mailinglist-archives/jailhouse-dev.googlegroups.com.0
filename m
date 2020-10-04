Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBONX5D5QKGQEH2JVOHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A02282CAC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:10 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id l9sf3112602wrq.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838010; cv=pass;
        d=google.com; s=arc-20160816;
        b=nZ/FYtdih4q/4DzgvT+XMpslUf7XcJSODdAU/UAu2u8IN58ObeNL+tzi5soZ8yqyz7
         uQMO2ew3LbvVH9PoBr1iQrVSHmnSozWCdIP6vn5Qce8szlQmNTD4JOBvitOOasjBpxcK
         MdJNcqoP/zJoypxKthNv5P9HeuWUb/cJZpSkLFmaaJfTyNis6ywsygx3sJ8g6KzvH805
         DlSvBU1fnGbiVQLIt4zQGvczfTxoNfjqdAIIYdWHy6sphdz34/REL7YgjvLSiBMZad2U
         FIYLqIAce2BN+0N0So3Ju553vODXQHg5D68m0vfzZMgH9UXsHRnSFaE9SNJU3IJ7jccG
         kHPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=DYVDXe/5Y8IR+cykl/ZBha1ZyeLcmxJ9h+AxuKeUdAw=;
        b=B053058NkMPLsdY1M/hHs2lAEFMWHKlg3I3xqOtuLPdUu4k29bQoVJBIvBUNnLpW1D
         uJS7MAsawQvYMq43NjJt2ur1d1IaJo8cY5ObTwlZpysh+hiF79MFA7QPukjyiDuZjLdP
         rIgcNNPB3bZptHOtgE26gvUiJTzKp6JdZMx69Tsh9SPND7m+VEjFrpBHPHMQn7I0gQn1
         VAx0nNPjyFeU90Odf1YjKEuVTtbZnIGLir6+2vk3RNJh8hsfNJ773uEGXglcnMG1AQnd
         IyC1U0RXF/EGC3EVnTNbNVWBYpeCIBAryda26hxQ6wev4zkHDSSuZYkjYkD3hDUOEhZH
         Ho8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DYVDXe/5Y8IR+cykl/ZBha1ZyeLcmxJ9h+AxuKeUdAw=;
        b=mFk12PPHD+d6DvnlLfUgFSUcOiOzkWIKY0e6V9UMyoRJXB58Zq16imOH+io9N9apmR
         bqHWRhDHL6YAOcvBCKPZVcEdfiWWM2Uwk7jMRKlRwRFnQMwnWGsda433lt4yX5qtSI51
         M0NHDECzcM/3WnXJAa/ZVnrQeiLrgWFE4YWbc39AE9JuV3ErkVm2THLlQQIdXBxwApwF
         RerFbnI2K8lFY2BQUnJeqmz2A7jBOEensoYnIsUH2oToXXueiiN9onrM9/+LL+d/3sSM
         XnaIQJHjS4iBY8ktPAQKBKbrsFvkf0avhl24lnkGhqvlthQkZhnCI2l5pmG31vcHnhqe
         jFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DYVDXe/5Y8IR+cykl/ZBha1ZyeLcmxJ9h+AxuKeUdAw=;
        b=pHBM8GOT2kRF9J6sgCaopI/cjB1uE9YrIBN7qgw0udBCsL9cgaMpWv/hUvRuV9icPm
         d+bliol7CPj3wPalNiuewUlnR4K55BfN01XPuyW1qW6C35jMn26k9WlF88mWWigmRXGR
         HSiAWqRMJ7X2P9cwZQf/JyXj5ZHKhMmQ3Fl3dEPG3IOwlXUfD78+BBO3mI1YIV7jkQJc
         9mLWZnSaLh4pA1aJaNaktiCU/EsBcICn7tkdDFykrVi8PpzWSGFyR3ikR0svWEiNKuVl
         1jnJpbCXaL9hr78CeBo28fYEAOiU6ndSuQjZzyL+TwsKkfrLi+iPNX3V6xUM5tayJk0X
         6T5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533zgzgPSHj4VLG0b8vuj4OD4S+KW+zwk8j+RGrYWXXTRq402uvU
	Hfl7mtTFourmTtedlmNQ5pM=
X-Google-Smtp-Source: ABdhPJxVYTnXHIJj8wyJ8noc99fwa6BIqW+8L2ZS7jA4jnEzKOU5WRBR0gPrNBzpRTySyB/q6YYhqg==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr14541525wrm.392.1601838009979;
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls3536572wmh.2.gmail; Sun, 04 Oct
 2020 12:00:08 -0700 (PDT)
X-Received: by 2002:a1c:2042:: with SMTP id g63mr12886974wmg.174.1601838008837;
        Sun, 04 Oct 2020 12:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838008; cv=none;
        d=google.com; s=arc-20160816;
        b=F4SPcG1NLw+Q7xT6NlXyQVnFqZypF4/37HRLQvxh075TbfbVeyzBIrttPXkw3G0Cqo
         ilcFClJty040ZYuOQK8yU3Dum38StENFbgIwspOgHBwxsJ4bKLjUYbtFNmR144cDM5x3
         1kk6fXAtNAUHWXRMZHXyNOFo8LBmVI6dR9n7NGFlHgwOWJnUYMI/503a2O+jQR7VIo3c
         kEj1uINaHTgsmh9zfgFGzkMR8vKwdW12FjbzS3AhnXg07bnNfuwHb0ZOygWbIK1e0A9X
         i9TE+LpP5bNKIGf5fNqMDFGEvPYJkWNBgYtq4nQwI6nasM5wugY/Ytl8tQfiNUNbsP/T
         9/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=EyJyvQhix0rFD+gMI/hFhT56+8wa8jPFXGbHdWvHmHU=;
        b=m6yNCvWFqOnIaIHiZWl5RU0VDhnI5QOXelppkHvHtAYC6ljuEFcDAuEUvmJCNGlMgu
         7TPDUgwOgAXnbhHEHHVXmDl5yVdvB91w0gooPKfJ6OXFnnqmcIQVR4z2pbvJ6zh48Hax
         4gWqw4JM66lZnYkcHJTUGH4XExtLpPPvKc90b0Kr/+qcaY277YkDYRxHHIe8se9uXz7A
         QkhJSS9g38lYeRBjlBjE0M9SXrPH6Se1qmyxA+arIo57wGAUSsBxtmB+YjWwdhH6wqw3
         t1TbVK7QxmuBwuAJ7BsZPyn8OF4z4sr1CEaErjG5nMzs4g5P2NUj81A6AwMaeAyBfNMm
         KVIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id k3si136429wrl.5.2020.10.04.12.00.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J08ZK020308
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060E017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 02/45] arm64: Introduce cpu_parange_encoded
Date: Sun,  4 Oct 2020 20:59:23 +0200
Message-Id: <a3fcb28ff4f58371c7a7e92be689927947b100d8.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Keep the encode parange value as well. This allows to use it directly in
VTCR_CELL, rather than re-encoding it via TCR_PS_CELL. It will also
allow reuse by the SMMUv2 code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/include/asm/paging.h | 16 ++--------------
 hypervisor/arch/arm64/paging.c             | 13 ++++++++-----
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index 5713379c..67664efa 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -177,7 +177,7 @@ struct paging_structures;
 
 typedef u64 *pt_entry_t;
 
-extern unsigned int cpu_parange;
+extern unsigned int cpu_parange, cpu_parange_encoded;
 
 unsigned int get_cpu_parange(void);
 
@@ -193,23 +193,11 @@ unsigned int get_cpu_parange(void);
 	   ret; })
 
 /* Just match the host's PARange */
-#define TCR_PS_CELL					\
-	({ unsigned int ret = 0;			\
-	   switch (cpu_parange) {			\
-		case 32: ret = PARANGE_32B; break;	\
-		case 36: ret = PARANGE_36B; break;	\
-		case 40: ret = PARANGE_40B; break;	\
-		case 42: ret = PARANGE_42B; break;	\
-		case 44: ret = PARANGE_44B; break;	\
-		case 48: ret = PARANGE_48B; break;	\
-	   }						\
-	   ret; })
-
 #define VTCR_CELL		(T0SZ_CELL | (SL0_CELL << TCR_SL0_SHIFT)\
 				| (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)	\
 				| (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)	\
 				| (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)\
-				| (TCR_PS_CELL << TCR_PS_SHIFT)		\
+				| (cpu_parange_encoded << TCR_PS_SHIFT)	\
 				| VTCR_RES1)
 
 int arm_paging_cell_init(struct cell *cell);
diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
index d62c7142..db8314a6 100644
--- a/hypervisor/arch/arm64/paging.c
+++ b/hypervisor/arch/arm64/paging.c
@@ -14,6 +14,8 @@
 #include <jailhouse/percpu.h>
 #include <asm/paging.h>
 
+unsigned int cpu_parange_encoded;
+
 /**
  * Return the physical address bits.
  *
@@ -24,10 +26,11 @@
  */
 unsigned int get_cpu_parange(void)
 {
-	/* Larger than any possible value */
-	unsigned int parange = 0x10;
 	unsigned int cpu;
 
+	/* Larger than any possible value */
+	cpu_parange_encoded = 0x10;
+
 	/*
 	 * early_init calls paging_init, which will indirectly call
 	 * get_cpu_parange, prior to cell_init, we cannot use
@@ -36,10 +39,10 @@ unsigned int get_cpu_parange(void)
 	 */
 	for (cpu = 0; cpu < system_config->root_cell.cpu_set_size * 8; cpu++)
 		if (cpu_id_valid(cpu) &&
-		    (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < parange)
-			parange = per_cpu(cpu)->id_aa64mmfr0 & 0xf;
+		    (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < cpu_parange_encoded)
+			cpu_parange_encoded = per_cpu(cpu)->id_aa64mmfr0 & 0xf;
 
-	switch (parange) {
+	switch (cpu_parange_encoded) {
 	case PARANGE_32B:
 		return 32;
 	case PARANGE_36B:
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a3fcb28ff4f58371c7a7e92be689927947b100d8.1601838005.git.jan.kiszka%40siemens.com.
