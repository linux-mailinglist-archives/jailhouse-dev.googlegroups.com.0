Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBS4QY76AKGQEH55GK5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D2296434
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:36 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id f3sf1016266ljc.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389515; cv=pass;
        d=google.com; s=arc-20160816;
        b=SJuqaDL0bK6/dXqjpXuua6vt3IAYPciCv6GXqtxpdeB/Y9fovbkO8sor0a7Q+vdnQr
         W8cu5SXL8kiMzeK/s/qaFuXg9QYwBCXMpf7TduyBqX3/XG1h3S9DVeEGb6mt0vOIpPqT
         yX7kV9Ti1hpLpjLVOFyCwzeudvWTutY0rW8pFiRHKNeJDz3rg5B8QdIQObdkGLfC3Odz
         a+0UYJpC7eHjDcCvVE4HjNstTuQF97uPt9mPDSd1l9FrIiurG5M8WrPrs6Q+B4nhuATZ
         7eVWmk1pH92AlQc1JGh7VTPcL/ie9P1agMeRPw0wBalKbmdSAlUy/JdHGNIfuFwqncHw
         o/7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=X7vZOew2P2lsdnmyKOFuReihjA9kv82/b90uXl4k/kA=;
        b=IpXocQqPw5CLq5B8BnUXUgci+TXfj2O9AbDHlYLrdoCZKGnpcpc7/Vefk9VdUAaUkt
         RXu45HgSlS9riztA3o5TFTJ3fWQhKS9L/qlQCTvcRc55eEWCMzlP6RHbjbD12HJSBImu
         +A89AYkpatS3eJX+Af9O5QScd5fMKV5hs6tHfk6EB8gDPr+yeYedSpy1wEqgZF9Z77DR
         GSIeCXdXKPXWXNZ2HFJy5HzyZzu+KUDzFkIE2EvIO9V4vNF+qShHJ9iGsR/bGwLUSRGF
         k0otHkMy3xif0OlM5BwsfQLeFYQI9poXdPL1EkdZqp6qQyN8eg1FcAA3my8b2FnyWvFO
         IHiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=s2Kd9vpq;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X7vZOew2P2lsdnmyKOFuReihjA9kv82/b90uXl4k/kA=;
        b=ImxLU/uU9ZkHKGFWpE9bZpylZHFl4K/Vn6wsaVAYFYYB3v2S2msaDZQwjTmGSg8RAJ
         AcODJBNDhGVoaWE9qipv9VUM9OeHjuwYJXQNNs0jaB1qu0p89U3TzDeUeLgRt3mTo18O
         VuE1zjJgLZAYPuTqqGkY/7ioPjp39Zu+47oreST7gtnJb0GJ0qCH5tXEJROa8uaDwN7f
         4Zu/xW8mThjyRVhzaYrrmYX8cMTEo1ZXNXZwYzLuw6tO2VjbF+FI9433iYoto+6jPKHJ
         8f5WabUzdSK/L4fusCXM4t3r7/X97yDlIpdX65CGr9xH2TEfAREV25Ra6ug+3C/hzM7y
         W9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X7vZOew2P2lsdnmyKOFuReihjA9kv82/b90uXl4k/kA=;
        b=Za29unJi1rNlmA7uz4Y76mgYfWb0q9aDGj1gO4aiaPZyjS01qV2wyoLGlrJIygsrpH
         j148EVK3UTBCKa9L5CnDtRF9yaBkkc/L4TMnpkjpVNSO5u8G9l3d9P/3ZmqaMc0hfwFJ
         aPTMrqlwzYTo6NQqkPtPWhdzZgwfv/mIDnv8MAeKaG9R+1Oh0ahHTx36WMW7PSA4URrV
         jZGNyba/ZKdng+HZYRQRM9A04HEIYxJ5azYnCPcCUbzcHXmP99ZdKLrkw1JCV8MGLo8D
         D6WkfEdIHimkjv3uOIg0glLi5nQ16v3iaCjzLTF41tblPeV6TYhEXU5LbhCGXntG9vIV
         u0ZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rGaFo6fRJKcz2SdlrxoJuXgHRMLywdFiO3BsCmrw1aPjDafnY
	O1z8nl05UxzmNVyh5Dm0KJ4=
X-Google-Smtp-Source: ABdhPJz5cateOU7n7/ZCYSMwbGgbUYeBKatzXvSd0pmD6XceWz63yqpyoZ5Fz31/nizJZZQp5pHtpg==
X-Received: by 2002:a2e:6813:: with SMTP id c19mr1524833lja.152.1603389515601;
        Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b016:: with SMTP id y22ls497867ljk.3.gmail; Thu, 22 Oct
 2020 10:58:34 -0700 (PDT)
X-Received: by 2002:a05:651c:234:: with SMTP id z20mr1543872ljn.337.1603389514486;
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389514; cv=none;
        d=google.com; s=arc-20160816;
        b=tGg613ZK/5kQA5OUIHAoPAZrVvdd6IZ39iW34ETFWv/byXgrDX2WkPJQWFle0Kk58A
         0UM+3cabSNIckIwTb/4A6NwGV/HQ8nvjrRGCjrJ7R8QGICuZrUMlTUkYaGcwrEKnCKXQ
         iVpCS5t3PANVspjjthQ097A+yeurzXbUA4oaOG/nXG1UNrXuCXahgPZRl8TycmFD0xNk
         RxSf1g2gFzamDohQUoNsEGxz5kqGoD2oKDesoLQC9mkze1McY4xbuWOvpdW3lBXyQ010
         rRaWC0jklFWD53H8DMAWI7DylBeBpB2ITAH8IeasX3HAjNwQeHLtRHd6DO75xSjiYL18
         AxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=1JDSKzuP8HgjOnha6yafeJvOg14KzFdXWnj91RmzlhM=;
        b=Rohyb9ZgVNhdsSWEghIt5A7nKivNmYDVyPH0r1Gt803FQIR1UanBuh9G7g5XMmSSvh
         WB5W2d7sm1MyJxmepKJVNrhSh3bE79WJvKI+1Qe7Jx70eONFsPLxhJ+HolZLJRqR1NmM
         1WzHrZnecMGIsQONsmeGQAHS+8wgp1oUg8t5+a+/9QVaFEWBkTWivyf2Yhke7fybEIp4
         trWxONNmSL4W9CK7niBgO6X5jUXkC4OMUI0AgKz0lBl+qqmfZZTB6gfQOqKdG8OOK7Yf
         Eoy8l3ztjwBGmH3wFu0qvSTyKX8FjlTc38nfnAgrJrMLLYy/9voT+dod/EOomjfauqQE
         JDyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=s2Kd9vpq;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id e15si58839lfq.1.2020.10.22.10.58.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTk032bzyXg
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:34 +0200 (CEST)
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
	with LMTP id 080Ap8tIh_fx for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTj4HCQzyXc
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 08/33] hypervisor: protect inclusion of processor.h
Date: Thu, 22 Oct 2020 19:58:00 +0200
Message-Id: <20201022175826.199614-9-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=s2Kd9vpq;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-9-andrea.bastoni%40tum.de.
