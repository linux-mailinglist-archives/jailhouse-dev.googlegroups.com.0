Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGEXYH6AKGQEK3NREJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F736294F1D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id 26sf1779308ljp.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292056; cv=pass;
        d=google.com; s=arc-20160816;
        b=QoTS935vla8qQ6w5iotBRBXxSl4y0wv2geURqj21WzEz41qJmp5pv8nCt6uaMKfhCx
         Klt4idAFVNSuEnIQfLuBmd84IjIEzU7USNQmk4nGfDndhkiFiuKO0jbhsTilXhq+Bj1W
         ry4QXimxv+TGlGeo0EAlIN0DLj2DI1RX2trNa4BO/KdiSRRkjy14NE6HhW1jhprF/JFN
         9Gg2mFGyiQJwPwcQBxAcdaMs4tJjIoAwDpnA6Fz8xZ46WPpzraTYz4V0cuDQbYku/MQn
         EXxunMW/2Vx4AycoRPOA+4jXDA9UA0fc3jTorCQHELztuBDY+IsQfltCE54+ROQz+XMS
         ZZWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=hyoWHsUokS7bLi9lzV5lX3F4MI69e10zHLBUHy4Za6U=;
        b=eGRT8qyVwBxAzuNvv/N2XWrV729pQwNs35M8XbeNF+J/ZRSMw18q3d5SV3gmtfadpo
         UCM95HH8+AlNxjunU26MXAb7trZxD4wP1LxFQFDgrzfOqJ9Xrx4YaHpMevW/xQFEDW6u
         aMQuNx5DRQatQHjsvqNY7qGlXm+g/BzTIOsD4BLGTxd9QXBUFBhl9EKK+ueugrNqFMbZ
         4IOgoTZukn5fpRewOWCP3viwEZ7sxp07fpnf3GZsttBuGmsyIQcwSuaHAyi9Xw0BVXz0
         qr2D2OiZfnRjt35qfjbfekExp+v1c0ee6z5p6voy+GgkBqwO4YJDnFZQuMU5K6MGuUqI
         5KcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=s1WuUZqF;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hyoWHsUokS7bLi9lzV5lX3F4MI69e10zHLBUHy4Za6U=;
        b=TWXMDKiCJpxoA3A9/Md+FLk1r2nTFxpy1l9bhahet77O/tqihioFF8VfrPaF2n9DAZ
         QiSXZsAnLYPforg3ExosaIf9uZ3XUdmKyCZvsO0BnJ1jYIems530q5i5K+5FCpiUKhE1
         qgWj5k18GHgznxT00OEp/F8gma7PNFANGWuROlZ2cZ9IFjnO1PQPbfBqGi92ghgjTwGt
         tWy05b76hcDNQqIkq6JkYk/ynCMGW+UworZhYdefiXoAeF9q0cUldwOOuk9Hyb84bp3b
         FAOoU2MMOUGGNRhS2g6RmX/BNrYvLDxnyCzfUcO3Cc9V81O+7iA4Ma5NFORfSiXGQWyB
         bJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hyoWHsUokS7bLi9lzV5lX3F4MI69e10zHLBUHy4Za6U=;
        b=NVsPFJ9BnKGFnZakGS+rJG5hI/BAw9WebvV0SpSUmLQ1c6JhrFBQHv/heCp8vys9GF
         8Vk/wdyv9/8MCDE9NhoKYRfSOlD+f7TiYKhGce62CsGfaAipUtMB+PF2eSnYt0X3tTlR
         6OeyABgU7av6oV2kK7FvcGj0bYsDclxwIjudbBPaqd0HHRuyoiBfpuz/bxdRbqjHRZiZ
         oSscTo7kCYauDi9RQaNzOnx6TNBHYH9xRz+u2d4Qhk3ZJEQdNzea9DZm+8hfK4w5rJ8E
         MTnbmbxmUw2Aqq55liqMpNwRwaNjQYtDZX/QgtTfhRN2w701KTr4Hxo7eOkBqZ6XyIjC
         S5YQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5303ath1XbIiml4eCHI9+kSvpKdv6SElY4I5iYuNCh8TRHzPcRXz
	AzPfK5jqO5tY3ECJUJ7cAQs=
X-Google-Smtp-Source: ABdhPJxYFWhozqbq+hyPtHWW+CYB2KsUxTu8DQZcmpzwCAvanO045piPSQ5tDo0Oh63J2feKCQ/uCQ==
X-Received: by 2002:a19:6d4:: with SMTP id 203mr1514122lfg.391.1603292056534;
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls122788lfr.2.gmail; Wed, 21 Oct
 2020 07:54:15 -0700 (PDT)
X-Received: by 2002:a19:c8c2:: with SMTP id y185mr1454391lff.231.1603292055440;
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292055; cv=none;
        d=google.com; s=arc-20160816;
        b=PyuTvnpDQO0qy7Pak/cX8NmB9KqLnyEb5VogyWVfhqkHFr4vKYjSHqT4i+hgOrEwfR
         ywJK8yAPfvoo4NBepdb0mFXOrJkIsTybg2sd+gbvflVsgTlg0LtTKwhGBf5WCqHIoteJ
         kPKtjPveUQI6ykoJ+sCW1w12hEsLkL2vFsYE4F8kxN9GviR8x15DcK4AJl55QWhrc4tU
         yjO3GwCgM3XtE2YvmWq4r7BOmZvBYe+NaV4R5cu5XPCFSKM2Wlwnp95HW/jf6cOt/89R
         CRsaZJwX4crNP21e7wg6sHfo6UDMTtzlMRWUIJfRJuz8SWN7a0/EtdXeqHNGZ4b2/s1t
         YQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=1JDSKzuP8HgjOnha6yafeJvOg14KzFdXWnj91RmzlhM=;
        b=H8/Wa0uUMLPw1oTqVdRwyqzNiE0R7Nk3Iwexkg2bmRaWZGUQY5c3U0AUsPVce2/RCd
         Dwb704Flzl91NMlf61tsmTYOQ99V9Rr/SQirE5+DStPMf4LStMu1FYpgiQV2ya1y9EVB
         eoWCvxRQpWZB/JwP0i29mok01kRBUC5MFwIdBNM2g+yi6/wkV7wgXzszmdbF/DJVhRsd
         MG8L/QsJmLhr2Bkcmctx1ycvX5t8d73iA0b+Cg8j7zkIDzmErAZ0S8iTWsQCALSL+ArR
         WQtf0n8ReMyHtz6xZA5xWzyq9pM8KPI33jSaWSlxgbhzVMvxtY7x89nUXqAfMjNw7iii
         WW2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=s1WuUZqF;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id r22si56000lfe.0.2020.10.21.07.54.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRV3phszyWw
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
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
	with LMTP id n7HYbB62F4SF for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRV103WzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 03/26] hypervisor: protect inclusion of processor.h
Date: Wed, 21 Oct 2020 16:53:41 +0200
Message-Id: <20201021145404.100463-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=s1WuUZqF;       spf=pass
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
 hypervisor/include/jailhouse/processor.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hypervisor/include/jailhouse/processor.h b/hypervisor/include/jailhouse/processor.h
index 4b0d64c0..639b2e5e 100644
--- a/hypervisor/include/jailhouse/processor.h
+++ b/hypervisor/include/jailhouse/processor.h
@@ -9,7 +9,11 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#ifndef _JAILHOUSE_PROCESSOR_H
+#define _JAILHOUSE_PROCESSOR_H
 
 #include <asm/processor.h>
 
 unsigned long phys_processor_id(void);
+
+#endif
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-4-andrea.bastoni%40tum.de.
