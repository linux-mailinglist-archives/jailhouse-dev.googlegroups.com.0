Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUMQY76AKGQEZ3FG2HY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5029643F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:41 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id h14sf1033545ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389521; cv=pass;
        d=google.com; s=arc-20160816;
        b=cD7ZApC1Kk5xINIStHgZLC66+Pi0WsMUvVCgJRIqHCQAbjrV254GNj3oJIgBkO0S38
         in7b3UM4L8ZC+xGdfMEroCP+fQqJ9o28xE0vNM4qUslZlyY546xRKAwfelB5U/u06r4J
         Sd+NdrXO2acehIgccuiaRh8YZVr8blBoTj/l1u4AbkjWQKW+A7dkJ/0S7C5DWsgcm1oo
         EsYQ9rBSUkZg4+vFrOTXhfaqWtsbiJ/k3thuDEyluG2XI/Yrs/MqL+jJjJNXmrHgs78R
         YcbJ0e4MyfbHBC2U5Sgu1wKUvPpiphfD3//uKte039FALkRaFfrdwsFQsHDLN1Qqohsf
         Gn2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=85s9uQlNaJvQQhQtGZiIrqSZCxHoe8aX0caboZbhKuo=;
        b=bxS0SeSodGpcZ11lcQM0NcK6uvO6wK6D7lx8e6j1C+v6XMPG60VyhxsUYLeDKa/CgD
         C5nwRr0XCA+JjTDPVwA47cQuLuFG8tcW43fVnuoMH8pWlOLzsDl6q5w3x8ANRapIbt6H
         XJa/C0rwxXTESnWpASl5C9WNEPDwl6yButc0vQHvqVXRE1eU0sZEJ0POrae55h1DW8hp
         o3iyR8gV0a23d2pG48pZnAmXsUCWrkSd88GASVOAjb+3R5qE800vyrqfoWQg8LPBEJUy
         QmFqbGqWTN3GREfaH128IYfBPxGioC6eEzJRm3MdDwq66VZKTnMcEgqinFJkisP4nHu8
         AGCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bin+6oQU;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=85s9uQlNaJvQQhQtGZiIrqSZCxHoe8aX0caboZbhKuo=;
        b=DMb1cb3NkYJR3uWQf2dacZaWNhT56wYU6sB4Gm04Y1sIAxLaf6ohuRUgxRb3K/ku9t
         b1WK0lxcOG583a4gcRKKR81SQkzuYZuRGg7V8XvISOBcNRnKr5mOiFhdZchnjMI8QsSW
         2snbzMVZZ2JaMTReCfMdNfHsimon0H1r8wDfXxATA1fULFWKzKZRMSivLYggzgHwKuxR
         tDmnAbiZtrC3LZUqtwxiG8WQ9Y6TXMBddkuWAPGVbE2G/5h1zYLaewR3pTz5Ys9PM1+M
         U+Er59mnAPhteiqYQAnvM/ho9T5QU0T5rcBzxHS3fO68SEePjZjnz01OdRDVryPvhw0l
         W8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=85s9uQlNaJvQQhQtGZiIrqSZCxHoe8aX0caboZbhKuo=;
        b=W0IgYBtykIUWjo2rkwzPJ3HGHU3WMc1ai8jyD3Q49r2teVmtZIr2rMj5YS/IN9CByO
         NHq/PYCkn/bIciL9C6S4whZoOFDwUrKDx2tN261uiMODFqnfR+pxiE/elezaXyKy9jJn
         jexWs/aBsr8r0noApm1HOypx85QtGhvow8fnDQ/mR6yp+0XGJbseu3oJQXIGI+Kjhw7A
         qXWSZiV8EsxVchjs9Iivz4bUkJltG692vOeKKyPWNbNA/LdTmn+E5tAjGsiw9ObGd0Vm
         ITqA1DopTAeh6+PQSndlIVIgCVATViXiHfUAQCE7XxyBqHfbdYTUFP2/lnJ9sq9h83Vq
         dXCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533fzOzTBi3iH/MhW4nX53RTbccm+aIuX/1P8tOcTbnT1XiQg+qC
	jBkpnCeRG7tkhAqO+4nfaRM=
X-Google-Smtp-Source: ABdhPJy5cadFIC/gUKzN6vmElc4l4VKHbPy46666dCbL62LJXOVzy/hD2wJjVEUIoTV4bAQo3On6rA==
X-Received: by 2002:a2e:9f49:: with SMTP id v9mr1555148ljk.369.1603389521368;
        Thu, 22 Oct 2020 10:58:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1749799lfd.3.gmail; Thu, 22
 Oct 2020 10:58:40 -0700 (PDT)
X-Received: by 2002:ac2:53b9:: with SMTP id j25mr1361759lfh.457.1603389520178;
        Thu, 22 Oct 2020 10:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389520; cv=none;
        d=google.com; s=arc-20160816;
        b=DAusWs50xFeotEXlxYU+nvM2Vu5KMJAl4sxLFbwwFdzbavYVJZfxBw0Ga7PTk3b5NI
         OutG60Hk7SGr9W2Llk7u+jhwWExi3Rfx5WIUX74M5+w6z07K0a4p4N6Tby6vWziQ0TEy
         SZGnV09mmM11e+WWzMX4mVq3yY1YR48DvjZAm61b0fYy+unvkKqgMmdBB721aj+0nwqM
         aMNoSFX4VuYEA3gt3PBoemJpwEc6ec/tC2ezc06jM3IZeRDGeowei41FiPWfxvdZmY2l
         YrUeLnqSX49Vb9j0lijE5WKlZNppf+h2ZI07QTV8O796qHUDXjeXMU/md6geEYCJWnPT
         +dhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=aLiEt6xjYwXMYhMWN+h5yDChrPbrezJmpajHkt4tVuo=;
        b=zf37BVWmB+q64yk8YjJAzxQuLWRwRiuW7C/4KsB4oD5Tr4HaDryrJ3ODPLL3No8Hs/
         W6z0UIN6rG62uzgDhAEKsKVPUkR7iwUrdKTqQvIEg6mM63MZNeKzksWHRtHVKISNTRWW
         18oOXRYMUh6nrm97kSt+0sEBWacN8Wblua539xCTcd6UbQ/RI/9u8MjVzKenOYh/4/CW
         H86rba81EYWtOc073yDOKjHw68q3llJGgKO9HnoOGC3X8t5yEvNw9ZtrwMQyGVa7zrN8
         Zf91AdifmhQ2b9jqM+Xo24aO3yrYilsRYPgRVJ6/sfQIIiN2RZPGY7UGlVommQ8SPZsP
         UAVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bin+6oQU;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id 11si68482lfl.4.2020.10.22.10.58.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTq4vfyzyZs
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 3jg4fWLByH9T for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTq1lk2zyZr
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 19/33] arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned long as size
Date: Thu, 22 Oct 2020 19:58:11 +0200
Message-Id: <20201022175826.199614-20-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=bin+6oQU;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

A better overall fix would be to have size always being specified as
size_t.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/include/asm/dcaches.h | 2 +-
 hypervisor/arch/arm/mmu_hyp.c                    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/dcaches.h b/hypervisor/arch/arm-common/include/asm/dcaches.h
index 73c2722e..87c316dc 100644
--- a/hypervisor/arch/arm-common/include/asm/dcaches.h
+++ b/hypervisor/arch/arm-common/include/asm/dcaches.h
@@ -22,7 +22,7 @@ enum dcache_flush {
 	DCACHE_CLEAN_AND_INVALIDATE,
 };
 
-void arm_dcaches_flush(void *addr, long size, enum dcache_flush flush);
+void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush flush);
 void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush);
 
 #endif /* !__ASSEMBLY__ */
diff --git a/hypervisor/arch/arm/mmu_hyp.c b/hypervisor/arch/arm/mmu_hyp.c
index 8a897f2b..676c7fda 100644
--- a/hypervisor/arch/arm/mmu_hyp.c
+++ b/hypervisor/arch/arm/mmu_hyp.c
@@ -47,7 +47,7 @@ static inline unsigned int hvc(unsigned int r0, unsigned int r1)
 	return __r0;
 }
 
-static int set_id_map(int i, unsigned long address, unsigned long size)
+static int set_id_map(unsigned int i, unsigned long address, unsigned long size)
 {
 	if (i >= ARRAY_SIZE(id_maps))
 		return -ENOMEM;
@@ -368,7 +368,7 @@ void __attribute__((noreturn)) arch_shutdown_mmu(struct per_cpu *cpu_data)
 	__builtin_unreachable();
 }
 
-void arm_dcaches_flush(void *addr, long size, enum dcache_flush flush)
+void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush flush)
 {
 	while (size > 0) {
 		/* clean / invalidate by MVA to PoC */
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-20-andrea.bastoni%40tum.de.
