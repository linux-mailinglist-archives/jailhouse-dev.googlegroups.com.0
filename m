Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPPD5TWAKGQEY6N7ZXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 60110CE1E3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 14:38:22 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id g67sf3274139wmg.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 05:38:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570451902; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZDRj9OTAZLHjg/EJ8KMJieNjMtnT8/LhrsT8Lko0e8CfVxlhLHcEfARjbm5Qk6IDm4
         9bFdwmXYkvSr1Yp4cV/Qiqe5HvF0bomcNa0q4q/SAxKeXteGPSlEsulLBpVjBLU5uSt5
         QJAFV0VgwqA8otEc/2bg/2UHQgAY2sRHp68nsct9mzWoqHF/15R3pQifFJ7V3pzVTB2u
         PEp7/Eet4uoFECU+ax3ouTSEoi8wdnCsMEXpy81tXtzF09Id/W9f9H/3LaNJxg7H5exC
         kc7E7E9JzNF7QXdTU8mv82aLATRkO5lyqGPTFvkMrdKdM6lSC5yN1kjMbV0KoguLJRSY
         M58g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=uKMzzKeHz3HQXUT7SJxBkwq1rH8kVXPjtbeZ2QXEeZU=;
        b=Ghy33O77f+q4/Hncae7ezPSRujrGa86Cccgyq77QFu7Ad1WXgtaLqwS58KM1IizDRU
         K1rJ9J4t4OudLqzHzMOw8lbMQgFEX/fPO3fMoB4iZz9mxY9NY/NruNDdkF/Waveoy5Ie
         Z/Wmz5NIctQrDc3gZiXAkQ4buJAAMjY0CymYx2aC0dAr8CyXpjOePL7wzuJrjuscY+br
         waWdRkJ2QD+2YegE7UZT7d/hfpmhIS6lG0NgiVPf7jQNLjf6cIcdx/6JylsBU7kz64b8
         Y0zFiv0VqXJMUjqCkBJEbBp3hWmTNtxg2uXFfGvw2IjTPayFewdirLjD9aSSigVo0o+D
         xrTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uKMzzKeHz3HQXUT7SJxBkwq1rH8kVXPjtbeZ2QXEeZU=;
        b=Zv4+lgnRj7FqmbErrRa+aJVyPoyD7wV5v0NVaigekZP88ef34S75sQfx9pgvh9uxbY
         nQck/zzNqjmnUhVn8DWU5FqRVs1x9Q1k60tldOa+479JU1zRzU0nc/L91Jd3Q/vGZkFE
         6GrpqQ6a/7JjZIHvbBT45pkHXSrJaS4s7GI2BNXzpEdxMfTctB/CYon+NIyiaode18uu
         i9r5l3ZKDJALbEue3+UyiW7YfyTWsyRjUQN47N9z2aRSnTC3AglgP0b6OG6Irh11c+Dr
         276qPsng0lX5axrwK9wwDTLo/u1B0F4lQSTtK6GC/odQ9YRSTtHNZaMViq4izx7mYdGv
         qXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uKMzzKeHz3HQXUT7SJxBkwq1rH8kVXPjtbeZ2QXEeZU=;
        b=CRqtNsTaNC7vC2gXXiI8bYoEacFmRecBUFuhQUDel+QJjH9hiriwRIXwRp/AJ0e8bl
         BG0F9YhEPEfWA9Ek4/HiKT3tWn3UrDFk67GqA3NhTncDWKOA2lk0rOWsKAbjk0KHpsio
         Qjqsd3UviJhz+/QrFpJAQwR3d03v7q0T6pzJTf2iuQ1Q0VrgbySuzrO1MpYk9EjRwIwt
         afo9gXNR6DF8zGXt+yu9QoMXtWag1GUGQTZdgV4FlHAmhm+6zSVI9gvO14Llk2vualRe
         qwGTr0JDwGd4zmk4SKlVEEed584HJkQEI1+eeOud6rQg29RT5FC+J5GfoZ+sh6/6JFT6
         78aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUPIVOYy9W3bbYVOOd4fxkJO/4V4D2s+9daa2vDbfOkllJwv1Ia
	ofQlJunJFdcvdFFlvfh6a6Q=
X-Google-Smtp-Source: APXvYqxfTIfsqWMkfgFc5JtIWKpjk3GVgXqNGDeJeX/LYtaJ3c37WWeDbmvIWC1JVwSiSQ15xPpqNg==
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr19699338wme.146.1570451902045;
        Mon, 07 Oct 2019 05:38:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8d9:: with SMTP id f25ls4097150wml.5.gmail; Mon, 07 Oct
 2019 05:38:21 -0700 (PDT)
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr22059932wmk.150.1570451901166;
        Mon, 07 Oct 2019 05:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570451901; cv=none;
        d=google.com; s=arc-20160816;
        b=MwTaoRWb6kA+m+8k9zS+VzAtbzqBEm2gTGGydM4Uth1ThRqkNkI+Uhgz1WqEe7ZbbX
         IfPw8SnvDgRynzedHvJ2Mvd7I8OKxfwhsBOGyA/SrUvVpckkIzB2fgqkxfXnTMRxOZ7m
         YFckxSxN3Xx2jYFMf8JfvDbI4Kwvd1mQXa0mtnMNGyKYkI/GkicFoJa65QAN1xd/u6tB
         FN44QQ4mFV+ud0m7qO30CHrjdTsEj+zrWfK/hRB81yH5N08S9RuIy5fqYUdWCqG9Cyzc
         9154kpnvLJ0DOzTPjTW/UXUf723TMTqbYHXrRheP6TlO3wQa4qz1ODxzCjLRFxq2Jfuu
         EoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=tQpGoKH4/pHk1tsSQBt2L9yPgHKhcl9VeeZStwUTKwQ=;
        b=Mk1l2QyjbZRDAh+RSiDUdiDc1g5ndgpEXrvri7zvwguBFPszRTM0Jb2mCmLpzeOfN0
         GPfue0aHcQYIAVCq8vgTlGrrBxex1nhGrdmGzPiKVQJXfcmK8TJt/t6mMXu4v+4GBpM4
         d4OI7Tz5NCDt34O66T/IJK7NgNohFny3M+E9v0FVFJDBVDVyoc4ohr581i3noARI7lRG
         0KuL9wpNu9RL3S+RD0eehqGKTntmemUswD2dkoUiCvkIJHiS8187VE0GFBOb9qpSpRth
         +XKg9sTahZxzkdNXfrl7W2kPv41P7iCkqqrO5X0NZTxWqxO+DE6S1igeRMICLPidLpTM
         q0vw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id i7si804489wrs.1.2019.10.07.05.38.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46n0Q44Z2Zzy16;
	Mon,  7 Oct 2019 14:38:20 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v5 0/2] x86/jailhouse: improve probing of platform UARTs
Date: Mon,  7 Oct 2019 14:38:17 +0200
Message-Id: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.7.123317, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.7.5650001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, URI_ENDS_IN_HTML 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __MULTIPLE_URI_TEXT 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NS , __URI_WITH_PATH 0'
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

probing of platform UARTs is a problem for x86 jailhouse non-root
cells: Linux doesn't know which UARTs belong to the cell and will probe
for all platform UARTs. This crashes the guest if access isn't
permitted. Current workarounds (tuning via 8250.nr_uarts) are hacky and
limited.

But we do have some flags inside setup_data that indicate availability
of UARTs, so simply use it.

  Ralf

since v4:
  - Link: https://lore.kernel.org/r/20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de
          alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07483.html
  - rebase and test on latest master and resolve conflicts
  - Add linux-kernel ML

since v3:
  - Link: https://lore.kernel.org/r/20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de
          alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07365.html
  - Address Thomas' comments (and it really looks nicer)
  - Address Jan's comment on patch 1 and add his Reviewed-by tag

since v2:
  - Link: https://lore.kernel.org/r/20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de
          alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07334.html
  - avoid imbalances of early_memremap and early_memunmap

since v1:
  - Link: https://lore.kernel.org/r/20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de
  -       alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07283.html
  - setup data version check wasn't really prepared for extensions of
    the structure. Add a patch that improves the checks.


Ralf Ramsauer (2):
  x86/jailhouse: improve setup data version comparison
  x86/jailhouse: Only enable platform UARTs if available

 arch/x86/include/uapi/asm/bootparam.h |  25 +++--
 arch/x86/kernel/jailhouse.c           | 131 ++++++++++++++++++++------
 2 files changed, 117 insertions(+), 39 deletions(-)

-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191007123819.161432-1-ralf.ramsauer%40oth-regensburg.de.
