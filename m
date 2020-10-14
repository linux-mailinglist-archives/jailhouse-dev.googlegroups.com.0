Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXXNTL6AKGQEXVI3ILA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AD28DB62
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:19 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id t1sf868578ejb.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664159; cv=pass;
        d=google.com; s=arc-20160816;
        b=zYGE8RmiQmdh30WMo8Ih+nGe7eOkPCBNEn1aTUclOwPcv14sVaLjU31uTWAUVSFXej
         ++avgVYU23q3XlmStUagQE7uXlKAiptrc3sARbJhn9xY4+poa5Y1Tz9rvHuyuUxFspHA
         0wrqKY8NYYvCcnmtGNhgFeq+lf9uZk8QuejkJdCB0mtNNNzuaCemLvoZtxkOvHM8Aweu
         1SHOa7TrDc9SPEFSsXDsj7Kk9G7+lP1HrB/heffdYNgouS2AjfHfcHgHbXQdwE/+CcEn
         kjfYE0mPmTiVzEHV8Uk1o9myewAwU3tgCnMmUOESiUQ6XzO5YXAVDk5/Z9gwvsq+EyXt
         wlIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=aSfZIgUykn18RniAd4qLaoKyzuyjMRqclhVetwYNfbQ=;
        b=x2BbTQV9C4lJvRSjhYnhyTeE7mercmUUGm8h5ZqTUIQv4FLR9QigWYwsGRWXyR6cx0
         DUuZDD91QQbvipFlVgh+2drRDZsdfFkb/mX1MV7prdllh0owGWL7O5CYZ0XvN2qOgaT+
         wY8P8JD2j3wzfAZ4kFMh3DWvM+4t1WhXyD2/4joHELB6Yt/cj1fhMnwyNXz64LFA3uWn
         PuQf8CobrQo1zuA2l9WilUfyvRpvnk1oTXnalsA0aGfIiqe71NiKsEWsh2+dFssjAreH
         Uq8Se3RFdSkfHPTn6Tse+7MNBmUwyNvmJPai6ZKBvqdIzBTDh9uD+Z5G4Lff3XjrUSD4
         7Uiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aSfZIgUykn18RniAd4qLaoKyzuyjMRqclhVetwYNfbQ=;
        b=idAkocv+3/UB59QVZ9vadpDXWRtU4GVzjFwSafUoNXgjHGNYiWAHt8tgQ9jRn2CSEa
         ua0xSXNLj67+MYzdgWTm2hXGKLKnVE5XQbgtunzTirf61oRHqFFsAZBHBwLyPEZi7w3E
         DNZh8qxOqNQw+WKmEpjc+N6WJx6tpaxH7rtFfDFz/r4oldiHdpyUDh0kC/weVG7PeYct
         vuu7/gVIFwlAMHIWB/exZlepPySuNDnuhYQtAaWSEzWrFlDf+4K/EtaYvuUojdKRvVHB
         9hqX+kC95Nsg3AgOSpETVhaD3xFrRwETqTlOhG8kO8jakMRfGzOvUAX2L2kzNh+DU9ce
         sGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aSfZIgUykn18RniAd4qLaoKyzuyjMRqclhVetwYNfbQ=;
        b=BhP/wU5jNF1SKVX+zxNdhTHGAqS+cu+RFu8IDsH7NngIcQHWJxgND3jUHeTvFH+a9+
         JDR1dbZUcQSSOiBBggMjCupxmitUKWobC9bSYjlWhaF3Gy7hydAPX8293W2P3o6suUz/
         VCv/MR8fANjdoYmL2wQDDrSu6ZDvbE3SAVtyzSq2MIsZLuJZHcv0EA95WcukpahGwTje
         PfXsHeEGRJjPPhh7/V/W9Kaz8FZKCz7GHNKR21zyywQ6IXaj3jtWpKdW4L6Vbm2VwvAf
         7Pzt339KDmEop3I4Tm/1nBQ37WAa3qI16w/Zk28ZlPJ0/5A8hrxvmNAYrhPUUNmoa/mq
         jdww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YU0h2rUTLyKANvY35ixYijGFQA3RG3rRebHuQwj0cKL66LHRs
	4GI8JCproDuu4b9aa3GEf2Q=
X-Google-Smtp-Source: ABdhPJzE0y1TDQ4Rk+hmmM/Iy95Ws8lAEQdiKAflSjxcW1r2oXdShVHx0U+F2z/a+KHkfoj7IbdhnQ==
X-Received: by 2002:a17:906:a198:: with SMTP id s24mr4012646ejy.154.1602664159210;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7381:: with SMTP id er1ls1232247ejc.8.gmail; Wed, 14
 Oct 2020 01:29:18 -0700 (PDT)
X-Received: by 2002:a17:906:52d1:: with SMTP id w17mr4183528ejn.164.1602664158119;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664158; cv=none;
        d=google.com; s=arc-20160816;
        b=hBcGAsQYUpaQ6Ncdz9N8Rf3kN8AMMwkEllOHuAu7ln5uic/uzo7XMB34oWpo/a3ovQ
         Mo1WLbyRZrFkjypOgvG/pkzDEL7Vn7WICKd4hkZXLm3lbfDcV3OiVc5Znt7HA5HaGLYF
         acslTrkTSEuPGT+0UogWN4JudJ2/sl9zQafqnyfaZZqN/v9qrjSIXy2jTR4dne+FJpUM
         67lpjTEdTCl7ovKf3lwwqFoym3EhPt6vzg/ySusNddk3YTgANz/+ffBj6VjgH+HdXy+S
         qwPKRP8yGIhuIcYO7hr4dTabDrwz1blqmBKOwTROTLtoy6FAdCfsvYyTW3Pnp0uVX/t2
         DxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=pLSnddz6EG5US94GLrhFo/PzzmGb1OiefUfl9pjbYZk=;
        b=wL53bPFgnO+aC2vC/mMJetBOja5yYkjqAookjQ4mPqHFaAgNucAaCmNYAUOugwqZ9q
         5sRpeKk+JSoMH3ul5e0w7S6tU3elPk6CnBVm99o7ryP+0mdckSfZlwgThqWQt87YRhQW
         FiP2dQwKP8238qL3CzjRyPeQecOK9PBCN2kn049USQTYAARCb7Pkv7ITSOg+j7j1o+jK
         YFFzUjsxPH3gdb6e0EQQME6lfrwwYYuuZd3ab00UOXlRsMN/6srswThIY1MhxatpSLtP
         MIr85Z5FYxFAt0wgtLvMT3vdO7UY+z8mhrS8DFUYpsMyKJjTkDThVOWwqvF16KM/9yeo
         Rvyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id v18si73471edx.4.2020.10.14.01.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TH7D031324
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJF002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 29/46] arm64: smmu: Drop dead ARM_SMMU_OPT_SECURE_CFG_ACCESS
Date: Wed, 14 Oct 2020 10:28:53 +0200
Message-Id: <2ad93da668821857ca749ded9fa4170b71c7ce9e.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2ad93da668821857ca749ded9fa4170b71c7ce9e.1602664150.git.jan.kiszka%40siemens.com.
