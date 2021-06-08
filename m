Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBL4C72CQMGQE7L5O3II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53e.google.com (mail-pg1-x53e.google.com [IPv6:2607:f8b0:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231639F95A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 16:39:46 +0200 (CEST)
Received: by mail-pg1-x53e.google.com with SMTP id k5-20020a63ba050000b029021ab84617c0sf9335323pgf.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 07:39:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623163184; cv=pass;
        d=google.com; s=arc-20160816;
        b=U5s7dA4SR5iyFoLYoCNIrIizrJ150ZH80vUJMGGjNMfBDphvmIvNgfOcFGw9jdp1oy
         dBYxt8Kfe4xzL3DMv54jJid8VXXq7n2NTi3d7ZshSRLoz1M18D2e1/L+QDR5NExuMo9T
         t9wCxby5YOyhNJKVVmfhEvopOW2AFiZ9mJufG/ss/V2zz6j+2U+2A3ARLRtxOJ4CtH6e
         aWp5ytm6wdQoEhCy1XbTtRUAeN3dm2LI1Djv5LWKsB4iDP0Anfw27yCE77ekBgeWhyOw
         pKOJDDnlakadKUmWSr+/8CWC5vtJUOki+sGXNc57XtHmQMzYeDc+JCFrGRTeOjG6gmC3
         ZBYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=UF1dkQ4/Kty1tq8TAukTMFrvgYT+c2JbYWfyewb0b+I=;
        b=gopQ1MTO/t2XZUFwSvYj8T7L/GfTVnd4s+ThNJF7elJsEMahyQQzyPOlT2DXEO4+6k
         F0BTzD1YOxECRe3+w5uHMypyTlagMVJKnNu35+WT01pDBE7Zgc0TRCUVvqhbf4QF4+X5
         dmXI0tZ9JkkK/nWj4HM7YxnShzhVGGtCDTMXbyMD6J57nFybwhM6E6uRomCF5XJbRbRz
         Z+dy/MAxQXql4cnHGjOveatDO2Dipl1BO5XntG2Ay29mCl/HIUIbSxD7aQh68G8AxAOp
         gqwbg5zma+KNYYndWsya9X2Qpm59kcLt7lJ6WzcckRytvKQg9UApzkRfoPaykedQar6t
         MvMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ACuj0oJ5;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UF1dkQ4/Kty1tq8TAukTMFrvgYT+c2JbYWfyewb0b+I=;
        b=LDwzPVTq9+xKlWf8tWgYCJxoaWzGqpvdKGu5e5hGIkIglSVtslmBCw4XOduartPx9N
         e4fQVdz2BFa7BfoWdg3cdrcwYFZZVvsBxG2aAJUsLsJfGAYxKHfcZgL76VexCjs2wjgV
         8APA+w4C0M56JFYHZT+lmoIKlGtDn5ARqpL70rI2tjA1wbx/NeEBq2RsJ/mD8Xha2IFn
         fQjMxV8DagUnxDdXHcnLZXwCn+pkABmClBftoOLFnNlHV5e4292UkrKc5+dUk5mSdKHF
         bDI+INAen7gUxDqJiM5Xr3EMRte15GLwRsIciEi9nddm55WP6WzY72CSZpqy1QiWNVRN
         PS0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UF1dkQ4/Kty1tq8TAukTMFrvgYT+c2JbYWfyewb0b+I=;
        b=nwaZYeMf1LZ4X0iBH89J7/azak+SfNmrooTPQNJYhxqquRod5ibdiOWaQQSvAh9vRi
         dTUHIvvtsysnYsGxJSJKLYNl4ipTDxDl/STrKv/wynbN0NeTx3lYyXeozf1cHS8So2Nr
         8lHMERIz8H4ZqBzs38SFdJdXqU0dxumswZSzYNcBt3Uoh72U+KpM2juoZ4s1hEUSxZ9X
         9kcfKqhsaRx1jvcuUGPT+we1A50tCT43EiSFzYVNrndKABA7zd787r3rfLNa2RWy5op/
         KzuOQliwXzjmS8ysYyVQPFqyCk0qfEC8FGaXABsyMMWqdUWqHdahyJN6fyzvB+OXCSap
         as4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UF1dkQ4/Kty1tq8TAukTMFrvgYT+c2JbYWfyewb0b+I=;
        b=k5zOCMYQdssh97qoJTvlXTzBtDMt3xuaO1S5v6zRfrsBdKR+IEcj/nou1MsWWft6GV
         sPuKWOfGo7cDAb5A+Sm44KDorJafYj0FM+42p+FrDKfM0Qhb2Tnl6ZCz4PkwRh7hON67
         ukFdSdFf2i17w00mrT1+yXQEv+Gkf7RGVt8iJzZfMXUQ2YmZjMBvpk//FQmamPKUdtZo
         1Ne71yAqEYONEEcVonWs+AFsj8rAAT/5D1hQ3oXOXMVw0q++YvSJ/E+JKXjUOtrXJRpi
         WMNpmVuery1FBx6ybhdeaJ9cGW+5OrIwbgCnCbRLy3qA69x1Bo5/J9npCNyZ+dNEFvp5
         9uxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532MOm/i2ndEasMNnHNdl4pQoz5/RmPljR3uWfteUD9rOGATWSMU
	nalJ3DBvk4nVU9LFI4f1Qh0=
X-Google-Smtp-Source: ABdhPJyi5WxzL88Gh9auCE46lqWgqHSDEwZaIX54521D5mkyLDvKXgbQjXAOdPrBAZvYkCZrGcAmWg==
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr23213733pgk.441.1623163184038;
        Tue, 08 Jun 2021 07:39:44 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:51cc:: with SMTP id i12ls9191204pgq.4.gmail; Tue, 08 Jun
 2021 07:39:43 -0700 (PDT)
X-Received: by 2002:aa7:8f3a:0:b029:2e9:c63a:312e with SMTP id y26-20020aa78f3a0000b02902e9c63a312emr223783pfr.73.1623163183398;
        Tue, 08 Jun 2021 07:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623163183; cv=none;
        d=google.com; s=arc-20160816;
        b=WeyOwZKcktOhJLEOP/uVE4JVz9J85199g4cgbtsq5UZ2ULjNLnbZEtzVRE1Si5HY0M
         fcXssLiJTOFaStK785F7LXHwuEWMnr3woLnI/dgYgZB4Nd1md+tHrRQEAFEKKNNUDeqP
         0IEcMmdMtOEp52XYZoobO578HPHT5rMSYD32a9W3cN32ST3KbGOOb14Gf/JNBWRidrBZ
         8aKRwgCMIjrO2sVZ8F83MxQ5IyxfTxKtx3M7JNpLZhk7Z6LTCvquqrfP0pmpmHNJcdjP
         LmhDZTcCgVsR8nDABrrU+V+mO/A1g1tydjOCY7vgva4AaXt0+kiKxJza5HR+gxbOT/CS
         xJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=22yHdKYAzi2xF2sdXReKpv3OWopT15/+HxZ/gXoGhv4=;
        b=Sf6S8OYCeFL3XV6r0XlTt9dPutq2r3E/IRmSvgTHf7fDhMyxauBgksSZq9IxbBfmKr
         kqSuozu2+BueZ4P/gWNHYkN1rEdiJTs2K5ttsiwXuI3wbc0X4M7TyZ9h8MmFbH9/P1FC
         YptiuqGIpHhldKeKx6WdEpC8AcxMFxOpkTtOUQHVZ4PwcSXpQC4EDBQZHToXMA+SciYQ
         y1GadBPOet6YKKms+tp943oCPVlJfV3BhZGYRBuSz4fQWt5XiBKQBZ6IFB2p0Oklxz6Y
         j/AJ/t0xh3Gi2l64BbszioExhmQuvgtw8GnwB02UIZf673bjAC/L2DNcmkbc+/K1UKlm
         5wDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ACuj0oJ5;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com. [2607:f8b0:4864:20::1043])
        by gmr-mx.google.com with ESMTPS id t6si117359pgc.4.2021.06.08.07.39.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) client-ip=2607:f8b0:4864:20::1043;
Received: by mail-pj1-x1043.google.com with SMTP id mp5-20020a17090b1905b029016dd057935fso6028590pjb.5
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Jun 2021 07:39:43 -0700 (PDT)
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id d14-20020a170902728eb0290101c3b7a47fmr331493pll.21.1623163182844;
        Tue, 08 Jun 2021 07:39:42 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id u13sm14544053pjr.29.2021.06.08.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:39:42 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: gengdongjiu.gdj@alibaba-inc.com,
	Dongjiu Geng <gengdongjiu1@gmail.com>
Subject: [PATCH] paging: correct a comment to bitmap of used pages
Date: Tue,  8 Jun 2021 14:39:37 +0000
Message-Id: <20210608143937.17263-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ACuj0oJ5;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043
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

The used_bitmap member in struct page_pool is a base address,
so correct the comment to make it is easily understood.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 hypervisor/include/jailhouse/paging.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index 8a6ff374..d592abad 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -64,7 +64,7 @@ struct page_pool {
 	unsigned long pages;
 	/** Number of currently used pages. */
 	unsigned long used_pages;
-	/** Bitmap of used pages. */
+	/** Base address for bitmap of used pages. */
 	unsigned long *used_bitmap;
 	/** Set @c PAGE_SCRUB_ON_FREE to zero-out pages on release. */
 	unsigned long flags;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210608143937.17263-1-gengdongjiu1%40gmail.com.
