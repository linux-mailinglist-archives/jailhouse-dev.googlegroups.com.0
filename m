Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ7QQPUAKGQEC2MV76A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C587A426E7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 15:03:35 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id d8sf2645482lfa.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560344615; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vd9zrnRa1qys/AiuJDnPAhLFcwFwnHQDGQvvz5cS4g/fbg1ukrYS2Tat2nS9tR2C3a
         Hkj+Mu32ROyAwJluxR/JgcptDEGHpGEdPWymW+d71AvpxjRrRmtIq0mvBgVnCy8H02D/
         WrkYWzK+OX71v9ycKPNDkqg+zxDTFmIonqSrflx2REa/ziUhvKRvpGaxPSrdvlHfbeTL
         XwhYTt5ScU3JnLb8SN9GatQTbMw3/w1MoApnrl/VIurFQNSIir9uaM6X+z5H/yWnSu4H
         1SZLMZuE1JC+STFGs+0PPVohEf7n3sJtnSOB+DdGGiMKG7EBK2j2rnGrgHpSh9ORxbZS
         unQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Hdd/m7Vecm3Etam2BFEnKHoaw9LhfQ+JWaddrSomAI0=;
        b=ZVfPTso8HVMwhfXLOBH6I1Je6MJz1QbqYOuk5WgLyf+mfjC63XZ2v9FeyukLiUmdoQ
         k5A+noMMQ3qo7vtxXXz1eJ28O+zDUU+4tuLtZ3BmejUANS+cnjh6Y7CU3V45vZGigwA/
         ZMCdbXVqsZMjV7VKYdtkkMX/670LalELitmm0lAA6w7M2rVS2yZKbbn7EiPdr0eUc7iT
         /DuHwEeQ2qfBLLmgW2ev8m0pL6QqAE4jD9rR/J02aTMVMEf0Yr/bv+j42YQ9aX67SQFM
         d5+Ji9BCNUIEgM1kHGi7887wBi98iRQDDoMuOOFcJpsj834As98GQLSd/l52UHKV5S0O
         7Aew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hdd/m7Vecm3Etam2BFEnKHoaw9LhfQ+JWaddrSomAI0=;
        b=ayxErn7NqCkeLeGDAvNAEllZoQMw4xGxdwuBSr87Np1X8m1d57djPD4lRpodF/WYpF
         aJhiLNuOicUzcq7tUopdiS5oaIrDic1qCyPwm/bkBgLAuO5spZEA4bvJdSkVavfAQvs/
         TSFS02ooDfP02MXZ/tN0yTAS+DOOZojTg9ybivkc+WVJEwUe90EPIgaTMaG9+jBlcqVn
         WOcDEnp/fJUNkDH9DAyIFmyC/Mf0EwAA3VEZJkanC+6e5ze5uwZz9Krhc1IFumjC6TNl
         LR8AkkWbRedfaKHsm4aoVS8m1bM1nFuxkoLQmKrp3RAlVoYN6qRx9G67USEVCKfc3uKN
         bjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Hdd/m7Vecm3Etam2BFEnKHoaw9LhfQ+JWaddrSomAI0=;
        b=gZPO7ABva79DqK45UYszFPUmyDa6rxGbA4iia3fWNNgWG/EKnfMWx830wV3L7viKzZ
         h6BiS3DcyILUpWDdvVwvLjdwnpPxpvJR7FQpWtZ7wePPUEo7a08nL+cmW/98b8x4KnvJ
         eMTYKf1j8YCP85211Y7ZBCdyZUFZOwaZWztaSJmBzr+tULJeBQhvOSEqIKjLMqN7kPPw
         hP6mzcuIy8E20ZxBzg7JZNz+NlWg/LNUZCDBV8X3safMHFbhkOLC5EUfSFi4A1B0urm6
         GphLFOjwvaBWaqd7VH+gbOn31Gtz9srdxQf5u1PjxX0sEADCMZF2/1shfGfm6QLNJ9tS
         I+Hg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWL5Fn4m3ZhvgnbRWpFa/SqGkZm3ZvDYxoOaJE1kri44dzhW8s/
	is2/rU+bwkErQYHthZYRz6Q=
X-Google-Smtp-Source: APXvYqwJ1kM1Gc6rwAQXtY22SSPeE5T5kV8SD04J3EwkQki29Pf3Oby0xZ48LjlafekpKEduvluONg==
X-Received: by 2002:ac2:4a78:: with SMTP id q24mr37808596lfp.59.1560344615388;
        Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8198:: with SMTP id e24ls235241ljg.15.gmail; Wed, 12 Jun
 2019 06:03:34 -0700 (PDT)
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr20331835ljj.162.1560344614688;
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560344614; cv=none;
        d=google.com; s=arc-20160816;
        b=co2Hh9qhL1Bw+KjmywmGDveBPM+fmJSKES+GdvN5h00tz9HcK24jN8fqqfBgno96rp
         QdVVkEzqU78oAaUQRNkZnmUVAAfjekuYdhSB1tFlbVF+8upjTbdJ30NxNM/+DoG7ZJc6
         aWaA9LSVWmF/9VwU0frqGPay6lVaRzRJqOcNvN35NX/Rflr6LWxPt14djMchqFbP2eqL
         ZrfSvjtNyHW9qSRH5gE/0K3qs6vxUZgnwazRrUIZVEbOikcp5N4tL0ImOxRABc1WT04p
         qUFhiLfpIhTk5nDsmPlkQOQlLifKq4Zd7bV10+pfxf2p20Tlg/Y94oZHCBMNZWOHokLx
         PTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=w2CIawYrguSkRIeIiZts+fGqDqVnNTLbzzguMyEl5jA=;
        b=olSHXNlz7yuhRNP0IR36ak4PeTmR8gPLdfgrPgEAsnZ9u03WA3C6YHfzs4ON0AM7Yg
         EgqFuK1DY68y2/71OWASvpFNhB5pL1zQ51iXVQo18rixWhPSCDg6XM9AOifCnqytJGEM
         gfKpc1tcv64Di2s5OgtLNP9M+my5uVTx4DGXJSDDSt4BWzzP3rgFsPNdcTVD3EkHqbyK
         M3Vv+ddBAT3sDOmXBA8XcPIXJnx8LnY9lAvTJCCGZL23k9eZjreUxJDysDfZjgg2pzIv
         AIdPkRW38Cpsf++MNzeaoElYBtSYIJUmEJH8sbC7nfhh8gdFj8Ny5zbxM5NeNw0CtWTo
         80Cw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id 2si162653ljp.1.2019.06.12.06.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45P6W94HNTzy0s;
	Wed, 12 Jun 2019 15:03:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 0/5] Some assorted inmate patches
Date: Wed, 12 Jun 2019 15:03:27 +0200
Message-Id: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.125716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
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

Hi,

factored some patches out from the SSE series. It fixes some (yet
unrelated to the SSE series) other issues that I found during its
development.

Basically, it's all about the width of variables when being used in
timing context -- It's very likely that we exceed 32 bit width.

  Ralf

Ralf Ramsauer (5):
  inmates: lib: Use wider types for time-related constants
  inmates: x86: timing: use a wider type for delay_us
  inmates: x86: timing: adjust type of apic_timer_set
  inmates: x86: use correct types for pm_timer_read
  inmates: x86: Don't compile smp.c for 32 bit inmate library

 inmates/lib/include/inmate_common.h |  6 +++---
 inmates/lib/x86/Makefile            |  4 ++--
 inmates/lib/x86/include/inmate.h    |  4 ++--
 inmates/lib/x86/timing.c            | 20 ++++++++++----------
 4 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612130332.6175-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
