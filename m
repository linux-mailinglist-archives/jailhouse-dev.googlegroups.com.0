Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBT7P7XWAKGQEYT23VUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3f.google.com (mail-yw1-xc3f.google.com [IPv6:2607:f8b0:4864:20::c3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A858D3058
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 20:26:25 +0200 (CEST)
Received: by mail-yw1-xc3f.google.com with SMTP id c189sf5322327ywb.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570731984; cv=pass;
        d=google.com; s=arc-20160816;
        b=GlMMlrgyH3Uw5YtriPl6v+X928/Cs7dzzSCpUrLMBO9+Of602/2goUFs5hfv178uPr
         r05etokjrOyrTQm9hhVp+FAXmyGzB8r7ku/gs/chY0X/riZ+hNR8tF29b5Y+95NHzUZv
         7BQb3MPsNUJ0UHdlz2p2oIbgKvhbD+gJHHHHS/txmTQooLbzIW1DXBfiVn4ebYAcOrvt
         tUQlt4PuyWu+8NmlXZRwtilSDxbHQW6sBZvCiAsL/CwCqRuSZ1ZOTr5CX06qe2tw7tN0
         JSDKG+Ho/P0HgpEQWvMmoItHluZfmFjynb3tGw6X93wUvHngrwvU8YwloqRHl32jwuLb
         4lqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=F0iqn2YFarNqQ/euOeumgkv1fOyC1uUqxG2lyNXkmv4=;
        b=y24AT7a2t5sD3cQIa5lW7P2MEHathZtgAa2kPR/gP3ygGYtWzySV7p2w7vOIbmhiv6
         xelFR1ha2N0VcLPinG2iDJzjnRvh8soLh9pTZdaFnTTR3QxHnSaabx2gtHCsNhqa4A6V
         2g7RlWPFAeG3i9qX84bjBD9RNL20zgkbJbChqr8/ed2ZCsmPxpSUeMQFyXRR8pmNDEZ6
         fjmzixcP+vlzZspSXikghZTB6fz/1kE3ftRL7z3KXHA+p3rIqjySJ/c8DeDM4IorPLi7
         scvdUjlB4eXMd73ZryqxQzWm5BKf67A0Nk3D7qqZ65opBiqHhPum2Km3tc4xQ9HN0NjT
         YBtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sCalmgCc;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F0iqn2YFarNqQ/euOeumgkv1fOyC1uUqxG2lyNXkmv4=;
        b=mK7RQXt4tlAKrLWhVSSCWHDfronpbZXHu72x67iCvXrure1GUt4dh0HP+f1AB+Z+za
         PiCzL9hQYtkgANR8zHho+5OsYBIyO9ufb/LL2QrIp7PY50UjGRxbVrvs1/XALlhVtvFy
         014Blxmkl9Pi6FA/bGt8Bz/LrYogwAC0kUpPRDUqKHCBAKuj4xBeV3wPhBR+KxoRLaQd
         zaQV/n+/rCmq9AkMdvZ5Wrh9cOIUyb9ArUjjuVrYDa69p7ivpgt2rRFFUG13ck03AH5l
         6oEdR7NgiRB8kwCw8KirQNRVn4IXL8kO7SrghJrvr14Np3Fp8CVNXUqA5THvycW4NCox
         8M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F0iqn2YFarNqQ/euOeumgkv1fOyC1uUqxG2lyNXkmv4=;
        b=lXuhzf6HLJekO/rUm9nXEV+3Kbgi6KE3Ru075ZU/fDOBef8EhFUZbdhJCKpiyLQ3TW
         ZI/Uk8WC94orw5P7cwtaAlayxNQcwjN3xB2zbcoPt+J8I9qIp6lkVQhViqM1jKDFtSkK
         U+PcRftxqoNijNUQe9U4Qq7hpJFLL01dz9iO/CJDc/eDkZrssFJ63Hd+RttykNrAGAJF
         gOuw06bdFUI5uHHm2um3h55HBh86hfTmz6KhpO3zicjAN6F+11ra/E9IdgvUJfhyxLHL
         RAym+GIu9lXnVsEwyg9U+KhGd8cb4Ndl5T8/gRs6j+lIl5yIDKuh+3Q65tGl2laTXQ2/
         w0Rw==
X-Gm-Message-State: APjAAAVbeJAWCxV4xw7zmjEzIviwKNtDuTimud6g0NRBa5VVdFMQCl/U
	B8OoIgh8r0E7+FZib2Xmrnc=
X-Google-Smtp-Source: APXvYqyyoCwOqxp7SaYUZSaRnAqVQ9wA64zg6STyiqtGX6pAAosILOG92eCzlPRYHaAOgtcc0kibiQ==
X-Received: by 2002:a25:bcc6:: with SMTP id l6mr7020306ybm.519.1570731983970;
        Thu, 10 Oct 2019 11:26:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:68cd:: with SMTP id d196ls332198ybc.13.gmail; Thu, 10
 Oct 2019 11:26:23 -0700 (PDT)
X-Received: by 2002:a25:6c82:: with SMTP id h124mr9747ybc.243.1570731983571;
        Thu, 10 Oct 2019 11:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570731983; cv=none;
        d=google.com; s=arc-20160816;
        b=lOgpGBEWVF6r4PYeJADaj+os+rK1rjovfElthiZaXNJ+tH035aAEUpzYZ3PzmoFXAF
         BmiAXVz8sZWHnQ7fvtKF9AjxmV+gQnWmkrLb+5RB26z1jecGT4wrH0d2hUqhO8Epjjqk
         1Ky0kwD2yoYZT+9JRtz+1u2w6wRb9d3C7Y6TfN8jOFXJBba0aZSh6qleb40dOxOXC3J0
         Wm3IhWjBfSSY8dax86KYeYMpNF7i4kNs6SswaUBw7FgDeyBo9Q2qT/vaDSPF4B6m7pIm
         ZRBKfAe+cQsvlcBzEo9sFmYyvGqVX6mlicd84b0i0cfWtNB2lTHo6SDOGRDBcirNqf27
         Lvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wNxwuzYP6t/92vPEilT8+81o43NOPanxkVC4BgimQGo=;
        b=v40S2nql+Nt+vAsOnsYjslT/HR+n0Ipiv1dc1Bdwn3XIUXMCrT+LN4RlIkFcFLmLyn
         hGitJPqOgI080rQFLSzsjxwT/t4JRrruxe7RWrUAEo1aCLi+yjH1lqE78NZ0tAqnptim
         C2nJf9bNRXfNUCtMLz+FyeqoKQHwO/f53h+qDAQIb+uwXEQL1T8eZ8NQBBLzCFKTD/jn
         rHmyxW4WZJhxp0b9OBXnGG4+Nq8tAueLi2fnFlmDcCZ1nUn0nbhHEfqMyUgB1OoToEmq
         9RUrF037P8JWO8pkUM0mmGKKGBV4Mw9GPO70o3l7dwb1KXenypImf3uag8JqKOnuWFH6
         TwCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sCalmgCc;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id g203si783633ywc.5.2019.10.10.11.26.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 11:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQNRS053802;
	Thu, 10 Oct 2019 13:26:23 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AIQNIX009098
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Oct 2019 13:26:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 13:26:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 13:26:19 -0500
Received: from uda0794637.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQLl2008251;
	Thu, 10 Oct 2019 13:26:22 -0500
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH 2/4] core: add weak attribute to arch_handle_smc()
Date: Thu, 10 Oct 2019 14:20:48 -0400
Message-ID: <1570731650-5335-3-git-send-email-vitalya@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570731650-5335-1-git-send-email-vitalya@ti.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=sCalmgCc;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

The following commits will introduce TI am57xx support, which has its own
arch_handle_smc() handler. The handle overrides the default one.

Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
---
 hypervisor/arch/arm/include/arch/asm/traps.h | 3 +++
 hypervisor/arch/arm/traps.c                  | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm/include/arch/asm/traps.h b/hypervisor/arch/arm/include/arch/asm/traps.h
index 3e02b82..e167f71 100644
--- a/hypervisor/arch/arm/include/arch/asm/traps.h
+++ b/hypervisor/arch/arm/include/arch/asm/traps.h
@@ -17,3 +17,6 @@ struct trap_context {
 
 void access_cell_reg(struct trap_context *ctx, u8 reg, unsigned long *val,
 		     bool is_read);
+
+enum trap_return arch_handle_smc(struct trap_context *ctx);
+
diff --git a/hypervisor/arch/arm/traps.c b/hypervisor/arch/arm/traps.c
index 10b3fdb..6087fe0 100644
--- a/hypervisor/arch/arm/traps.c
+++ b/hypervisor/arch/arm/traps.c
@@ -245,7 +245,7 @@ static void dump_guest_regs(struct trap_context *ctx)
 	panic_printk("\n");
 }
 
-static enum trap_return arch_handle_smc(struct trap_context *ctx)
+enum trap_return __attribute__((weak)) arch_handle_smc(struct trap_context *ctx)
 {
 	unsigned long *regs = ctx->regs;
 
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1570731650-5335-3-git-send-email-vitalya%40ti.com.
