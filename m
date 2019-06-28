Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBUHH3DUAKGQE37T3RHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E0E59F02
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 17:35:46 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id u21sf4113056pfn.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 08:35:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561736145; cv=pass;
        d=google.com; s=arc-20160816;
        b=wBpiQoY8deRP1UI7w3ELM2m1UtbrDV0oGE1vPUHq7ykhBFf3HD5iYIUhJMy1YmpJiV
         AL/lnoZOuHhv1LMmNbNwLTHibFVEb187equOQiYxSaIjFTWNx90t1S8AY+9D5vGThSgc
         XYtkEe36I8to3Rc3+QTAVrYYjHVpq8to9DRFRJ04FeJfvpmzfzs1hVgMzHE7jEcbmJpw
         Tsa9TbtyEj19+9CUKvGL/0wUro8rXOciET4s01wLn2X/50SA6CUUkKvq2St7m/VEhnjA
         pFHaI7FsQf4cXSh+ITIW4rI3hCbYUS0EQrF0DoO5PooqcCr7RgcWIDOiUKQ44Pniv3Em
         2SZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=xlIFGs/VOGwSTrq4QLr9TKFujE7TGhCUSlOzhmdVfgc=;
        b=iuFfARWokJAerOqFHCoCXAS1PBCzUQYNfgJ1aJ+gkQbvjj8W41+IzIjNko48G5mB9p
         Ce7pCyEEy1Z2cBsB3H9Jut7HxLR0wlT9Fg/bWxN62vw61/4OB8vAhzORfR6etNyGR6Rp
         r1Wlfg73Crc2L1fgHqZUm45jZTGv6CwuoQvfN/c580MiKRTm8lt0gWxP0TMJzBYWYDSL
         nU+3T7VStPIiXrV8jLYzzSbr+x3tamUSYInMNlQLpsoksHdGZtSxQnzPpqdrRKJ2WscD
         +g6uTBroauhYfL1pRuUeS0ONBDNgjilRxssjmumDh/Pgc5qt2Re8yaUh3UaSIcYlyt6j
         JcWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dO6rmJ4A;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=xlIFGs/VOGwSTrq4QLr9TKFujE7TGhCUSlOzhmdVfgc=;
        b=bGaSve23ctRD5rbKJt3mhBx+T7zowkecyUa6I3v7Vgz5/7VeVm73/RUX+phXOy8RA1
         Y6HIj4DAIFiWuRh1tV1+zGhIbIbkMnvBxqNKEUl240Vg4jcRKqCKnDTIc+l3Mk5tguUR
         9VEyJhxazYVp7TQokIzTajdiAjIMIZYz5NilKJgKRRLI+yq2CuyBSpTmFK8RFUQfjf53
         tV64EaqXcl3hbjbVbqj65rKEWYd8/Elg5naBZnynd7P6bEYXLg8akoS8SqIZbiFWFcLi
         +Cn9/EaD57f8DgSczWKW394YpwoSSDTYXFp5gWLnI/Y2C8dTJcVZSmb91laWmqM46gXR
         o01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xlIFGs/VOGwSTrq4QLr9TKFujE7TGhCUSlOzhmdVfgc=;
        b=QpMclSU3rv79Eg6iz2UbzA2js5CJp/Q1a6R5g8/DwYrtjR3SOWcUuVZFm4bk3ubrtS
         X5ElPUvO7ywDjLx5jIwlHW8dwpDYH0BEe3aEacBqffHNyc7V5wHT5AqKzKcOUPJnrztW
         eF70cD1OmdK5uVj0OCqKFlKRVXaaUgIRjm7h/pSUjyGnvx+fgvrpoarnJK4pMaVrsCex
         ADx3tsCLwiJm4ou9DtYqL+l5sESbkcMwLDu82dYTTCqQynojwkQVuMaoExMNL5KAsWd8
         LB3OW0n0aWN8S3TStpip2mqwB7mweG43Lrrrfg1mRnYtVxVOSPhUELR6G7XL6TwXKFUw
         PPzA==
X-Gm-Message-State: APjAAAXe5mo8Y0Yegxb06Xo/2SPxhJfY6cudg+rFqaNOW7qrIhWf+NNH
	DGbM9rhIEICXCQOd/zp9I84=
X-Google-Smtp-Source: APXvYqzUlsrTiVof7paFS+IYsGJrW7ZO1XbP1btxAQLg/PUcbSS+cHwUwQcyqofqtWDsg3wdU1HrVQ==
X-Received: by 2002:a17:90a:246f:: with SMTP id h102mr13857736pje.126.1561736145258;
        Fri, 28 Jun 2019 08:35:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:9204:: with SMTP id m4ls1054333pjo.0.canary-gmail;
 Fri, 28 Jun 2019 08:35:44 -0700 (PDT)
X-Received: by 2002:a17:902:6b86:: with SMTP id p6mr12724954plk.14.1561736144650;
        Fri, 28 Jun 2019 08:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561736144; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1flbnoqEwiNO6jMy10D6y2Hk03Sa7M7qr2mAD3sQVb/tkhcYL/Kt6s6cpA7isXo+h
         E3ESho0c9crDnpLqLoYPKoaGwYFlIuVDhnXZI9OYnZgytzggdVwMPswoLJQiuMpFkTsZ
         A9ek7f0/4yxesgMGkM4alIHYsqNAuIuAhpUf9iqGbNzLUQIIavMFXjlFLPfMJa+PUBRY
         FG4F3928H1+uLwNaNu2ZK1RNBHFUl98ihPdDH32GgJVlPmM5pUchZGaJ3yEKYevLqL4x
         H6mxnLu+qZgmtaCrF8cf0jUH1cE7q/O3ngBsIene9F/H7CuO+30EPTMX6B9m8oZ6UgvS
         lAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4c94j4V2YuN+VtVIwN1QzOgt3q7IihGKsao9vs4ENkE=;
        b=vOQcX5oYm3c1cIa0eBkZnf7p6SAMRRz7IHszV0D1d+ahU61lnWjuH/zinuDAESNM5T
         W5VghQ4lutiylzB0iAcYRRxaR7MHDX3Nuejch9t05AlGzpKxB0hvWNphbFR6jHnts4DG
         jyZGeLms12GkchE2n43PM3iSOvJJ+Js2mtZLpjzu0m2xoXKs7UeiV7n2x4zVok5wF6TW
         I72G5Hqqu5z5vRVnHoltsycj9G4iIlWJWMkpyweR2yVJ7YUJ+lnQifY+HVaC5IBHAQGG
         F9HmZIKFe4P/A47cMwdWe/AG8y6JUHEWU+ZQvQAKdYcF2oKUG+FRlrP6TQ6+6mbcrsvq
         08ZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dO6rmJ4A;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id e2si85828pjv.1.2019.06.28.08.35.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 08:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SFZhPC004621
	for <jailhouse-dev@googlegroups.com>; Fri, 28 Jun 2019 10:35:43 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SFZheM096808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Fri, 28 Jun 2019 10:35:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 28
 Jun 2019 10:35:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 28 Jun 2019 10:35:43 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SFZfdw050807;
	Fri, 28 Jun 2019 10:35:42 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <nsekhar@ti.com>, Pratyush Yadav <p-yadav1@ti.com>
Subject: [PATCH] core: Fix aligned_start calculation in page_alloc_internal()
Date: Fri, 28 Jun 2019 21:06:01 +0530
Message-ID: <20190628153601.20850-1-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=dO6rmJ4A;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

Right now, page_alloc_aligned() can fail to give aligned pages when more
than one page is being allocated. This is because the aligned_start
calculation is flawed.

Taking an example from a test case, let's say 8 pages need to be
allocated. This means an alignment of 15 bits. The mask here is 0x7. If
the page pool's base address is 0xffffc021f000, this gives us
aligned_start = 0x7. This start is clearly not aligned at a 15 bits
boundary (3 bits after shifting by PAGE_SHIFT). It is exactly the
opposite. It will never be aligned except when the page pool start also
happens to be aligned at that boundary.

In the above example, the address of the pointer returned was
0xffffc026e000 which is clearly not 15-bit aligned.

This change fixes this problem. First, zero out the mask bits. This
makes the address less than the pool start, so add mask + 1 to it. Since
zeroing out the bottom mask bits means the maximum reduction in the
address can be mask (when all those bits are 1), adding mask + 1 means
the resultant address is always greater than page pool start. In fact,
it is the first aligned address after the pool start.

This calculation fails when pool_start is already aligned. It gives
an aligned address, but it is the first aligned address after
pool_start, not pool_start itself. So don't do anything in that case.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
 hypervisor/paging.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 16687a89..5f5d0066 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -105,13 +105,21 @@ static unsigned long find_next_free_page(struct page_pool *pool,
 static void *page_alloc_internal(struct page_pool *pool, unsigned int num,
 				 unsigned long align_mask)
 {
-	/* The pool itself might not be aligned as required. */
-	unsigned long aligned_start =
-		((unsigned long)pool->base_address >> PAGE_SHIFT) & align_mask;
-	unsigned long next = aligned_start;
-	unsigned long start, last;
+	unsigned long aligned_start, pool_start, next, start, last;
 	unsigned int allocated;
 
+	pool_start = (unsigned long)pool->base_address >> PAGE_SHIFT;
+
+	/* The pool itself might not be aligned as required. */
+	if (pool_start & align_mask)
+		aligned_start = (pool_start & (~align_mask)) + align_mask + 1;
+	else
+		aligned_start = pool_start;
+
+	/* We need an offset from page pool start. */
+	aligned_start -= pool_start;
+	next = aligned_start;
+
 restart:
 	/* Forward the search start to the next aligned page. */
 	if ((next - aligned_start) & align_mask)
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190628153601.20850-1-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
