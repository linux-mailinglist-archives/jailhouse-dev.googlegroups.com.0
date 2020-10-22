Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVEQY76AKGQEO5DAL7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E3296441
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:45 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id i3sf1019899lja.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389525; cv=pass;
        d=google.com; s=arc-20160816;
        b=ouzVMjGLqoOPYCAyK2rEDQSqaRsIZctjUB0s36MR4/XOdX9m1MZ6qIuN9vga0TiZwA
         vQT8mDscProa9uXmi6i2vdIa0Qf1lwAclclkEqfDLBr581PntkwZbWXyiakFxTHQKyf1
         ETeVkvGK6GNVIzlVbP4192h5gcZt7gBYGptezoYK6x78wwsmZi4hwiyXfD318ot7sxMF
         qAquA+51pwryJZ/D/UPpfQX1UtOX+H+pMg2dMlShqmBf1wxddN+QeU1zrQQXG9B3FkU7
         TT6IYUeGxVGsIbZ4LpInQblmQgwStTpLQY5RbkwUwbOHq6IwLSPGRkxhuEs3ZWGuyB4M
         gSRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ASp/6rhTmiYAFvWwilFuH56PWQvj4YZFCTcUk0Hx8/Q=;
        b=qMdSpaaHOgchpRgMByAGY057JoHotuL24ELl1BSVMRaHAjLmjg/j4he4vcDaHiC7QI
         Myc9bfODWBlTGeyBx7gMKOAXab8SNbi4tb2mYRj7YbNNBSTICOuu9thgcd400ZZ5sZvP
         TR+gmTc42CmG8nIjWtY+B/H0RVXy1zpXi35+/WpcXmv9Y3x65SD+nnF1sBjbOUIRsrTk
         ixDCHo10SKqUoZK2sP1K4iATWbkl0Mc1SVWnCMWnRwr9X5X9LPJ8dSd+mDWaq+DScKlG
         ztnkugq1Z0rUsR6xMs2+9VHv6ZjoaQYVTwl06/6b0wE2jI5obfm0/E9L2Ssg5YkEucIU
         txjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Gzo8OzS+;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ASp/6rhTmiYAFvWwilFuH56PWQvj4YZFCTcUk0Hx8/Q=;
        b=ZeGkw3/NkST+/G1o/R0OG77nP8NWecrWAdI0s1xpixjvnz4rsMSU/fwLc+pi4PVMwV
         5EwQhX4Afb4dknSBVETK/SI/Zf9NTqOUy/v1RO3hA7mfFkhRGC24aY4TZkHFikzf5KWx
         KHXnVS3Z/472GHZ9SLvAKBrj/1t4Qz+ZT0KsRwA7aKhv1HXPT4UGLUz6balqs8QJY2lc
         vAvklq4UsH1gtLzlpNkp4hUDYFR3lL1bGXlEUURmFL2OqgaUEMqJHrFPIrpdT6H0fGCu
         MYu3Yd9lX4iIfeuXwEz/k4zJwGb1DAawNAJv+VKrZNcrcFJPW3xV2hY17FXHk8qGmyCt
         ir/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ASp/6rhTmiYAFvWwilFuH56PWQvj4YZFCTcUk0Hx8/Q=;
        b=KMQlUO5/PBechaCttRsmzBdgeJeiGpRYk6i9BKajEeiCmP+4TUdaudGiE+K5MYoTf9
         Cgdf4xTDOrMaDvPckarB/t/n1QPX8rm3Bu2L0fGi/g9Xolycg3J0K7eQfZTo/MGiM0At
         gMolCCVRM23pGSwbEGg3CcZjT7v/d6vWZa+FUGVn4xxWiRPUGDFLivBzgfne2cnSCDfR
         QJsKgCkqRCjUxATXzg41Q1ohOBCmQltbEqbeyq3yFTMEcmPYODOLmCFB0+9ntDCIehYs
         ykTJe41jcHbdYd3RpZ92R4glTDnBfvQl8/a2NvtsKqPYdpBdsZ+egE5ysWwet5ec0gGY
         CAfg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Di/kRbL/hMpXqTYwe6bHLeAPMFGD1Dps9xC2+LgPTZpHBsxCl
	WElYba6nVi+MCi6ROFD1XSY=
X-Google-Smtp-Source: ABdhPJwwtk6299Rkmn3cTssG1xDfACL0WkMzTMU2q+7ipahqEqqueykgJyLCAF4smS8mB5AN/E2Gyg==
X-Received: by 2002:ac2:52b2:: with SMTP id r18mr1167511lfm.498.1603389525156;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:888a:: with SMTP id k10ls494479lji.10.gmail; Thu, 22 Oct
 2020 10:58:44 -0700 (PDT)
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr1535342ljk.238.1603389524057;
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389524; cv=none;
        d=google.com; s=arc-20160816;
        b=ba5BK8onpJS5oDLur+4tQPXPzu46OupW4RrRhDmwqt6RngR2kg6LsiZmQdTmTQIs2D
         ko0sNhyjLIJMGhCbSpTOYNZp9ztK+g76CRPIQqrfj6/A32Jjtyd0z761EpAOGJWjYH6J
         /y3W32EgoHkfdZp5c4hFJPnQEV5lR1feq6YQsnId+k5EPVXZB5cveIGjsvjA7t+B60KB
         fVvK8+qYnXmmRd6iS35NhdGD1UxeSOgtEEFeztuuu3ya3NZfOckpT/nhV6+REg4ApXYh
         BiE45c/HOiHWt0QLnJZLqLuu5g6lQb0u03SjVnAA3JoHXcWE8fhxi29aNmL/7G27mL5C
         HtYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=QQsK+QtbSi9TXxEmeYkLq0uBbtCOmplg1asivICkcYA=;
        b=j6wUc9OOPjqZik6X+euzKJhzJelWJ4LdviEBFtFdRfCfPSN/r1Ji9eccjTz3L2F2hL
         F0irTMCJDZvgY+OfSfrzI91ybhTuqrcdLT1gpPPM3oE+EDZc7Qta9TvJFT38vYu4Jm1v
         hkgfYwnvYvkE6+Emk4v05LXdgXWv/6V3vurEx91i07DoYGkb+8KdsERK1A52i7gCNFJ3
         GIX7y0cGVku92YVC3wbrxK2zNZJe7Rx772w7L/YSxH2nw1kPNb2h3SWWJ8sSEfxa2ise
         ToN0mMCRa5S4rK3FHHKxGuzMbCg5Z5rBd6IC+3RljO9yOUFE0Dp2mPu5kvJRwhhBLhhg
         9Uhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Gzo8OzS+;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id w28si89298lfq.3.2020.10.22.10.58.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTv48c3zyXc
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id YHxCSqDl1-Ph for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTv1KCGzyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 21/33] arm64: ti-pvu: fix Wsign-compare by casting size to u64.
Date: Thu, 22 Oct 2020 19:58:13 +0200
Message-Id: <20201022175826.199614-22-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Gzo8OzS+;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

No information lost in the cast, size is > 0 there and fits u64.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/ti-pvu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index 3b9a29ec..50104212 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -286,7 +286,7 @@ static int pvu_entrylist_create(u64 ipa, u64 pa, u64 map_size, u64 flags,
 
 			if (is_aligned(vaddr, page_size) &&
 			    is_aligned(paddr, page_size) &&
-			    size >= page_size) {
+			    (u64)size >= page_size) {
 
 				entlist[count].virt_addr = vaddr;
 				entlist[count].phys_addr = paddr;
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-22-andrea.bastoni%40tum.de.
