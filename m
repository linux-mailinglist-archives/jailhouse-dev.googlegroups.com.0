Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSUQY76AKGQEV6ZLOMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B68F296432
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:35 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id l12sf719105wme.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389515; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vad8KZ+gK90pgaHBGZzGZF6PLrhfWr9C/oGjTKsxqtuDO9guNuc3grxmjgGaFFk6bt
         MEEtWzCCJQiER9JN5kGx3zRWeczLi3CI6AcOxGl9xmAuf9jGDh1XgPsAE+TC+ZNU3WQP
         DZ9sBDbYq2CcmRFQ3NMHMd6i/CZHTcLZUs0HrekbNnDDbCy3C3MVBwaoRB1VXCfIL3Gf
         mTbWo42ts/hRClpg+3z8dkdAoGwd+KoAAkSVJnKTvr7F1VqFqDMmZVBI8NEoyd2ybGWX
         Cl5AZYFgKNCOk0ObIpOkYox9UJiXYUhRS+aT2UJwC0XrjxcT0sItnn+K82gS79dYcLIB
         GN3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=FYHpQ1PT5DA0P0ZjFktsdkRu/Yv5vSVdnPhgb6OmQ4Y=;
        b=0iyu0q2kyVem6WgDoqK66JPLRkDDq5IkVl7+rK/CJi6mye0ZUY4SG2Ode6a11ddQ1N
         rGfX1ODAS6d7WR14zdRLz4ktpGblVYMnZFaecdrBmVwLe60udyypc38CFWRyuO/mdNVc
         CHAHERBv6scy4EQjRjg4Fd/nlb9I7oUsItx/RjXZHolQsMj7OIdwjh+FmDmGdXqehOuy
         5sLM9fiI6R/8GTbyVnnuWkWLWD+xGxCNgXpy2Owx1IKIZo12S2hHchkaxOjrZ3P/tkYO
         ARTsaIkczKCQ0HvyiVMPWzvbSb+BTG2ofE7ZV3fNFtoD5u3RKMVhXDO9r9bTHccaKcEh
         jdFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=gVfvXn2g;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FYHpQ1PT5DA0P0ZjFktsdkRu/Yv5vSVdnPhgb6OmQ4Y=;
        b=l3FulA8Udgf5Z7CcD/daGt9ez2KGZr/AoXBJp4+96sOXgkiOeU+PxFsemKey4SgWGX
         4dc8E16u9CuufqyAaFxY2dr8ONKSEt7qWSN3ySSeaxDDEC6zkPzsARTlt/esjDORghVX
         pyfkEVQt0Qx/Pl75LfvKMmnsOPkQt/BlWwOPmvsg7eqbU5llZ59YUH8GygtG2WBTmQ8O
         a0c3ZGztiBJ7pC3jieN6LTb37W9rQgp+5eIWEoQhldvGM6OUuA8JToH6NWqQa0yHC/Fy
         H8G5BtTxe2RV97iF8DZbL7FmkCdFkMT/bClzo0/FdtmvxMauQSwkQQJNNHT/zvtHI7iu
         vhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FYHpQ1PT5DA0P0ZjFktsdkRu/Yv5vSVdnPhgb6OmQ4Y=;
        b=VTyIlvZHwbdxofppAVUoYuOu/EwWj365najTBNqNhDKwW+xbGkxRg1bKvkVBAdZ+Cd
         EGS+Uvhshwacq0Ypg1vq/Bmck9dxZeQlotziUnqNhnAxFyy+WaTKHf9nClJ6PbKYCIZv
         HPZqhwgg4McspXLBlsazhOfQ5Y1BM+93kZ4miMZF4U8QjP/NBDu3mz2YNMOp2/XWnDI1
         oRlwo8Gn+H6mWRg+z5jyHLGEeS2tkzBhxjOhBrAw32i94EgA6iIZ6LIU8zITqevEupCJ
         EIa1J7xsSFalky/LKSfJhpMhlcESqayUqVDGA+kKb0pTTJWVQLkaEXEbUZ1vycnE5MvV
         omeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Q+UPHqnKbYqvhP5GtjTqPMURFKGgLfjW6nFLuUbgKTvCne8LR
	LBupYFbbyZtpnqKyzx3EQCw=
X-Google-Smtp-Source: ABdhPJwh3MvSim8CrGKN+8OiLj7Oro/txMJ1CM3CkE7ftTdDj6CuitT4rIebylNXvxu/BIOXh9R3sg==
X-Received: by 2002:adf:fa01:: with SMTP id m1mr4241374wrr.220.1603389515051;
        Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls1439329wmh.2.gmail; Thu, 22 Oct
 2020 10:58:34 -0700 (PDT)
X-Received: by 2002:a1c:9854:: with SMTP id a81mr3818061wme.72.1603389513986;
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389513; cv=none;
        d=google.com; s=arc-20160816;
        b=YnryV2oEMOliGn4d7SuYJnPrW+fmDWeJbmlimx4NqtNtpjXgjAd2SZL+1ggMlyo61A
         xiypv6WJeV7VlgKk+NVFsKxI5ZCRbSExK2b0dCD7ZzyZlJ5jZap+y6oilY2Nr7OZOhJQ
         RDSVOIL16aS0fV/SBPSCtgTNLn1rWnBUCwTj3oxpecCX5nGTW0Jk5jXvZ9VMGA5PA/Pb
         XaE+01ymkvylbjQ8FR1OtwS9Jr9G9mEhbOH2INS9wf4Q6hK5+lmUC+dgF4/a1Sqo24Fz
         hEGMOvq0sLX2h6kFwtQmF6k6UFQXo0eyGB8Tamh+qwLqt7zYPaTnp1sUurU/NAIjh0ag
         MLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=L+m8NHSTh+Xf5H8Is63XmRONyhFHwEZColbETwXVs/E=;
        b=UMZrszPnNwFRTdoT4voTLLimk0Zq8RMPhdMldrL8hKx0h5phdZ9yqtDjAe3Y4qAfkx
         bVNQkltKq1LnLj67b21yeYTK/UNnYHfvLaRU+tRGi+lI+7emrheGFAhta2z4bS1JJlhc
         bNZoZHTBE46GWGUY44vnJ5FzqstPQZ1Vooo4QecYiULMMNfIop/3XQx3LdV6tARiCEZz
         /bLmMlw8PItDM4d1FH6gerMrt65TcjlMk1etYmIMfZvXJIClQJ3QYlusJFb2AF1V0e7W
         pFGeBTmeEXLFz91mmGuxbUIxNcvfkWdMHYbwALKOYEiuh/1gdK9H6Iuc5+OKCTwb9cUe
         J6Vw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=gVfvXn2g;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id f198si70444wme.2.2020.10.22.10.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTj5cCVzyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
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
	with LMTP id Xg3KfH1eZ1bQ for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTj2fb8zyXb
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 07/33] hypervisor: protect inclusion of string.h
Date: Thu, 22 Oct 2020 19:57:59 +0200
Message-Id: <20201022175826.199614-8-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=gVfvXn2g;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/string.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hypervisor/include/jailhouse/string.h b/hypervisor/include/jailhouse/string.h
index 5b87bf03..24f0b0b4 100644
--- a/hypervisor/include/jailhouse/string.h
+++ b/hypervisor/include/jailhouse/string.h
@@ -1,3 +1,6 @@
+#ifndef _JAILHOUSE_STRING_H
+#define _JAILHOUSE_STRING_H
+
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
@@ -22,3 +25,5 @@ int strcmp(const char *s1, const char *s2);
 
 #define __stringify_1(x...)	#x
 #define __stringify(x...)	__stringify_1(x)
+
+#endif
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-8-andrea.bastoni%40tum.de.
