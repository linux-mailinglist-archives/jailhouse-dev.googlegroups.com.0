Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNX5D5QKGQEYRUKFJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09C282CCE
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:17 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id 33sf818563wrf.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838017; cv=pass;
        d=google.com; s=arc-20160816;
        b=h0JkDShYIzCTNj66TcMRluuurvN46o2a7AMHAJD6oCUki+VvsfrzJn4FKFBqTZPi7i
         jq5U60dbl/sETQ/yFJ0Dr5bBSTa8ABPUSqzIqbAvXxsMrBks7PbTOsBEj4hnynZd/5Sq
         Kdv04Rqa2YGu+hzDOUGj8zhgu4R3Bq5PujiJtn0ZZFEL7LuVYWlm4S/owfWIRAwsfqXb
         oNIQVGJexKlDg+1/uDPKesTxqTT3S4K8ipXvzV+r5WVsEyAgyE1EX2Ex2iWdRKmReHOy
         AywH9uONSPleOi/4Sumxgf4Nc+Ibnv36c6aprwDiUGWHLq/SF0Y0LBBVoARh29aJy0Mj
         eYmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=1NPyaq6iy3ILYIOgYo1VyD5I0k0CEtIlBBLRIODVPQk=;
        b=Tu522GGm7cxhllNGgvCDT2RsR9lbppQSxAzP4ah+QMSpBt98v4vmGVjKuuFmxDxBcl
         rhmzYDeRKRzpPIwBlToClywPpjP0iz3YeQ2E4osSefaEk8Uyj1g3larUsibkbyoQBBSt
         MC/bXIhyUnD9WY4Bi4SJGlsJ9AoQZqD35BiBt/Q9Hi93kG2uDxl562ao8Ms7WhR/R9IO
         0JuWtV3v/X4372oFTU5K4QF87zxcvNDuD3IsPITtjv1D0hUSmBf6vJb5fcx8/Pc+fwE3
         SuZ6eF8hSU9A7vaj4vTsKEmjyPY6Uv9wO9MhhLaVrpnuuUlRoLUkPOYc95C1SuffDx38
         tsig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1NPyaq6iy3ILYIOgYo1VyD5I0k0CEtIlBBLRIODVPQk=;
        b=jniKSAgMNMBNR8+/e8DtEtV9Kc9PDMtMw7EQXsi6HzacHTOA21XZzmf4MjHCzMYU5L
         650cdAT99BfWyLB27JQeC8hEE51MtJgD7zAR2HQlLRS2s/ouP7k+sf3RnK41LiFpde99
         cRU6CQHmERxUDRNLcBsC8B055lZC5kQnhYqm08VxH4c2KXYW4CSDcLdwt77I6z9FouxY
         f8Xmg9ogXlKOaTOv+EYmkRqAh0VytBDZHv11bxBpfkyb594fvhqiWj3UD4IgxAG+qj0A
         7+QyBtSRJAfwlaQeQicmxGQs0oAJ1mlRyQRyGiwaUX5SHTFyg38ce1n7H1qT5H3erzyq
         aoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1NPyaq6iy3ILYIOgYo1VyD5I0k0CEtIlBBLRIODVPQk=;
        b=oDLh+ia4rgPI2nh+By68yU8HGP2e5bJYfxJMQNYOvIqlQWrTjSmXp7WomZWYChl6Wp
         UGq+AxXB6WlhuROXVN8dw2LrbiOHWL/KO2kmdgqJsmnxf/ouTKl23lQens6fTRfobeuP
         3XZHMPeEKlt002Pyb9Gt2AM5J089pP/+H6zayu7XTsVa4S7lnvfSx3B3lkpNjabZ/Jok
         ccA6EeJUKyhDTYJwd7t5Go4FfgoOohL308MndlKD88WtoI7NYKfDx5bmstojwKq5pufn
         AYJoe9lXlvqDt1Ns7bwj9OTCQlf4jyF809qlKW0U/fO9dQfRxgqNzGf0Sq0CguEAyFj5
         3tow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5304dVid5cHqW51URefBvSm+RBTU0Fm0w45BAVAxgeXyHu5fcgGR
	I4BUTgmKwVPjn+J071C/oPE=
X-Google-Smtp-Source: ABdhPJyLSxkHqongCFwvhHmyve0F1u9zyMDxSeutdSEBhKWbjePcr4RLf/1/OHBL06ILRbOqT4uL5A==
X-Received: by 2002:adf:9043:: with SMTP id h61mr14018298wrh.237.1601838017424;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls5163279wrq.0.gmail; Sun, 04 Oct
 2020 12:00:16 -0700 (PDT)
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr4717702wrg.166.1601838016428;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838016; cv=none;
        d=google.com; s=arc-20160816;
        b=jQecZz9A3jaM96qoYoyqXnZGhTcEUZ1vox10j6bVGPE5A9nORJS5+hMXEc7bm9H4pI
         Qt6eqvw0Tl+HT86vnswpRploQYvqbAfVqOsytTIL5lOBWbrKZWSFm1bJe6rdocmxn2g7
         qLoiasiBi7QChwMoHnP48C0KH8fQiB8vrXTyRm7OwBunOY7C/O1XWw3xLkmhoAlL3Y+V
         dUz+yNy+zUTePvYyw6WctYX81p1VSQHlY9k5gHvdxFwSHjVHkbrSjNtNsg6/f3HZFyz3
         lSTFEVrq85LqaT/1X03j9DgBrpqRxOk4s482Kh6Rgq3txD5OzJvR8KCy2Rik9oSDfuuM
         Oa0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5QPeRXZ+QuEoDFjZujitJkGruluIb/YOogTcd+p4/JE=;
        b=ou3zgX6BPPT3gveVxmGUq/523XjxEMZ/kLXD+qTw68nDyVqHw3N1FS0YSf7iGwWTyM
         lr/lC5U68lWVy5oUdueXb6E2m9zfB6ujhhZD68s/9c3tWboILvjQbd32fv8/fO2D2D5q
         mgI+tOYbpfKWN/KymK4Cm+NjzzKPtLoVJv9DIyVlI7nqxLZTEYbymLmv1Vimnrtd+s7r
         h5q3XaT9NRtsgUkHti8R8d3SNrRySSsTLZQEUqWyBPRpy6a336CtbxOvw/4CSQ2xrCev
         CZxLvvM4s0xAV9rDF4twWy0wJ4zLSeThxFaF+3Yi+jdfn4meaOgQvyoXIeZZQWv+PM9C
         SxNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 72si33841wme.1.2020.10.04.12.00.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0GnI029825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060o017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 38/45] arm64: smmu: Demand version 2
Date: Sun,  4 Oct 2020 20:59:59 +0200
Message-Id: <16e2acc785aab3d1b2329fddafd2bf7e3bfec96f.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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

We only support version 2, and this should be checked during probe
already. Makes arm_smmu_device_reset a bit simpler.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 3b45cc5e..ac6d7472 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -286,7 +286,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	void *gr0_base = ARM_SMMU_GR0(smmu);
 	unsigned int idx;
-	u32 reg, major;
+	u32 reg;
 	int ret;
 
 	/* Clear global FSR */
@@ -306,14 +306,11 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	/*
 	 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
-	 * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
-	 * bit is only present in MMU-500r2 onwards.
+	 * clear CACHE_LOCK bit of ACR first.
 	 */
-	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
-	major = ID7_MAJOR(reg);
 	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
-	if (major >= 2)
-		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
+	reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
+
 	/*
 	 * Allow unmatched Stream IDs to allocate bypass
 	 * TLB entries for reduced latency.
@@ -359,6 +356,10 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	unsigned long size;
 	u32 id;
 
+	/* We only support version 2 */
+	if (ID7_MAJOR(mmio_read32(gr0_base + ARM_SMMU_GR0_ID7)) != 2)
+		return trace_error(-EIO);
+
 	/* ID0 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/16e2acc785aab3d1b2329fddafd2bf7e3bfec96f.1601838005.git.jan.kiszka%40siemens.com.
