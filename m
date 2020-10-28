Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHN4476AKGQETCLXIQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6529D23B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:50 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id f4sf297733ljn.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919390; cv=pass;
        d=google.com; s=arc-20160816;
        b=s/RmA8PaZtfk1BsP8JWunucMR/oy3bWtUULb8aMPWECDarxwXzZDusz0YSdhKGNVp/
         Zz5U+JUHWk1J12PPh2dy09AoiXksKVibYn5wXQoWM3P9MGrafoqtvS+tLDBho5KKEz4z
         A8NnynrTg+XsPMgEp+WPkW+Nl1xTzuNZuSlBHP26yatrExx1ADaxbYbxbBeQ7OuwJM/5
         fjGd2KIEU4Ols4+3C8FHhqpjqe0AfYUo9lU6YTTQTPGUJBI4PDoBLwcJ+vYiWJLPMd8m
         TXLL9IMUk56kYVduk6dUvz9tYYtq99fmwwwuEq/UFDBYerSfkXQTfzfoiSWWxXmiMvS+
         eKbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=GmVZMx6bKkYj/fouudunTsp0sksT1cGrSpaoyJo7tNw=;
        b=ONXtfkIb7PUxvEh1EB/gGRFN3VuTnOPOyrbbyhEfPq5xyE5KvxmT7XcjrH5WKfsTvf
         H0CXbYVlZEsaUVj0anQg0MKzuCOVQPldCqSYn/iG2r+EG+i1MDtTIEuqVjl3v4kdPwjm
         w4rBlmYozh7g4Eax7Pdwjt4R9A1omGRmfca1rS7htgYUy9kcXd4NP2q0ocIfkTIfZo5Y
         6caxPA/QWyL7mapI8YpeLHPoJDIwWJHSO/L1zQ+dmiii/XYFnInDaEYZM6pNCz5aqeOT
         V7QcGvORTyA15I2Mf0DH9uCOHvalQLQThbIJhwFXqesdEB7qbdDd1BQdTjwocm0ULPpO
         ok+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EibxfSUK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GmVZMx6bKkYj/fouudunTsp0sksT1cGrSpaoyJo7tNw=;
        b=cUs8DzcR9iTYHwuDil866NIxyzm55J87rU+0plYwyW9vZtxM49OvATOH1aKoprUdpq
         z+8dYuq7SyQ2MGVjuC3/dz/g6wgmQtuEPxa6vk1Tl0PdhvPRYEKlfaE+Jo61hNr1sMvy
         Y75i6fVTOBtXhPI5eECQI3GSM7TqNBKZ/Ubjicc4uvxwG0DhWtXDjDEqC2C6qsJqxlHC
         QK+zHlF+yghNn6cnzTrBWb0UCKWSAKTA0w7/26EJdC6PehaVa6LTmX1y8r+Cn9z3PQRZ
         kUQuxY+NqLOOtETIJ9Jn3o6kK/aiL+dbPdP1iNWX+5JKDUZkegJP4GCc/IWb2X1APRaL
         BIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GmVZMx6bKkYj/fouudunTsp0sksT1cGrSpaoyJo7tNw=;
        b=Wl2B8Nople8KZaRg2l2o6hdZsFXoYBAFy9Ze1BEry+uWxQnk0R//E6aFBXUHxKth+5
         ZO/jNVW5ZZw8848Iy3T9Guue2U0jq4vQnMetNUqzBZVO2QPJgQCbpmz6yVTQ2w3zbRNJ
         p01q9mYyHFtD8F5MD1fVVmvomNHQ81learEB5LjWJ+vnb1qmEBT0u814QL7X7ILKBXyH
         9YGVPTW2+su5TpqLRzCUxNWWjQ8KfxlyeHFjR8NFCNb9rc/cKBMXr8paHg/54une9McO
         +whrDVnLfcwTzlabRjv7ME/qPpHcoCE8l5s8dfyOH1fYRBT17HWxaXTwspRUU7byxFCg
         5TUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xdRW8O7WbbDDFLhT6z71g7KfkFh1DBkoz5399izuHvvnispnw
	NY1Gq2X9YrxuUyMuUVQMBqE=
X-Google-Smtp-Source: ABdhPJyKKWgiPcVeuyY+MzG+m7QIwqk1TlbkGt+LeiPZdlhnz5it47iES8bxsS7u1TBB2lIPBYxWmA==
X-Received: by 2002:a05:651c:238:: with SMTP id z24mr485978ljn.408.1603919390471;
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls268861lfr.2.gmail; Wed, 28 Oct
 2020 14:09:49 -0700 (PDT)
X-Received: by 2002:a19:6b0b:: with SMTP id d11mr373713lfa.295.1603919388951;
        Wed, 28 Oct 2020 14:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919388; cv=none;
        d=google.com; s=arc-20160816;
        b=fa2FtTRFYvfiuMJxe/9t0RvjjmYoj2XFwwHXcmfMcCkAsm+cKIufYCT7LfP9p57Vc6
         +4OrdJRHpTIuhuCwhE6mBUma6T7uA124qpodRjHgFqMq2ONW4WiUifAkSSgdAck6Ksox
         XQCqGKJNgRjaKDh76BaZfUiTLhgu65ZJhifsiMlx/6GSJMjKK8uyPYCdTHpBfalB7UcC
         Tvk+G3SnXbobe5QfRxMmpNj/MFxAls5pcGm4NeXORQWeXcbAHv0VnvxxMoZmEcYDqAz2
         P/ddIYyYMA8zWNraOT8KFgEFdVKDKUw7i5wumRSuJ1oLAGjKDBM3NjO5xLemvE9Flo59
         rwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=JmGEl9x81DjJhZR45e/NS0IYtbdh91oAquXILn0UsGk=;
        b=JL8Yp7nHFsxCaI+cdnaFAm3rNTBIhCw2Q6Ln6qwb+mG3B1+MGEtaaGoJZQVeX/z2r+
         cx/oxdwisJHo0xr5tIhOp9p3+ZDU+8pz1X/MebcLsFTfUBwwY+QcRXpsQD85jlWXFOX0
         zXnBl2Kmhv81HOjn8Z/m4wLhaFmZN9NS9YS0ftUney0nN5LiYVfkhbyegu/nFSStwORu
         tMwHAqmljzUxs8hrOTwAZdkXyTMXoWLuKcze6FFGVaPveHdN5DGsJTA5GDjuh/WFhd5D
         ZuSHu//ye0X6bjMx7X5U/KVArPtRu1pYRaWxOjdRVM6ce55jyIgXBuwJ42JvJJzqNaBo
         xpvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EibxfSUK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id i17si18025ljn.4.2020.10.28.14.09.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rc2ZZ6zyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
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
	with LMTP id tdLKR66HAipg for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:48 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rb6nLRzyWq
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:47 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 02/22] hypervisor: add wordsize dependent size_t type
Date: Wed, 28 Oct 2020 22:09:13 +0100
Message-Id: <20201028210933.138379-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=EibxfSUK;       spf=pass
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

This solves warnings due to -Wbuiltin-declaration-mismatch

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/string.h | 5 +++--
 hypervisor/include/jailhouse/types.h  | 6 ++++++
 hypervisor/lib.c                      | 5 ++---
 3 files changed, 11 insertions(+), 5 deletions(-)

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
index 828e40f7..6d78ad6d 100644
--- a/hypervisor/include/jailhouse/types.h
+++ b/hypervisor/include/jailhouse/types.h
@@ -55,6 +55,12 @@ typedef u32 __u32;
 typedef s64 __s64;
 typedef u64 __u64;
 
+#if BITS_PER_LONG == 64
+typedef unsigned long size_t;
+#else
+typedef unsigned int size_t;
+#endif
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* !_JAILHOUSE_JAILHOUSE_TYPES_H */
diff --git a/hypervisor/lib.c b/hypervisor/lib.c
index fc9af7aa..3fcd41b0 100644
--- a/hypervisor/lib.c
+++ b/hypervisor/lib.c
@@ -11,9 +11,8 @@
  */
 
 #include <jailhouse/string.h>
-#include <jailhouse/types.h>
 
-void *memset(void *s, int c, unsigned long n)
+void *memset(void *s, int c, size_t n)
 {
 	u8 *p = s;
 
@@ -33,7 +32,7 @@ int strcmp(const char *s1, const char *s2)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-3-andrea.bastoni%40tum.de.
