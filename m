Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBFUR36EAMGQER2OYEQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5393EC2F0
	for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 15:43:52 +0200 (CEST)
Received: by mail-qv1-xf37.google.com with SMTP id bc19-20020ad45693000000b0035ccbd692a2sf766499qvb.13
        for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 06:43:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628948631; cv=pass;
        d=google.com; s=arc-20160816;
        b=n+y6RXa6funH8uWnDpsDlqvZL9KGFe+ZqZSSyDSey4cxt4bZPPyDvTpMUkg1bZf6nP
         znjz8ve3TznPJXb6U0kUHd9bzOggQDTHjV6gpk3u7//qPU8IZR8/SrNC9VGYsOWe+9kJ
         FdbeqyILYOIIKkOf5aAOrV62zBT36bJXfxThwnKvr4c1IqeQhqxKKhtuK0hpjLcUeANK
         V8cLg6M/kUTD/vS1NhpxyPNkDbvvjyv5l84aWu4aPDkM44eEF3OOyw6LouNiLsEXLwZg
         Rpnn7Tc8dtBOHb6YVpW3wyLWzau30Y2bL84wVNnaZ9eF1mMpeV8onfm4DW7gu0k1mSOm
         MbkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=Mtzni77m6qj2p3uJaE2D5VRjIw2yYzrAAMs8ahoXbkM=;
        b=bjXBuG3APbPRwphZwwRCVZVyg1W+UDI+EZ5HZjdWL21tl8zzZAwCXc1tEt94kVOUCC
         VUazJ8+q6EI1xqDubBdyoMQvig2435umoiPvKNGM/z/8+vfYVrOIKPj9VVd2BrBDPh4d
         LFRSlcor0dlFZg3X1IPg61no/hxu7UAN9Ef7GeYRhp5YqKXSyWRJArxertsHGRVZZQde
         udgH/KxTsccSbootT7rDGaPHU5k2evsvUdrno4H+2KPblzYygvZO7g3XIUwdGxTsHkYb
         pFXgVt8Q+xYy+gRX4pkSQ9CUv0OCZKwsHhvRFYev6aLwj4I3TNkX7BLNmvodJBldPXH7
         TDPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+tmSHRH;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mtzni77m6qj2p3uJaE2D5VRjIw2yYzrAAMs8ahoXbkM=;
        b=ZcCx7q/wpo6Sxa+FI6Ivwy6XrBYwpOItVe5QlC3lwTG0aqOGt3Tfcijl7ndJeCV6B2
         g77ksNeLkD1eI86v2anwUahyimBKX4piZgegamMgQAJk4rHEcSsM2dT/MpcZJJvOPq8u
         hRFds8uIrRovgB0Uz4BS4JdnCjF93S54umZYASDKx1sfSPpAeTF1DHlm3fRu91DzCfgJ
         kS9H5gFyByPKkoyUSFqnbm7zV9HwnhuOYMAobJ+2tbr23yVS3OCyM6iYGPIvc+kMQJWF
         TvzsL7jToyqZ70sE4OUGYy5c6OXyNmUabd3h0NtSa7g+m4naCKJ2xlnEw5SOxh4oy7gr
         lVZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Mtzni77m6qj2p3uJaE2D5VRjIw2yYzrAAMs8ahoXbkM=;
        b=OWYtTa1qKrVJOOpp1OsNPLK+71ScGLgSdsgIuyhXdeqLksPz2fK5+ns6G50Z0aFp75
         8De45bbigeX8bCNSFqpgpix9cqaogwKJke2WdRCIc20QzJ+N9kuGN6o2OOWAF0h4ISGU
         W01XaIoknEPdBJcKKYFk3G6HnJpsfJUZtNqrrP/qsC9USiU2Tt209VeGHIBF3Ql3/Lul
         yajO7HJjXaOlEI8+d35XQUBzFgUoQIpg3zcHA76oMLH9CiLk4/3+X6vykkN8qH2cBU4k
         7SIOz7ngjIqMSlmYAZpdhNXP93ArzOUy6hDVo5VKdr42k7cCnNfIewkMa0yQZNXptJa0
         irwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Mtzni77m6qj2p3uJaE2D5VRjIw2yYzrAAMs8ahoXbkM=;
        b=D6zmA1JQoiILvIZY7d8Pg1d1kRXMji6R3QCzU1ZyYauIJ+m8VILr8FLr4hi0oSRquK
         QfgI6WkyGNzbDL7z3HPp2J3GbpCpk2N/IRywt6IK8DxgY1AyFPfQgTZKjFQEDE3zFKkh
         cCMSpdJuvejj9FX6Levey10ba26o0HqnPD2x5lRCOlrVeHkAvXgS+csf+4YG+tXSPKmF
         tqmL9jYTyeMi7Vv0geQOSR1E5CVYxEdwW//mnxHDeI5VFtZuKf58LsszqKyoP/jkIF3a
         LeVG6mbWzNVBlrkEddLCMTlCfojRwIZFEsJZ32dplR08SXbHyco9CPuqafPan+gz+Tud
         n0Bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530yMNUAqjEoz6/67b6F6LTNdUXh1kqm7DO+JM0+9BxJ3RQVIufk
	KQXvdy0WAqZJneu/RJjPANk=
X-Google-Smtp-Source: ABdhPJzu3kj/XWcloL0NZ6+7xY2oyoqjp6PsQUgs3L5y//x7AbVs4stxKfrL2Fr//I5gfx5y95AGfg==
X-Received: by 2002:ac8:7eea:: with SMTP id r10mr6225572qtc.349.1628948631068;
        Sat, 14 Aug 2021 06:43:51 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:1e06:: with SMTP id n6ls374432qtl.9.gmail; Sat, 14 Aug
 2021 06:43:50 -0700 (PDT)
X-Received: by 2002:a05:622a:170f:: with SMTP id h15mr6276588qtk.378.1628948630454;
        Sat, 14 Aug 2021 06:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628948630; cv=none;
        d=google.com; s=arc-20160816;
        b=LDPtre3tDYYVF8uIDP+01s7CQ0rGYHTbWAHGKyDouLkbjC5SU5tmq1Ozay0iiZye+Q
         /pH9e92Wisz6mRw40TB6xKjR140VaJWkIFYyt/Y2yNmd93C12uaD/5NittBFHzY245M6
         pAES6RtWhrTESlsKvMkCwbxgiWJz1jQxuhbEcPf3wr15nZjbqE1HPvCsGL2BiPpKLZQn
         naGNcqyH47y0S0/7TyHzWYeAlGCi/DzaQLtMyvk/CZK1PApPfB8r9SUshrHXSFAffHQH
         pxGcb3Ima1yUNJek3LIfRLs6JUZJlYYOCT233to5x/aU9YBVjWZQzuc88OXs3TTVsyrG
         YIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from:dkim-signature;
        bh=HmGlfMRIEXTiI6dkFExoKwCZELZuDmyA2GnSkFc6eTs=;
        b=UjzUWqBGv3KldKf//D/HV0lP0z88uOLShK59dHmm6yDdzym6bsCp+GlBk9PbKPVKjk
         u9oD2TTSNR2KYtkNY4p9FGsPfipvGoTUpAGGgOdevXhfkenV8qi3qEwAySxRGZpZBZL6
         lLhkbva++ZftDDVgOnreP5IgBeRK361pOqwdfrmXTmmfUENbasj8CqMFW6KKvMqENvXw
         1uKktBbDB19Iv2krkzAHowlvOYce6N/pIt2ZmzCWr0Q79gJxkYpvSR8jSnw47j5PAfih
         oq3an4zTD6QlLtYe7Ubr+wBO5dY87ibFkiuCDeFzYTQ0YZPXIm/89xtmTD3lcL2/lMhj
         py9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+tmSHRH;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com. [2607:f8b0:4864:20::1044])
        by gmr-mx.google.com with ESMTPS id n2si255054qkg.5.2021.08.14.06.43.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 06:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) client-ip=2607:f8b0:4864:20::1044;
Received: by mail-pj1-x1044.google.com with SMTP id oa17so19487291pjb.1
        for <jailhouse-dev@googlegroups.com>; Sat, 14 Aug 2021 06:43:50 -0700 (PDT)
X-Received: by 2002:aa7:900e:0:b0:3e1:3dfe:bb2b with SMTP id m14-20020aa7900e000000b003e13dfebb2bmr2669244pfo.81.1628948629535;
        Sat, 14 Aug 2021 06:43:49 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id y13sm5388906pfq.147.2021.08.14.06.43.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 06:43:48 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH] ARM64: Only init bootstrap page table in master CPU
Date: Sat, 14 Aug 2021 13:43:45 +0000
Message-Id: <20210814134345.12340-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=m+tmSHRH;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

There is not need to init bootstrap page table in all CPUs,
bootstrap page table is only for boot, when jump to C language
environment it will use the formal page table instead of
bootstrap page table.

Init bootstrap page table in all CPUs will impact hypervisor
startup time.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 hypervisor/arch/arm64/entry.S | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index a9cabf7f..6d10bf28 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -22,6 +22,9 @@
 #define LINUX_HVC_SET_VECTORS_LEGACY	1
 #define LINUX_HVC_SET_VECTORS		0
 
+#define INITIALIZED_BOOTSTRAP_PT	1
+#define UNINITIALIZED_BOOTSTRAP_PT	0
+
 	.data
 vmexits_total:
 	.quad CPU_STAT_VMEXITS_TOTAL
@@ -29,6 +32,9 @@ vmexits_total:
 vmexits_smccc:
 	.quad CPU_STAT_VMEXITS_SMCCC
 
+bootstrap_pt_status:
+	.byte UNINITIALIZED_BOOTSTRAP_PT
+
 /* x11 must contain the virt-to-phys offset */
 .macro virt2phys, register
 	add	\register, \register, x11
@@ -120,15 +126,24 @@ el2_entry:
 	cmp	x1, #0x16
 	b.ne	.		/* not hvc */
 
+	adr	x0, bootstrap_pt_status
+	ldaxr	w1, [x0]
+	/* Check whether bootstrap page table is created */
+	cmp	w1, #UNINITIALIZED_BOOTSTRAP_PT
+	b.ne	1f
+
+	mov	w2, #INITIALIZED_BOOTSTRAP_PT
+	/* Set inited status */
+	stlxr	w1, w2, [x0]
 	/* init bootstrap page tables */
 	bl	init_bootstrap_pt
-
+1:
 	/* enable temporary mmu mapings for early initialization */
 	adr	x0, bootstrap_pt_l0
-	adr	x30, 1f		/* set lr manually to ensure... */
+	adr	x30, 2f		/* set lr manually to ensure... */
 	phys2virt x30		/* ...that we return to a virtual address */
 	b	enable_mmu_el2
-1:
+2:
 	/* install the final vectors */
 	adr	x1, hyp_vectors
 	msr	vbar_el2, x1
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210814134345.12340-1-gengdongjiu1%40gmail.com.
