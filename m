Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBT4QY76AKGQEBXPVRNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id AB79229643A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id n14sf925065wrp.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389519; cv=pass;
        d=google.com; s=arc-20160816;
        b=1KPLEI15RZTOBJrx7Vtq+Kzd/raOXccNeskVEC+DhxFhuPfd1odiyW2zH2j4d406OK
         63o+Pc61Jq85nLbgqu1i5rYbcvSZjGSRVkWaCwBv9sW6tofeII6g2fkmGPQCrM2bEU6O
         5xe9pK0KGg2iCsrxscTib0D/pqD6gfTJ2ljgvl46KuzOQI1AVY6tu8sJ9BpvANsAMtLm
         10ULteFBjG0PECstM4hbXtnPApExdL0nkOyHmem0l0jkSsfBb5wAQU0d6n5TfWRxxgf9
         56vwpuKMnkS3lQC8FK4016fSqtL8cfKFdGTkxCaIsu+yCDkAh7rzBC9LrKDqhBlRbl2h
         woEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=8m8Wdjg5vP+nuKn4/wrXm4/Clvwi68NF1I4wm3gC9ks=;
        b=Awo3CJ4NUioxHyasI106DTpb+exf6NxBlM0KezLCGqXlBt9QVWx57XP6JImoMLQNTf
         S0mnF0urRaJ4sHngtUWBuuDPdqrItv582FUgzVYurewJ/nKjdSNXwz7jtCl+PPZDmkHl
         c/yu9srs10sKdJQ4gab3CCSMqeBXBNCTMsZLqR4EAhU92jBdNcMm8V5dC+kNjlQLm1cD
         zESwHF+QAJ2NhIHU5r737zb6KWcJjgI9oX/kYqUY9d4zVCpqFCk5MfmBdTDVhV96tmO7
         cmxsNX14xDkeZskVc888wN4Y/N2W82AlecV2l8AXclrpU0+c4zapJBS9xWdnakXliRp0
         CeEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=w1YuFxS5;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8m8Wdjg5vP+nuKn4/wrXm4/Clvwi68NF1I4wm3gC9ks=;
        b=EQeJZkvIUB+dyKQis6lvkTZgR9xAmEUseTlPatjnkN5c9m7++kyz7dHUh5Mn6yu6Ep
         ePAOfDgtfrG2PXDb52RDEqsWnhRsHVKbbO+NizZFTipG4Q1sCA+qqPsuaZq5cFc2oRI3
         WA3P+kXpRno7jFTL2tVQX2g+8SbaeBttjXa4QQ9kkZ8mx31hGm2ZwEkj1Rkt812K+RsM
         jvhkw/34FSyLiwN7Lm8yOqjPypzh8dB4+RwRz3yqaf0cjwa+fRmYjUIrvbEoTAvdaZBI
         83MIlUNm7JVM1JRQulOKMO71pLKxtSJx2TpX5I7HaeqT64icS+wgNfdEQeMb/ZblRhma
         9HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8m8Wdjg5vP+nuKn4/wrXm4/Clvwi68NF1I4wm3gC9ks=;
        b=PskPcO9wSwKcEAab1Bu6UUEpbIO2CbS/IYwUtaLdE4fleWSqUSxZDnqpQeBdTNMgAV
         HQEuBGlCc7h91Tf4Hqd56h5tE0WClReiVZ2Vad+Xa7AjrX7kpYhadJIyfRi/G2kBbWyh
         0NlKX8hZjpAtNuOytd5/TZ+LnSzCru02u9K5eejs6gy1vGNjSebjhSIehVr018sHsA9R
         omRpAdkmpGZAXN/h+X3+8Rz10KkgpODop3Ff9uoniG/bHy19MbA7/d2E1JfBjICEQE99
         Dm6kCWleZLj0ImlzrU0++t2GucDPhwXklL50WmxUAAmBuGIiAJEqVvFyxzD34xc8YJtj
         xn2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Y1faE8vyVQuExViUqBjXcuMqSAuVFd1YKAK6Y7QCkl4OYGjJH
	WWjR60c2FSQ9SHpTIqywgcQ=
X-Google-Smtp-Source: ABdhPJzkDXIovS0AD56uXs+1iHZfvbPC8n9mq76TrBuVYWvzBTXv0iJA6UM3TxqFJmeEDvlqhynzvg==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr3809783wmj.80.1603389519469;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls477548wrc.1.gmail; Thu, 22 Oct
 2020 10:58:38 -0700 (PDT)
X-Received: by 2002:adf:ed07:: with SMTP id a7mr4201309wro.326.1603389518685;
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389518; cv=none;
        d=google.com; s=arc-20160816;
        b=zLB0yoB0t+iR2VUOn8YhVBXUH8+WYTf5a444DLRb1FHMBZv76MhSEmOAXvCH+p5v+l
         mckZuqhqEVGvrh/4Wgvjc9R1uootY/egIaKfE9n8f6KnEfgO1t4RPHyNPOjoSeAvZJgq
         oYsuWBjLiB7V2MkDazT1R/JwjU8FBtP+tYlyMpO0ahoztn0rqVPlMdvTCruAegm4+sot
         bUdxtWCBLC5FYaaMUFoGVZGnqbrkPP1ye1feWANNL3yZQYcIbzbgKuWQy+TMV+u5TsEw
         EpVDAJ85T2Ghr0LNif9RK6iaJYxwKygNhcEuoas2JnyxiAxJFx+9k2nhi3SImx/maVqp
         5jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=MY964BDvIFrlRZBxWN8H5F9t1o+nuSomCmKkmLnHX1Q=;
        b=GYBQOQgGPKOt0kLUsh2FNyLHmyjRC3QLSWPfj754QD/0RXXaOs41fHIJDzDVdYYlm9
         NAHEoxvmDqLjXYlxJi8hIsCeJb4QwhdthGrJubR4mGRFMgu2u4iBnAN9D7tBR8Z8CNIR
         qX1DFiRDFaZN1eQEmePcvCpcYS9gKwro4+pwjR4kG6npCde9/YDwdNCsFASlJBp4px9a
         /vuTPtIebLK2mbZW42XPmREJl5ckri+j5iEMBCxkDflIvuY8bIXZF3/c0vzQnsWZkyBr
         Y3XOMT4Htae1DIGW36s7N5+W/6NU2V78bmFV2LKD7A3nYf9K6lIMWOrxqB5tZY7WBio+
         Y96Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=w1YuFxS5;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id 63si65267wrc.0.2020.10.22.10.58.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTp3f1QzyZp
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
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
	with LMTP id TAp_Y1nC4a5X for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTp0Y4wzyZs
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 14/33] hypervisor: printk: Fix Wsign-compare in align()
Date: Thu, 22 Oct 2020 19:58:06 +0200
Message-Id: <20201022175826.199614-15-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=w1YuFxS5;       spf=pass
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

Cast width to int. This is complicated to fix without a cast. A possible
alternative is to cast the char* to an unsigned long "address" type, but
that is even less intuitive.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index c9e22b29..a32ff8c4 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -133,11 +133,11 @@ static char *hex2str(unsigned long long value, char *buf,
 	return buf;
 }
 
-static char *align(char *p1, char *p0, unsigned long width, char fill)
+static char *align(char *p1, char *p0, unsigned int width, char fill)
 {
 	unsigned int n;
 
-	if (p1 - p0 >= width)
+	if ((p1 - p0) >= (int)width)
 		return p1;
 
 	for (n = 1; p1 - n >= p0; n++)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-15-andrea.bastoni%40tum.de.
