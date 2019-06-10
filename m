Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBR6D7PTQKGQEJBDHWHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6783BFAF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:35 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id c1sf17564215edi.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207815; cv=pass;
        d=google.com; s=arc-20160816;
        b=dR6amekHqSW3kcIssOURQ+1ANiwdmIhVLQhm2JId1vm76QzRhIGfvGPKopL9HVK0w8
         T0BOK+j0awBwjAFR0iRdpYhvGN4LzeZysr6f5jyne6oHBvJ2VRpCdbIccR7hoU0lINRs
         EX/1nnOUDREdBdwI5S72JM17EYrLff3OcI1bkUjLMnVGeTArI69N00fS6FCzcMGpO9/y
         eGnHssa8tmiKjIMlEOj3KflO+EvQPaHGdWpDSLbmZWP2Rv/DbGTORLHtO5gfONEcFg6U
         7lksNVHFWhqgaNzvE4hNJ0MRVc7b/99XS9RuJbGyNxxr+sr7+4QygwB23okwP5HsZGpm
         kEPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=fjstG7jAlPmgyD515o7xme2/240hUbkU50YbOck+okg=;
        b=LC3fjuH98SUF85N4ay9hxykIM7+wWTZGD9hYdyWYw8nFy7V7SHERD+mYwV/oIOvDHy
         bzZ+Y3RF1nH/zEGUAzjTp80bH/W9/YFOre14eG/IKuTwTBa+dHsoCSy+xKEVfYsth8j9
         AIH/9o+F2OzYqntzBvZNAGsz51z4ANQ5ytsN91EeoTL4ethKLuqq4G3TFGMZvN1rH23M
         Q4UTnVc2pU+GPgGMpDF/kAGugsIg62e0qRX2+7p1WtKXDXgzQgmXZz/MN82mc5WoNqi1
         tayykp+hVrn/nZvKQvfJfCtAlDLBHhyqeLz/cF0yjmVyUYkb+Z3LiJGfrzqbIE8vynu/
         ByJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fjstG7jAlPmgyD515o7xme2/240hUbkU50YbOck+okg=;
        b=V4ekegEm4AJJ1ecUAuQv+ngvBbStxlAObIJm9F4Ede8cWf8GXM1BvfrkRlrSs4ii+p
         xOLMyynmcfoFwKT+GAeFf1jcBC4ktBSKnf6eim+p2Bc6WR3dZarymCC5QBdgchyhAGqx
         kkwpDCvAP7qLCDXMOEAfD36oQhwfD1ZfwRVRWkTSn6VPaUysUTRIP9uIQL+ciuSZg0VW
         CvrOG4RKXyDVObTqZhv1309Mh7FpQ1Ah/T+dWuijpMjf/fIz6k93MZoEvTVi00J6z6bu
         IYwtB3sXG6XUIKdpwJYh0mSvBnWDC3M3z8KzD44yLXvxB45gahiJfASPdzC+lhYwdyka
         i9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fjstG7jAlPmgyD515o7xme2/240hUbkU50YbOck+okg=;
        b=gZjyR9wztpIJjwP52CbVAjbN49gv3BEcgsRTRhngNqgxnEWanijwqtSvz4HkRuoXXK
         2oqy1X16TBe/1TIFO3HI1ktO8sbZsXQF4tWnVRSBo7dTANz9cZHWoSsrwGaycCIskNNA
         GqMGgPrTrOPj0C9k1zae1Uho384jf4m+lGQUNS0tzqxYjytY0PO7GakUxCRfXQNW5UWe
         qKzUjW20ZdDgOdG4J6DvlV3zb5DLyWZSUfZS9/dDYVw0tnXLp1W6GHC9bQFOu2JWJA09
         zFLTDML4hmPTiZCJeoP0HtWhDuPGEvye3/qgoKi1wUOqQ2+NTwMgL/Y2YTagaNRpmJ/g
         9s7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUEyU/bpeWMrDRjyMAp+uhEcSOBl0cYKhbgQEOA6qmanyRITVfl
	G/i2/IeKqYYci5c3qm3Qjnk=
X-Google-Smtp-Source: APXvYqwJcJ3GqwtS/v927V/r70p6Os5Vxpj8uCHFviH/r8OqtJAZIKgzP3rGCeVAeBo5/KM1++erLg==
X-Received: by 2002:a50:ac12:: with SMTP id v18mr51597338edc.232.1560207815369;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3446:: with SMTP id d6ls4185284ejb.2.gmail; Mon, 10
 Jun 2019 16:03:34 -0700 (PDT)
X-Received: by 2002:a17:906:6545:: with SMTP id u5mr63642323ejn.102.1560207814892;
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207814; cv=none;
        d=google.com; s=arc-20160816;
        b=GiK4inp4SBQssOts3zmXQcXklRg4LfQAtvFW5FcFXTja6x7byG90Ehe1Em1j4tQia3
         D/kM/u8W07bCPFMz0xAIO7Kj1ppEAss2+JkwRwIepOPeC8cuZCIaes1If8vb9/jFDy07
         +NPuWv5h2kDYfQu0WK4/X1osN3CnU1eJjwRCGM7BOTi0YJfhuO7uOoMBv7AyrTuoMSDW
         vzTiEwGCMlz302rDohsri0WpauQLqGMI2Gtk6JbeRNOd6B18Bq/fmbMx7FNz6YhmwJQS
         +rCtFaxQjOtAk/ybjuTtQsdNNkN9TUL9uza84YBXxoOlwPf30MvDSKdGQdoQxmwSltgp
         KcOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gEIum+ButGx9KC0+4YBEgLap8lqRhOs7sTnH8KvoOUs=;
        b=enG4VM6+YRctbqmpKX68L9bM9zStU732C7Y40oXR965y2nFk2/RZwAUt+lkB9WjUS6
         BZHiXiyxkW9rRQNbp9K+xS3k0ILEB5GbJV0XQfmPuVc59yM+nocmsEcE1aGZ8yNcT1WV
         dteOPUOaK9SREw3ljlxEsYIpk1ryV9FXBur0xtCoN/f31k41iPPa+DY3SP3HooA7qv4W
         SHQ8wI2qrxtuf1JG52zIb8R5PvnnekkRoRHKPOH8xWL56bYIBP8JHV51qBqsyBlvExNr
         ZEjECgZqiot8mGKWp1J7/vwsj1We9g2ftYB05e5pp1ny2q7V8WGXtSzNj/khIau0i22r
         +m3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id e8si503336ejk.1.2019.06.10.16.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wQ36WWzy9v;
	Tue, 11 Jun 2019 01:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 04/10] inmates: x86: rename header.S to header-64.S
Date: Tue, 11 Jun 2019 01:03:24 +0200
Message-Id: <20190610230330.21419-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-5-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
