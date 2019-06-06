Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB25O43TQKGQEZSJNIMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id AB51E38123
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 00:44:59 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id w14sf86002wrr.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 15:44:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559861099; cv=pass;
        d=google.com; s=arc-20160816;
        b=cbIswIiEASRh4hzc6aeaTdEpTQ4Y3qHe1XbSjhdBAoVrNb4APRhFP9jlwQXDjBb1rr
         yoCh3yk0hTj5JIgikrVRVpdaiF0RScoqkB97VUUbBwgcwXcH18mjMUa27wGNJMdVJwfW
         U9td26HiPPmPSH07RShLcmdLwQbHgIXkDMdKFy9M0//LK6QKwvCLTTjm7gBYAhR8mJBt
         RIeI6FMigk7BKOA1iOFg4s3MDeizV6HtJLIzKLKQk7PggwnP7S4z4JqhpTmeM81cm5TM
         NRQ3chk4WEs2Au1IxZ+SOLomohWopTxC4jw+NoZgwju0JZ4/GthAe+Cn7pROwPnwLVvv
         jidw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=6vNEOmGKDTAa20EABf0xG4W/UWuPB6AKcwnIN5wExUg=;
        b=N4rXYKRWBnvCbRVmEeI4640PTkCdk4PQwqh3qYnCeIyo98fa6k5C9Oo1umcxgE59Eb
         obzL5pA6b/Ehc2/sgWDOCrynhDAyv3oiGELH62djGlcC87FniVo5Vli6zQliYNsvhtNm
         FVNySdGyEAD7jbNsF1a54Ym4P6NPePOkhxUgXcLoJfmd3bSyBNY7Y7XCXcnFbTPjlQX5
         rGPwuaGfjKp3nVeUp41qhvRqzLmPr8kqbBVAzw8dlcMlkTxi6wjjHowarnXLTGj9kXKy
         U8bJWieK5BqqoOwoA3/3JAaZxKeCLbGY+1MDq/OxqYoH3OT4749GSgae5hyp7GJXh4d6
         vi4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6vNEOmGKDTAa20EABf0xG4W/UWuPB6AKcwnIN5wExUg=;
        b=ZuN5EM8Uq4mEfBJy10C7xfSJIzmE9SjOmiNnjTKcM/s121OlWMYvOu7cB0JxhLxhDj
         XiKSI0RKzQmiaupRYuW+YAWX3WpuWW2tewryGqm8dQ1lg1ObU+vhzzhHmjO24O63MYsC
         vVJj3cD572vAt4l4ZMsU/Ttve2SN/A3TPSgnqQFaiXrzZWgXk5us8aIcHEe/ohv8I5d+
         EuHHJoOdAAaO7kgo0T6Hftfz8EF6AXf+CNlh0UwS4UA2P9s91dMBiqcCvmAaaLGBnHPw
         7qkywWRaVdZseEqXj4n+dNlcp6reIIydJGY39zWxBcclYKjZ/9KCDNgq59QEz01rdo7D
         7w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6vNEOmGKDTAa20EABf0xG4W/UWuPB6AKcwnIN5wExUg=;
        b=ePo6CH3CCk2O5XN7qyxXbgJjZZhfgMGiONGa/cCTsmdk1uf4nWt31kXKF+1wjl0FY6
         qVdsKtcrbGF99lYNJoXa1FByRLFqbz1TRZy5wVuFx9ps2bT+XmAXyZgbSrqvXXFfwMVN
         rklatzXKsnw/dDDc7ZU0RM1kJJ5JwhPA0p3NTTsBFAKg7pFRFlsUyG0JE8EL4pYQb1TU
         /wxiyonHnJeKLFf5EQsnPgIcgnS0a6RFBtF9WBO7rK27/Pfog76g70TVI2knF8L2QFqb
         yahF2QrYq2NScX+RdtkyRx14TOkJX01BD9dL4XFdv3FIAwyIu6kK+DNMVrmUWA4Ak/Hf
         Rxxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzrMNlEwQizBdEskppY3xsDs0qymYSjDllklvTOgWq8vAnpNWf
	iPYEtbs1tT+0gyc+qOwY6YY=
X-Google-Smtp-Source: APXvYqxViN0MfVlncV2NDnUxhVTgtiSx+fvbGs5H1KgHW7cOgJN7IKp8BLq3fRI15DpJ0aYxbASxAg==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr1585005wmi.14.1559861099378;
        Thu, 06 Jun 2019 15:44:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc09:: with SMTP id f9ls2137289wmh.2.gmail; Thu, 06 Jun
 2019 15:44:58 -0700 (PDT)
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr1540573wmc.89.1559861098790;
        Thu, 06 Jun 2019 15:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559861098; cv=none;
        d=google.com; s=arc-20160816;
        b=tuPFv+r+f7lYWZQKXEnctilLrzeveTatXBmZIz5O60LKisnD03RBu16JECPA5mfyaM
         sU+1ZqpEYc9q45sOYX70ERHtDnMY2CbFkWRDzqxj+YipKr4DiG1+ymaJ/CDBhTbicP0i
         /PZFbjr99A3kWq0EUZjQh5kAuQyKFVkTfkNSa2Q0g5QarMxTn7d3QEtn+KGB4bRpf/i5
         uOPL4Z2HZ331gQYtFNkrj38HHEA6HbCJ7RDp7YV4wYo+y0Dnm1KGGlDDnOOa9/h5xcbQ
         X4Yyn0FXk1euYShEfEivGVLzUo95q/TCf0J4CkjWHpal/rO6T3xYPN+gPQW1IW+66sMU
         QJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=vOYvtySTS0sDV8G8iBUBNN2KBMUng1SSRR9ITp5iUHM=;
        b=TWIven+afBA9q41tk3D4Z02jfOXAFo46hAT2hal9V7I/Vo9a25wyYTJ39pFVu2qS8Z
         oMnz/XrM8ppMkt8ee7sFX9hI1hGVqw3+YYhJ9T6LqtVKXlUABItjhhP+Np7/DP+/Nvr/
         siM3ZRGwiOKA2ioarpBDMVWu9fR5Tuxr0tmvh1GnAkGhARXIAFjAcwPSxbdi5UBHXWW9
         lHiZnGaH46mXUW//WWPMIXOu5tI0d8LIptpuKTobFTlz7wU3ojGUhTBXN8zIgRiC6GNo
         EGjjyxyzECbJKNzITLximMG9jigadyOFE4AnUemiDOhw5qpFHbe7ayyvx0HQvUYyMbHS
         Bc9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id b9si15432wrj.2.2019.06.06.15.44.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 15:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Kghp1ZK8zy5p;
	Fri,  7 Jun 2019 00:44:58 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 0/3] x86: mmio fixups
Date: Fri,  7 Jun 2019 00:44:54 +0200
Message-Id: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.6.223617, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.6.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0'
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

all mmio-related patches combined in a series to avoid confusion.
Basically, I addressed Jan's remarks and added more tests.

Only two test combinations are missing:
  rex_w + op size prefix
  !long mode + op size prefix

  Ralf

Ralf Ramsauer (3):
  x86: mmio: fix accidental clears of bits in registers
  x86: mmio: move flags to struct parse_context
  x86: mmio: add support for 0x66 operand prefix

 hypervisor/arch/x86/include/asm/mmio.h      |  5 ++
 hypervisor/arch/x86/include/asm/processor.h |  1 +
 hypervisor/arch/x86/mmio.c                  | 88 +++++++++++++--------
 hypervisor/arch/x86/vcpu.c                  |  7 +-
 inmates/tests/x86/mmio-access-32.c          | 31 +++++++-
 inmates/tests/x86/mmio-access.c             | 31 +++++++-
 6 files changed, 122 insertions(+), 41 deletions(-)

-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190606224457.1053-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
