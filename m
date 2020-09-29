Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVFHZP5QKGQE454GFYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id D920427BD1B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Sep 2020 08:27:32 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id l15sf1395128wmh.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 23:27:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601360852; cv=pass;
        d=google.com; s=arc-20160816;
        b=ruGtr0rLBbDjRDlGnIYhwAdC0uOu+0nDRLpowzjX/wGjvF3ixyqYePdAazQvcKr4N6
         QjxoV1Gy2zDZdFoo+b5AJUNwRIKCMdrjfN9nDM9xUYr7n0ZYhbVaMIOxB5mp/4IHps37
         kjnnSm2vc6/se5lB6E93uZSE2RvJfB/GrLGegp88IJKNklf86zDhM7VVLVSYhYZNDOQ6
         eqOsuhQE9n6mHpL2MBefuDB1dcP31KHZuzCB/1xqnYmUY7LsMMdanrRYF6rML0OUL+Ef
         pkpzkKe62YN7wZHUzR/NyMOBbBgg3/NVRs0e65GH63jclTcC6Qmn5tGBF6FV0n3uDI76
         MN3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=LIMDtLDOQujMdD5pzRjlAxmOrOkSG1ooLLDt+b8iIZE=;
        b=Nw4KLubrpWX5fcjVTEFVMTJYfYlQ9Qw1ujZqPaTcIjbqv0RWWQ2Zu9ghUN8QdwBe+U
         1/S0Yc12RuSqSnysZR/H81qn43ZoyCrwtBRqeK27UClgOHQfrL8RAqAC/BdfqgE69dcS
         JBM0Bij721eNTCkq1qPrstIUMmb5Z/iNfFtKSZ+dpRjv/UKPrSw89M8YBDdPrpIzCxBW
         wMyJvkaNm6WmVUmfuhD8o0bfapNkZ+RjZx+geewycR9FqEmmMKoPcr67WMpCK7+FXX3h
         AMACUuqfiJmRvVGfiOEJqxRYiQCIZeZkHQi5C20WO1VJlIc9QqhTAM6KCpxoXNnQk37h
         JRHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bfyo9D0V;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LIMDtLDOQujMdD5pzRjlAxmOrOkSG1ooLLDt+b8iIZE=;
        b=DZzMkHYcRvIyzEAceFcMuY/3OaVhV9Ol5aGKA3pexsuTRjSl9Kf6mkZEWakLUGXKWq
         oMVtOftqfHymDEfSN/bom17T3wBArja/SzciMBxrLjKM2tuChVRgYYVx71YrH2/ZIveU
         SwO7VLg/7Yo00iesyd6aPacT+8XZTzBfL9QEUycPpKFkrgm92XTueHjSLwSIiqtkMnul
         Xcsw3BVq/vS69uWIhOGQbCZT5yTbFLfDsnemTMBSsPdeRef639OITY6UcI4L7ZOJNV+J
         olGmCWM/WHaMS6NkEgSBuB+x4QBGyfbs6v8b3Gsg44hcyUJmyr0Yxi6qjOn8dXu3t0ne
         /bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LIMDtLDOQujMdD5pzRjlAxmOrOkSG1ooLLDt+b8iIZE=;
        b=kXhTEmarpRGHO3i50YvVNHtsCk7f/dfrO+GtH7U1FLb7JDFE/pc45ERjQElI7JuqkK
         L6Pwn48cu6aU392M2qfOfqo6rQPe1a5xtVA+Rxu6T4ro00QEn7RGgnW5bSkKTX1Omrwv
         7bzgTWSxOjQH8Vcexjnn/NTnbyhktpzM68BOL9RlcMVILeOXaHfvXPclufsu/aHENX+1
         REimML8ks8nhHXs0rOjdjuH/RsiSlsH11z9WHky0AXN8C0w251djJciwwrEw/ET7iGtH
         iYW3gPi2MUuKcAmKwVm4NeA+vOGVQfg53mFmQcrrXFWZJJItxNW7w0OaOzt7h5Fb2zT8
         q6OA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Qvu3BCbcSUwxP0aeEMXGDo7tb73Ctnutq7B8ZXkGkM/jNP1Q8
	+Oe46D2BpWmHWAorOgrBfxA=
X-Google-Smtp-Source: ABdhPJw3pOaznuvVc15hBWPIvlhpQjQ9PBgi69nmUeH6nHtep7Hf4/WKe9NS8whBRCNtTUzjNQeiFA==
X-Received: by 2002:a1c:bb06:: with SMTP id l6mr2813697wmf.175.1601360852490;
        Mon, 28 Sep 2020 23:27:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls324742wrq.0.gmail; Mon, 28 Sep
 2020 23:27:31 -0700 (PDT)
X-Received: by 2002:a5d:634d:: with SMTP id b13mr2338420wrw.324.1601360851512;
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601360851; cv=none;
        d=google.com; s=arc-20160816;
        b=kt75zWC5hXsWh28OrKjqJ/Eow2cOiWaKrHgB/nyjmUfSZHSeVUL1ww4rQXFxEdzQi7
         KFQxJmHzh3r5DkcIvQXE8f5tnsWcJqeQbdCh4uoCW0VRR3qT4d14yiYsdUsnHHMGYnaW
         edNYE8e+16KGTlCfnwJn3NGCSVFx0Dpf6rHUfeSznqxRCu8HPv2VAJsT+4YwOEYlhln0
         WSlzW0WzcH7PwnFdJjVP4qiYTLnPgG5Moo8xzypXIjoE6qn4+gvZ5jyB13fiv6cfsOpW
         s2IVqvu/mnzGjXlCAUxAszoygYwfNwZQneFjymyyr4q2OuuC/pkxB2vewOg7y8/rOC36
         L6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=w6bRmHhtbgKMdy4fXRHbmSnHu5RJVLqHFEE0nj/ErmE=;
        b=XqRSmtAUA6ZYkGR0rOVDSf9jDFMSNj/50h0Rg2DLsLx3Ye0ZMkX7ZkPKKyXRwRKAlH
         uvUJCFqokA9Eew657bJA+HbnVFp3e0ZhcGyw8tUnJ9bfe2YRJ74JkS2u2jwbJMny2wCr
         z0IMkwq1elkUXezwx/BFeJrdNj3eeyxaVvv9y40L5PuBrDc33wzy6kWE0M6FQSCd1U6V
         w0mDSPuZ14tDtbSvkmiH7eBFggPyu57ATclXU9EELIbD3aD9HF83pxKu1hyzBMYMPEfn
         m397qtV4QDJJU3wJEsP4R0/Dllqpxywyw2HlwlS3mxBqo+uxKynsubCUXO/omhhOyp6D
         M7hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bfyo9D0V;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id w2si197388wrr.5.2020.09.28.23.27.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0M9XM3-1kHPp747Xr-00Czqv for <jailhouse-dev@googlegroups.com>; Tue, 29 Sep
 2020 08:27:31 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/3] inmates: arm, arm64: Remove dangling include search path
Date: Tue, 29 Sep 2020 08:27:05 +0200
Message-Id: <959515f0ce809642bf252cfd106d562c9c41fd85.1601360827.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601360827.git.jan.kiszka@web.de>
References: <cover.1601360827.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YEVyDogEeB6Wc9dSFgW+3QjXEOZ6eqP6bfnqTyHqbl/pDatO+mk
 rPjGh0rvgwBPNujb9WH+d5RocVJdrBalo/P7sEtm4PM3IbPAIuxzTG1LuZCSPrQUDgWVvzL
 6S6EEfumtGzx9KmoMSKLG7r42/NYBmVDyBs/gtafeqFaT9s4DUbelLJBXIBEgaW1/vg8ahi
 XPaQbbe5ke6oF7PIl8cSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YtMDGocjL5A=:0st8ZyRDSsjQ5S7sNLdEnA
 tWh+KJf17hLyS300rayvKFQ1BtHr7qYbqQuRNohdmmWtJF0yweeMein6EnJlcAodsKH5WfhKD
 sn4ffT4CBvwRHzH8dWHqJBNRy5qFclH5eF7OB1YfCehlii9yuQMGBUTRapTe03TNXQ+3Sz4Nb
 UGL6qEePQc8s0z5zu0382Yt+wZE4kk2p/znE+Vm4L2cBSEbEgJj3dCHFQfiw1pWq1S3Uz+Tgp
 xmnJHKrpuumvFf/evnzoxy8fyjT7/LBYJ39vd0Fb7S81YMjib2j1rK+fYKn4qCzOaTQl/cvCx
 cJwgMHd1N+T+Fdxk6bhTq9OFSIIRwgzySCHNnPbT9ynKNa2B4/zyju6szbrrNe9oKRsgcOavL
 e/i1S1Qpm0rKsXIplgKptrq8FBS3JsZoJ+ksmah1dVYNrb4DALSVUqjtUkbl0eexCPp35d2h2
 covmGwSHEQ8tMzDAzd1HNiZQGj05RBDsUPRX5KmNBIvYPuPib1IuZ7TldlV4FidSQHgPjTzc4
 HDAgfI/GBbM12L/U3RIsb0AllsPBOf6u3iCEYZGmoBhJ6hI2lp5wItExsDxLf72ra5f4OpaQK
 HV3VCTqT9A+0WpKvwYDnwCH4gRpGRoNXA0f3dBQeeaSiQzyd+5RfppTA0yX6CX1iWSLRMaImE
 FIDS0L6oQiGP5V0wD21eKaseLUWB42ypY8meTp24/F+p7Eqi24E+FdTudlJJMsLCVjvu2VJPA
 CCyHHwfPVBYu98sAW8IsGfGoC3ywqdDT1c+kgFhrjWVlAz3FtjmXHaXYnpy3L+4/0g8maJdeD
 3kIJRj2E5hiHugtia5XRhZflwkrWt6EsoD1G4N3lNAPQOofCqTwApeOgcZJOM731qZ2jlCa8p
 MNc0MXm2MkYioQMetPiGZ/opDuXJqcfVhbGAmwT6Og/xqsPDXelfuGfuHDUFFrsRp7ljBef2V
 jD2giDEHddEmvhYsdSFcHQvfhE8qP0QTo6UgjTaesHdM4yVYql5e02gf40lQq8DGsIMAbdeDy
 kRBL3nkD0ZddM5L+5BgcAlMTHfvONP3hO21atzlK18LrXbQEdk/ePGmBNozBAwFdyqC7i6qqw
 sV6sim70YiqxJaStatR2Q0v8/g2Y6KpAUrGMadEmvylBYNTatXsPA4tYES4mw0DNSDzc9qhvX
 +YPCOG6gZnpYzt1w/co5BnFpiwTKPyfMGE9lubfLl7C6TMtoZfd9SFP0ySKYJp0/1fNu3yvBR
 1vp5XQUbA9B9qNksMN6NmvImDBMlhi60u+2dZbw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=bfyo9D0V;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

This was obsoleted by splitting the inmate headers from the hypervisor
internal ones, somewhere around ce98ecaad89b.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/inmates/Makefile b/inmates/Makefile
index 25639922..81099b84 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -20,10 +20,6 @@ INCLUDES := -I$(INMATES_LIB) \
 	    -I$(src)/lib/include \
 	    -I$(src)/../include

-ifeq ($(subst arm64,arm,$(SRCARCH)),arm)
-INCLUDES += -I$(src)/../hypervisor/arch/arm-common/include
-endif
-
 LINUXINCLUDE  := $(INCLUDES)
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/959515f0ce809642bf252cfd106d562c9c41fd85.1601360827.git.jan.kiszka%40web.de.
