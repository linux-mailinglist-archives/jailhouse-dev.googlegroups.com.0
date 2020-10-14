Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPNTL6AKGQEOBOKETQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1528DB49
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id i21sf260933lfo.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664153; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jcey0H2mgPLueuYNrDPBZwuW6/c8rQX9FGIlmm7cw+RxKIoBarLNifejgVJqHF3pQM
         sLgWED3P1DiNfc1pmRC6/8rEtjSi4FBtNE8nQNrQTlvvdnxqf9U964V5/i/CI+zheMce
         GV73nB9fy/DQnzwKXSAkICfciov+wH3J9bzqpKobYxWlj3wwXN4jCHyy6LzPtjHvBf9c
         BHxmG1w52RyIMvpfWfgXAeJ0CK5e5Xivv7jEmv0DmGcS+ETc+lIp68BbON/FUn10Zz6L
         R533R4YLcEKbia1qhhKSkLSayjqUACuRMzpqU0/FOtewnjsuPp5dXWR2IAQfwOea+8aK
         43AA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=xSsn2df7v45MLZcVq9qeTiuhg3hXq7WxXI7yeAFTBqU=;
        b=H0chMzZCH+HKxqf7Lgit2BdrM4xPaBxtf95KxNlADlXXsePcHbgiEIVqa8+WOg4L3n
         HUtcrwLbY6cmify8CqerNciJaTSZmJ/2H21VlNvM+ucOK9JHJ8Gzu5aOSJUcfRd5+D1+
         y5sXW0cl58uDdNb5NBMkFMB6aiP49Mb6E/F9M2eu2WjdO4KwLTExt2agBLx1t9KVW2tG
         N8FTAiuaHHu5q6dVz9aMRVbi7kugCeY9lFLerCnGX/+trRXtBmstALf/mM3cX/VkSwqp
         JpxicdPArEY7qR/4h1C+cLBfD5VrSblZotx0NWSHZd17YGxJeWhDEJuyJ4eNlYRJ3E24
         CPew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xSsn2df7v45MLZcVq9qeTiuhg3hXq7WxXI7yeAFTBqU=;
        b=oawkKqLhkKjAIwyokg+H+SHLQ0TUX0lH0xLFe2nt3SsPo7Lcv53fGGmTe5bQq6vqXm
         2t5cGgmntmtL5ZhNXpuju2WdgJYcZth6Ei271DuVOeQvRMywO4MIeLUrzcrVWp2uDCJr
         FUatsyqmGmM2KM5QT+2ZdxjcDXU9n1Zq2Jh5iw8zBTkwIANYrwiAzY2H++7ASHLaJwAI
         nZ3IN+UPhPMceV3hUYpFz0HxdO+851v22MgvCvPPJNO7aMc7bKoMZ7RgjGBTBCg7tKQi
         KRJ6K7qLabCo2oQ1tix4gPXjaLOFBerI0tRqd5jDNpqSBIuQ2QB9PuVQJchMtc2Gj/cO
         y0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xSsn2df7v45MLZcVq9qeTiuhg3hXq7WxXI7yeAFTBqU=;
        b=XexQdmPC9z2o3qKvPAADeIkNUfCkcU6Qz41PLDyN37ZfeyW7pEC2hRX4XVuBArUR20
         p4COF0ZWGDZ4nTgyt9qUlpCNaZ8gfoDrNHxmsIyj/rqCkJje7aQ9llqyOJXjXHxaGQkT
         Pd0gjXVmHjLcjHsVNYPdkFEs07hoHGL1aox9pu7FKmRykVuDe9kUoDUctOTjkevpHU0N
         D1EbNHdl2QVItRVM6+a2Y3XbiPxF4gDQcnZrcCZuOVCPmVWlp49Uhx1zowFuzPbIJZwa
         WJIFkmVwQCqSHDMn9+NDVgCwwLo/tGPq0fPHHDA7s+KrD+J2n06X7/hY2IsiqlP2Dk4h
         MCiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530L7K5JIKu2lOuycCxlaajLejY2uDiBtv61sq0/Pfxpr2rJ4CBF
	uTNseMKpo/3RliJ/pFMFRoI=
X-Google-Smtp-Source: ABdhPJyzy9J1iWk86qbaqbw7aZ6JkMhAXwktQEVNonmw/hnNuJuG8TCbXjz3JlbPTz1uZtbow5azPA==
X-Received: by 2002:a2e:3e1a:: with SMTP id l26mr1503169lja.63.1602664153795;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b5b7:: with SMTP id f23ls490670ljn.2.gmail; Wed, 14 Oct
 2020 01:29:12 -0700 (PDT)
X-Received: by 2002:a2e:898c:: with SMTP id c12mr1485402lji.285.1602664152540;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664152; cv=none;
        d=google.com; s=arc-20160816;
        b=EO91U9n255ssLaSvmxcs05YLPHmbaUKafHPghe2tI9PufOqcBM8JDf9dSwuPgbxOxI
         9HoChN/uBWyKZCLKyD5ZtBFLWD9pyJrZSpgacLEnXf41LpUeFoVvd9wBxxUsX5COCcOp
         8wh6FQNnr5LFS3gwivEmj7ukcx9RKStoIck6J9cNJSZATM9RONmMLdqHp8gWaF1tC+Gi
         KDm8JXOzD+R76Z+DfoQLks4xVN5cKlBWk1k+YtPxJ+P1UEX3NbUi/on6UzNSKeWFAIrz
         6BmVJRYiIiFtYkTdc/6TqjoOo6pGxmNxJmSdR4Yq65hGS53WfP07xPAqteZ49/5TQpxg
         8xmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=d/C9nE+omDSWAw2HeVUOQbZtZjm2BAGKZL/pKxRjhes=;
        b=pxkg+hmfiq4P3o6BMQaakwOtPDc4BeMpJTxc3iD9LLuMcjL3q/2W5vqePjvUKjkyw8
         Q+Is9jagvM2VaNeA+VmRPt113iIvrvNzg611G0YQajJjpbqLrn2g0mA9AkBmj1E49pdp
         ayQDokte3908SP1mt4TVemMTnCcBjDedwlejtJFKIK1P4FWJvI4zu43Kv2h+hpgBtBu2
         eczyqeeEAJIEG9ap9X0GhvPv1gtXQAXReKJhTjmkxO9fAMIFL29szgIioQkPsPJFvZdn
         2iXEkc18Bn9jddCq6K8XtAmT1Ewzanu3H5ibXBEPwk9/u+mR8BWuS22dlN0daUdyyTBW
         YNfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id i17si63310ljn.4.2020.10.14.01.29.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TAI5023821
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Oct 2020 10:29:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIk002644;
	Wed, 14 Oct 2020 10:29:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Chase Conklin <Chase.Conklin@arm.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 00/46] arm64: Rework SMMUv2 support
Date: Wed, 14 Oct 2020 10:28:24 +0200
Message-Id: <cover.1602664149.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
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

Changes in v2:
 - map 52-bit parange to 48

That wasn't the plan when I started, but the more I dug into the details
and started to understand the hardware, the more issues I found and the
more dead code fragments from the Linux usage became visible.

Highlights of the outcome:
 - Fix stall of SMMU due to unhandled stalled contexts (took me a while
   to understand that...)
 - Fix programming of CBn_TCR and TTBR
 - Fix TLB flush on cell exit
 - Fix bogus handling of Extended StreamID support
 - Do not pass-through unknown streams
 - Disable SMMU on shutdown
 - Reassign StreamIDs to the root cell
 - 225 insertions(+), 666 deletions(-)

The code works as expected on the Ultra96-v2 here, but due to all the
time that went into the rework, I had no chance to bring up my MX8QM so
far. I'm fairly optimistic that things are not broken there as well, but
if they are, bisecting should be rather simple with this series. So
please test and review.

Jan


CC: Alice Guo <alice.guo@nxp.com>
CC: Chase Conklin <Chase.Conklin@arm.com>
CC: Peng Fan <peng.fan@nxp.com>

Jan Kiszka (46):
  configs: arm64: Add SMMU configuration for Ultra96
  arm64: Cap parange at 48 bits
  arm64: Introduce cpu_parange_encoded
  arm64: Simplify get_cpu_parange
  arm64: smmu: Deny transfers by default
  arm64: smmu: Drop test for non-zero base address
  arm64: smmu: Drop useless features initialization
  arm64: smmu: Clean up arm_smmu_find_sme parameters
  arm64: smmu: Refactor smmu device setup and usage
  arm64: smmu: Fold arm_smmu_free_sme into single caller
  arm64: smmu: Replace for_each_smmu_sid with for_each_stream_id
  arm64: smmu: Make sCR0 write-only
  arm64: smmu: Add shutdown handler
  arm64: smmu: Tune output
  arm64: smmu: Remove IRPTNDX traces
  arm64: smmu: Remove bogus Extended StreamID support fragments
  arm64: smmu: Drop unneeded includes
  arm64: smmu: Do not stall failing context transaction
  arm64: smmu: Move S2CR macro out of sysregs.h
  arm64: smmu: Refactor S2CR handling
  arm64: smmu: Simplify VMID and CBNDX allocation
  arm64: smmu: Drop write-only pgsize_bitmap
  arm64: smmu: Drop write-only va_size field
  arm64: smmu: Demand aarch64-4K paging, drop probing of unused formats
  arm64: smmu: Fix CBn_TCR initialization
  arm64: smmu: Drop coherency reporting
  arm64: smmu: Drop stream-match feature recording
  arm64: smmu: Drop 16-bit VMID feature
  arm64: smmu: Drop dead ARM_SMMU_OPT_SECURE_CFG_ACCESS
  arm64: smmu: Drop dead arm_smmu_test_smr_masks
  arm64: smmu: Fix TLB flush on cell exit
  arm64: smmu: Disable context bank only once on cell exit
  arm64: smmu: Introduce arm_smmu_disable_context_bank
  arm64: smmu: Refactor ID0 evaluation
  arm64: smmu: Refactor ID1 evaluation
  arm64: smmu: Refactor ID2 evaluation
  arm64: smmu: Check IAS and OAS against CPU parange
  arm64: smmu: Refactor ID7 evaluation
  arm64: smmu: Demand version 2
  arm64: smmu: Drop more unused fields from arm_smmu_device
  arm64: smmu: Catch VMID exhaustion
  arm64: smmu: Rename ARM_SMMU_CB_TTBCR, drop unused
    ARM_SMMU_CB_CONTEXTIDR
  arm64: smmu: Fix CNn_TTBR construction
  arm64: smmu: Stop caching context bank states
  arm64: smmu: Clean up arm_smmu_tlb_sync_global further
  arm64: smmu: Return StreamIDs on cell destruction to the root cell

 configs/arm64/ultra96.c                     |  15 +
 hypervisor/arch/arm64/include/asm/paging.h  |  21 +-
 hypervisor/arch/arm64/include/asm/sysregs.h |   7 -
 hypervisor/arch/arm64/paging.c              |  30 +-
 hypervisor/arch/arm64/smmu.c                | 830 +++++---------------
 5 files changed, 239 insertions(+), 664 deletions(-)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1602664149.git.jan.kiszka%40siemens.com.
