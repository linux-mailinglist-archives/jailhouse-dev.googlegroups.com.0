Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHV4476AKGQELIVKQWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D429D23A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:50 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id t11sf344916wrv.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919390; cv=pass;
        d=google.com; s=arc-20160816;
        b=LnlMQ+mIEQ66MDoPTvRnHVDS2V9EIY2mVuI/kgGBadM9Tlb6x9AyQeVoP2PDsJ7A8C
         2Hc0tk7RqUP85ngfEKVGa+xZwc9BEB7p9toupEe4p5x+l/NmKocOhd+CPiITisN6kRcS
         A9/eR8cQPe4j8RNOBFZyYHBScgcCF4Z0/f2hRRsJ4Utyc9mA7KuUf1YpWs/osZ9l2hBF
         +nYOw69FERUx5dNLY1Hja1FQIAswUS9IaExxjoz6/tVOG5p0x2bnZFe7V9PE03qwPDhn
         20SfhM5NgjuFnz/nV+AIeDZVQEI4ILa3ChhcyWn4zXK+TkfWYvTd0cZhCPJIEYXrie12
         Yvzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wMEiYCeB20cTvv8JVW8mft2CatUVSC9blkftGtr7QL4=;
        b=ygNHA/ATwxYy5Bu96FJYKVBNXRsp4T0lE7uN/AyqQY/fCTyU+jWzgUbhzqrEbjD6oD
         c2iCNg8H6qV4ab9yQ10Du5xmh7tHNw1LeEpGkltKPo2lPq1/Gt2FiCawUdG6pCywcc2R
         R7eKT/VVV6CjuUd5dP4b4aLJw9vCK2DbAPBC/a6STl+s3FvV3ovHPJVvTFGxbTNsitlo
         m/xZz6016d+q6/8p4kP2uE8Abg3MungoOe8JQKfWJMYC2Ff0w3lGnQF/lD2bAUf4O/PE
         dI1jtibNAy2npUO0JNKOWS604HTTXe1NhITKa6j8cl4yFeCQ4Fi0mOv/b9SNewYKstLv
         dUaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RT2ZbY6t;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wMEiYCeB20cTvv8JVW8mft2CatUVSC9blkftGtr7QL4=;
        b=hgiANgaQXaG6oSGvggSCGVacAi6ryUlk5fC7O08mc7+plQJw0KQKhUv62uOzjOySJT
         S/3ccegjMtjg4IDpL+2MgP0e1c1bUoRutDqq9iFjHJCaS/Xuh3rnfivyJX399bjxKH1/
         I8YEO8iyg4wjvovFMVnlp5ylM6v7Ha/Aj8n0QcQY36B/GEK1hPSFtpyiee45eIkf/3/R
         ovqsiSmUgCkdJgYoI2hXZS0fGuOTfd4JkA+qmubNaA2YPe/21TM2EvLC0WZ60UvFWXz3
         pwhkDUaWTiBWxTTSLqPdUOX5lFL70gFM+bgOH0ERctVhelcqkEiTWenBhJxF5On7ox4S
         LIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wMEiYCeB20cTvv8JVW8mft2CatUVSC9blkftGtr7QL4=;
        b=uJhrVqXJNj7HF7eO+a1RfhraWUYBiemY4yDOwT7xfNOSfmmB6dsIrl/v4U/eF/wLIR
         KyxUyQ4M8jHji7M0CUWjdNyjAaWP3A/q7bLU93mvW/dTKhheZ+i4iNhS1xMslsi9HA4a
         26HpdEKuC6mc3N+OAb6NJn9YPjCB0TNO0Mn4T/ETPL8ydP4bA4tSVdRE6XjytREeMyM3
         RHTemrMyZYRntPa1OOxPOezgWk0AdWM5hE2YW7oGuu3ucsAzf3wEUUfqRXs3/TYbIUUG
         OMfwmkjSFLt1Me0dZrvsgoDYhrZRcbyc6q8vbI+IYDBiymyYNpUj8HfFrjntyW7wI/fe
         xIlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530QWjrqGrqmwIP6G7eVQ33Qx7qwpZx/yl5VgSfCpp0VDWVAdCpl
	183pDZy64zrnTODOG4gZ9G0=
X-Google-Smtp-Source: ABdhPJwvd2B9FoKXTyhGWaJI2snCeYuQzbPOtssuiwJLqS1gyDXcnDqi9IIv/goUaTjUpDqUCS8z2g==
X-Received: by 2002:a1c:e154:: with SMTP id y81mr757122wmg.111.1603919390296;
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls406067wrb.3.gmail; Wed, 28 Oct
 2020 14:09:49 -0700 (PDT)
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr1489502wrk.142.1603919389332;
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919389; cv=none;
        d=google.com; s=arc-20160816;
        b=YGGt+0htCv/h7ZVArEeSo6k4phPygVvL/7RRaqkgvX8UkustFTCrnq4Xbe+t8zTK2F
         pv8PYpCkZBKc+1OcPEyvieFEb2lK9TpJsa9SqZ3L9XgrdnVNXttWMnj6jRoCxkzA4sxA
         eXTQCidjno3cvNemdIdf8BPluRl6Ndnju/mRIeP1/8e+Kp42d7B0kAbQT3bXTE8XdXcb
         LN1o6eczoeTy8VmpNZMH1kuzqHZcqlvSKj5/X1piP29hfLnOtlLAucXHjaQOUnOtsZO3
         3yWp9Kep+MwJJ7lTITwOQdXGy+fYtzA5uPmA3Q48spUh59Pn+yXFto7dpq+/8XZJe5eL
         iUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=0Hsnsee629/Fvkk+14YT30+reklswnU1hp2anLnBGyw=;
        b=b1MXyVNH4c0jqCodrB5J8ngY1X8DZsNNfkWz3HwPlsbm4u5CFvhZADHPKOuYHXnNZY
         /OvIIYDxTo3T/oQuxR+eWtFbymT9fK+9lpYtnkz32HnNpNNxjM7I/DPdmYGPCfKw2GA+
         U+2kSzy072Ysqf41hTPt7EwXcGXpR5cgrEQNxcu4t4n0eqBraXnUj1gD638HIlz5S4Ri
         efkEBc5oRqDBZNgzYqsLPSPVcs+Hc7aN6lfE6Q9w0nqrb0n8/ONG7QGPQDTZlbj0y3jE
         XTjjETQiVYxBzp4g5l7Wa4V0GvZoadzDHRAh0/rqvme2JAAJ/ajX/OthSNxyATMknsUB
         /KyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RT2ZbY6t;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id y14si22338wrq.0.2020.10.28.14.09.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rd15p2zyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
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
	with LMTP id cOeRG8evhfKq for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:48 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rc5Jg8zyWn
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 05/22] hypervisor: printk: Fix Wsign-compare in align()
Date: Wed, 28 Oct 2020 22:09:16 +0100
Message-Id: <20201028210933.138379-6-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=RT2ZbY6t;       spf=pass
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

This is complicated to fix without a cast. A possible alternative is to
cast the char* to an unsigned long "address" type, but that is even less
intuitive. Since p1 > p0, cast the ptrdiff to uint.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/printk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index c9e22b29..1b3027ba 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -133,11 +133,12 @@ static char *hex2str(unsigned long long value, char *buf,
 	return buf;
 }
 
-static char *align(char *p1, char *p0, unsigned long width, char fill)
+static char *align(char *p1, char *p0, unsigned int width, char fill)
 {
 	unsigned int n;
 
-	if (p1 - p0 >= width)
+	/* Note: p1 > p0 here */
+	if ((unsigned int)(p1 - p0) >= width)
 		return p1;
 
 	for (n = 1; p1 - n >= p0; n++)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-6-andrea.bastoni%40tum.de.
