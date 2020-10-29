Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVVP5P6AKGQE5V2C4PY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F929EEDE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 15:55:19 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id a10sf1360851ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 07:55:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603983318; cv=pass;
        d=google.com; s=arc-20160816;
        b=sbuvgpJ6diVUMOvChtXjoxQSyQ3VV99FU6WflaH/fgqRYhwT+1KODbQX+f04L+5/Tj
         9jaY7h2DxVypPGn0W1exfHblEyUZrVt9flZOeaQNpQOxV/QqrMe5wKBNpxSweXfFfA0L
         kMDphm4xI7mMvRDKKrrsvLw01TMsYqSSGv4jrOTo3hOENYBGKrhOfZQdH+A7Jwl4EEnY
         D74SX6ewQOpVNlSoS9qiV6Znq3I6pp/ohtX7qJodIFD9TwhMizcfpmXvwtFWxBLX/RN6
         eRAvq/9Q0AEGPypjLNewqdm2B5tQ/nCnhmHgZaxfeTEw/Iwu26hvyLT2yDG+d7SnpbC5
         FkBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=uegCxijiojEEGIUaGl1IzQj0K8FH+5lKJ4Nq73W7xM8=;
        b=uPqGSQ6CmQqLirJcQ78J2SEBf6Elm0Dc8zg5s1VBFp3E6EB0fApmgMsqAxvmNJGJQX
         tgsrd/fzE+l3jowKeygn4rPCwNUjnOceFgGe8eYG7QI9+ErZTYdyaadYPSvgew0e/2d7
         g3rkmPp0kbh99GywIg0zjVGB7X5s/i3ey5+vxGXEBkKGXbd6obGYTqWVpTkQeaf+ML28
         SGxnHak+S9qCgedIvcFXpQ4rUwv4audzh1+XVdzHWDFqiGBKjPfok45g6/BMngv4+KKc
         HHt9sYygT9OaXz8kSccPBId4okl1kg2DKsXfjiOOdlo9L3PDBxOqUX3PaNOUicgHgktc
         0dUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uegCxijiojEEGIUaGl1IzQj0K8FH+5lKJ4Nq73W7xM8=;
        b=rFEei/Ey1Bl88HNwSmMV4ODudZZTO48F+Hu65FC95c7H79civ8p+VL6I3c4o4QgtTO
         KmlSvFPlhODHpvETbH8qwgZ8dIEEUgQcq1QyMCeQm79XWKW1kEYK13OlYSvo0tY9Mplc
         bHNJkfwcDSBNKfzw9LEumrlb575DfxXLWRlpeRsowuxEZc/e8ytB8SpVWhheUOWPKQQX
         tC/EdEvnBc6gsa+hbSH7n/ykP2ay5KiI///032oCOE9wjniw3kmU90z1uUgPqyNsCgaP
         kHxQsKrvQkzuQEDEOt/ScgcYY97AduhYoQ1fbelc+kMM5gF/HoTOnGET3eOMKYowCgRp
         PAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uegCxijiojEEGIUaGl1IzQj0K8FH+5lKJ4Nq73W7xM8=;
        b=G9xNWAJUlNWxodiA8CjefmLcqTHXqf8Qht5Ck+vyLL0jiZWEbck8QX/qc/uvmcGTCa
         kZ4MdtYt2nm5dMNh417LHE7hey68JR3npbGF3QzyKL0sA5fJ6Wmwb6AK6afoh++s5jJv
         1jI7IUbsGsbclpnNSG+op6dEFPPuzGj2ZGj57Yg7MQcMHA4AWFcmWG6sl+0S/1T0VJbD
         Yq852pQCEbFt3gyakP2sL7NO4oZolRB+jEurzYnVbhe/vn0E6SIS9/wU6BAXkX5DeyDA
         Q9if7gAJNsLOgGEHFyDcECnyGNMgQ6r8WInHVKveQIQ6Q07C3ds6DRW1hsKbTW8UdioC
         G22w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532rB+TiP4H0CbGHBhvQx+qLzcNTKW1FUwJd9LDrM0oC0+AKS3ZO
	xAiHwyVi7TmCvF1PaRADJH4=
X-Google-Smtp-Source: ABdhPJxxEjYfAvoyRUvZGgpksAqR1MjdetN1DW4kSCe1GyKLwVDTnNgMmw0AJkhj7Mcht9ijzKm/GA==
X-Received: by 2002:a2e:9583:: with SMTP id w3mr2086623ljh.25.1603983318630;
        Thu, 29 Oct 2020 07:55:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1855854lff.1.gmail; Thu, 29 Oct
 2020 07:55:17 -0700 (PDT)
X-Received: by 2002:a19:4286:: with SMTP id p128mr1646090lfa.5.1603983317459;
        Thu, 29 Oct 2020 07:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603983317; cv=none;
        d=google.com; s=arc-20160816;
        b=Qs6tvJXG0HazKP32SDYOqghpyzLnyUJQ1dfHpl32Ynhw9DOkltYR0SElhqrGmT07E+
         y+Zioz3or3X6xKCJkEGZ26lze17B9HmC0KFcIcTw3ohlNAVFsrgCVJTsRb0GUJ7qdJzj
         1/YLA/psI9ZxZ1pDrI1gHIpAY2wqeJB18GNHKnRzEkW0EbekRgyPUU9ZvJmGKSWcU/TE
         2hCUHxq0BPoSoiJiT1LD/zRf+z/UBdVuIFMNB0wcuYwruvUZObXnRvcOb5vSaUF8ZZLi
         i3Jx/jkc7uoIufQYBxMYSMnIWUvwOVhboPK5SMZjYzR6T7sfnVkppgtZtAIePzhscbjw
         tE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=d/KDf5tX5BsI3jSxPH1roCg9hjE9QxDOqJ5JnOYwJ9g=;
        b=GhLaA7RhpLEvp47za7ngw2tsU/1qI6fbl9taE0cnQNj/2ZdsOpISFxYbsNdpKHgmXb
         Fhb+ZtHzN41AhQRAxt8nUhMqMhdAPFt3tBv+pFo2saYFvtXTqBpzsl/16SoXdsA6FPbg
         9TUKTe+H+qV200E8px0wbCPr4Ya+3sfFgfKmViaICp+Xh6wUQ3JvMnzpIidv1N6r/jKu
         D5q6FNx+e8/ZfApaghsY0p2Erz/wFfCmVEcMtrqNr8CxtV66JtRgATWcMd/CB+xx4Yh/
         JCE8uNt23rWehR7AalJj53RURQ2dxXxP53nIhPRNjtwgkuGXqNVnVoozEJKZf433IrP/
         PM/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q11si70870lfo.8.2020.10.29.07.55.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 07:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from sd6.hs-regensburg.de (unknown [IPv6:2001:638:a01:8061:5c51:6883:5436:5db])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4CMT503j7gzy9T;
	Thu, 29 Oct 2020 15:55:16 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 1/2] tools: introduce tools/demos subdirectory
Date: Thu, 29 Oct 2020 15:55:14 +0100
Message-Id: <20201029145515.386953-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.10.29.144817, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.10.29.5770001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1500_1599 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, SENDER_NO_AUTH 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

And give ivshmem-demo.c a new home.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 .gitignore                       | 2 +-
 tools/Makefile                   | 4 ++--
 tools/{ => demos}/ivshmem-demo.c | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename tools/{ => demos}/ivshmem-demo.c (100%)

diff --git a/.gitignore b/.gitignore
index 4691ff79..1d8905ab 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,7 +21,7 @@ hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
 pyjailhouse/pci_defs.py
-tools/ivshmem-demo
+tools/demos/ivshmem-demo
 tools/jailhouse
 tools/jailhouse-gcov-extract
 tools/jailhouse-config-collect
diff --git a/tools/Makefile b/tools/Makefile
index e6945cd6..8cf5df84 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -34,7 +34,7 @@ KBUILD_LDFLAGS :=
 KBUILD_CFLAGS += $(call cc-option, -fno-pie)
 KBUILD_CFLAGS += $(call cc-option, -no-pie)
 
-BINARIES := jailhouse ivshmem-demo
+BINARIES := jailhouse demos/ivshmem-demo
 always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
@@ -104,7 +104,7 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
-targets += jailhouse.o ivshmem-demo.o
+targets += jailhouse.o demos/ivshmem-demo.o
 
 $(obj)/%: $(obj)/%.o
 	$(call if_changed,ld)
diff --git a/tools/ivshmem-demo.c b/tools/demos/ivshmem-demo.c
similarity index 100%
rename from tools/ivshmem-demo.c
rename to tools/demos/ivshmem-demo.c
-- 
2.29.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201029145515.386953-1-ralf.ramsauer%40oth-regensburg.de.
