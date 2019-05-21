Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4UYSDTQKGQE464X7HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F4E25244
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 16:34:27 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id v5sf385065lfi.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558449267; cv=pass;
        d=google.com; s=arc-20160816;
        b=zjas69vgU+ucTauI320bEZDHaEKwdVDAsDF+BLzSF8jVSYeAfl9vQMnMCiH7V62nwf
         k7PiMc2CvsDG5cMmP0LsYoK3TSA4xhTRuuemRe8cYSqqz68YNX/w2W326m6IBhBuA7zy
         Fqn0kZHxe3Oh2iKrF4qIKIL8/4YIeai9whx+ZgCC+0UHXkKGKQQI+B1cfejaiDXnNl2+
         A/bRpALETvoiPolcRwe8S9FwKRa1FywF2hNZBqyrkTYsb8z+VadEPgM1p9n5WfBBA1TN
         1vwnhFKn9he5JgSFfpZ/zupKkd2Zgut+u2WbUxpY+L0KWIyKYrR6odUw08Oqu+10fI4K
         VXTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=IyaxSZ7HekgBP2Q4CXamygpcaLInm9D1WFMp23IJFgg=;
        b=ebl2Ub1l2OAs6s327CG0BRajn3EhW3UPJj9wQxWp9juoq36avHRYtafn/Jt/ebWDwS
         Sy0q69Z1bgjZ1PFz0KnvWe9Eu5ZUEPCJD9k8yH/g2uo3wkiQmouLj8eIKweMXl/hBBX9
         t+BPhvwH5T+DPDqvMGYiOnZueMmJb6xNHCTYX5UO8k6qm6vsYUhfv7BoLKaGcZFgz3JT
         T57SCU1uNbrLZWHNeva6Sbrwov6Oxl7QoLB15+X2jIBeV6HtiOaBpsm0aHpJjsBW/C0I
         Klb3j7aZ0Kvk7rv4v4JYJLtSTlpEjiiWKVMVSkdW6dp6EFNSO/HO/0LQEFHlv0Ra/DF3
         tPiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IyaxSZ7HekgBP2Q4CXamygpcaLInm9D1WFMp23IJFgg=;
        b=ll/JyQpbiEGvejH//xmoiBw2vOaLHOwdKcQ3iVeSP8zRLeADUT+IbluaszowQBR0KQ
         EkiV/k6WK9d39cZIY76g3me1ij11pxE0iqETeB7McxObRjCITrhLGiZZL+R9rP5k8N1c
         IshLE7i0zNFcBd9v/YambnhqXg5XV10TWEC6urVr1w4brvC3j4KRQBVCNQRhnUuuaIVg
         Zp3Egz2OpTsn5PwfZ+Fhcuq9+9xs8lLTBWqc/Oav7AiQh3RLS1nrEQCafiWhnT25SgEH
         1x/mm6yaU1zvg0Hgz9CdSsA8J6hDiB6Rhl33f5z7PTVlMl8t/IiyJvusnHkJXvSm7QKR
         301w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IyaxSZ7HekgBP2Q4CXamygpcaLInm9D1WFMp23IJFgg=;
        b=Yk8C8sas8OSHbro5rZFuzsSIMZOdGRILSXmvI1WA3HK1VAa13b5G7ueuSDi4JyYQB7
         UkSa7xrHLtrSvgi3Jy196q9siOtHSUlWDvQd+XPL1msIgOtWqK5rJVWRVdgBpKjdJRSI
         SofzlsUSa+BGZlpmhN1SWH97AISMMx1fUisDjrOR3LIlumJvCXMP7NiCgF17Hur7qVPQ
         ynBYLHQ+u/nUuyBcMTryrZnCQT8xtlgnxOgKt0NNfpTsAvyT6CCislazGuGfjicfSFEz
         RzwFctsNcJjAp9xNzzP2ZvLeaC+pLvlbBzM8JD5QPOe1tAZtw9WvYxvX81luoJ+oAjXn
         8uYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUkD/U4CKx99FU6q/IdI18ok6cN1wwZ21grSwUuNy0JjOqhgCUM
	D0pByuIha2bf3IyM19e12s4=
X-Google-Smtp-Source: APXvYqyeQ1HF7gwAOWJDxhcZ9wsr4jp0CPMfMnBjgEH+bIa+JUuB8Ga+X8k5MWUERkKSUdJ+BAdKyQ==
X-Received: by 2002:ac2:5612:: with SMTP id v18mr24766910lfd.15.1558449267008;
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:864a:: with SMTP id i10ls1073087ljj.5.gmail; Tue, 21 May
 2019 07:34:26 -0700 (PDT)
X-Received: by 2002:a2e:98d5:: with SMTP id s21mr22570322ljj.142.1558449266456;
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449266; cv=none;
        d=google.com; s=arc-20160816;
        b=HOnjcNcjiUIQXzqtx1/5E06ehrTlZwlZlgtxnawwyIRs6DbIJlo8wqz5tByMImezZY
         2J8Nmjyv6jA9MycCadMVlnsx3aKSczmD2rydY+LENhNWtMIQs7TnZjDMi6lre4UE4AEv
         kT/0TozU2/tj3hJFyNFmxYY3PFbel/rLxqMNHfU7BwyORZI+4hj+cXG3FJ8TUlaWOuvh
         fQ4ipWSfwZXpGhT7z+xxfxTclBJPZPwCHNSsdr3rf2FU6QSszhsyKNXgOMPGWbp4DrQC
         v/M06TTgQut3cFplreXuE1XNAOS0roP/t7HsbLx7X3GCXL2Ajx0EC2aSuYI9RIhhLWlK
         pNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=iR34VitR+z5IvB/MoHI5twzbGioXpOf/bVoyKVpmGjI=;
        b=WzO2dDXLxhe11weockIIaGfYLj4WVAgwL5bS5MQAkud4GHlXDFPujEusTCUuMzsru/
         m0Wl6kTy6vH5C6jt8eBMnbqrUggDvwbc+SsHuc/UFeZ6unqXi8Za1DL4x7TNVbPUY7xW
         G8LSBXVbqBilHbJ7T4SypGnZ0idr6/JUXCf9/fDoaCIxbOSbgOjy287wOLfkJS4daZPL
         X/QJs5rulI10goPP72K/PYMt/K3a5EOgTtw3lE9uFWoOjiDVgtUCbOXopktrKsopu2hE
         f4BIXjZ7Os4aY5DVMrhdhs56UK5aaMSI42OZtJWOHY/RmYbBOsaEaXiLeLjt6Kjc1IQA
         +RQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id z22si1526162lfe.1.2019.05.21.07.34.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 457dZ937tnzy6p;
	Tue, 21 May 2019 16:34:25 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 0/6] x86: enable SSE for inmates
Date: Tue, 21 May 2019 16:34:17 +0200
Message-Id: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.21.142716, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0'
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

Hi,

x86 32-bit inmates are broken with recent gcc versions: they will very
likely produce SSE instructions here and there for some optimisations.

This lets inmates crash, as SSE needs to be discovered and enabled
before it can be used.

The solution is to either use -mno-sse (for the hypervisor and inmates),
or to activate SSE for inmates. Let's go for enabling them, as almost
all CPUs that support VT-x/SVM will very likely support SSE.

Though unlikely, SSE might be unavailable. We don't stop the inmate if
SSE is unavailable, we let it continue.

The actual SSE patch is pretty simple, but I want to avoid duplicate
code for header*.S, and I found some other spots where we can
deduplicate 32/64 bit code.

  Ralf

since v1:
  - don't stop the inmate if SSE is unavailable, let it continue
    execution
  - Also activate AVX, and discover some other CPU features. Report
    availability of features in a x86_cpu_features struct
  - Add a common interface for simple test cases
  - Add a test that runs some SSE/AVX instruction

Ralf Ramsauer (6):
  inmates: x86: rename header.S to header-64.S
  inmates: x86: introduce a common assembler entry point
  inmates: x86: Add accessors for different system registers
  inmates: x86: discover and activate SSE/AVX
  inmates: introduce test.h and test.c
  inmates: x86: Add SSE/AVX test inmate

 inmates/lib/include/test.h                |  21 +++++
 inmates/lib/test.c                        |  28 ++++++
 inmates/lib/x86/Makefile                  |  23 +++--
 inmates/lib/x86/cpu-features.c            | 103 +++++++++++++++++++++
 inmates/lib/x86/header-32.S               |  29 +++---
 inmates/lib/x86/{header.S => header-64.S} |  29 ++----
 inmates/lib/x86/header-common.S           |  62 +++++++++++++
 inmates/lib/x86/include/asm/regs.h        | 108 ++++++++++++++++++++++
 inmates/lib/x86/inmate.lds                |   5 +-
 inmates/tests/x86/Makefile                |   7 +-
 inmates/tests/x86/mmio-access-32.c        |  52 ++++-------
 inmates/tests/x86/mmio-access.c           |  76 +++++++--------
 inmates/tests/x86/sse-demo-32.c           |   1 +
 inmates/tests/x86/sse-demo.c              |  92 ++++++++++++++++++
 14 files changed, 510 insertions(+), 126 deletions(-)
 create mode 100644 inmates/lib/include/test.h
 create mode 100644 inmates/lib/test.c
 create mode 100644 inmates/lib/x86/cpu-features.c
 rename inmates/lib/x86/{header.S => header-64.S} (91%)
 create mode 100644 inmates/lib/x86/header-common.S
 create mode 120000 inmates/tests/x86/sse-demo-32.c
 create mode 100644 inmates/tests/x86/sse-demo.c

-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190521143423.17734-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
