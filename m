Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHV4476AKGQELIVKQWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CB29D23D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:51 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id m11sf275762ljp.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919391; cv=pass;
        d=google.com; s=arc-20160816;
        b=AhOjjc3C11Qeuc1R3SHrxqqs0M4E//U5a9/nyGdRfspDp+y9F8kwB2pDfW6AOC8o7U
         70i2PMMG7emcbGsSTF1GIFwTnG1DvonIow/gajxmYpKg4BEX73cMHZV1AOGg37QFEhqp
         3LIcxe3GN6Nzk74ozFWc8c9rO0besViWDiQb8VzJS59tEPD77sbzxcuYn7OCHulRQBPN
         H8x8QWR6f5yZobcl/N7GJZuJXmIH8+TtwqJNZp9RdeiCK/cYd07mGjcu3BENmHtiBU5U
         tfi/LDEctrgzwewnmJKpnxjyRWPKQMq8TlN/qqMmMPNSbLbvDJ0KULNUL3XuT8ZtdNPz
         SL1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=QYYKvi7MrRR6f2FXgm06ar9Xs9OOk+vBKwGcBkIwqmE=;
        b=fbu9jHecov6YfSX7DVQU8LgdbeQ8UxD7/ePieWirM1PAm7DoluffDoH1ohV8zSmKXV
         m+fAPZVjbkZwU5M3lzzfcG9+per0U0s+8xcT6xINx2E8yzZiFjMzLurx7/NpbSZ38sbW
         2qtyBMlEzaHTT2tR0frj9irvfYE7aw6tr/OFfLSVBiLzNHvEBUBfDMi1jFF1P7KzpIWO
         rUTaoZ42q3Ae2wGmnsjC8FgMrf1v/NAnuscCpdaJKbXnD5urGDCTUipg46AcGhJOeHLU
         5l73QavYxu2Wif07CYz+6eudBelde/Oo5eipU31FIvRdeslYqEUtXVmp+mPezQZfVXUa
         87AQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="D/YmO8zS";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QYYKvi7MrRR6f2FXgm06ar9Xs9OOk+vBKwGcBkIwqmE=;
        b=Zjl/PFW6GiNAa5SLfMVlnTsU1uTG8/1JqhfMETgUc16wjBmmeg3Bc2Q/9Wtq3uqf9+
         rjjeGgDjEdeuZ7pnCTmLYMrYui0drayMMz8YbmyouL2wiuckq4Rr41mWJ0deMOD1WcYu
         cwEFAUBDmLYk4sRMwSi76DE3dTZVR2nyFD+/Xzfb4Ipdd/xsUp+KYhc6RN16o0c3UuAk
         wD+l3G8UrWXSJt8doia4ltjRt92UkWImrQ8jgS9O/Xf3XW0IedGcyn39zZrJwEyb+YfN
         zDkzndFjMvpPu4UiTDUeWbVygemF4/tiToDFoVStAlELQ1DwQ09wwPAcmw0tEzAZ7M02
         lkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QYYKvi7MrRR6f2FXgm06ar9Xs9OOk+vBKwGcBkIwqmE=;
        b=ENj5ZsmrLyLrez3S4dsUAtDbX+RF10utHV/zJwIjHHeGUIVArscUz4pGh1DK7C+WbQ
         iemt02owydM/Kry5x/o6D6WqomPkq8gchUyNKBr3/Kxo07C+i+PW6XLhkY9j5PIEJW1T
         JTnwrM+0LR4Gyla1BOuonh68cs00cYb3nfmARn+EU4tuaWTz1H9+/kKP9AQHNWJrImPm
         NJSVGP9w5u8SVkRv4KNs6Qa5ioPZJQfkLJP5S57jz5d5Scb5nzkq1szoEXAOUfZUzVTn
         VIUTXQk2A7nRgTUKYoSxNXcv0csunKALzTUSsG8JpB2cUs0kagLIiBHmWPLyS3pZrnQN
         7e8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533YRG6rP8Vibou+oHGeWEOfQuyDoXhIdb7+LEPxhM11hgnylOA8
	laxViB+foWL720Q0++nyeSU=
X-Google-Smtp-Source: ABdhPJzz1mR4pgy8VGe4UgL6Z/M5BilbzTdpYextv2gmrhUjXRgoneXlq79bHZDtVlxBm+04YEr+ww==
X-Received: by 2002:a2e:b1c2:: with SMTP id e2mr491910lja.282.1603919391145;
        Wed, 28 Oct 2020 14:09:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:890b:: with SMTP id d11ls134176lji.6.gmail; Wed, 28 Oct
 2020 14:09:50 -0700 (PDT)
X-Received: by 2002:a05:651c:2cb:: with SMTP id f11mr500599ljo.40.1603919389912;
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919389; cv=none;
        d=google.com; s=arc-20160816;
        b=tZWpWUV2WYFjVFpIKILDcdYArtqzO1tqm579kQ3ZkJzkCxeYNGsK6JHgbPFMNxVZtn
         2y64Oq75hCNMox+c0GPBku/H/4rFGE3o/8Ns6iGqxdT3BA+fjnySv87EkpcdNFCWkp8o
         nLf5E9cb+zC3bNVwTyP2HeM5AwygssvCoSsYJwLXhB0uHRXFeWWcbK5szMaMx+ExLE7N
         mjEQiqBYi6JPt0i1DSwfKAjgoIeirgrH3V7kndPjFeIb8ipd7ZlJ1U92kf2z69cVcrDt
         uvjyhWUaT5AcT/RGzTDEVxV4wXTYGsKHfxznEwd9QC2DqPGiqfNCjaRpPl2NBQYMe+Xe
         yYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=wEOX2K/utRxaK9QwW/DFm1U8HUbZQ2JeIw3845uwhwo=;
        b=XtYpuxjG2dUdEYEb7rBcgghTIQfLTzT073JFbYj80YYrXRjupMpMvPwVwnB0lbUPO7
         faCkhivIAoFUmH6da4etzpmVxPx2roxlAsIUUHOzEwvzU4gUulztg75aoxfyJlrCdNnX
         I8PvTCvoFhO89ECQQx1bPk7jsAsaE2Q6AUnVwWWU22uLAvRMLgHxcV50KyiNon82wi0i
         bvlbAkga1oX1V9KQUmwOg44I3+lZ6cO86Wi0XnpTj9s0erssbHNnNNBDAgp2wnFHb6Q+
         QpqRYdr30xFHkIl8V5OMrUGdpVUjt4rJWAiXmaW9cI2oeezvBdJAZEpto70nX05huWIV
         I3qQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="D/YmO8zS";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id h4si25414ljl.1.2020.10.28.14.09.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rd35rDzyWn
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
	with LMTP id KPXYYeA31HBs for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:49 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rd07WBzyWq
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 06/22] inmates: lib: fix align() in printk similarly to the hypervisor
Date: Wed, 28 Oct 2020 22:09:17 +0100
Message-Id: <20201028210933.138379-7-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="D/YmO8zS";       spf=pass
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
 inmates/lib/printk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/inmates/lib/printk.c b/inmates/lib/printk.c
index 45af2730..712a9b44 100644
--- a/inmates/lib/printk.c
+++ b/inmates/lib/printk.c
@@ -207,11 +207,12 @@ static char *hex2str(unsigned long long value, char *buf,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-7-andrea.bastoni%40tum.de.
