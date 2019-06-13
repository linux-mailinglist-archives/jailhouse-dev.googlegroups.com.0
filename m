Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZOYRLUAKGQEGJVUAGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192644CE1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id e8sf58786wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456294; cv=pass;
        d=google.com; s=arc-20160816;
        b=NGvPF82xJqmkLbXrrvVi+9MOmn68+UuE1bfECUrzFVrC2aTd4uwEPNzUn8ZRn69t/k
         LKzzyXWAvZr3gZiwGq6EkRkWfZ9re4iU599ewy2EmpTKP2OHIhwGyfLcsUpHS5xiOKKa
         p52WbhrDrzCxwMpX/g+MebGe3PtrTxx03gXSVV/7x3TpJceClDNluMtWnMaRgy+hTO3E
         DueAMSAdwNM7pBPXMRQZJTPBrN678vZjGb9Qkd5KxdwquplwfEx2aNOuorx4HPlKAbH2
         VJFYaSxnYdSjhRyQ9IufHAnO6jCA0hRvFbCk2Ts9m6HsBkI/uZaj3r1dHzTJDW+rsQaT
         NnCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=X6zP0gXnuZfWypOi3UPjaTbD/bDv9JuXiOh5K7U/2mA=;
        b=pfuKjka1ccHXyOFS2UMfZOUWw0VIPt6CkBS+AzaUi3dlYrQLwdAKuCfaN61gKBfGGI
         LjyD4Wjxe8ZGVDF7XphNr56meeNsV6abGR1RBg0qFP7cJ3nQHjdvyPV7Q5ytl1ftPhlD
         wiMm2RgPOzTSPqAZo6IBxNyV4YA0iPZpilNHWG+n35DXMyBfGPp/CkCr5F87fpIaKeAR
         ixGGZBPPiacHG0PMv+hKjKEY7uoKGwByZP1G4HiydZVD7+cYW17bLMODvZOh5A2xBPI3
         n3/AfiV5xzsxGBZxDGrU7YlkWB37w8IxMgZehh+83N2q/0wdOEVZ5rxaX3lbWivpK0gG
         YMoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X6zP0gXnuZfWypOi3UPjaTbD/bDv9JuXiOh5K7U/2mA=;
        b=Zeoc1desU/PpN/ver6QX3vJW/1HWJNrD60F4RtGOh7AdlijbPRluHnyThsJrBk9ec+
         wAsJEt8FJWhlOqPeUhZD0jmdgXs7sw5AmG1sf4uCbJpwBA3Ygs4kOjt/4u5QLSQSH55b
         9aRwqIvGVeF1kMZz4t9VnWnPs4Y458z80cNUUWyEViOUi7Kk0IxqqXxbI5ewOhDvh6Fg
         svYesdh77ajhYxD2dPFqDYJotc+XfobXfSOupk4wQB/U2EX2mnA9Q45eKGTNyFwFypdA
         vqGcMSC3jh9f4eLZ31+1IPwvN04c2bXDub3xexIXt0/WPlhwMxI2d6y1djIjYjfefwV3
         /Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X6zP0gXnuZfWypOi3UPjaTbD/bDv9JuXiOh5K7U/2mA=;
        b=qnhMXjD1IZuyZoK6Bl1BjD5NTLRZQCPk/jlZkU8qnMwoaLjLWNgq43YFb6ZLx3s1V1
         bKsjNA6m3lcZK7USlBq8NxGnIcgFBEdludb8GOuh9UJCIcjFfMEr0dt7wP4yGvd3h9Zt
         pj32x1u6B+zDfHxuMpNFAVHVgwrWRFaRcSIMf6ui4CS0GcgDpsOZwgiEcFgElIP70VTW
         qJ38d005qtozAnu6a46fxPei1fTKNQp8YnKTXHjAaBQgzYYHKJbchZtLtJl6IysRfKJG
         bEp+kmkMlCEi2rJX6A8dyeSV8I2wI94jLYRp5RBe220hGCFGuYXOuiAJng8R4W9qYNsJ
         b14A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUjCDum7gVuq+Ls6QLKchDuybEg2582En5cmGippf8V6aPdLwvV
	wNcKYbOT80r+P1ftdo2l6Sc=
X-Google-Smtp-Source: APXvYqzrdacl4F4oNKTt/5G23r6tdVNjBpRPcBZHAl8QDtZVlOKJACDvH/N68kRJqN3gD7gC3S8P3A==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr17116380wrv.89.1560456294060;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d05:: with SMTP id z5ls1648060wrt.15.gmail; Thu, 13 Jun
 2019 13:04:53 -0700 (PDT)
X-Received: by 2002:adf:f246:: with SMTP id b6mr44070wrp.92.1560456293628;
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456293; cv=none;
        d=google.com; s=arc-20160816;
        b=yeX9tVIIoiCUGjmTNLA1St46ymA1wCFWUMkY+49JE0AMAkES2n+cyMBHw8ZIMj8nyL
         vkEJ5Dj7Pq7jbZmZ98jgBg8DbRB1Q6BJNjLxXwEyKq4HmRjaZGLIEKw6ShhdCGV2T83z
         pE75C7D6arAR8kWZH4XYkEhBha1ZhD1Eu12Ez3qSqfDUSmw0LGzC9L2bNweABLa+IkYR
         DuzB3HqBf3EkAfkPeNPLcRCOS5YBifQGZAxZEHU7Ha0Rxo7VozKfNfy0ShqkQT/nEQA3
         cKNQRygAYBscEedvevvrcw6JuIrfMblG8TJKXHMUPVoFa1UMH0cJbqVhxo4RpUvMdwMl
         X8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GgyaWnTCmtNwpNrBKv3UMf5bkSyYPzV9BuEm5FkRHPc=;
        b=KFaztL3o7JBfcWCLNFlv4KFxUkiKkNJAqOCaaZIxvM97NQY3F5ZfKh/ih/2OSKlvL/
         2oB6AscoAhD+o3/Dt4VzAtDYs00rztSBB6nHHkIsXnF8410Xuq8S79ygwkjSRbv68BDi
         iJNMSYtQ350H8FTSxS9MdvYbONUu7rpIVbE6I1q+/UV85i2gIhXe0Ylldlbsv0tQG508
         70ypc+gNh8KzonQ8x2vL9V9TCl5TMcf2KM0Kmr29+3ohmJiKO2Hg0TL5kMli17UpZXLo
         BVigT8p32UeemMVisC5qPVisdezdA2Eyt58OJCfupl1oeRlX/j5i7PrV/hsQMDo4TKVQ
         KoBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h10si59290wrv.3.2019.06.13.13.04.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvps0sslzy18;
	Thu, 13 Jun 2019 22:04:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 2/8] inmates: x86: rename header.S to header-64.S
Date: Thu, 13 Jun 2019 22:04:36 +0200
Message-Id: <20190613200442.18984-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

The 32-bit header is called header-32.S, so let's name the 64-bit header
header-64.S.

With this, we can also simplify and tune the Makefile a bit. This makes
life easier, if we later add further 32/64-bit specific targets.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/Makefile                  | 14 +++++++-------
 inmates/lib/x86/{header.S => header-64.S} |  0
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename inmates/lib/x86/{header.S => header-64.S} (100%)

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 572e499a..f54160de 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,24 +40,24 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := header.o ioapic.o printk.o setup.o uart.o int.o excp.o
+TARGETS := excp.o int.o ioapic.o printk.o setup.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
-TARGETS_64_ONLY := mem.o pci.o timing.o smp.o
+TARGETS_32_ONLY := header-32.o
+TARGETS_64_ONLY := mem.o pci.o smp.o timing.o header-64.o
 
 lib-y := $(TARGETS) $(TARGETS_64_ONLY)
-
-lib32-y := $(addprefix $(obj)/,$(TARGETS:.o=-32.o))
+lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
 
 quiet_cmd_link_archive32 = AR      $@
-cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib32-y)
+cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
 
-$(obj)/lib32.a: $(lib32-y)
+$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
 	$(call if_changed,link_archive32)
 
-AFLAGS_header-32.o := -m32
 targets += header-32.o
 
+$(obj)/%-32.o: a_flags += -m32
 $(obj)/%-32.o: c_flags += -m32
 $(obj)/%-32.o: $(src)/%.c
 	$(call if_changed_rule,cc_o_c)
diff --git a/inmates/lib/x86/header.S b/inmates/lib/x86/header-64.S
similarity index 100%
rename from inmates/lib/x86/header.S
rename to inmates/lib/x86/header-64.S
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
