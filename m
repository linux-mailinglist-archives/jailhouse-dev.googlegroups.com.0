Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVXH4OBAMGQEFGR5CNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7734502B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:26 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id gv58sf20279284ejc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442326; cv=pass;
        d=google.com; s=arc-20160816;
        b=h7mZbwGr18iD3VPQGPLudom27VFQZuaiViR1qrDDuc5wV7A4FtL3OrsxX4cgZR7e7d
         4LbEAMmNnPO+wAyc4DU/KP0iT/afceeL/HBgagmssHLjvlQqC/y8kDgBIsqCQ+pEtOqc
         2HTIkN6icUkh+CxtJwC3gBcf2bCmhVYkqP0Ep2O8fNlgHjyq55tLzQKB2Znrc0mO9ni1
         gjht/URgdA/JvZRL0b/U8F4oBIwvTFQNvTpoodeXqag2CobnSzege2ZUsbXDIwt2GF1g
         nTBln9/PaarVIStvZrnwOKlktfJYqho7klKsGHgg0ch3/yidGBw7MEow+FUV0X9cihmT
         pdyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=5LqLfHVAS4sIcIwWzT4s0BjSuYV0dt/lKT07MZRj8SU=;
        b=hzebcBT6acnDxXInkTfb9LHAVhKKyYykZn4Q64ThHIHFzHHqrzPSETJ6gWoUoWMklp
         hkXUzrYxdAGVtmMR9WMzbBTiRwqP6NVUYIHEvat8wbL4++UkC6UVdGdh/rO6rdL6EXZ7
         DhwNoG7gBKdXodBBnm2TqzzTYEgUDD6East5Bdwnyz/bFYu+zj5O4FrOb8OMqpOZdIpd
         lN3Ks5NBvNySB+u8JIqUC8p4KPtPaCNx37WydjytBRcuR2f9imklfMxyfRF7X9fLX9Vr
         YNdWqp18V6mfKw+d0PRZ0EbexWHypDwuIbEfxRg+vZa8BeEfu9rubeFc7cM77wRL+ByV
         IKKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=yEsC16mp;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5LqLfHVAS4sIcIwWzT4s0BjSuYV0dt/lKT07MZRj8SU=;
        b=qIS0m6aCh+LmH1kO1bHBWK0hmot8Zpu9bL6rwCsm/+XJ5BWpd2zcBiwFA5PsaOkXXA
         pm11n75k1mUZCOlku+eugRQG+h2jol4oH9dT/CezvLcqmnED5HC/8+u7yQ8rsH5ChytY
         KWxW+Y9wbItLKBnMJ4AI2fY6WtXggCu6MLwownET7KHjyXSMQ4elfkxI1X0eadqnBcpy
         cY3eD0lrMS5sr+CqZpMc/x2rcHUo/WiDRrZ+fGoonqqZW6WCsOkmQPXbCyODPNxW4iPH
         wBRF7Zi5APBeH2dmhg8ndIevPX2SpLc8BTDEqNbAPuqiRP7CB16PFT54VJE4g+9T1QTv
         OxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5LqLfHVAS4sIcIwWzT4s0BjSuYV0dt/lKT07MZRj8SU=;
        b=NMBtchRxlMdb2xiGC1XJ+wePx01PnQtZiJHJPAd1XDO15tLykT6GRv25uIBN1iXkK/
         NjELlf9W29DmmFiZx5rolERqcHerSwFT7tyV6XCBeAsXRjZw2ThlZx8N8IKQ0NrAJMpp
         BY9kbOXcOQR+i7C9Ix/jMnTZTl0K9hnjG+ivhrwvd+E9kWiHLrdKyIG75JaVIGn/2COx
         Dx18Qr7KTu6A0grW21OOKHEIEYRumpNABGwydtMSQI1XOBHBm13Pg7107pepPD5f4t/k
         lEG4q1PdWWjUcNI4tsrdQMFX6u5KCerT9dAWul9cFRCGM8ZXOiK/yNJ3kTRNYaZSWwy3
         82/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5325iMAuk3PxuZPV3pdRYhJyyck+EWAKf/jlQe7g1irDrDgoXOQ+
	/v244K9k+WJ4bMkb3G/CWEs=
X-Google-Smtp-Source: ABdhPJyiafYuHKEz4rr4CwVZ8RpdqOF9Xx11vGbwtxG5I5aU32N9o4BGIEu/spcz3NuEz0vQp9pxFA==
X-Received: by 2002:a17:906:7cc:: with SMTP id m12mr1336885ejc.171.1616442326473;
        Mon, 22 Mar 2021 12:45:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c1ca:: with SMTP id bw10ls116557ejb.5.gmail; Mon, 22
 Mar 2021 12:45:25 -0700 (PDT)
X-Received: by 2002:a17:906:358c:: with SMTP id o12mr1450966ejb.156.1616442325666;
        Mon, 22 Mar 2021 12:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442325; cv=none;
        d=google.com; s=arc-20160816;
        b=iHvU1aOwsBdJ+3D0hvc1pdDryqRZ1r4qQ4V0My70PbZ7N5pFWPjiGSgAeMlWcce7Oi
         TvsbMA0yyaHvEtmfdsTzFwSAi0qrHbSKHQw+s1Hs3mvIsLsiWHplvR644Pycta/tD5Tp
         N7aHrfLGIPiCfCtnkFpr6JKhUom4Oj9DyCpD9+qWTzqTakc5+lQSFeQ8JktJlorxlG1R
         4Qoo/D5S3+S1o8NDHGoVw1mRn8K+x3wi9OuM/eFeak5wphwHaZdDfkW91bRoq4Va5pbd
         roO6SAz5HOQkAYmaTgsD1C8+SEbW550osITwD50Ud1R+0HlydXUq120URdabgJCeYagx
         tGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XjhtRDJVbg4Rs8FxaxFsyyuzCQZxSid6528O5JdWTPI=;
        b=yJqLDiyqwGqEcr6DHjMRGawDlqswTBox2AVqRa8VvdKuJUH+kWs6hbHHee2VPv5NAV
         yNNkXYS+y0/ByCLFYSjrr8NBWaWfGb1C++0TZSwrTenii0CMgytrrF3cVRAs4tqbe7Wq
         y9Yk5qqhA4nK+3U7SR19W3S2Ulvcx7O6fRGOG6BkozuFSFjMMUakrmwZyaC34zuwLDll
         nfKbvbE+wu8beevCWfNKHYvEsD+IXb6aToys11VKbYHjAfukUk8vbJwessK/uPBJiOBc
         Io2s4mOJhqd6T40T3hyDn12LBkaWt2q8yqeqby2L7IVenwtP7e/Xyrw9lxXzkeBben2c
         qxgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=yEsC16mp;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id f25si601711edx.4.2021.03.22.12.45.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jK33KSzyVG;
	Mon, 22 Mar 2021 20:45:25 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id rcTxVstOwxiA; Mon, 22 Mar 2021 20:45:25 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jJ5zcBzyVB;
	Mon, 22 Mar 2021 20:45:24 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 1/9] arm-common: bitops: add most-significant-bit operation
Date: Mon, 22 Mar 2021 20:44:59 +0100
Message-Id: <20210322194507.82643-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=yEsC16mp;       spf=pass
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
 hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
index 808c9a0f..e099b560 100644
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
+	return 31 - clz(word);
+#endif
+}
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-2-andrea.bastoni%40tum.de.
