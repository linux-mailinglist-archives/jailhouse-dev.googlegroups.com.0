Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4UYSDTQKGQE464X7HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id DC93125241
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 16:34:26 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id l13sf8141791wrw.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 07:34:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558449266; cv=pass;
        d=google.com; s=arc-20160816;
        b=lesuZ/kZ6igySNaf5Hw12OY8DVx7uw+MR1bTldHysIrR7N++19ToHLiJ9909sskbdJ
         7aAXEOmMxEiXtXlCxGptgg0w4Q7+XDhB2brACgB0dCDygHP2yzoU+hx4tV6uEyFv9e4p
         6j4gcKOj3ykelzQ2fCnV8C12fxMPNM0qmZGJ4/KUVw2TViIrZCVlNsTyS4rwjk+GA6kW
         BebDaL5ECuIliDYcatJor/Wnudq94Lx3RznNySWz5IyvlyF4spMBMwnlRkTFplWFdwqA
         jTgo69XnebQ+FYiMye+tVGLYgS9WYZPI7QRkx4MApJzpFhEhvYnBRHEc+iMLZss+kaQ0
         yUzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OgEKoI0J+UeaJ6Lu4wYvawnBMGSWJL/uKNxIuLzmd4Y=;
        b=iENtV9SvjKxPj536+ZEr93hTtX6i3UWDrZ5UrIw8RRVDDM3Tm0yM1GHQmj7qPeHE5J
         aN4h92y+d7Evu7iVvFBPINrN7gQD+48ci+iePDcHfsMiaHKeHXV27Ze9pMrQtOVvMEGu
         OI9xYzeDUykUQLmeX+TmPEiVRLLXjO2QTlnWKD390UH9WDoG++1655Ur78Xp9a2BlSm1
         jakdq4gusXC4i07bBV+yjuXswOVRhKB6EeXdYaQQzmOtLZxDZ6a2cpbfQukbBW4wy+LO
         TUey+PcRjiN/56Y8P4zAJESwowr+hdtAJXAs4y8SsqNknQemdmcIsDjF6Z1alCY/Urwi
         NR7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OgEKoI0J+UeaJ6Lu4wYvawnBMGSWJL/uKNxIuLzmd4Y=;
        b=eoOAFZRwaAEMgf+/eztAWcKTOBhuNdOrathwF+Z44EfQoekN144LqKZlAVnyy+h+/r
         6uRlCfTvxVROLjmyPRJgi6793hma8/nRLPn4xcdk7HefjcEe8EOOq2NgIeDK1iPPiFKt
         +4nnDsYraN9xKvessG3tp+TpVqZ2d1nka5OSBF/e5oVYfcasTOHe4xe/G36dfAozu948
         l6oUu5f1hRniFVXbzylrbnLS5FFAgIzqZYqWSRkQZhWC/lFulOtCG6vv+GFGDiwv+aDD
         AEvVzFVP+f/pd67RB2lAeDJUNzwgnh31/jrI1rICao0tiMFx3X3xMa6v8Jjqdb8n2kX1
         gmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OgEKoI0J+UeaJ6Lu4wYvawnBMGSWJL/uKNxIuLzmd4Y=;
        b=glnKO2j+7t79DRHuw3vr7ZT9peU0aEgsmXaW6JnMQPEK8UiVkw0BTIvvZVQjmk6lxy
         efdGQLbzWj6zMlq8FGmU7G92fGXfyt+szKApn8tqT9VNIAuq47d8KJg5BhI6popUE3Iu
         DB2ACKBn1KnWxUOZLtjiBEEhyAlWNKkNoajVmyvD3s3cRi7h8EYspgSXFBlgRrzyEHYd
         8bzTuQ3bjjH/fv896nFyb6w78XUWpG51ejLPDl5f99TrrkAbsFm8igFzC8ZM3WjX8Pwt
         xdh2EM8AjeaKjEdPcK8LpnxoIfxDc4AxUsE49O83h+FqSEYz27UtzUQayC6t5zgVobr4
         fY2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWjk2k6J9ZSFcn4EP9mXpaexYE1c0Gv3e9jgBQWSF4s/DYZJRCr
	dNCzPsifdjZ+oqIMKt8Rx2o=
X-Google-Smtp-Source: APXvYqyAeCAYZshUQ4OuD2tpx/YDaGW0MfaKjNqijZhg2d9gy/NhxVFNEy8cY2Z1FUdctXb64oCPhg==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr4025435wmj.22.1558449266565;
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6342:: with SMTP id x63ls1008813wmb.0.canary-gmail; Tue,
 21 May 2019 07:34:26 -0700 (PDT)
X-Received: by 2002:a1c:7a0d:: with SMTP id v13mr4026703wmc.44.1558449266079;
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449266; cv=none;
        d=google.com; s=arc-20160816;
        b=aKNcnHVnvgAiKfeeajjiVUfym3m/Wp2ivLkg0+Zmbi4jKioO6Z+TSNf/ZHjXnBSO+v
         FjhRec/6jsv9CnWz8phOvCveye02a88Att0xrKmL5tvIhOQQ1LBv2Pqyp9O7QwUASRr/
         QNrgKrQjAKlq/kQHqgTXFn71ZSrYBADPuF85nATruuPkYCMBgQA6oQslBAXU7Go+tx8M
         Z6C6xT+mAVtRzf00L+a+3Ex7nwcRCFO9VKOEHj4kjz0WHrnsXd0Nm0gwPOxNDMZwSFwE
         84NM+dED/Vrt9baGiyJXy3udV57/xlps9lC+GM5hKqaxYRd/u7NwiScT08M2HsAFXCKP
         ODsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Rf9wmgFdjtNN6vcUNgYxrSdNAqQIGuUSHoG6iSy5OaQ=;
        b=DTHhgYhm8MLoldGAMC7RxpsBn9fo7oWZi0chI+BqdNQpIbbLo2q5CenPw1yeDbfMZQ
         yiKUxC0iOqKp6Ri4Fw21mlNQV4Hf6+SCjO/qC8xFSJVnHN6IxmuqqPG+L7pJBd+gDHzx
         AUcfOlrasDhYih1DeTaAtFOI1DYKYgkqDSY2bK+0Hi1GQ84QNh6W/Jzm0dnnvMr4IrzF
         AoPJCQz0sDU+ueLU5W7WiHkvB5lmgzkYxMnM7XAfNlaJH9wZmB7CmvWMEQubm2NDD6de
         fpdaawfl2xyAUw1L4oJkdqVAR6AeHDXKsxEfWHYJgLMoLyfMh6Pc8H9y0n06aU+3JXP1
         65uw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id j20si174875wme.0.2019.05.21.07.34.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 457dZ94Rkhzy9x;
	Tue, 21 May 2019 16:34:25 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 1/6] inmates: x86: rename header.S to header-64.S
Date: Tue, 21 May 2019 16:34:18 +0200
Message-Id: <20190521143423.17734-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.21.142716, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
index 97a37341..bae59025 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,24 +40,24 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
+TARGETS := ioapic.o printk.o setup.o smp.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
-TARGETS_64_ONLY := int.o mem.o pci.o timing.o
+TARGETS_32_ONLY := header-32.o
+TARGETS_64_ONLY := int.o mem.o pci.o timing.o header-64.o
 
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190521143423.17734-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
