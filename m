Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBTUQY76AKGQE4WC6VEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id CC210296436
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 13sf882695wmf.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389518; cv=pass;
        d=google.com; s=arc-20160816;
        b=GlUuXUzzc78qTlfAwz3PnE/SiBQY3YtZ+sF5K9LIAymE0mDseQUw6A0+3lTV8CFXv7
         rGETxZeJE7vpnCJh1Mf1lCrwWRJ+2wPySgTmPeSggFUiF4jds73KLVDD+VqL9FcxE+yU
         JzUJRGhEMVaDVrBYdZTMcpsMmZ1BOF36lETn2duUP+208VUbvq4reG0dbxaeZwm85mSv
         21Dp5LmZdrGH14eiAYP3FUGt/HfDC1W64bfhslAys+RYcrTrPCV7iA+6JqT/gaEIm3re
         TOkovi9xppdvRSA6+BsAMkj0dG5quFDKynLTmXoU0yKz2ICBxUd1KKAKlXMNGc+sINxE
         Do2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=bccfOQA6avGPmkJtq/jkASqW57Lm6xBfPEqtHoDaUNU=;
        b=SXBuCvQeko7bKf2c3hF/4tF7p7e6ymHk4hiCRqktMaTdVHSa419WxWAM5Dt8ZtPitW
         z5w9KEdwLi60c42ugJQOHQ69E3KaNeXAX/XY05zCwaKU2HR2Yt8tcvko0FVSnL1/03xL
         klorSyXWVwods0hr2dSx1FCOTqRvi8acUYNT3Y5FQXnrPCEE2StvQFwX8ZY5MCndzqmU
         EdTT3VkClN01d6auv6HwJI+PpJQP2ETeKXtlgncJ1zqSp9cRShoNerVoX/u5Mlbi9B8G
         j9qq8S2ODvm92KoOKbtkhgyIDm4oFY/rhk5YubfuX1JEA08XsJOChtZxw7kHpKZEGtfZ
         yXiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=c1m0d5Og;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bccfOQA6avGPmkJtq/jkASqW57Lm6xBfPEqtHoDaUNU=;
        b=Ql5BVIH9+14tU+S8S52AyN0x2ttOM0fZkYLmghY/6YOlIjds3eof9+ryPzySKlMaDf
         F0mWXU7c6z3i3+XYNUwbtX+sokkbNx1eoig7tMIFKs/YdoSFbMH8joeFB+9p4hzAJvTW
         kE1q2J793H2/PbEMt6Orj1xJBjrdoOLrBcO2h9UGcRovJfyGPWrxOKvJF8qqZLUqyZiz
         55ax3Ui3fLPs2I9Hfw1o2Og9DquqSFNH1L+bByrzL7knnguk8A2Xr9GWPtS4+jh6+f6H
         LSKHMETs73NxAW6LUutx45xDYX8yEykRAhGaY8ItXyCRfhtPQXjvHSrfkb+5zecSRsQ9
         sjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bccfOQA6avGPmkJtq/jkASqW57Lm6xBfPEqtHoDaUNU=;
        b=juivEgH4BDvsu8NdGXBoYQEMpJM4ZYe9PA+ZXfnLITcx0Dkh0GPCGlNBCVSG9AHCSY
         pMOqVIxZjWqNFfg4U2tMoYNluYKemtEQeoePewIOCde6etBgJVIoG+1+tgfnspxjaAru
         fmEZW6BT+XS71yLtWYI7v1DCAYSvQIXEcBdXxxVilNTgacGTzu+y0SeWLBQY2nm+2iYa
         VzH7lAk2xUS1WkbgLYjMCZuGmqKKYsjzrQRQBtY7IdFzLUnhhNEPux37M1u+ga1fBMa7
         EpNuBsZoEQMKHj77zwJ/f9Y1gttFwhcX2EUrPcLppxJH1PnlESGmwDSHaiFtHvqOW87O
         kwlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hMhQIQkejukSEljx4KFa0np1ftLCHl+L1TF7Glfbo+w2hPVGL
	tXKyyAPcJC+5k5IUa7H7B5A=
X-Google-Smtp-Source: ABdhPJwM9mng860Ng11CsjCFcfQbdvbI96mg45WIe567ZnKT0ofJwrY1LIw/kxRkQbLKo3zg4MrbyA==
X-Received: by 2002:adf:9069:: with SMTP id h96mr4212458wrh.358.1603389518569;
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls475574wrb.3.gmail; Thu, 22 Oct
 2020 10:58:37 -0700 (PDT)
X-Received: by 2002:adf:f986:: with SMTP id f6mr4268623wrr.38.1603389517731;
        Thu, 22 Oct 2020 10:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389517; cv=none;
        d=google.com; s=arc-20160816;
        b=qj6b2NnZlyXOk80b4MjEneQXVpbt7gldaKRqO4b6vU1lNDwB+YvcSFTlHAZwNqDYI5
         8QQSJ7IqUaA50FgKVtOMYxuwy8fGDiIB6mDQL8D7ryEav9/j9MX9bsqCZwW+y6aTiPpw
         DZ09n0C7OTNT3B2B/qfjuzFnpmOQgFmG36qyulGF9ba4ZpfGoYdBAkRo4oyQI745dNnA
         08uGUifRb0JUsxz7EQ5uSDOFFiCYdo+amR5SGYSVYsjIqlzJ/Y4M2XEUgjq62og9ldNA
         c2pab6q1cmmmnU8P5RYupZBUDh3vpqq++iO+PXj6LHWYLBvf77w2CQR1++LT02UilwvX
         RScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=xvaJjXmQzNUdrzJfb+P+209mTNU2qbBosWuMMm25LPM=;
        b=E4P5UHdORYWqGAWw/ZDdZzQKhK1sRr9JULjttruOIG/uaKjBh2d3JyARFdAuTZIG/I
         gq+bTy5d06UZnpZUXxF75eQ9fGKoaXCWv6XxaIY3QtcN8bHTPbRTc71t/UgaaoVF7IDQ
         ZmcCvB3HGOd+7NKG0iAEcxvQqEWsqEvs4j1WAHbs5/TzNFRRIg+7ZK/CqcwiaNF7f/EU
         sH8COKaz7aVYnmNLY4+5jWKYwkbBmF2seQxGaCWvHwFagA81SQNZfaUAiNZJ4pOGWJW4
         hhUw+NdNWrP9soMVg1Pkq00KY79rb3nHSwZJ/DLwiqtKwD3FCcu4YBlnGxKRod4WEDxj
         GMgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=c1m0d5Og;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id 16si99980wmi.3.2020.10.22.10.58.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTn3wr2zyZs
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
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
	with LMTP id blrTHsQ_tHH7 for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTn0rT1zyZp
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 10/33] hypervisor: Makefile: temporarily remove Werror and hook-in Wextra
Date: Thu, 22 Oct 2020 19:58:02 +0200
Message-Id: <20201022175826.199614-11-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=c1m0d5Og;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Wextra covers multiple warnings. Temporarily remove Werror instead of
disabling each of them. Werror will be reactivated together with the
removal of the others "-Wno-error" switches.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index eeeca2eb..524653aa 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -26,7 +26,8 @@ LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
 		-I$(src)/../include/arch/$(SRCARCH) \
 		-I$(src)/../include
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
+KBUILD_CFLAGS := -g -Os -Wall -Wextra \
+		 -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -Wnested-externs -Wno-error=nested-externs \
 		 -Wshadow -Wno-error=shadow \
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-11-andrea.bastoni%40tum.de.
