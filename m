Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBTPM43UAKGQEKZBWXZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id E691F5B5BC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 09:29:19 +0200 (CEST)
Received: by mail-pf1-x440.google.com with SMTP id z1sf8305116pfb.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 00:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561966158; cv=pass;
        d=google.com; s=arc-20160816;
        b=NkmKB8JpZzEhzDd24TwF37Fpb4bq6loDJ9af1tOhc10wBmSaUHSHksODKpx0iWMXe/
         qD4JotZU7RnpUUc4TLJRZQ2UL5UXMQyhK9hqbxJjneTYmJn7k1uPQkOQkjZmFWdmoEaZ
         CN7L5D+1GOyxjVSwReStzApL4MUWMUeoi3ejXj4KJ0n23yI5Vg4lw/Tk1krIACEtkU9X
         SUuxt3qnURreFX/rVNrNe/ERIpphu8xqH1vnzxQHjWo/psQ0UBSAg1tiThT4ZhLt1X9D
         Xy2bRzEnXr3qjDIyXgVsw+vqiSb2mle5DE+9oXB7j1KS3FkMvL03nOEc8esAws01ILld
         9rXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=3YzIA0Ms4/x1F+j7IRDK92fH2kxaVWa8V9u8W5fTAm0=;
        b=CeBC61GrVsO9nDd6zpl7tWEkW9bvEKOQv8kdXzx7dAtFgvr1Bc8Xhcj+SwYYKgtvY9
         lMOwuCc4QWylmiaXitZsb0gMIUVy33t8H2Q2o3LWF+F4+Udmoi8Rn6mXp6ZpHEAfp4eI
         h5mqQudSiR9Ixuo83Rqy3Yll2QE2VJtzKFq8bYg2dVxQhGBGcGhgb2jsHi6kPqP0fi8y
         fxdC7+dq6A6vir22/sdpENp2h5YES0cYEBwGwDz03qsZQCpPXcuwjwchUxLRh6uZKBQN
         gCoHcnICnWpNtdl557yt08pFn+t+iXtlZTQXDhOc89ZIoRwiviNUjpf2GyJ5ZMze2mL0
         GgLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d0Fl0LcX;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=3YzIA0Ms4/x1F+j7IRDK92fH2kxaVWa8V9u8W5fTAm0=;
        b=JhYi+2QOxlpqxJWyEunSdo6EhxgJFIrYMWtNcBH7AWchIbdTLx7m/yG//RQAyIZ1/W
         Jvpdefl+EVje89PA1+ClUHhRRn32jbdOPcpNTJcOTsEmN2wK0b13DBx3V2xqTU039R0K
         SYElFqI5Ho7lSWllvwfYz54n8n4QRMzi9t2vJW0C3wX9zZAo+O7SsTYQgNuhaekI+g8Q
         +SCUjE2Zl1jwHzlm8BZ2AvNfGWvCl6G2sNnaDwK9EYy5VeBr3POTRmdslVb3IVy2/In1
         vPcGDQEI3iURU81F88f9gtt+qVbI0KctvkubwLsfqXOEjNwGcqrf4CFMpkehUmFmuNgS
         ee7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3YzIA0Ms4/x1F+j7IRDK92fH2kxaVWa8V9u8W5fTAm0=;
        b=ef+/R2ODi2Vctl47gq9gh6HHx9GYIukMVbVVe9MJ/7OX2qZgv6nveR8JXC0Lx+ix1E
         4XOHH6Q8gXZbROAmqezZPi27tzRFWTChlDxYeSy12wPoWkpzFNX8MeazK2wGkDz759x9
         T4FSUs7ApA5SyoPGt35oLYA6L7yBoVYPKLVIrnmVAyAUzZs21egFrZqYAtrIzsAZHEf6
         N/0gvANxfeB+wzZJimZkKLFHyJB9FD6HPX1UkplhYcJUXzasnHl6LQqzY2nRLUFtVTph
         kHfncQussmH3UzVqo6BWUXGWXin5bEOWb2/2J0LHFXlWSkVs59iGP9BLhWn/hnyRCtl4
         gkzg==
X-Gm-Message-State: APjAAAVp51uBij09vtOsoECiluq6vcedpLjiLW6ha0qDUZAv0bz7P98u
	sGctkRmmwe4eozya+sAw2qM=
X-Google-Smtp-Source: APXvYqz9rDRw5JkdHw3SyZhHl5EGgSACWHuul8Kb4aPMakTD6W6Mtev0143s7VQAbhaV7mThHpAzLg==
X-Received: by 2002:a17:902:be10:: with SMTP id r16mr26800417pls.294.1561966158120;
        Mon, 01 Jul 2019 00:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:32d:: with SMTP id 42ls2995627pld.11.gmail; Mon, 01
 Jul 2019 00:29:17 -0700 (PDT)
X-Received: by 2002:a17:90a:3585:: with SMTP id r5mr30672614pjb.15.1561966157546;
        Mon, 01 Jul 2019 00:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561966157; cv=none;
        d=google.com; s=arc-20160816;
        b=MBHV+pVlY1ikyj0UD8tSwHC5jO9ueIkCaSD58yxBKTjkds0znnTC9v8MNN1mmL9UfO
         wVcl3ktAnB/tIXR8nS4VbcAPgg2zYOu5RTrntRDRytxh/WAfDlM1g/bstvQcvFpPzfat
         kLFtoR7mcCpO854j9QX6yQYJphrlgvpgHRI4+dQ9WM/J1G8JI3pngY6Fb+02tUKel+rc
         bunmmXvwGlabCemK+WW+dtAbZw7nNgu50r+8V0ghgAFFYRFYV0UiBCGme8i3X4fUmxnG
         MPTOruHpNtLcFUwD86ACSOjY77mIFgsznxf7Xt/v126jCcW3aLmB6/wJ+F3+qIkJeZgS
         9t2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6HSy660IkXQpaWFurOLf625dOXrX79P5GMsSDOIn1iw=;
        b=Cyun0M/ni5qhF4t94yfCbpPuiR/jwn980l1AGglMIUMktBmDu/X1LBcMxL+yTgFArA
         P+nP8wJelEWp2tqVRS7b2DdxM3Y291fwGoHXnXTEVxgpOU2hc0tWbysJzB8nzIT9Bo3i
         wve0O6KLMycJwF5ptF5qosRplZPiCYg68YLZMuMlO+uN+DquYM5qGj7/cXtElfE/56Me
         ozRNZJP+s7jkt/kKtjfM3gbRPY4CGuY6nbg6knLLIcFCNAtRIruEHBdJegwgDyshBgpK
         9G08wLXM/lIBMDXdjNJ7oODu3qWxxJTGA8zIdIfuUipRTkCG21/JjXyRxg6ZohwRz78y
         Ol+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d0Fl0LcX;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id l6si352254pgk.1.2019.07.01.00.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 00:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x617TGVw019003;
	Mon, 1 Jul 2019 02:29:16 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x617TGj5034601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2019 02:29:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 02:29:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 02:29:16 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x617TDZV125027;
	Mon, 1 Jul 2019 02:29:14 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Pratyush Yadav <p-yadav1@ti.com>
Subject: [PATCH v2] core: Fix aligned_start calculation in page_alloc_internal()
Date: Mon, 1 Jul 2019 12:59:33 +0530
Message-ID: <20190701072933.10751-1-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=d0Fl0LcX;       spf=pass
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

This change fixes this problem. Add align_mask to pool_start, and then
zero out the bottom mask bits. Adding align_mask ensures that
aligned_start is always greater than pool_start.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
v2:
As suggested by Jan, simplify aligned_start calculation.

 hypervisor/paging.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 16687a89..4a24c1f6 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -105,13 +105,15 @@ static unsigned long find_next_free_page(struct page_pool *pool,
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
+	aligned_start = ((pool_start + align_mask) & ~align_mask) - pool_start;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190701072933.10751-1-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
