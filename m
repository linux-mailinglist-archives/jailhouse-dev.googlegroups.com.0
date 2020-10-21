Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGEXYH6AKGQEK3NREJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADCB294F23
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id b8sf1774242ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292058; cv=pass;
        d=google.com; s=arc-20160816;
        b=q5RuRK1xAMOoR0PzGqtoOPdlyBCVLtntx6H9TxLo7WiEefzy1/2ptq55+LkyOvm5Lf
         QI0gpkLUiDUmetp7ZtrvCXhIfpAFjxS4WQAvFnW8CdnbZELlXDPA70xgeeY22BVhVnu5
         XAr80Ypy+reqkwrlVR+E1y7mcqdt0ETw13Rhz+1vzP3lczFvlfEOmefgZN7Q/ulHqapK
         Ncd/F7vtTVnA6Zp1ZjBaKXe5xVNGlUZw9ziZ+/gFjepk/Uj69YX1mMkZK4/mrbnqLdzX
         GWk6TFq6vSqmOb8RkUD8720PrVfy5VfdUSK920N+f3exGLIr8QX7GmCTQyzyu4Vjg2BM
         ZjPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=cSHKSQ0bLS9blSFbS7NIH0Cyt+0ecK4w9J8JtQwJlqA=;
        b=Nzuq5F7glibHz3BQ9gfz9HLGQl/XRk1pONglZDuXWbDI7QUCO7ZbjkAmnERVqZk9Zn
         OafxnPilsNZBFfj/SU+543PDSAVu5INZET/5nAG9uL8xLMdHntEBpFujJ4mrCuh6bW0B
         /JbZNo+dNF+2I9D1C1ocqncyr94THP0Z27wcYxDBYHEb15FdBdkMOzFd9mwocD5Yv5rb
         B05YSXTHZwClDMYzkl1rzwjrh5uMRpXVCWLo4+zQatZAL5Irted56PD1VkJZN4I0qBAS
         rqUpWdS+YCv1RXAoZ1qwX9BWU0vZxhMgpH/H1KsBR8oW66x0ZawHfv5PtO7fs8gUcho4
         f3lA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JHOPbfga;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cSHKSQ0bLS9blSFbS7NIH0Cyt+0ecK4w9J8JtQwJlqA=;
        b=YgYZs+Uj+wAIwbd1zLgKg+R+4VacyW7Q+QL/UKddf9KW+PxeR5hSJAsNryXq2orYm0
         jNa3FyJhCCNu2nC+Re44QAX03Dcy1xxgSjc8RjYakJuJ8jOkovLZToCcUoZ46F73iCQI
         Q//eSCQ0t2WcUk9ohfosFfAqeCvHv9MUWhSLFSkbseegUGw1NLH547+sVNK0U+DDziPx
         HDp4kt0iPDWumhDdU2hqZDnfwGyETAa8EzpLXg67jmL9S+AtWM/hnI/bYeBh6/QpK0w/
         FmlasClo35iDYr7hXYwnIrihHE9lNwZmP3p/cYUBTWArIiME8UnsVqwX5yGDWNxEFHAK
         HJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cSHKSQ0bLS9blSFbS7NIH0Cyt+0ecK4w9J8JtQwJlqA=;
        b=l3LcGm2YBsYRnJuauAYx3VnS0Cjnguu5FytNjKhTGVIEmTb6aGERF0tEywFhrfUS0x
         LesmT1Nj7fnR4NPI/7gXZZ8nPVssTsobp5+9fjhbsEtmkhscKCTqXdnBEkEs+zShaKvS
         gWAhSMUm/6+cLW45AhcxayapPtb/xEqLSisfdHjfmzKpwmZC7M34C749e7nwZ+BwLaHv
         QssKpfSlle1hw+NuA1+op/gQvsR8w0hsoog9u4g1gZshmVXK3gvIN//4B90CaW2XsyDG
         av+WY+9Dq9VQLx0LRDEgzc/hZFuwNR9s4mgMfFRKEKikQd3O6WOs1kvuebPg7+0cgs5G
         GnzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533aFoTuRv1gIUE6Y8628yrPY25aSgQfBDvrZ5IvTpGwTrdtHRMz
	dVwV8Bb+bmvs7+GjuLwb24E=
X-Google-Smtp-Source: ABdhPJzPt6PjO+15ZGjvsql17Y3SlUU1Fdr3PH+7jQRsaLCiPmh4GE0RU4/QvVsgCMwkfNjNI2v/OQ==
X-Received: by 2002:a2e:8ecc:: with SMTP id e12mr1689114ljl.98.1603292057237;
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls122765lfr.2.gmail; Wed, 21 Oct
 2020 07:54:14 -0700 (PDT)
X-Received: by 2002:a19:be0c:: with SMTP id o12mr1522473lff.313.1603292054636;
        Wed, 21 Oct 2020 07:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292054; cv=none;
        d=google.com; s=arc-20160816;
        b=aaXupUN2efr/CK8uzpaocip2jt1GjVD8mui12nChYXNRAlsRpwOoNveDj47owowtGY
         3IiskQmlPWk1+x6zceRqEdYJXR3CQ7BmsXm2WRsA4j9wM6eZBuzEH067Zma6ik9skdOZ
         LixHECkwHMcRc3A6DcnDaT0UqUTp5gCmZLRHqqSziKJ7Bpl5lMs/f1/9nVsOQY1/pYwf
         xRAvV6Tx56PqVztHnNNv65q70twXRd8s5T9G1o4vhBv7c6RwyA24CTSYgFx0xQ55yGdP
         VxRXJHoJZzxrUkXTFfQqUeFO80dAf645IDdFkOXnVWhE7+gFL6O8jfM1+8qPJK+f1FPH
         M78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=+m3Cwuah+xpj2UnVrHDq2GpGrsKEhitdBJ9PxjmnvBs=;
        b=s+a9LL+vO8/jeC+dBaO1d/jMt5z2KK51w6MXChZNm/RMzQH+aBGUQ/EEGTaBzGlER8
         qFe39BlpmJceCYul6Ems1dBgWkyiOn5YXlqrKU4A0/Q/wDXaba+DVJOCGentP8Xw4Yat
         iRUoxXx5kO8JbrReQCKqXHI1FKR3K8IV7ctl1yu2RdFYXHYdx86q/8RXoDyPEnUI7rs1
         RWBpV4XcLMsSer+LMCEfmLXAUcjZnuF5gO2UVkqBOKhAks8j+i35mzOTZoegoBDg1FeN
         7CSDr69cCFOPZU8wWII13uU4doQDPjI982HNdEtp9F0UUqbkoTbs/IEkU6XLjNbggi6a
         SC0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JHOPbfga;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id 11si64242lfl.4.2020.10.21.07.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRT74h9zyRN
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:13 +0200 (CEST)
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
	with LMTP id LIMy4bQPWz6w for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:13 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRT4GZVzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:13 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 01/26] hypervisor: add extra warning flags
Date: Wed, 21 Oct 2020 16:53:39 +0200
Message-Id: <20201021145404.100463-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=JHOPbfga;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 5322b5aa..41bf99f3 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -31,6 +31,10 @@ KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
 		 -D__LINUX_COMPILER_TYPES_H
+# Nice to have: -Wcast-qual -Wpointer-arith
+KBUILD_CFLAGS += -Wextra -Wundef \
+		 -Wnested-externs -Wshadow -Wredundant-decls \
+		 -Wdeprecated
 
 include $(src)/arch/$(SRCARCH)/Makefile
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-2-andrea.bastoni%40tum.de.
