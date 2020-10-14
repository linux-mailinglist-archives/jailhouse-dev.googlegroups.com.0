Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWXNTL6AKGQEJMV5RQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761128DB52
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:15 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id n16sf890285edw.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664155; cv=pass;
        d=google.com; s=arc-20160816;
        b=IEzsbnxeF/Z/iXxdqoanDUaSlM9mPRIFqOE5I6Ow9gBmyLu75/SkDxJqzWpxnndm7E
         Y3lbNpx6/JD6lJirH2YDN2cNXMJYTDF4+znypJdtd7yqutKL+zK7cjhIrEtDI1jA7Vah
         3hLEKx+DMSkZF2KtGdO/CCnJQGCxb3/z+Tu+eM8tbABmLLolYbJWozAXAb5Q4N81Nnk6
         wKNFcXxIn5betZpqJpR1G176wTXzVWB95dbfVxgrHIXeXre4Im8sf0AsyZ5URCmHwjBu
         RFlp5iPdyV9VvvDJgASJ6BIScPOcCMKv6oOJeJFEDSEfMDtasvgku3mtnj8b/GOM22Uv
         4BKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=O1SUmWxweHJuepCv+LfAiZcIIojiQwhISDQwHD+0F58=;
        b=DZmFyPngnW1FYq5aHR9TS0AnGHPQXQoOdkrRF3e8V4B0a/JNm6xZ7JhBkJw/mZe8Vj
         KIQdzrY2HuYaU+u25hVknHo4ojwZxK8XS86yrY8PDQKrKBy/MRaeCl3FshLxxF668qYA
         miEikNuv63khuHmhm9yCOJ5+9xRBpzhaC6H5OVt2qLiLrgOBHVrPuYFLumI1y/QVtzg+
         tLwwbcjT6st87Pyx04jN4+IOerKGHZuDBs4cZLLDXadCIPBshAVpupr4vEALldsff9ry
         DH0FPBIB5Q2F8Tj7s/A+Xu28lL8zQacowtvLvLzBoRKNUO9L6eLcOMhSj4M8l2mpfCQY
         XKRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O1SUmWxweHJuepCv+LfAiZcIIojiQwhISDQwHD+0F58=;
        b=pIDu1oCPHhz/9SAchL/qVZZjGr14iH0At9U8aogQiv7JB5IuMx0FhYZUa0TRv+08W5
         6RB8d/lB0qdOcwlhpD8elRL+npUiO7+BiFrsLV+qZ4qULyld7/nGsVr6gTccJWwbzb9b
         Kh3tXZJJmcbAVWC/Rb9N8At5Cm2Vjrb7eHYb264KPJGp6jU77LtzEwwUdudT0xYVvHbK
         P5W84ju2v8ALibPOeAzrWlCExBSGTwwEy4LG3oqkdF5JQMduwTmsH/I6TJczcdI1/TT+
         E5JRJUecPrVh6E9r9PskBI3iGPUCDzl2mFGF8BgF5SlRC71hS/JuAdkpj2jiTNaNdIcA
         BsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O1SUmWxweHJuepCv+LfAiZcIIojiQwhISDQwHD+0F58=;
        b=B++SWH6JUhej9nSip4xK6lOTIoEKoMRV27Cj6R6lvTt+CgmVkpKjlEDggQYJqVTUhZ
         gqadME+CJYJAFf8M/yhV6GnHyvbX+R+QPKT8+nwDJ4AR+eE1mwm7M/wU4TXyC5MJ0eTw
         4iT805cJNzLx/Xo/j+dSxV55PDJYVuphv9xOHDm1CTTcYKIq2/VP9Nk5LBy/KfSmtf4d
         ZJbQLTSx1fA6AGPiAuSE0/RVzEUTTGUNqPjgCXNdc6wFZXcZ9vRhEqe+hYDVc63fJB6p
         SacwCI2a6aBh1BFtOwcXcoEk1wjnja7Y7pAVIs4fBe5UpfF9WAluy63NSGjJJW+ZQ0Fd
         mtRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533IBGt0BhmIokTrPIzmEWqA1VjaaKABv+FwleZxOBtZhgtfC6dq
	mzWDO6eympA8pVuarW/QUuY=
X-Google-Smtp-Source: ABdhPJyCotw/ZMTk0jh8glpqxTkDGffdE4YbUb1aRAfK7qXNTmwR4BcmL8thhLjFtfkD6bGp9fHeYw==
X-Received: by 2002:a17:906:af75:: with SMTP id os21mr4017786ejb.28.1602664155215;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f252:: with SMTP id gy18ls1233957ejb.7.gmail; Wed,
 14 Oct 2020 01:29:14 -0700 (PDT)
X-Received: by 2002:a17:906:b784:: with SMTP id dt4mr4330952ejb.376.1602664154195;
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664154; cv=none;
        d=google.com; s=arc-20160816;
        b=VWJ96o8VzAhV+7g+tBGc7YqFnm02BzwflCiOZdYw+Vie7og1RCzMPEZRnTMz7KPz3d
         Oaeih0+oZB+LfGbzZiRPGrQaQmn91JiKaU8WD985mfTi6D3OsIGJknVjHLSAw2CGkXGU
         N6umiM2GHnNXN8kSOJ5H2oo8fxiTXvYCX3q56MW4CEUqbpIanS1VXpJYJIzJarZTgaUh
         x0oevfs/GljHX6v/w0XiM5pXT+28ZVRwPtLz9LUCD+dY6o3a/qOoPG4+BuKoB5+YZEo9
         pfYPH9+eeyRRhyVc/H2p/oNLorb98kWidA9aytcXYPsTgkTuGjel760s83mdw+dHGQA0
         sc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Zo0mS5o0V2+6KzJ6eYybazIIJSUDQbDPR/CNnvm+otM=;
        b=BE4otv/N2oKpy6kMKyQoREhljHDuwvnOjZEMwKwusueIje/7pws/wzRcIGIlyTEAgT
         HADOYwgP9BXZ9rR0M2CIUuMf8Pu371hzXv0UHcb+MF+ShP6I6ZRvvMBYhthWb/bJ6Y+i
         T16HL80BV1PDfFYvkjQYVmI0owDhIRGQDEI3msZi1z0JCy83LSTymPMSBV3U7e46U+9P
         QHXhqdXcNxdKT+tr72VXmj4DqgpLGgSA+NtATy5nE+H0ZM9oOamP06QEUfodJoK0dtfi
         ihxGVsA31eqPyLzi75hcaLTeQz57seO4Ivhn+K1q6rVbmk8tmgr3BVLgcf85KwjrWgVu
         YnCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id bi6si56097edb.2.2020.10.14.01.29.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TDSd032658
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIw002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 12/46] arm64: smmu: Make sCR0 write-only
Date: Wed, 14 Oct 2020 10:28:36 +0200
Message-Id: <7659ef3cc6a0b58bfea92f5d757d9b6b544be7c4.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

There is no need to preserve existing settings, and reserved fields can
always be overwritten by zeros (Should-Be-Zero-*or*-Preserved).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 9078fbe9..34c99a6a 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -96,8 +96,6 @@
 #define sCR0_PTM			(1 << 12)
 #define sCR0_FB				(1 << 13)
 #define sCR0_VMID16EN			(1 << 31)
-#define sCR0_BSU_SHIFT			14
-#define sCR0_BSU_MASK			0x3
 
 /* Auxiliary Configuration Register */
 #define ARM_SMMU_GR0_sACR		0x10
@@ -532,23 +530,11 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
 	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
 
-	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
-
 	/* Enable fault reporting */
-	reg |= (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
-
-	/* Disable TLB broadcasting. */
-	reg |= (sCR0_VMIDPNE | sCR0_PTM);
-
-	/* Enable client access, handling unmatched streams as appropriate */
-	reg &= ~sCR0_CLIENTPD;
-	reg |= sCR0_USFCFG;
-
-	/* Disable forced broadcasting */
-	reg &= ~sCR0_FB;
+	reg = sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE;
 
-	/* Don't upgrade barriers */
-	reg &= ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
+	/* Private VMIDS, disable TLB broadcasting, fault unmatched streams */
+	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
 
 	if (smmu->features & ARM_SMMU_FEAT_VMID16)
 		reg |= sCR0_VMID16EN;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7659ef3cc6a0b58bfea92f5d757d9b6b544be7c4.1602664150.git.jan.kiszka%40siemens.com.
