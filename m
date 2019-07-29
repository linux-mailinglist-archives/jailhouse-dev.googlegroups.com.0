Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNEH7PUQKGQEWVQBULQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FC78909
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 12:00:20 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id s19sf11527031wmc.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564394420; cv=pass;
        d=google.com; s=arc-20160816;
        b=QoynAKpf6WJOJiosn7Fd/pdDhT/mJRXJejTtT3zmJCYKqi51/TLGxbQVdWJgcT3Art
         pKgj9AujCh2e+W1D/Y/bPVrL704nz1mpTaFIHtDUngPXI/xNRCfP6rjJEzCOX80/0N/w
         Lz10SCG0OTayIlw/lyH+WA2W6bKh7rOqrVZ1sy8g3Xc739+jfQtlV8x2Ovbnnn8zIBuo
         x9mtN2H2kGnXOZPKFSrICihEBE7LuYiWqcnymlKOElkSkLxuWKcXSSXhpg0AljfHY/3Y
         VGctfbNynItwtIQWDCWxjto+b5QSiqaVMgC2osz8T+iZPIX/sDvdTDMtN7kR6f7FB3Mg
         w93Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=bm6hI78hLv9IJ0tdlaDFvGsipzNYFNz0kJkfkWWNf00=;
        b=p6UTm0R3D2lT5wIb65XQSuWZyLujFuW7J6Q+hrkwIUbdtRl2+ayZhn6gSIEtDwZQMK
         ZthXpzSyqbjkXS7DJe42wAor1u47ME2t18HpxtCDfxMhsFbbvY8LR0P4Nf8vS/yBI/Om
         G6S37qSefVNMh5JBoq9b7Kkg3TxAb0g3asn6vGN0F7OBiFY05v6o1vhmNE1PSQKccQhZ
         x46XzZLwa1dEAW9Lp89sFvCmLyQ3jAtHME+FVwXlfz94RRMbToQJcyPdwp/1Cm6hVuSd
         gV1Pq8b7y+1WpwcRAlgFAIPrwV1y0P3dCjiiewyxIxm1rPm2cc6/tUtftZM3CA1ojckq
         3nWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bm6hI78hLv9IJ0tdlaDFvGsipzNYFNz0kJkfkWWNf00=;
        b=OI4LOC/Y8ufN77eKMuRv7loQOdla74EH/v8MrdH9E7fRnGKCfxbjMKcKwSJlnjyy1b
         i0r91jbt5HTS+8lSJcRmXPMm7P6D+Ipfp4/R6F3vA599b8J6UXFWeSXDdiB0uSsX2PxT
         hPfjNmTzQlmSgD/7RbG0LJJwREmNZDX9iuB3U+Vh1b+Lf9S2oYFUzpiWqRbu8kfB2yq8
         /VC0KvKzym5TJAbMhatRaVmZjSrs17LEASZeowvrI8XhykUkNK2hb/5N5hRz55zFF9xo
         99egM8JsIHE15wCtW26seKGbrm6rdNsxQpTJ8gK7jE1RqyOddbWnvFkLWAhoRqtL8l7q
         cw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bm6hI78hLv9IJ0tdlaDFvGsipzNYFNz0kJkfkWWNf00=;
        b=Scd/q4397IaHYLgtdWjxHLniVkYWL/Jp5BQIyzpGKim67QB8v2pEtamXXiSF3PXVdn
         oDfGsxzQKcASd+kefpYxIeC7+Rmg5spRL0myL/ww56CUBcAG4BpABFPItgwSul4xNokp
         ttpcN8oT2/vvipxUoy7ORPRsc+gAF9L1Z6TTEMsmUbDboTz7UgMiQvPonC/kkJJOmaHE
         S7/X1jpB2xcsP2qpQ2FZ1Vw4uNejakyf1AhpdmSCiFn7mCgmLW6px/uzEtdOjcTQ0tec
         QzUjGwbj20OyrhhO4cyYgbD0G25Gv4YNzFS3kOG5EnTXDiIayxrmOWPqB78WYGU8lRXx
         WGWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVWDFGpUrODb0FVOxMThFFnkmjZ6Jjse2u7B71LO5xcZ2jBJ5b6
	qw2er+RnB9POBNN/Gl2ZV9I=
X-Google-Smtp-Source: APXvYqx7eE9cDjj1xudQSF9JacFdpQ6ATqJp5WQ1N/MtxxVS87Y0z3ZZGUcYBg+oPGNAD1mxObtmxw==
X-Received: by 2002:a1c:a6d3:: with SMTP id p202mr101099551wme.26.1564394420561;
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc10:: with SMTP id f16ls21193709wmh.2.gmail; Mon, 29
 Jul 2019 03:00:19 -0700 (PDT)
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr101700505wmc.95.1564394419804;
        Mon, 29 Jul 2019 03:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564394419; cv=none;
        d=google.com; s=arc-20160816;
        b=CitjN3pFv+bdGj16I5LZy7i3Jtl4qbV97wA3ZwPwbTyJQZ0he09ADQvR1QRjKaYW0i
         TKMtP6lJrCYLP1JwWAKm/AXBUmnXnDn1kR/Dhg12HRIeN5W7qvqiOwbBwzrZTB8Os2zf
         JxPEy9RFokQ5OTsksLDV0dD+Z+BwSTskG5DarDUnjFKTvoDpMPLcTmSkCAbhKsQNG2CV
         66xqLvrHlLqFv54Rvk34P3Req3Wnh61NGbPrLLt7ve9wwHKC1k9rBbgw8p55vy7negGI
         S3E2efh0HRECywfZAOP9yOs5QLQ2zVThVnvnn3tXaUSbhV9AIc0UWyQrKip2XyUAoLbg
         +JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=4s2I3zCCDEQTjy6myjfwD40WAPykqs+iQSfbXG3twSw=;
        b=LciTlHn6TdyEpZENqDMRL5jBiyh+qJuaNfUO2zuEAl3+N/nDiL365cOYw9sIqvwPjZ
         wSH94XGyFL/TCl5QlXpcbaeA+yvO1h46zzyqvQ48JqwZc+gq3wun1YGBfjI6TurT0sg+
         gvXCWWacokyCOkN5ilkATgplFI8gL0Y4iG7qnosYqQSE3jSzpNlg4JuiyFLSehL+EJTT
         nwDw94Uy0oVLhuNMhqdlU/X5qOdMQMfAMmGP6AGBgPA3YA1fmUWHBo5NOG6SvYDas3D5
         Lkp28HHfT3Yqe6dAvUsZ429Upw94Klzmb+MPYtCrwyahz6eeNM4j2DBhMeBxnhGc4LTA
         tZEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id a10si3171078wmm.2.2019.07.29.03.00.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 03:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45xwD31qrnzxpK;
	Mon, 29 Jul 2019 12:00:19 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 0/4] inmates: x86: linux: forward platform UART information
Date: Mon, 29 Jul 2019 12:00:14 +0200
Message-Id: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.29.95416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.16.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1400_1499 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_URI_TEXT 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NO_MAILTO 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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

non-root Linux will run into trouble, if UARTs (no matter if platform or
other additional (e.g., PCI)) need to be enabled selectively.

As Linux doesn't see ACPI tables, it assumes that all UARTs are present.
So far, we supressed this with 8250.nr_uarts=N. But this workaround has
the particular UARTs can't be selectively disabled.

This series adds flags to the setup_data. Bits 0-3 of those flags hold
information on the availability of platform UARTs.

On Linux side, we just need this [1] patch. A second patch for Linux [2]
is optional, but not required for the functionality of this series. It
enables MSI interrupts on PCI based UARTs, if whitelisted.

Once we agree on this format and this series is integrated in Jailhouse,
I will try to mainline the above mentioned patches to Linux.

  Ralf

[1] https://github.com/lfd/linux/commit/8e137ee548730eea338aa383a9a09ae050fcc261
[2] https://github.com/lfd/linux/commit/929cd8e8df9914a84843d23fe2d14470a2db2765

Ralf Ramsauer (4):
  tools: jailhouse-cell-linux: Simplify calculation of setup_data
  tools: jailhouse-cell-linux: Add support for pio_regions
  inmates: x86: linux-loader: Enrich setup_data with flags
  tools: jailhouse-cell-linux: fill the flags

 inmates/tools/x86/linux-loader.c |  2 ++
 tools/jailhouse-cell-linux       | 36 +++++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190729100018.19411-1-ralf.ramsauer%40oth-regensburg.de.
