Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ66W35QKGQEA25GGMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B883278330
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:12 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id l22sf771279lji.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023812; cv=pass;
        d=google.com; s=arc-20160816;
        b=cq9nVze6bmfs1jl2BsYsSDZ+akChUzGdoJE+Raj+1xLLJznTvRLdEf2Zaamj8jb2XT
         mETxTRClNYoT0I/mCEjbugukRh9r/sZ+pBVGXb8TpnvSwNzehx4o6p+r/fYSwjRFlYKV
         CaebZ9pJ7le5tsWKy4X9KnmT2jIY1ybCb74hc2FDANEkDBtcu8Y6s7JzcB3maqzYtC6F
         FAe+JTOtVoicy2Qss8Oyypdrpujn8hdwOeCjJ6sLo+qDrPAk/zbMT09as0NXMMqrRTpw
         J/uQbPujLfO2ib7/WU/LTSdtGIzZv/TRQX9FJvXFz9cl1JKyDkeEveegpTW0O/H30Msm
         XB3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ecGVhMDZXaOIJEwVB+/+1DnJwEj5FYPuT/gZgJAOjZM=;
        b=nK66fqcB0cEF7VRgYbGSfuUipkenRd6B50X9GGiQPdhctt44FsPWm9ru1MLGzER+tH
         z3fDEy9Ovo442MoTxeJrlYIF/1tzF2U7y24aFbV/jphQygBGUosbYJuobYuVtR4MaWJV
         Vc2sbyI92De6R+5ZBLszpsAq/+BfMwYHtnaC0q3RGhb5lV0Ye+Ho4zH4F7P3oxbW9/Qx
         dcOetsYMOM2b4vWseDjuyYP66x3ETb+V7EQJ+GSirCSjN1XfTbiCrwO1yZjIRj9piDIc
         ZUbl7NK5p7oKI/ZmncCGq17odUujGZOXQ1T5WCjImpYJl0LGV2nNiYhy8/0Yvkp8ZpIs
         osOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ecGVhMDZXaOIJEwVB+/+1DnJwEj5FYPuT/gZgJAOjZM=;
        b=DRtJVnb6U1tH1LMWYFHC5LY6SjFu99Cq6GILN682Eyaw4QIB7Xhe8GrcFYbrXG37cL
         AC9R1N332Y96A9meSrqHbIgCvnyiNLF/yVV04Aw7+rN5KGEFlVi6NyEiX6rFkQ/37L/s
         GP2oeI+7wX5Zo4XxcUWM8I1s4SD8dh2YBAP4qxTxmmbivmEmru14dWz0PlyYJ0EoJ3c8
         Q+SRvzFBfiLYlm6c9s6y4X/w9uDx6y0ghLQU8lIuOxTPS5IIkIliKkB/BmEoDQEHaLnM
         oN+9fKMYnf1dfrAn70yzDvFUbjHVafkJTQCEfOzq5vHVqtKIzelNpUpBmKLuF8vxhVAH
         aM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ecGVhMDZXaOIJEwVB+/+1DnJwEj5FYPuT/gZgJAOjZM=;
        b=fQNbGwOIFqQlibthV4YgRN6/9Y0GFOaW1pX1uwaN+130rYO35nrkDZx2tBTehTHu5u
         NfMSwfwsY++oTWJYTpIvYvVkT690vWvg1fM2EyKg2/uQJHSggxuRY8bKPyFkfFgUZ2kf
         WTkGjkR1oS4uvZaiuCukA68hbJXAf5oV3gChsDJ6oXlvTV9gga6sEseAiHh0j40Q083u
         S7C7Va8T1DYUQYPwIzFnl5wvivcJXMuuNJaPMN0cISGXaoSx1C47f/I+esChQou4eAQw
         eAmGr9H0XvePfJyA3CUp7leReJAYdp8fMTls2q9xl6/zjfRwOrpaNafPKacDwuKFPBXN
         Zo7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532f3N0kCunWrYMPx/iAjb95xRreoTa6KYWiaKe1G2RGdeERwagb
	AXUVru/BhIohpdtCqiXMt3E=
X-Google-Smtp-Source: ABdhPJzaaWeyZLj9TrLLPPs8czB7GSOXdesHl15q3YX9MtRCg5SoPxkg2CVCPCdxU5AhNtV291MTfQ==
X-Received: by 2002:a2e:7d07:: with SMTP id y7mr1105195ljc.179.1601023811864;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls164451lff.1.gmail; Fri, 25 Sep
 2020 01:50:10 -0700 (PDT)
X-Received: by 2002:ac2:5597:: with SMTP id v23mr941574lfg.5.1601023810647;
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023810; cv=none;
        d=google.com; s=arc-20160816;
        b=gnzJEgjedHewEq+ncUWpBD+4dEhjC0j9A2a1+EhAAgOru3/PVsLA/cCyYPTF/hZcRX
         Uc3UqfpeoAtOnmDrWoxCB7zYwHchq7WacYKPmKOoPU5t3N2vIhFcp7dnNG2v04XE+x03
         xkptGAuG4N7L3fL/MvWEsEtmyQ9isWPeQaxVlV3b/piIWyN64S76dGDeQYK7iY99/jz1
         fsRCKbRCX69TKUJPQUo/NtBP6NfPauxJsbY9eFJUighplXbpTmulDiPhYbwnDdGjyC+F
         YVX0LnByZhJCnJ3xnxLTVnuUSQSqsLm4gxyg9iEpd+gPlhKGgropPfIZcyJ39Ea+/f9W
         Rn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4R6apwSphXabiQlZHsyJ8fRFE5MMyz1YIliEsX9ZljI=;
        b=CWhTla57Yd2n+BfDyfUwc9MRar2PssrHZQB2KUOdqR3x+1IM0PvdBtlLQwOnMkzdsK
         ETaX33YXZFHdd0ZT4ZzZmZWvLriZm9YDn8KqViEhu4ZNwLRzgXwCikhMqWUhmEI4eA4y
         lzMlGPjYoyb+3UTskfw+KNszoZ5MtYbVckoNynoWe1sX7oeFLkc716JVWuQXOkNoySMP
         VEwJSHsjWucuq3/JtMXnjAc4vSj5QwbRO0VAXRwpaf1YITnbQ/Gc8Xgs4slpsff0+euk
         SUaRhAOvAY96IdklBJ92R9M9vA0ZXQh73jpSDemQYV7HGdJwnyaFZibWgpZavtFG6/1B
         bFww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z6si62880lfe.8.2020.09.25.01.50.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08P8o9OV006004
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IM027224;
	Fri, 25 Sep 2020 10:50:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 5/8] arm64: smmu: Fold __arm_smmu_tlb_sync into single caller
Date: Fri, 25 Sep 2020 10:50:04 +0200
Message-Id: <fee50d3d617b6ab72c4e22371adf31b394a9454b.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
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

No need to have that inner function separately.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index dc476618..2cd5157c 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -320,14 +320,15 @@ static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
 }
 
 /* Wait for any pending TLB invalidations to complete */
-static int __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
-				void *sync, void *status)
+static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
 {
+	void *base = ARM_SMMU_GR0(smmu);
 	unsigned int delay, i;
 
-	mmio_write32(sync, 0);
+	mmio_write32(base + ARM_SMMU_GR0_sTLBGSYNC, 0);
 	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
-		if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
+		if (!(mmio_read32(base + ARM_SMMU_GR0_sTLBGSTATUS) &
+		      sTLBGSTATUS_GSACTIVE))
 			return 0;
 		for (i = 0; i < 10 * 1000000; i++)
 			cpu_relax();
@@ -337,17 +338,6 @@ static int __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
 	return trace_error(-EINVAL);
 }
 
-static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
-{
-	int ret;
-	void *base = ARM_SMMU_GR0(smmu);
-
-	ret = __arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
-			    base + ARM_SMMU_GR0_sTLBGSTATUS);
-
-	return ret;
-}
-
 static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 				      struct arm_smmu_cfg *cfg,
 				      struct cell *cell)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fee50d3d617b6ab72c4e22371adf31b394a9454b.1601023807.git.jan.kiszka%40siemens.com.
