Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ66W35QKGQEA25GGMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 7008E278331
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:12 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 23sf577247wmk.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023812; cv=pass;
        d=google.com; s=arc-20160816;
        b=U4RbipYRpXoFr50A7L+weAwRMjS8QYh5fCk1QE0hmbItDCKkbNwQz7VKQm4pkNwN6c
         +DiWPdkFKFreGQD3Uke8nvKLYNML6WvqEvl3/Q7C2KzJh5oho6S7G3k7Y0pO8N909jzS
         J0YZvq7kLW30ldcjNFzxPPa5N3SZ4UmqOiYxTaqRMw5DKEQwt1ETSWciy7QAS/WFfPxh
         ojnd305aoDvNsUzNVqIL6F7pAC/lqqKhOJ+iOb98v2AFqhaMO3ODnUgHLUwr4scrR9Js
         AEEX/zxBjBmVQdhUMRP1SzFcQ+Cib7sFd+ujQYxyj0IXjZLwh9hPfkbgxBtujeZyjw05
         f6nA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rzQ3dvGBJE5Pyd+kXloCl6gUIziCv9MU4JbvwWpnRDE=;
        b=OnugjRbNlyjs0F88qoF3XSEFX1ZCwAU0+G7gfQ0WA0mn2HShtXWBRf49bViute5KID
         AaPHu9klNVcL6Fo45u1G4vSAno1dFTsXyROHGPGh5RtF0p8L6M5Q/AC3sGUWILsFIwrZ
         3hU3tazClURlcVHRsvs7rkW64ck4qUR4EQc3DJTFIYdO9o/dQSe6Ak8g4adoO9wXvuql
         jerL4dtdpfTfhAcsDE2hKivmYp42Q53QametVZ0e1NHHadHNYYPQoANzq7e6kd5o1VeU
         tzeCVfeTGAi201vV+Jv65gCINj9gJvKINdnGP2NqR7lp7IUGXeBifn1w9F5N8epMWMlr
         rrXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rzQ3dvGBJE5Pyd+kXloCl6gUIziCv9MU4JbvwWpnRDE=;
        b=XpEBYA3iAqcyZ3TEoJxb6DHwbWd2ICrKeMl46dYRkQFeY1so/lmPCgk3vgW9lw+Gmc
         bQLGPEyRii6NBw4IwTuaNlDZC7rzTSi4fnHjXSrEh4MpjJad9TxQrjLb2g1WspPl2m0j
         7KNFlcH6TzNSHdfsRxjkURE96WuvAqw69Sb+S78uOTP6wk6FbXNCmyGLEnJFd1A7YXsa
         3PsKQH2zhPbfNs/i9Kava6Cwk89KeIslgkaYjBKGwI9BBr3X9v2cF9F4upUmKb4zCtDH
         WtCRgP6w6msj4yjZ1l1ATFrkqib2C9LyU7907SevnIkN90pHGRldGLRIhrV+a594hgWV
         QM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rzQ3dvGBJE5Pyd+kXloCl6gUIziCv9MU4JbvwWpnRDE=;
        b=Xyxq1qym+dfYe22B6oDuAp8YwMykPQTd1SmS//fOPIcp/xMHJ2xqqtJ8ixN7FVr+Ec
         I+3iytApEGj14gnxBnvks5XR1XAl8vT0Qi5QpXXVtTG4rSfKc+ca0kEsCLwLIFg0tlIT
         XtC4LMKEyZ8noaI5dYqeHfdF+plBL2dwjLDZnAIgrWq8ww0g3cbQInn9B09O8zhgQYF/
         BvFbCuXMMRyAAZ0az6f2t73GxfHx+6ssRn50WZfJsJCuDeQJhotPgzdP41xqVujEmVKP
         9BDVDvphAN7A5Wr8bhQBqtITBev6aqHIPSvq0Gzcx2QibI1D6u6QfmT7Rh9e7mY+VvfT
         cHTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322TjBq+bFyjbcCg8hkWkybgQRdqVOYxSIzAAX7jMRF1bwiwwzd
	jcBRwW5lf03TATGopjE/jvQ=
X-Google-Smtp-Source: ABdhPJwI7nAJc/maUVWFyyhBKi+AIHyNBaYoBZ6t+ROa+0ixKzFbZCmu+MtOsnqUZo5Gk6zdJXc7Xg==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr3475078wrx.251.1601023812197;
        Fri, 25 Sep 2020 01:50:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2e58:: with SMTP id u85ls834380wmu.2.gmail; Fri, 25 Sep
 2020 01:50:11 -0700 (PDT)
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr2063697wmk.128.1601023810886;
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023810; cv=none;
        d=google.com; s=arc-20160816;
        b=rgnYW738oOKjxy8g6mA9StCwTtfHInXsCaSbwLXbpZrmaOdpCwiE+SDq7MmSm+UXUA
         dE9376t/X5TbSt+XZe0LX9Wj29tY+EPyJdpcBM4SYsugSkytyEwqBg+LbmE7dD2d16AH
         iBqsywg1tVH1t4Je0g8lnQCe0GISi4rcl5QUls8Dn8x9K5zuiLnepvEzTFvmgEsEEiGn
         EOqc8Qok5zrjK3A/s1julqJYmTen627Of82KJdAKCBvy+BW8MGwcLpEa1iWt9re/OHWy
         PQn9EURUX/lUiuL17D5pKRWhoyp11+yvCjzU0o0ruUh8OU93qzXrrACwEjxWuWqmNOIg
         ChFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=aQ38ay3H4CIAfdlSh6K1EBdoYwB9sIKscC3M7v/2MDw=;
        b=eaDDuDvmg2qL3OuQpGjUnFh9OXuTB/mBUmp2kB0Cxzjv3yxtedV5mozO5nUQHyREwR
         WIPw7NqTAq/BFEEbAu1FeZPo78RxKRZszaM8PEhHhljyw7bUTEJvDsMLvf/eVYqaRbMw
         OV/8ivgNo07XBK5pCTXFXxzTyDEPWRuf2fTKqis2fn5zcAoR+0ZMlKni8Jl3q1Vm1N8X
         XRXspCoHDLoGJiAIpA0ZavC2kjA4h6PSL5Ix/9/6bMp38j983CNI22e3rIZUv90wfO8r
         lvVUvNkMzgKTYCMP42hWFwn2KICVYvYLCbN51adHAWGxZ9zXSmtyWR/X/sqNT/SX8/EL
         BsAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y64si56638wmc.0.2020.09.25.01.50.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P8oADm017404
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IO027224;
	Fri, 25 Sep 2020 10:50:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 7/8] arm64: smmu: Handle arm_smmu_find_sme error properly
Date: Fri, 25 Sep 2020 10:50:06 +0200
Message-Id: <a38f43616d17b754095f52767f25dab4fe8b192d.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
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

Bail out if they happen during cell init - apparently configuration
errors. Skip the entry if that happens during cell exit (unlikely).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index b89291e7..4c4bb279 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -863,10 +863,8 @@ static int arm_smmu_cell_init(struct cell *cell)
 		for_each_smmu_sid(sid, cell->config, n) {
 			ret = arm_smmu_find_sme(*sid,
 						smmu_device[i].arm_sid_mask, i);
-			if (ret < 0) {
-				printk("arm_smmu_find_sme error %d\n", ret);
-				continue;
-			}
+			if (ret < 0)
+				return trace_error(-ret);
 			idx = ret;
 
 			s2cr[idx].type = type;
@@ -898,7 +896,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 {
 	const __u32 *sid;
 	unsigned int n;
-	int ret, idx, i;
+	int idx, i;
 	int cbndx = cell->config->id;
 	struct jailhouse_iommu *iommu;
 
@@ -919,11 +917,10 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		arm_smmu_tlb_sync_global(&smmu_device[i]);
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(*sid,
+			idx = arm_smmu_find_sme(*sid,
 						smmu_device[i].arm_sid_mask, i);
-			if (ret < 0)
-				printk("arm_smmu_find_sme error %d\n", ret);
-			idx = ret;
+			if (idx < 0)
+				continue;
 
 			if (arm_smmu_free_sme(&smmu_device[i], idx))
 				arm_smmu_write_sme(&smmu_device[i], idx);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a38f43616d17b754095f52767f25dab4fe8b192d.1601023807.git.jan.kiszka%40siemens.com.
