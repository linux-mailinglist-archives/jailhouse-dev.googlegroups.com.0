Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBG4XYH6AKGQEYP2ZNHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90E294F28
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id v14sf1705002wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292060; cv=pass;
        d=google.com; s=arc-20160816;
        b=ggJ3pezkdYt+UTfaZailEm9Zzf12JARiL6Exqep4EM3O4c+vBAIS/z0csb683h9ViV
         J8n5I8p6zTdfKPIURH4b4VmO6y4NyqIZjJnZhtjy2s5a5Vb1tlsylx/b5GPHynqYzVRS
         jvUgefeTc/ecxEszPhbusWoLRG8rz4N2ikMTnnCDQvlJ6WxB6PdZm85dB5DWpaw9B5yS
         3cd2LSzLPF9Y9K69vonfgXh/7cH733eDcJwTGJFd8E3+cJlknwgfeeHeMqzMEmaRI9XP
         ROKbeMgZMJ7I9QEIgy5uL/yyXGrq+Dv/YsiHasqW0C16ZKpiiICkOuggVNC2U6MDKpvw
         7s6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=AhXnvzI9g+0eDNpWX+qChMohP/xnMbw2kEFPTao3E7M=;
        b=PJI/gu1Iv7sdodG7Am+70OA5AvrLUbd/d1WNsYJODbKdwX5Ov3Gp1kTVO+7v76H0PJ
         /gdepCXH8VRztc4SxMvKGWphPR+ffPbgjXBvo9DxBpG5agoRdMAMrm61gJ1Top6iZWTp
         JIGZMP7NWRgsWpilbmzkuA+m55W2V0oA29DHc4oubB6ZJmLK1k/JoiS4X2AjfZ+k66lg
         So+jwnTOs5bPnc3WIy1QvhTsLiM2XYXukt44rcLKo1/c+dPLx9akUQyXGLOn+Z130qW9
         lGzSNXg0Kus6J/Cih48raNoBL9FqRZj6dcL3eni4h3WbsDoIwWyFUTFUTnRzyw9f7DO0
         LJAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=LTfKNBg9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AhXnvzI9g+0eDNpWX+qChMohP/xnMbw2kEFPTao3E7M=;
        b=Rdek4hOTvoqmFhHkzB9bkeUG9X2R7MRkAWzsPsbjwDSNcrTSAE/Uo78woSNE/9UIfV
         z0MHUNvpKV7ATOnqGg9kkMkyR5ICckP4snzeYpSeHET+CRPz4U0sI9hx9i9bU3vL2NrC
         4YVhiQBjn19rSaxF19RPpodq6Bu+rganWHkNYFrFnYksBABs4shud1T6JRLXP6FZJvUO
         pupFVocrhPDqv77kdGbwqsZpcZd7uBeSI+ifGgXZDArPxhem20CCankNvVCCmtr0UWnF
         9imzKP2wsm2nWmhcSKQfBiQsxsx+/LUWvrn+JgrZ8xppM8hWm6Q/8FVEPJhCsLjxwdG8
         h0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AhXnvzI9g+0eDNpWX+qChMohP/xnMbw2kEFPTao3E7M=;
        b=tNLBOdivws31uC9faGZphwJxAWkE8wCcJfDfR07xNjTu+hDhrr3JamN7bJEvws8EeY
         ulq6dFskK7cwPDvuyb1Rzn54qojlU9cbK0kcClYmwVJlEuS6a3ok8sUHJOwVS2tQrt/k
         WQ6g5/X/XHfYhT3LgSir9VWf7CqBLtWC+nX96J/rBPKmKCapTmvCvD840Iw79awDdOFY
         jCHWK51oI+7ZZVnLM5o/DXE5FxVCK4xwLtUjkWpyA/jt0e+mu/agzmywNCDe6cPKNwGI
         tmdzR8pbPXGGR2m1NBJDy4Zv8mdqPxSGBh2TFDccNz0MExIRGI0V17cQY9Dsv56QNrnY
         vd3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OrgqlIDuuaBzTzLtr3S3I7t6x6Ouxy7L7DAK1mhVtBb7e9nK7
	EEkizyWuok2hbUrdvX1ZlDE=
X-Google-Smtp-Source: ABdhPJyvuvz5VT2cuiw+ALP4WTKa9y2GVNe47MMTqMGL99eUU59VZHql8TG0ARb6t7XeV7gCXyil4w==
X-Received: by 2002:a05:6000:1045:: with SMTP id c5mr5515254wrx.296.1603292060165;
        Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls48526wrc.1.gmail; Wed, 21 Oct
 2020 07:54:19 -0700 (PDT)
X-Received: by 2002:a5d:424e:: with SMTP id s14mr5655830wrr.149.1603292059225;
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292059; cv=none;
        d=google.com; s=arc-20160816;
        b=ncHI4TskzL8CXa+ctlQwpttiiG/yIb1bKMe7++WNSVNlOFBp7E0yyq3x3Z/oTrVcQD
         9+oDloK6KlWGOHlPlCKAb/UUCVyevOMQFJs0CpBtBK6y33MxxQCvJj2RyaJ6aem6YpZh
         R5LbQKVWsB1q6Yv6ZT57hYoQr/VH60EN7jgFWok9hIzwG0SGoZFwS5A29jWdujw2++wa
         95Dbrw/ZAsc7onmhcpsEo49Mr8ha0iXoynyYH6vd3ljG34vU6NSpvAPMEaAeWBAUmjkU
         E+i+A1AA3ln/PIoXQOzTw5k1+zjduDv6LnrX7xRoAugRWiNV5jpw6wD/rnEEg30fJpES
         8IaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=vMEx7cgo8G623of4FrnSPJK7kXJ3j6ye1SyIha9BlcE=;
        b=IzMoplE50D2TdvMK10kagDNNyQ+KZ8DOdbTFhQ3npCbo4weIXLFR08KmoEdGxYb34S
         5x813TNcuFlqa9+k3FDpUpQt4pSc4h6sERJH2s+BGwPlR4NZSNWKdsv6Vc6fGSeVqgPR
         i9/TJiAN+bNsdRfma66T+a0mONu1UO0PDXyLVDR5LOsT1mDroWWSheW/+QHzDfP3vvcg
         JAt8jT8Ibk5/a0mWc4AkHmjOgXJFczgxrbAVPXW8FgrdveL/usp8wMnc3mQgFNOCZ9+K
         zlNgJooAAhtxLOIcOV0EgGo4QUsPaqm8Evn4AQJ8DOasndFY72jqojtSHt73oZXYPseR
         euxQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=LTfKNBg9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 11si70395wmg.0.2020.10.21.07.54.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRb0KhhzyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
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
	with LMTP id ofPXudtNJFcX for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRZ47N8zyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 19/26] hypervisor: introduce uptr_t (depending on the wordsize) and define size_t accordingly
Date: Wed, 21 Oct 2020 16:53:57 +0200
Message-Id: <20201021145404.100463-20-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=LTfKNBg9;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-20-andrea.bastoni%40tum.de.
