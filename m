Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBTF76D6QKGQEABFAIKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA962C16B1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:09 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id a134sf136867wmd.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164429; cv=pass;
        d=google.com; s=arc-20160816;
        b=g4ivi+CinjeMW/ab2cSynnfbvvWKcx8nZC5PBEjp4LsaGYLt9Tmh/Pp6l8gXKKCnqY
         0sotlYy6bq84ShrVzU7WJk9TB63J4WYK0mcDxWsCHyEwhjJdr5es/jNkBj17aei015Wv
         SjNynbgAVG2F1QYVwq0bVozoRsdq+lLaw7oeh0CNU4DOB2ggwOqTJtBh8qgTNaZJqqJp
         AHd5Z3QaY988n4nXafZHQx/q2jmGAHjPlSKbYJmdmwBmeXuhSmHQDQAgc6Fwwy0WTOn8
         enJLdBufyGIGd0CBGeiZmiUtW35uvQmrNdyFd41OPaKncfPbx0sVcmEFW4qaEwtECN3z
         F1sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=APXwEERya0coc4kBTbhNJFPQLUsW93N8Ow2K8oC8SJI=;
        b=B42S28FA8srZ3+tFuzw/p5ffW3pZkkdrEqeDQLis/VBRkxT+uiuiRs4E6DCbmFgq2C
         /SJKR/V+A1Hk78rYBk3zYVfnwzcRJRyZg0MF2ybI3FaMbZSHwVuu+cKHbxnMxsB+UYMf
         jKp8DtiAoz14zcVaDNwW7ARXnVjy29VqiG6jmb3mYWo8ikz6+MhmeUiFSd1Ei8F497qe
         3Nef576ZxVC36qHqaDbSKa6PN6OKaPiquaLT90nBOfEv0Davd86SUwgj4sbIQ6Bpg+i4
         zmAsupr+9u4rHRkLmw25PYNqcvVw3xCtrhvosICIiZWJmIw7R69P6rppnKE8bUruhGz2
         GD2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EOnll9Av;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=APXwEERya0coc4kBTbhNJFPQLUsW93N8Ow2K8oC8SJI=;
        b=cNY8wBHt0o5jEUlW0qUx3+yCSRCIjMNe5oEyDCW34rN6fk0HUZnf7qQ8WEtlKvYJqP
         VgPQaTWv8XYLxdSQbF1uY03XSp2x+TsboSUJ9jts0Pild1j6uwDCr7yTDV+E7TVmj1SH
         gUZJ+y/Vrs/Pz/hVllQrmxkZ978P+1np5Rk8AUvbWoa8wDa3Nx38taQNmVj0opBR9x6n
         WIVTN830k92Vp0Nmk8A6fVJ4TAFzQ5CO/RJ33dR3hrHaykVkNfTuQ4c/qdqy5VVWDFYf
         bKfKpBxp+I1YYLFZgGTxo6BUhS8ZfDMMVnYSd1FtZsJSJQpW+RY7MLF3F8CVuuCXDzNN
         P+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=APXwEERya0coc4kBTbhNJFPQLUsW93N8Ow2K8oC8SJI=;
        b=EBQEK1u91alvHAFFny7bnMSsVLUax7ErNBXnqFHAxegcXwhjWo6rO5iqoE7nplyPic
         T7MA8ktPr8OwbEY21IWRxPt5EK6IxwGkitXb9gDo6QsH7xgnPERGAeAoBXf1gYh8wbHq
         MBSsX+70n/CVWbUjV4JeeyIssQIu3Fy3rz1Somo+VRzHBoGUyg0hKfvyKhQ0HPxK2tVN
         kYMfttmmD4NqMDVLbGlKH8Ym2YSmlLKRqLgCrns7Uqfljbro3EdvQiDPp+/ZQONwTp/n
         243fLcgvwTo6/6qE/OS4Yt9mBqwXy5bPUR7bgq4ZltRNHBdYlBqh1QyqsjhVSalRKnTI
         QOVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533EjsjShk7OKeFD9x21P3ZjDEDW1oGZIoge0ZLk1ZBmM5pPr9FE
	HE4LCnaxuI3Yy+u071gqVaI=
X-Google-Smtp-Source: ABdhPJxm8ZTVErrDq14MKWpps1nCeigsFX3Yzda9cOU5nf7eKz435PzZp4+trgs8mJfoAGto1Y2meQ==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr1540270wrn.277.1606164428989;
        Mon, 23 Nov 2020 12:47:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e5c2:: with SMTP id a2ls9050027wrn.3.gmail; Mon, 23 Nov
 2020 12:47:08 -0800 (PST)
X-Received: by 2002:adf:f5c8:: with SMTP id k8mr1617077wrp.2.1606164428117;
        Mon, 23 Nov 2020 12:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164428; cv=none;
        d=google.com; s=arc-20160816;
        b=hRuO7/nbVxuZguqf4C65xVlN0fkANK5MOzX634VwSQ8MGQUYdPYz7OtMxp1V3IjwBp
         NFv10W6Yahg8IvN5mDlvg/qThFOpx0kRw/eEDi1aQOPTQ82K3i9w/DAuJJnoq06PqxMf
         y7JEtoPyIrfdQ4zYUzA7/N6VpUIr2Dl1PBePYlLmuXDyczMq32/a3eSXPoIVi7EMd3KB
         Wc/8gafkKmvHGXtxwnkVqNhzHDumm8wZS/O0Y4rD5UCAbJ3uCp+PgVfbGzenfFC8ookA
         sy6ET9AQgU3beZ4mNvbi6+T/sZUBgVU/5gd662BJJHAwb6GnrQ/nvd2MjEPRZPZtHKq3
         6Sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZBgSI9hie31ZVzr9i6m5/gRXh+mCB4v7gEtsKZcZUsQ=;
        b=kne5rR0gCKo3siKi7HlM7O5AyuEdQWzYbe6lrKq8SSBgVcvm5SXZLVf2bt24oFPP3A
         5UgdmAljbt5LYfn9SGWZe684jgSh8bXDeeAlOhyh0Udh0AL2xJu/e22ch3ASjLATeVCb
         JwPtMnUp6a5ly60UZdCy1YhGh/8//kTXeZDuX6Cw85ftN4VS/VJT9LmHZxEQswLchRKf
         XHfHuOeGD4Lc3UHzB6p43sRrIcv2peMqoLsKkmGdPKm8pG7Aws1Fll7ombNz7gtmPCP1
         iTNUAR/PvvcL3GlBr0H76EaY7wws1oPL/9iOurqJeSBVgU6aPWeoFKNrZI/T0Lx1J6FJ
         Dm9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EOnll9Av;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id r21si581897wra.4.2020.11.23.12.47.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:08 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CfzjR6hb2zyTf;
	Mon, 23 Nov 2020 21:47:07 +0100 (CET)
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
	with LMTP id y5n6tswUoYU2; Mon, 23 Nov 2020 21:47:07 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CfzjR2ZpnzyTk;
	Mon, 23 Nov 2020 21:47:07 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 01/14] arm-common: bitops: add most-significant-bit operation
Date: Mon, 23 Nov 2020 21:46:00 +0100
Message-Id: <20201123204613.252563-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=EOnll9Av;       spf=pass
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
 hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
index 808c9a0f..a726862f 100644
--- a/hypervisor/arch/arm-common/include/asm/bitops.h
+++ b/hypervisor/arch/arm-common/include/asm/bitops.h
@@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
 /* Returns the position of the least significant 1, MSB=31, LSB=0*/
 static inline unsigned long ffsl(unsigned long word)
 {
+	// FIXME: the ffsl on x86 isn't robust.
 	if (!word)
 		return 0;
 	asm volatile ("rbit %0, %0" : "+r" (word));
@@ -41,3 +42,12 @@ static inline unsigned long ffzl(unsigned long word)
 {
 	return ffsl(~word);
 }
+
+static inline unsigned long msbl(unsigned long word)
+{
+#if BITS_PER_LONG == 64
+	return 63 - clz(word);
+#else
+	return 32 - clz(word);
+#endif
+}
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-2-andrea.bastoni%40tum.de.
