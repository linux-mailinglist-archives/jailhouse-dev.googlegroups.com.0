Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIWX5PVAKGQE52IMGTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDB94D0B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 20:34:10 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id k37sf2594749eda.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 11:34:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566239650; cv=pass;
        d=google.com; s=arc-20160816;
        b=WAd2FV/56tZVfxD2qAhiu/zg30hJRuFjjZaEh+UDrfCTqlBlApnzlgVWYslBmsIC2J
         UgIzBnvzR2J5aEvfP3rnfNBWKYVWVSvOEW09QwuKnIND4YzhB/vIcaEBd4Aa50Fl/vTG
         4GfsHceTXL716z+17KiIhmgo1ZgjXI8GVwDwNtl3E+hnUBId5nxPhxJYeBLWQlpiSxzB
         ukBWF4q0u/4FsQ+HZYxiyD2DppceH5znFFYS8as4LdDc+8E8iiSThPynR7SEji3rDut6
         igab8yAVAOYhrKknHSMk63zIP+pnksI5jaHuE5YstxhPI3gTOTgGW5Ol4xIBKHSaIam6
         45Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=6Q1tVPhT/Y8Lt4ntuQMFfXEg2ocRq8qtjnVksx3wWhw=;
        b=MZCI6HFgScCts4LdPJ8ICYMIVWZ1j7rrQqGIMZn95nD41dYsqfGZGpgY0AeDX9Whb4
         995hDJZkXxALXj2tWidPh6QJlWHbFX7k+q2be4mlawYQJxCTRFYZc72PM0tjVjA2ns1K
         smAXZCYr1cUfFUsJSw1SCuSlblAdnq4D6RSjOcQdcx6cN5pK21ncp8AIl8QxBsDccExI
         hWs36I+1Ko8zJXa9m1ad/8UBnw9qHzrCyifox+wPFZIjPHHmkGYjrgagd9khAsagIZUw
         mq0O/ZVDRQoLh8LA+jR5Dt2cj4fYjg8DTTe97VxcJABTjqUtYXTSzGyExy3M/kp3gopg
         ogZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6Q1tVPhT/Y8Lt4ntuQMFfXEg2ocRq8qtjnVksx3wWhw=;
        b=e1Jysl02KZVujHcVmiwcgq011Gbm5Lagl6IHyExs/Ucn9qwgdTGsibOCWe6TkvJhxb
         K+kCBMkI977tQPv5GQTivOl1W4Dgdg7HcexqIY1Zg/12nLZewUiwRckNSc7RPdG4j1rl
         LfvspmEshZG1DMVySwlUjKIhMGgPDIkfl8fPbuYWmnDwlQ72fMrncbYzgc+b8aqcqnmA
         zC69ap98Tbk0cBKzHO4OEGsXwKAW8zmj7JO6q+iU4bwirvWxhZh0/aXcrS55kZsSGTjM
         Q56ixNPYVgiCrf7Q+7DaRHIykX3MraSIdWCPsvrnnaPfsuefnIQhDFoqc0CMEq2RiffQ
         kqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6Q1tVPhT/Y8Lt4ntuQMFfXEg2ocRq8qtjnVksx3wWhw=;
        b=F7ZdkQ7e8iTYq0SCZ58dI/dkzqaNQUXhgC4l847nC+v1RlRDANxJG3pnqXmFEbuBzn
         +iZ6VKWvguNbXvsmbjLna54CJdE4JzioNmjdlAD8pidhVnJ+iILfyqqFP87FLj+lT3jS
         5LtUZIL3aUDFuW9xtV9LT5pflGZalYifJFh1QnhZairIpSLofYAadYHRDeys8Z5FI1gP
         DFbPCNXl5bMkN6miFCB2lNRjMcJA2rgbESed2pTdBTfHR7reUyL0N80e0WvRwVygEjZl
         27bzkPSLVf2OBZcdkxlt5FIC+1VuVAyfxiQ5XYI37zN+QLSk23SkZAyGQIch7q9Jm7IE
         ZTLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWPovIIc4r34osiostEtxZ4mwH7Hiv2hRpEu25Dq3D0urnLsLBj
	8Z6MzJkplYm3WwFrkWtWND8=
X-Google-Smtp-Source: APXvYqxn3OVC7MlkGsPg5gC5nynLhC4Q2bpIiOAJ5jkpW0QKH0blpxVpDfQ+zoDZkBODpWy+2jmjXg==
X-Received: by 2002:a17:906:3541:: with SMTP id s1mr7041922eja.227.1566239650408;
        Mon, 19 Aug 2019 11:34:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ae9a:: with SMTP id e26ls4483049edd.1.gmail; Mon, 19 Aug
 2019 11:34:09 -0700 (PDT)
X-Received: by 2002:a05:6402:1295:: with SMTP id w21mr27629986edv.152.1566239649868;
        Mon, 19 Aug 2019 11:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566239649; cv=none;
        d=google.com; s=arc-20160816;
        b=A1JyrG5y9iBG+qpk3vaR4YXg5ufgZ9ERIFQaqlBKuC4SSqorZtNjbQEe7jH/7AMKlE
         8NjNYvuindoLJWzNlL/aKE6+BFjODNV6WaKlzL1IGrOP1+RdcNnj86HxwkwcWSqY/9+3
         rwPnlj3vUucBbpY8HS0ZP67axZ9nQbJg8Fbj6ByI8C5ADgJsEXywtmNYOGmcaz7UUSQe
         Q2rRs3xJQ91O2AD7mW3qmplwm/exAMg/TpcSsXZI26jbZ4IkQ5G37UPx5ojJXIyuyWRK
         VPBC5cakvicT15RGXofRk0199Vu+RQAHKkSx0BRSYDMTAAXBANGEzKBjBp49Nw+LBAO8
         jjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=bi3gE1bPwLyEXnZBatIvMxsQa/NQJh/1H6zrTe7c9uU=;
        b=eWQoaAMGNj48+tKAW1HroR5xun5jSl7NXR/4kJdzpJofocAPxJuj1MuPG6ahMB4kEB
         M9zEe0Tf6oH7rmDQTzb65P8l01CD2xNzQSlBbWK68+kMdjDEw3MdhM0HDUvkzVbYfbZl
         uf7/HlUEwjcTTA1PdeY3qW2iVdMwy7av0Hf1C/PrnHD6A8x6J+OjrpaRsiOfsKNFRtqP
         t9KQQtezb3gCD4701xXoDpCPNIm2cT3yo9fnVNVGgbBP2nA155clYBIqbhV4q5kFEym6
         uBX43OaTOcYMNJA7g16NbqwLYqNHtFrx8InZYRgC7Qkg5X1uwqCrk7uSCXBQKGpZJCJf
         ZTLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id b39si795526edb.1.2019.08.19.11.34.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 11:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46C2dF1MJjzy4H;
	Mon, 19 Aug 2019 20:34:09 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 0/2] x86/jailhouse: improve probing of platform UARTs
Date: Mon, 19 Aug 2019 20:34:06 +0200
Message-Id: <20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.19.182717, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.8.19.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_900_999 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
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

probing of platform UARTs is a problem for x86 jailhouse non-root
cells: Linux doesn't know which UARTs belong to the cell and will probe
for all platform UARTs. This crashes the guest if access isn't
permitted. Current workarounds (tuning via 8250.nr_uarts) are hacky and
limited.

But we do have some flags inside setup_data that indicate availability
of UARTs, so simply use it.

  Ralf

since v2:
  - avoid imbalances of early_memremap and early_memunmap

since v1:
  - setup data version check wasn't really prepared for extensions of
    the structure. Add a patch that improves the checks.

Ralf Ramsauer (2):
  x86/jailhouse: improve setup data version comparison
  x86/jailhouse: Only enable platform UARTs if available

 arch/x86/include/uapi/asm/bootparam.h |  25 ++++--
 arch/x86/kernel/jailhouse.c           | 123 +++++++++++++++++++++-----
 2 files changed, 115 insertions(+), 33 deletions(-)

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190819183408.988013-1-ralf.ramsauer%40oth-regensburg.de.
