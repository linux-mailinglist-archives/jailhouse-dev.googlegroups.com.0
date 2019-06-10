Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRWD7PTQKGQER5I7NIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF0D3BFAD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:34 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id s18sf5101940wru.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207814; cv=pass;
        d=google.com; s=arc-20160816;
        b=pQoG90nu5fDTfENigMAn/bWnN9LIUeHbw8ePKvuzAJUSpYoR97996GLRpzEdC9LLZs
         MZoMGeDSPH7GFPL9ZCz+g3twWpp5z/Hi0+jV6Xm/yPcgpgH/zWeiQPwGpFkFtDMmNrxa
         PY2jYGJ1/blLv/nUEMDAgsPPrlUqObNq/Lk34q9/6jHOunwJLJ3SK8JSFJsmuzheHf8w
         UdLL3I3Lscc0oMlTIp/iuBaE+UiZvK37j5R5UhDIO2M610o1jsAI2vaKrkSkptsDaa21
         +nCDaxIFQ+yx8jjHV1FFcRzNzbXF1NE/3s+w6xRcnvbSwSiNkJlW+8TXQyrwbYXQ5FXb
         ETkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=MscYOOWMvL7bBwRS/xilPRP8Bt7pa8l3HMwXKJeQgc0=;
        b=CBkH5fH2+/DegGkMT/Gn8JKDnNxlT66jjRVq7P/iPpoHBi8ixxO1PyeZmClKmOuLAJ
         9B8OAd0uwJlP4ij8iTMfhiVfiOiUV7xHG+CmXL4qflLnFhWXRuQn8jhhlnFP6InyzyZY
         0AGP7u/TDFAZK/n40htmXd52dYeeRgnPwtfZgXaLLbOr0TsndSjrLDMHrEyT1C8BeUVA
         w1H2SiMbZS1M6uTChysU22fUT9OcgcZkaNV6bxOHT7TV2jXO429jpZ6+ezSkf9Appdpn
         DM1jUtWAQv18bMVqzMWPEPzpoXC6ukjobM+RZNIxdWB34ApO7a8I1lLB80QrEnVLbcDX
         x+fA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MscYOOWMvL7bBwRS/xilPRP8Bt7pa8l3HMwXKJeQgc0=;
        b=WR44CfmU+uwwG8aKo+RqJiBlJDan9o59qUCB3xwKfGYqmD/SETSCBBuDbajohs+Xx9
         zKFGasgCS3gsZ65Aa6NGuI/UWPlRd5ULk7goufduDA2frQH5dr4zCsoj4W6lhR0ETjjW
         xJxOE1dtVZpWiSj2O7pOXxQikzA22ys7YTpHeOLbfRR5MYT38JGbQXNbp4gF8wKlhMxq
         xaR74/gUpbG5TEfwxmpciQ6aciasMDWiQsJdo0Zw/6o8aOY6DJUIsoX84W5DSIpTbVQz
         yo/lCDu7fv0uI1JCM/iPNQ+atCN2H1YaZPpQWFyKsS15qN3VvNgVp1IkSy51i7FAdRhV
         X4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MscYOOWMvL7bBwRS/xilPRP8Bt7pa8l3HMwXKJeQgc0=;
        b=qarCyEGYnhSmhoDYox+PXa9V/nPLD7BQzAqdPExYXIzNWCNHHuaaacl6xww0MnnL/4
         pKn4aNHzF2SSnLnyCjyHogGS8Gf7Q3faHMLFb2aL91wn4jw1vLmbBWGozjO0QqRl4Rs9
         in2yL9CyqOIMToHTrFn0MDomR2fEVj89QV6TLT/GGTGVmHJkOdXwPVnMI6Ud6psR0Qai
         TCqNd/5pfwlPss+RyVXbm2ykkfhMN5pGHK5/Losh211L5CVJLVMsmN6IM7nxtwwnC8lF
         cNRYLBfoKASaxlkl5TskoHp8LW0LLZQbHiIq0jc1pVEPS+7qo+6TpAyvKFkENlZnVnzA
         CEqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUWXNeXNaOZhEcA/5/cItvM+1L9gQL0krX9eESg+xuipTYkjU//
	ODx5egXJtDt6EaUECcJp5AA=
X-Google-Smtp-Source: APXvYqy8rmL4wikcAp2df+hNlAX0SHnjrzsWyAPlz7Zfg9JS5hbj62DrUfGTCV8HDUEdtgRhFqNc1Q==
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr6884493wrp.280.1560207814763;
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e844:: with SMTP id d4ls4047898wrn.7.gmail; Mon, 10 Jun
 2019 16:03:34 -0700 (PDT)
X-Received: by 2002:adf:e705:: with SMTP id c5mr16837504wrm.270.1560207814228;
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207814; cv=none;
        d=google.com; s=arc-20160816;
        b=s0NuU1QE3HfIbBheRJLEXUap6j0sMe5rutIeEv1o+4J0OmXvQ9QKUu/7fGWyv937TH
         rmFwsjmf0MtxHmBgErSuJvsdsjdaAkVD2A6ppbQPTjCG10fevRRMUu9WCjjt9taevqTt
         VX3vJ264uw6yH+qIAKe8JRLPNOJtN66TXp5wSXaj2MlxgsOabzYsbWoRM4Kt0mN3JMv7
         Syc1Vo01b6E7R6uo1kkAdcm4AVSnaRpEADPfPYfdYzc7i6L32TX2UhmVADaakJjvbj2D
         Ahnk6HyHRUZ5VXZiDPNuEfWfVjG2Tde8SksWPiBn2UqeXuKHc706TYsm0T3cB6Jr93w0
         T5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=lGuZlE7Rsz4ty+5uzVWWBw/ucveBRlbNl4IIM2YVJQE=;
        b=ZTft0GAsVaYid9CkqH+5i1Y4xbtAtlQVawM1xvaRoCHQz4tSdmhiEhckmsvSp/z6oH
         BB7umn7ph8Nok5YZC5V2dUbiFRmaHmOuJHd0kDMUg56Ik+kSUIVvRFILIRMFGUCiJzx8
         8v+O5EIWJ239XcfUSfEhwKbmaY7E2dMjaHj/46DRM5ukQj03l1X2UmBIvXoB2Nj7AxD9
         kkpiOpc81NBPxdOfIFCRMGf0AdkIr2BE83NrXjby7FuXbIkFDXMzrS241JBXd3uDgds2
         wmcB9PbHqluXzNs2vssbi/ksq6ebGiuoVjnDUIjwAIyHIPmxmUfNSghJpRnNX0XnO4Xk
         5Zjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id x3si47860wmh.4.2019.06.10.16.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wP5v3Dzy9w;
	Tue, 11 Jun 2019 01:03:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 02/10] inmates: x86: Don't compile smp.c for 32 bit inmate library
Date: Tue, 11 Jun 2019 01:03:22 +0200
Message-Id: <20190610230330.21419-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
