Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBTUQY76AKGQE4WC6VEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D487296437
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id t13sf997268ejf.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389519; cv=pass;
        d=google.com; s=arc-20160816;
        b=LnOJEo4H8iYZe7vAYfMzRBWM5hqbyU7VTizm1SQEN1ACH6pcA5CtvyBVFEBFGp8xw3
         aKXNwMcKnGwMpYaifEzULG3Eh94vqN9MJtAyGsoP5cI9nvVWc5mjQTyK2IJHmZsHanvj
         xn5w86c4KQSycqF7jFKFUi8osMpZKxPsXdkkzB83sWueFr/bTrjYJmz/qjALBGb9e1tY
         KPn2fyElV+M3PjI67XoeXzONFhwVU2VitAwaDa5f2JRQjOmIbKvxUYcexkmyKVvD6z0g
         av2rvNJBGYVAWvwueoVTYp1VoGKklY/pRkAzOR7dUFjxlrTzvzpEI7u7FGOtAJzAWHmS
         HMiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=moW6bvZvlN343a86pES+XfpvWFc4n0hvyXWuEzrcbpQ=;
        b=URU2jYDHjJj0CbR5pmcfKJRja5idjzh9LjcOh9Zcm9Nz9gZ4K572y+pGzSERRc9sV9
         LBHgTTWcD1ogoHU4LCRTjsTXi7rQG8JYJtiTILegCgAJH5sa5sw2KAtYIHB1lEYSvGpY
         cpZE+Go2m6Jmbml5f2GSt3XLqP6+ahWlkJnOhzRy9U9+AS8ymg2PXuwVVlxyjBvKzU2J
         j2zEqFbrK5183syaxEsUA22YYrhuaUDVAotQeLwZ+ow2UDydzd+4dj3KOzhauVppI5dX
         eFWdPt8xnr105iFN2JjNp5sZVNVyZVWNWbk6JSNBUYQ43OMcwXD8/cp1qfFH7ZT6UNAQ
         dDNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=NMKZ6eJE;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=moW6bvZvlN343a86pES+XfpvWFc4n0hvyXWuEzrcbpQ=;
        b=G+RGSdWRbi6DuGhyggYCBpWcqd/HRjHIrzazETjbIIFtOxvgP9LE4Y6pT+rh3+wobo
         nrA7RT93HWHyC4pPSfmCtlpKkyL8xaB0vS84MEMLe+kqntXJBpbtX+8AUP1BGCfLDCLp
         ztdWuKilfB6X16pNVUgMmd6IMufbed3/K769dkx82KO3bTsmWWaND/FpBBrsOYt7kvf+
         L8t1/0ntF2pY/ROayX3L9Je8ET38MptPgUkaBUwkRfh4CRIqjASrCWThjgoWctMwY7K2
         paFOKOF2tTB4SnBHu8dD9gtPUYEcn0dw8r9U7A/0BygQxnNN0deDkFl2UaPPCnQHQfg4
         Ro9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=moW6bvZvlN343a86pES+XfpvWFc4n0hvyXWuEzrcbpQ=;
        b=a7p+ylRTCNZoccLpZkz7OXXgLEsnMSyN0vB/v15QzPBY1LTNQI2/2aELNPdiPOMiex
         2K8QHohDX4iOSY+X3O7DLzaNeY7TqbsVvvNpRsrzKeK6GA95hj7uezBi0sl1loZJz+h4
         Kna0NGKYZpm8/X2VAtMIQ1VdOXCCk9JEn3hvBsNCYIdrR4ENoBDEviTNLHiyg37RF19f
         nuLgcrE31qJB4wYD06bKNJDMYR45yZDiDyvqAty76OMQQ4mr38Jk1nOoARUnv0JZFqye
         Fo453bo/Gu8UELW8wjLuO+rTZTssZ/HLraLAGlU/uxlc/gKuIwoQFzHGDnOOJC9yKDZi
         yLqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530OjWNZoicrb8A7vGGMP2nago9lqO426+X8oometaUpgXFO4kHz
	+q4JsDt96lHBgI12rUGrojU=
X-Google-Smtp-Source: ABdhPJyMSwDQVOiDHLsFyxV8IZ/5JqafuJx+mKam4H4E6a+GKUko3aVEKgoOmQksXbg7DBs8cjlbbQ==
X-Received: by 2002:a17:906:cc4d:: with SMTP id mm13mr3472606ejb.330.1603389519066;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b051:: with SMTP id bj17ls1284499ejb.1.gmail; Thu,
 22 Oct 2020 10:58:38 -0700 (PDT)
X-Received: by 2002:a17:906:934d:: with SMTP id p13mr3670898ejw.532.1603389518041;
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389518; cv=none;
        d=google.com; s=arc-20160816;
        b=lbdUu+0ISsU7I71hyLOcK+widDiPvuK74UbqzzWW9pdEmGDk7o8ffKWDb7vXDts/Ya
         1msaoMZKbCTZM3TzpOPaMdYqcApzBuR3oCw9s9kvmG5P+ghNwicecDisv6YBzQT8wn6O
         ss9VOsYSwSZGjLy5IAXuzfifea2QashLt4eKl0tv3h0PITAwKuBCc4qkkTCPXARgYa3H
         dd+zMpITM7u7zR8aKnl3Vp4z53P2whOyx6cOCAtkwbEv2XTjDkWfkQEnJdjRl2hNoVwj
         VtJmc75D1r1jEoloRaSsHyTSMR47COvyoLpAeJdZqW+O6msHXZBw/Z/38oGcspeLtJgx
         aqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=6vLeghip8CiFTnfbf61jabIoYaJ2bREpPGGyLAGY13M=;
        b=QVfM1M76JkSpG5dqJiRH8/WjP523yEMGgEno0hx/2v9dXBbMdihEwtb4TvQ81wyFeN
         NEYbT1hD+pOAW/gtjVb3k0FBmsvIzLRUP5ZkkhdYGqPj6yC9FNJpzf2BAMM9N0f27Z1S
         kxhYEfFccXAFOtOXGAoabOMXPnpqa4cbKOFI+twsOHJntWOWjnyy1yCZom5DB1J0n3dh
         a1yXWsydBc071BtT9V3a1F3GA678kwJHxbhAT1RZLdoGjDEwoefuZHymjPUA/11HHf5i
         qdC/9jxVdWq1HQzRuLAR35ZfEazFNUvWFuITPIeHdIwya4dakXI/tnqguuID7GlOJpp5
         SCzQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=NMKZ6eJE;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id n11si84198edi.1.2020.10.22.10.58.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTn5ktWzyZt
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
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
	with LMTP id MDEwcBP3M_O9 for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTn2S8hzyZr
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:37 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 11/33] hypervisor: introduce uptr_t (depending on the wordsize) and define size_t accordingly
Date: Thu, 22 Oct 2020 19:58:03 +0200
Message-Id: <20201022175826.199614-12-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=NMKZ6eJE;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
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

This solves warnings due to -Wbuiltin-declaration-mismatch

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/string.h | 5 +++--
 hypervisor/include/jailhouse/types.h  | 8 ++++++++
 hypervisor/lib.c                      | 6 +++---
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hypervisor/include/jailhouse/string.h b/hypervisor/include/jailhouse/string.h
index 24f0b0b4..7dc3de3b 100644
--- a/hypervisor/include/jailhouse/string.h
+++ b/hypervisor/include/jailhouse/string.h
@@ -12,9 +12,10 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#include <jailhouse/types.h>
 
-void *memcpy(void *d, const void *s, unsigned long n);
-void *memset(void *s, int c, unsigned long n);
+void *memcpy(void *d, const void *s, size_t n);
+void *memset(void *s, int c, size_t n);
 
 int strcmp(const char *s1, const char *s2);
 
diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
index 828e40f7..f97dc252 100644
--- a/hypervisor/include/jailhouse/types.h
+++ b/hypervisor/include/jailhouse/types.h
@@ -55,6 +55,14 @@ typedef u32 __u32;
 typedef s64 __s64;
 typedef u64 __u64;
 
+#if BITS_PER_LONG == 64
+typedef unsigned long uptr_t;
+#else
+typedef unsigned int uptr_t;
+#endif
+
+typedef uptr_t size_t;
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* !_JAILHOUSE_JAILHOUSE_TYPES_H */
diff --git a/hypervisor/lib.c b/hypervisor/lib.c
index fc9af7aa..e8a9733d 100644
--- a/hypervisor/lib.c
+++ b/hypervisor/lib.c
@@ -10,10 +10,10 @@
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/string.h>
 #include <jailhouse/types.h>
+#include <jailhouse/string.h>
 
-void *memset(void *s, int c, unsigned long n)
+void *memset(void *s, int c, size_t n)
 {
 	u8 *p = s;
 
@@ -33,7 +33,7 @@ int strcmp(const char *s1, const char *s2)
 	return *(unsigned char *)s1 - *(unsigned char *)s2;
 }
 
-void *memcpy(void *dest, const void *src, unsigned long n)
+void *memcpy(void *dest, const void *src, size_t n)
 {
 	const u8 *s = src;
 	u8 *d = dest;
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-12-andrea.bastoni%40tum.de.
