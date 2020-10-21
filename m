Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGUXYH6AKGQENUAHRCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5B294F2B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:21 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id g15sf1785330ljj.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292060; cv=pass;
        d=google.com; s=arc-20160816;
        b=gjmFE7/g0E4zesnY+DUvqVYe9Ji00Ng4vlLt5aMIubIaA/qQImtkEx5ZpA8rOOUFOe
         3azMc6DMBzpU5KJ+AzzFfbhESwHbwGj1Ib3Wjuw7YVrWU1i9v4IH1CA54l8tLIw5usI2
         X9z9T66BIq4DLvHY8l/oKgUH3UHdyiWqtJHuLL3NipbFp2LeWevvPi1Pp8z/APyf8E4T
         FIvfPhWZyKmf9JuzEts66RHzKS6gSTVvxtb4Hda7E7bgeUA2DEVVZ9+vJ7JDtD7wr0/+
         d8Hzbylwab8ukZONqnBuTCyNU+wOYMkmSjZYuQmDFEaV00DRdxBS6k5pg2IK7a+7PjHk
         r3gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Wp43VZfoeoqYVJslXt5XWkU8raT0iIH4KmC+lc7W9xs=;
        b=iexpQobLuQw+Kw/EvwgN03f2i4+5Qw7bEOzWktr0aevGLggsE26rjL4BZXTFPDFP5l
         H7GUhC9VmQ6KnnAqRXaUO/ygNZ7QipbsPlYImG8McHlWyN+Pi3YZDaAplZaC6FjEQ/H7
         kfOybDLu96TwJmSmOTz1dnBgBwN8fthesdvUhXoF8EwqnS+2nL1Arlh3/vVNAgVYGqj3
         pEAVGwYpgClGOdOVSfoH+1DNRtC8OwT1ku6gSc6sdFREuPaKDOEFeK/OFvDrH0V0t30G
         tXu+3rinZRo51s+I0jNfJwpAIwOsrnk5z65kdtuzo1aJbGo/1Y5rhQiR8b8nTdLBgSS1
         LdgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=D6bWGBqH;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wp43VZfoeoqYVJslXt5XWkU8raT0iIH4KmC+lc7W9xs=;
        b=Y7ARBsy0jSb92LVk9qny/BerubL90RfsIraJlONYfBw2FaRG0pPoKQhmO43Cm+qVr+
         Y9VSQfGHJArzLWbk9NpgE/4STdXXnNeazHhrTYcNnLILWKrI7ornmesmcR00KibtkVU0
         J60/7pKUx2NcGqpXMOzGkD3YhFxBBzC9QYTUpcLKGdLYD8KiJNaAQH5WPiSUEDoik6TH
         rtG21tH2twK4bKxOBABMzZPRuJqU/7+KP+O8G/Z0EE/plI1Pcw2iKcCKbCqXXMJDNQUe
         hBYNOhHXYZMOeUUz2GyLIIoP6hSfjaNL5Wy94TtNVCmSqP5m0UAs5yvs0KInK6cyjhQ1
         UZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wp43VZfoeoqYVJslXt5XWkU8raT0iIH4KmC+lc7W9xs=;
        b=bHortRB+6cBO3jGXCcQGX35Z0EpyOPHwdRKwJdV5nvuIJ6SJCXUoJmdA9bqdw2OYkR
         FhZGvgap2sMd2iW26+V5ajki4b7G1JGtKa4X95cAb95Tw42nVrNW7QXYWJm+0oQ3i/4J
         EsEiBCJKTYWMrHK2waXyY8YaxCTKmbPh+aRHbhStQ4WsNW5fWook0XRAqJZhyVZd09wD
         g2SkgEWVSL7ylCbUoA+vVANS7QSo0Xu+Mb8zckf6yxPYLhWPHc/xPN72JYkFgGrmC+by
         Tcad9vlm/vPpe/U1G/AGxMD2UqzeHLV18lveebrZuifHBdTk97Cy8+ujZkPIIvtK4QJZ
         KoCQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Wj4iP0FCxGvq6kwxaL5LeMaMmtH9nBIQ8tAQdW1ItLn5P6kKW
	2Vu34XJdSk6XGcxBYzk1pnI=
X-Google-Smtp-Source: ABdhPJyWlFQeihgn7pfC5rRnntd5Cx5uqSG8As7Puw/ioPiEn64ouW2nHteVI6ICxhLzreSXfDKBLQ==
X-Received: by 2002:ac2:4204:: with SMTP id y4mr1546943lfh.224.1603292059098;
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c111:: with SMTP id r17ls144382lff.0.gmail; Wed, 21 Oct
 2020 07:54:16 -0700 (PDT)
X-Received: by 2002:a19:6b0b:: with SMTP id d11mr1528086lfa.295.1603292056463;
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292056; cv=none;
        d=google.com; s=arc-20160816;
        b=olvffmqPYV0KWe5Ocsx5DyShD9sUSu63w211HfoSJKkmZkAJWGvQgsNLU3WjD1QEnY
         hDty2sdJKTU5hS/wx4rF5T9J2VQRmgAUBwrVtabnA6MvZ8/uYNA4LZlR/0xwIcHxlq+W
         bt3bGpXwiInY/Hbmk4jpam3YFWl1Z7FpBKVKyAMHkrMLKAbWbTxJrcrDO2SlJs5+hT1t
         WpMuK4UyLUwWloOdbW/PAc1P/UPGHwqCT0QtnhT2J4AQ38iP3tpkkqmeTt9r7B3h/sUP
         mJGjIgdmJqHGwL1ayPdL/c1tbGRpflqOmr2aJwYl8LB05OVr32PBCzSqTSRvQjDwMJZ4
         vEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=phKFGIrCZyPcyV1LXI+8Okc7Iq61236DpMmTbVjIi8M=;
        b=U4HJwxOtMWWBfeMev4N1FLR6Lhcl0L1p3k2fozhhQlMlCvpeViEmbb3D7uEYX8vso3
         v0pp3KxvFdHTckOFL6hv6UWViBuZWC6pxbi2BScffZSxGdljNdJDfgJslpXOR9c/1drl
         CfwmHU1sKzWYn1H4tMCyrHK+ZRkqpJuuo6MN+vXMjIa4i9ODbCY9+yw2rc3nH7+tf6Fr
         RexwR88M7T3Zgxmd0gQFlYcYddCspwYDPsav6xDOWB80GWvjvaWP14pqczj2FbW2Q32D
         ilqu1mifrutZ2Po3G9NXaZGg4Qy+7o+K0921eB/Y9qWf0h1gOOLqLreARrKgqt2OsnLL
         92UQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=D6bWGBqH;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id i17si87232ljn.4.2020.10.21.07.54.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRV5nK9zyRN
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
	with LMTP id kHocW5f8MWoK for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRV2vwZzyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 04/26] arm-common: provide unsigned int PSCI_INVALID_ADDRESS
Date: Wed, 21 Oct 2020 16:53:42 +0200
Message-Id: <20201021145404.100463-5-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=D6bWGBqH;       spf=pass
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

Avoid using "-1" to indicate an invalid address.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/include/asm/psci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/include/asm/psci.h b/hypervisor/arch/arm-common/include/asm/psci.h
index 4b724877..a24c0cb8 100644
--- a/hypervisor/arch/arm-common/include/asm/psci.h
+++ b/hypervisor/arch/arm-common/include/asm/psci.h
@@ -42,7 +42,7 @@
 
 #define IS_PSCI_UBOOT(hvc)		(((hvc) >> 8) == 0x95c1ba)
 
-#define PSCI_INVALID_ADDRESS		(-1L)
+#define PSCI_INVALID_ADDRESS		~(0UL)
 
 #define PSCI_VERSION_MAJOR(ver)		(u16)((ver) >> 16)
 #define PSCI_VERSION(major, minor)	(((major) << 16) | (minor))
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-5-andrea.bastoni%40tum.de.
