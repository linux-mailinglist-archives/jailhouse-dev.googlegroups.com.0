Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ7QQPUAKGQEC2MV76A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B88426EA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 15:03:36 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id k22sf25841610ede.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 06:03:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560344616; cv=pass;
        d=google.com; s=arc-20160816;
        b=niYO+1/OvUQh9BBQfCXJOuIboITVPkM9lm/dSFJWgluHdzQjVhL4faurLM4rok3b7a
         kKn+IJy46uX/+3kU9qWZVQ79CsyZlNrpZkKS3JiZ09elO/3gxOgUwlYhnqVsLf9/n0E2
         r8zLjj9b0loKpU8HmxjDjsjnglPQnnQAL7hxhbpfT18SrSjaeNVmshgl37/jzlnz6iXq
         9PuO/7c2lpdmZ7wO4rG1j4vi7xuDdLYltG1zpCeREGw/D+4WoBK4Lr/Fo8mRdcRqjeXm
         VP1EsbdAmO65sJ650NrRr7jbYe3ZTgzyTzhVq3jNaVkpj0LR+p6M0vO9dtmZ7X6TkIVL
         EAuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OY0zMiG+iJ4cLvjd4Uk2dzJ/KqIZe3h+GAoyM13wHcc=;
        b=P1nR/uS/BvteWYQSKMhSN8fFL0EzsUpc5x98nzQgIhgzoNjw827e99eKuDPVyxb8Nx
         K1R68wQ6BNA56R5REjNg7wzAfmHBN+hKwg0IblbLVbZgCpBxGbLCAGkJVlwJpFP4uICt
         zxwOL+DYjviDrpBQULeqmrQbrm25cyfpKHykBGtpCs0YQijC0p1qr6/sdl416ezg7VkM
         t4/DeuHWztO8jJo/Edx7wsb0Y5Wf3QuwepTZtV3nvhbYUl8y2sFWl1ZFhDLziFIRDXK/
         FoufFANsNiqNu0jJCF/cKx2V/UNGIh3nu7rEx6twM25/2z2LaygCOhq0OuW4naE6JeRb
         RMxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OY0zMiG+iJ4cLvjd4Uk2dzJ/KqIZe3h+GAoyM13wHcc=;
        b=ToclLT4WgmsMjVPm1aitRk1MvnoBWe7gBmOzKZEzC/26ZCX8tGGIdjdd+gtmVscJU7
         PQmbFvoJGtkzDKL5Akubo5q9ipmyo/Ll4IvMiZWCUpZPz6UFO3Ow/OaBRGagUkRFoM9T
         OCp401VYl7TjKZ8uEJOS+obflOVZGe39AP+8QzeIKJmJPFBIL1c0kuHao0OEieN8GuQp
         yvG94kUwp1CzZHYwvA7YxbW0XPgei326oTodxMIcxRTSiBvSWeUW52CsR6YFJvRKz/oD
         SL2J1QZlTK+hZG1gzz8vrUbN/pkXOhbn318c8ltZVLV4hW/FM03cqNcxSUEyPpT1oqox
         U6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OY0zMiG+iJ4cLvjd4Uk2dzJ/KqIZe3h+GAoyM13wHcc=;
        b=JtHUjneNSleb1Ed1WF+SILt/EKr7GcHVJ8QRsg2Rqrn0tuhRP2GCFSvCINa7+uwpDr
         tRCjQ4g23AWui2sFy5AGFqSQDZz3EI8wLXotDFM31pZIk+G1g0CP5qFx32Rn+0/a6IGL
         bl5hQsUKZKYZFpDXwl+wH/UFthbMp9GoeZYw22ymArOAnf/j80o0hkHC8/UM5JCWzCaj
         nStzFpfQsBTYnoeKCrRwC1VVpbuIdd2OKiimNDBG3QgOkTp3ST1mXU2cI3X/0u0bkKMi
         ftTmgnUCw2EP8p0F/J7k/uwqp3uT0EIywM69f5Zb2QKf1IfG+QZpIrSckHWNncot7UUB
         YrPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWB5s4Zc204dUs9TNGr9lBYMaL6HYK67EwOBNrXdFcvI/QERkUC
	QVHs+VG3QSpHF9Y9NJ79A6w=
X-Google-Smtp-Source: APXvYqxY7wLyoB21FmtbkZjpc/N1pcY9n117biQh5aPPFlwdqQkBjiIvZ3InuGzjMisanaDznBYdHQ==
X-Received: by 2002:a50:a942:: with SMTP id m2mr36455732edc.73.1560344615948;
        Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f15:: with SMTP id d21ls514082ejr.1.gmail; Wed, 12
 Jun 2019 06:03:35 -0700 (PDT)
X-Received: by 2002:a17:906:58cf:: with SMTP id e15mr20401268ejs.240.1560344615292;
        Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560344615; cv=none;
        d=google.com; s=arc-20160816;
        b=0O5gDrQXpCLR9ZUIaOO4BSHTWn7DlWrqt0xc82HmjkhIc171bugjMe475n1IfBHHUS
         Pq8RouJqVBWMZ20sFscaIa1ixnS3X8nJ4p2h1yd2mWbsDi1irOc1UZsEGGxZ0zUIu7f/
         OojSTKuStbDim23LuYu14t25zH/r95fNavmmr990qKUjV3c7HvVkZSBGTm9oGELUH9o+
         +IbSnAiEduHnJ7duo6z2MwT9P7qyg8e96dXh1UALe8GF4i9Rft1Ekr/iNIaBpiFEjRkO
         g9EgjLOSCpSINNT0Qiaxcw2xh20ryiJCyAgJqrTkdU0TAVfuaRMewB/CnFmvMeJ9zW8X
         g9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=kcKhwK6JK+KGFW3b+YWz3Gz8z9GhDcjfNiE+hpdmYuE=;
        b=Ee171APQJPCnr8eadQSYtz9ATNCApV/EdlnfbLVo9KPHdT1Wog2/sLwsixA0/YsjkT
         vj3PuXtzBRZ+ihJCrBzRVQx/XT230vpV3FTRSFGtBleHzbgPdA8kME1oVpJWxsVOZVIy
         hPL+7RD5LSHJOCFUlRytjGtOvxhP9ZDjni9Y3n+PU4VeOt+HuDgw5z19o6Jpb/8uAiA+
         Yynhgx8LY56f3ybD9bJ6pGPiYgLaGpA3TVdlBe05n7VPCsO86PTfvllOuQuXVZVurGKh
         dWOhYAczC3JBBou5AyPSxIwFhyZDWwNzdqMuXdEu5AIE7uZImj1MTqQCabLjMyPUQXDt
         fXDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z20si811415edc.1.2019.06.12.06.03.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45P6WB4rn8zyBN;
	Wed, 12 Jun 2019 15:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 5/5] inmates: x86: Don't compile smp.c for 32 bit inmate library
Date: Wed, 12 Jun 2019 15:03:32 +0200
Message-Id: <20190612130332.6175-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
References: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.125716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

We don't compile timing.c for 32 bit inmates. But it is required for smp.c, as
smp_start_cpu() calls delay_us().

We don't have 32 bit SMP demo inmates, and compiling timing.c for 32 bit is a
tricky task because of 64 bit divisions. Simply deactivate SMP for 32 bit
inmates for the moment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 258eed18..572e499a 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,10 +40,10 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o excp.o
+TARGETS := header.o ioapic.o printk.o setup.o uart.o int.o excp.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
-TARGETS_64_ONLY := mem.o pci.o timing.o
+TARGETS_64_ONLY := mem.o pci.o timing.o smp.o
 
 lib-y := $(TARGETS) $(TARGETS_64_ONLY)
 
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612130332.6175-6-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
