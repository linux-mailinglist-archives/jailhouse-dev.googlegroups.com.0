Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2GW3HVQKGQEDI5YL3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBAADBD1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Sep 2019 17:10:33 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id r1sf4598552wmr.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Sep 2019 08:10:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568041833; cv=pass;
        d=google.com; s=arc-20160816;
        b=xnwhYFT0kmaqW57xnQNxoHimXHlqFhyknYhFG26G0zzB6BMdZmF0r+gy8bp1AfALRj
         hrvTX1MIZgdsfLwVaQt43TS5+tBjYyNNRzwy80P/yKbkx0eflk92pebVaE8/wKqyqpBu
         pKAwGDBNhPBr/aTb+hNEhpQPbGDKGcC/yVIKg2y/ySMXLNC0jpmfMFrh9yOWXC2SKuLf
         jgw+sNwsi2r3SIuCWVCPMhn33GSn8oZDNMMERjsT0jql03OUBzPOVNUZ6/GPDKlgPCXL
         xvZMM8Wq6cduTG3hldu7wHEuU423qALsAO0V3FOaVA5ylN3RIOJeb0VPVEFZ01GedZg/
         VonA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=2/hZo5m3RWh1pKR/QV9nQhlrOVzUqCMpQFZGJap5bx0=;
        b=FStQG7ITWyfNAHS4RI10aBp1tGgDvPSN4PUNhhgkjTbDYRxZiFpAvt+JXtkBHZrcCx
         ylMSZQc9IW4CfQvduFfEzyhHdr0GFlAOVANbwu3vRq3v2qa2w2ZdqWhP4I8TsSJ6oydE
         6hIqLMuHgjEAMqmjuwO2sZvFLNNuvYFovwPxSYYt4f/3mor9aDNMMFFPTgbGKno1rVVQ
         Zmt2zdh5wg7Qzto3SWYJ2+3/pA2f8End9BplPxCQte+oYuun+2PRxns5a8fyV6feF7eY
         c23l50WW+I8PGi2Ec//TbRK3O3qf5UhafW6Mrl5DkSlWCmTbbEA+mduRv3SVJ+USBabT
         Vm/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2/hZo5m3RWh1pKR/QV9nQhlrOVzUqCMpQFZGJap5bx0=;
        b=nVEArb0X5kQA0T/IdPCtYWBZsNNZvbPctBfyxgXwJFTidWkP20v6xELRTWu2JJnkJS
         pMCBHcCd4ZWKDgEOXgV6NlK/rAKGbYXGFvpW1w9fgoCmmazzO05w4rKJCHkUXNkxI0cV
         QUWCr+xLC4BOZ93xTpIrmYpAICbD2IZPrtcaCup/eaGrJkUwMkRm0JFz+fHeGcKJqLbe
         rE6x55uaLd3MWE96l3zm+iuCuubbnjVCQUwHAfBCnse4m9+Fsp25fuyqD+sHOx2MZlxP
         lufXvmj+UpGYzem6ulddmHt5uNFoyZHYZjfHn6t8SWaHYoPBfEMf3b7eJ90ardW73Vbg
         akzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2/hZo5m3RWh1pKR/QV9nQhlrOVzUqCMpQFZGJap5bx0=;
        b=buiY3BwyuA4chGeASc9fLTsL2qEL4xolwoDEKeXx8h/PJiapTJQR/GPsDu6Pv6Y3VH
         uKCmljX8xu8MNOUe2t0KPOqCnM2TiLFvK2OMaYeDTa6G3l1W3fo+oq4UUSw7AmJS692D
         3Ljp9tAbIDOd2rUthShxQmZCe/9wx3YiUkhCFDAt7F0WL5XJHUAEWwaW9Ax715y+aVIH
         2d5z6Wo6WrkHzHhSLZ4i9WCWYcVO6rK3aiis4PjE7Iea2truYNC4oJxDJFR7hbmjQbUA
         126uFhtGtU+mt/20DUOpg6XQqYEt9IL8z4tW1bkmSIl3cEYeejqgh+gPZ+LbTB8xmZgc
         RxKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFJ4DcS2UibB253ZcPEx0q+Cjuids2zLZjN37gZtb9p2LThT0D
	JEsYKKEVzGxmIsoluZnV+Ls=
X-Google-Smtp-Source: APXvYqxUPhnDAx7MHxxDpO96QP5hX0taFzNsXS8Ic7/rEcLSqxtTzhbsj2lOZPxxZB8LTqrW71wZzA==
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr9538169wma.10.1568041832899;
        Mon, 09 Sep 2019 08:10:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:550b:: with SMTP id b11ls3978084wrv.1.gmail; Mon, 09 Sep
 2019 08:10:32 -0700 (PDT)
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr19029487wrs.229.1568041832169;
        Mon, 09 Sep 2019 08:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568041832; cv=none;
        d=google.com; s=arc-20160816;
        b=vS6xQ6g3gCWUNDXkkeVXmrbNyp7WOlnV1/EnCouRJuJMlC+cIApro1CCXHxnIMJH6E
         Z2SyYcD0B3mdfiG3Zep9MNpn8NyZnWw7h+4GJaYs1a6xZJHrqiEogg/YZ7GbGEC+bzwA
         vpmfqFZC/7zrbVU1i6A5CC8vcgn6SwOaqUeFVghIQ57QYyFw4IXB/2TAUycoJ0qSTPUn
         gAOnpZ337sfaEDvivxfJ7updIS78V7kQN8jlPRHVl6kAYCfHK+5FKbEKjz75mIqCqyW6
         H+VoLNI4jd9+N6+BaIcjwvvqQq5xg/G/U4sKveGheEizomk1y1n6mCEpfkTWqdHaijpX
         sCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=5iQz62A7Vsc/8XtcmFMighs46J5tUmogvKwYnl9zA8o=;
        b=kDZC1rLuA0sa0mMenmkLZtADeGnJAsftE/3O3lJpak6M766af7MV4Ve27EzDx+B3CM
         p6G826EqZOK3Xeb9v3D9i0ETZJdonvq9a0V+HZsUwznUAIZhFWatcTeA7CO2UPxQPjCf
         qavh/eiUfr06N3REEeJOiTd2on0A9lF1zUR4/j6+LA31erdpDNNYjVOCM0KtENH7Qk/8
         0iZArLFyN5V1MJHsa5SIK9a19r/tyykI1Gonjgvwq78tydAlGHIZJEnLKirhY8xLjRA7
         uIP1Q83dnUGvQ8gjQ/R2bLztvZB64KLK0tuQ58drHP4IjTvoBGxl3Bgz2fAvqnHYJHh8
         lrqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id j9si358687wmh.1.2019.09.09.08.10.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Sep 2019 08:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46Rs6b4gDwzxyx;
	Mon,  9 Sep 2019 17:10:31 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 0/2] x86/jailhouse: improve probing of platform UARTs
Date: Mon,  9 Sep 2019 17:10:28 +0200
Message-Id: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.9.9.150318, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.9.9.5650001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1300_1399 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, URI_ENDS_IN_HTML 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __MULTIPLE_URI_TEXT 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NS , __URI_WITH_PATH 0'
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

since v3: 
  - Link: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07365.html
  - Address Thomas' comments (and it really looks nicer)
  - Address Jan's comment on patch 1 and add his Reviewed-by tag

since v2:
  - Link: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07334.html
  - avoid imbalances of early_memremap and early_memunmap

since v1:
  - Link: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07283.html
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190909151030.152012-1-ralf.ramsauer%40oth-regensburg.de.
