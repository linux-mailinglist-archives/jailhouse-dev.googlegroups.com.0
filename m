Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSUQY76AKGQEV6ZLOMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E129642D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:34 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id a4sf1034833ljb.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389514; cv=pass;
        d=google.com; s=arc-20160816;
        b=a+B5d/wn2fGdsXVh/X9q/Twld8lz9pIl0JmpK5evqS7qp2yduh0EHJbrf0n+PrFZmL
         vNdwToggZWyk7eAW6z6Gg2W1MtEBa+vNE0E7S4eSpy6iw11LWAt6+3BNDvSgzp6VdkSX
         ReSPN7q/8NWAnxcvZMfxwT716xG3iQINR/8PZcm6qIzRgu0E5yXKSoo+JIjGOl5NdPpT
         +Wx5F5p3yajTmO37VqBfWogjAU+n3Tf8su4FolCgj9dxiwwyx/BemRiOz+XFPeKoxlXN
         uu+nPjLr7YDeUeQFO3aL+bfi0oVsIk8omMCDeVc9uaVpdfgcATSJ9YTUk3zsXB6MeEq9
         plPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=jBRkusGJC/MMK93Ipy1QJjWR7ja19+ouRDUby8qtqHg=;
        b=NudUuVkj/I4G56P3hTdCesyZeDRjWvvBMD3xruQ5Gk4DMFzDgFPtcmpKzbri+LPEYR
         FZuoajHan0kt/JY9A9AJEU0d8lDnHkDhuHVWsiVsj8s5LD6J2V3M3/M8RvBO4DhDvZ/E
         e9HX2bNqiDCYE/yymu/EwPeZ4Sln1AZCBvqACjYs6m0oVkdyeqovaXcHQ1SQ2aA7+zYI
         R7WrR0Rl4+3JW2OI3qk5RMi/28NR7JdHemo/pr/ldx6PdZLtGPXSc1cc/7x3MYsI4O3j
         DgvgAXTbJea2S7AnLdHkzzndnQ7Ej8rsJ6wzR3NTdVwI+rODBfjMKXyh7o6UxjKgHQvI
         hdTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=aEtS3OV9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jBRkusGJC/MMK93Ipy1QJjWR7ja19+ouRDUby8qtqHg=;
        b=HNmYX1YsF0AnROeQWtTdFcXaD8tZfPNwnG72uaj7AFIJfiTH5JuePl2BvxCtu3vsEv
         06XEsLOnR4OY6lQeY8huhPyjTzZD7aEdRcuCC78NoULKh3Zm9w4Jwb0+nlp9v5o20L1G
         nYLFfzjiaE5I3xq8m6n+ttyPPEWtlocCJK86o5oBEXmw8PqVPhTnJmPdIotkbuPCh6au
         jv9pah4ZyTT5D4WCbuDuJwvdvHv0QctshDWISlugLvjGg1tcNFIpn3Srzri39nsDVHiT
         gvUuub2W4f9V8MYqEbOTj9PEBjqjBKPWgVxrKbGWtjpqgi3u5pJALQPu4G0CcLV8CqKt
         t8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jBRkusGJC/MMK93Ipy1QJjWR7ja19+ouRDUby8qtqHg=;
        b=rs9d3eu6BJt41E5/YsYYgqGOTlThgpgJU4DOO4TcKENwJsAnJf/xClxEObF8F03eXW
         ByIWWNj3uUKfGKKqPp4cJED6jisxvIw+8XaXLHt6L5SagGV/gPnT5wTt8yaCUUAYDdZo
         jkKwqNn7AGzRBUZCk4fDGQjkILWR/c69Tjk7lobljOXjEpZU5ISHo/+IuGhWzC6f2MdB
         KjXVFMHruN+qW2H8yrVvxD/BoUlrRN8p/e4VZTOBmOoetsMql/8mrMV93M5Dxqjcw7dA
         uN+QgbS1ZzI0qgbvjvRY09vIquBY7rCqpLVcucbRlR/suZ0GAOAf1lFG6nM7uhRhzVkF
         eRcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532vIZ7cfe8ayOrvgkhE0N7KfKsc9S9Li3Z6wfnDJTzqdW1KSkPc
	wkBmTuPUbWPtuIWAeorKPpc=
X-Google-Smtp-Source: ABdhPJyVXu6XPTexZ1MFJj4EvucWhqDAtlQeBxYLocUgP8fDRK9opLZhcst4yrg7PKLwHj9mdyHjsQ==
X-Received: by 2002:a2e:7a15:: with SMTP id v21mr1571990ljc.424.1603389514469;
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8848:: with SMTP id z8ls494078ljj.5.gmail; Thu, 22 Oct
 2020 10:58:33 -0700 (PDT)
X-Received: by 2002:a2e:b5d7:: with SMTP id g23mr1580176ljn.61.1603389513284;
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389513; cv=none;
        d=google.com; s=arc-20160816;
        b=lTrhg4yni+D+Jze3D/D/lYTm5I7dcdBcOHHsqW8I6iPqQg+Wa3djjUQl7vHCfTnYFi
         0s67NqCcRVjmhREppEQ4H8HohWWCfDTlW3OsaF87TKJYRqmtYZojDDOc4GOBpUTScHJG
         a8qsEpsuwFRFdGVT28F8vdhMDlJU5KPXl/fLPTsMLuFBuc+P6T9P6zBI3M1N2DAwCQyP
         21vSgPh9VbDsNqO+GDR3U/ldssjfKXFxAv/Jd3W6vp3Vl/npOTrPyNs/44/PI4CWmkVj
         FnOmMRaajaZPwehMKk+l5Ezr5ittcJ7BS1MStgCU96v+/epSXG22zenrTwpCP9Fl0XZ3
         7roA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=FTpKqzQ7N2OzNuv3+3Yppzv8z9ANc4LpPzWxBvz1KK4=;
        b=eu7GcSfCtSQh3++Vl5ulfCXZAuPZKUqv5YgvVk/Q16UyvLtokg2zZ8+Ek6kN7PwDO8
         AnuZjzLxIBPE81A4Qn19JApqJ5zxKRDF0CBFv3FkEz3X925laDI9sU/OSTnhQ5xrp+jd
         /URV0ae+fR5g6Dd4HtWLVeJW29/tNzRaFEVbwkOL6UvQPjr+DfxbwBKz2BPZXdwwl0/H
         5LT9MDMINxDv56DKWkXOqTfzsalNXl9jWEk9Zo/cQoA1GPWjXPjwCyucuM6PdYeB/tJP
         Yc01l4j/kVRC/AFgTY/0dcyjvZzdnxDzVVg9tx2+tY1M/LF1xEesMKx8w3PRIRLBrrQO
         c/YQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=aEtS3OV9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id a1si88995lff.2.2020.10.22.10.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTh5RFlzyXc
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
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
	with LMTP id wZAxKuUsI1q0 for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTh2H21zyXW
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 02/33] hypervisor: move declaration of __page_pool into paging.h
Date: Thu, 22 Oct 2020 19:57:54 +0200
Message-Id: <20201022175826.199614-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=aEtS3OV9;       spf=pass
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

And remove nested declaration.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/paging.h | 3 +++
 hypervisor/include/jailhouse/percpu.h | 3 +--
 hypervisor/paging.c                   | 2 --
 hypervisor/setup.c                    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index 5513c4ec..8a6ff374 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -53,6 +53,9 @@
  * @{
  */
 
+/** Global page pool */
+extern u8 __page_pool[];
+
 /** Page pool state. */
 struct page_pool {
 	/** Base address of the pool. */
diff --git a/hypervisor/include/jailhouse/percpu.h b/hypervisor/include/jailhouse/percpu.h
index 344ed65f..4f0867da 100644
--- a/hypervisor/include/jailhouse/percpu.h
+++ b/hypervisor/include/jailhouse/percpu.h
@@ -19,6 +19,7 @@
  * The per-CPU subsystem provides a CPU-local state structure and accessors.
  */
 
+#include <jailhouse/paging.h>
 #include <jailhouse/cell.h>
 #include <asm/percpu.h>
 
@@ -132,8 +133,6 @@ static inline struct cell *this_cell(void)
  */
 static inline struct per_cpu *per_cpu(unsigned int cpu)
 {
-	extern u8 __page_pool[];
-
 	return (struct per_cpu *)(__page_pool + cpu * sizeof(struct per_cpu));
 }
 
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 876f1521..75d5da59 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -21,8 +21,6 @@
 
 #define PAGE_SCRUB_ON_FREE	0x1
 
-extern u8 __page_pool[];
-
 /**
  * Offset between virtual and physical hypervisor addresses.
  *
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 9f651aec..6f4e22c5 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -22,7 +22,7 @@
 #include <generated/version.h>
 #include <asm/spinlock.h>
 
-extern u8 __text_start[], __page_pool[];
+extern u8 __text_start[];
 
 static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-3-andrea.bastoni%40tum.de.
