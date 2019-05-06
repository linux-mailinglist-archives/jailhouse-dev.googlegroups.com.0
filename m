Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAHCYLTAKGQES76I2KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 923EA155EB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:12 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id a16sf9503706wrs.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180672; cv=pass;
        d=google.com; s=arc-20160816;
        b=Af942Vqe/MRZbYjvgiJCrSf94dxr/LjPNAZr+PD0Y7rc3ijfg9KQjPBbaC+2vi7+vO
         XgQyPzaR2wTKE85JlQr+X8sl4IRBV3f09+igYaM5fW9cOXfuWPD7Fd6jb9/Sc+7+1Yzj
         RRkw9KrLLfAry4rvoJddT/JJTvnOMXwUDQ3MXNI4zMwUNugOduQ/+bUXb/SU79N+key4
         FWDgC024rtYOr+m3qyDvrxXRQQFgEmib2X2fQoD5zDbrehg4R9d1WFdkOJfXUSAokeUW
         RORNJ+Sg5YHSMuLidL6Mqkp2MbJuTy19tKXEnPvy+RSGWOXPuWiaXkDs3k+ONPJt+ZMt
         kJlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=ero8wl7/8Pi8X0Zteaydbeo7f5UHq9PFutAyuzP2pP8=;
        b=daw+X8YuHE9FwhsmXhYnKlM65RCaAOAdANx697CvUas92bkh9Ka0ukhW2Kw3+UtJiD
         bcBF7vhfnTcSC3ihXwFgRc2yjKrJ6YVMxRx4r2ApoVl0JongOWxXENdyXKBMBAa/Ak7m
         kP5tQ11xXnlv0qim+M55NSprAtm/1g9QMJFGcUrOuI3QnX/2iLF6QuxqkfDTbaqdz724
         MCFW8G+Cq6S8GfA9pzHWDV3lCxdTV0zgKMtC5627sEAALrRG40VKRa20/QG+HiPd8Ubj
         kxbtW40sYvLRMaH4IEcKX1jeDwk7vv9IuvIMeWH4GJBm+PYDL9JAm5KDsBH4h/TCKthd
         eBMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ero8wl7/8Pi8X0Zteaydbeo7f5UHq9PFutAyuzP2pP8=;
        b=fgIsXWml3FTOABLRO587t0GwP32X7O8Wp7u8KSf/Fer0dyKVaCWV4JgebK0tyGxr7+
         oa9h/EabQLivlta1+p4CeQjr80eZ7W37voKkIPQHWOVAPNWVKCu8VDS/MWWhLvDvCc//
         ujE+mQSGIPgeMIhskcQ9h33VTtHHBI+JwM+/+MUR+KWs6NwwPJ+T7DhBzeMOcIxNTwff
         nMsc6ADrodS8gEnIEbo0antATpFneE6fIbcGGsSqIm2iec+vF7OD1CbuladaeY4i97be
         1jWrK90h8mhFsj67CAnJRp4EWls4evyb1LFuK3twKRt9C5m66MO4KWH0gTnr2WFIfh42
         I2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ero8wl7/8Pi8X0Zteaydbeo7f5UHq9PFutAyuzP2pP8=;
        b=pe9+gp9slJOILtzpSu19oYXPaSsTquxa12xuAVhQOUrfGbvkW8HADgvyWpa9YZwAnC
         F1GT8P2uTxDLmZzY9TvPwwFk7V1qFdXNLnELPgJRK+Yfb0dbVhL+8aHEjJ07xVdkfdNo
         A0cXlqYn3WBwVGpsvjfx2ltyyu2F8u1c+mhTYhz6Cq3bUTXOEoLtIH9Gsnovnk4WWtyc
         FScNCPvdYEM15wMMtAZ+W7eHuE0X/CQRVtj372CmwGP4h6ZS2UxQDs6p/jT+EeQH2xxv
         O8A2djvHYFWfWN7VuLUBrmXQiwdtui/KREdwkS2GoNETWMFkn5ZVBhis75nqfnsyKLGc
         VYAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWDgg80IcIlgsRE7sPlaraAX8meulWYYaFjBq+SLQo0bEzBuPKe
	VmlU2+uDVC0i/2wrvxG4NF4=
X-Google-Smtp-Source: APXvYqwx9WL+VZAzZqNRsOkK75/yQSqut33BZVfHAFfYW4pZoMD7pSRpkL2NOOk87hIlTsuBlnldeQ==
X-Received: by 2002:a5d:6b10:: with SMTP id v16mr19736743wrw.294.1557180672330;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5287:: with SMTP id c7ls3409230wrv.6.gmail; Mon, 06 May
 2019 15:11:11 -0700 (PDT)
X-Received: by 2002:adf:db8a:: with SMTP id u10mr20610159wri.82.1557180671900;
        Mon, 06 May 2019 15:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180671; cv=none;
        d=google.com; s=arc-20160816;
        b=Z12TmYCdqDUsXMP3wdZsjbRkRBgXc9udyQDClG0onbQFiALml4j930xE68IQZODYeY
         fHflf7B9o9JOyPnRM9Fe/jDahjZefe7TRP6W/2WQ2ooJ/zVNLNzxUsteoFnPQudtx+mU
         E4hj+vk8IV/m7TI2BC0UbTDEj+FLmBtP63+1m6J27wKJmQe5AooXeS8VC9iwqrUmG6Cy
         KHy+pasATBgQxj13XeHfQubuhtqgAsAbdfbGDaakQdUpPXvI6XYZrdt5LsU3Fvzrtkrp
         oj5dulU1LRMzCQ1xdqIRT4fP5LGLHAOqNUyv3ia/CE9Uop/Waw2Mu8tfmKRJFXieymsh
         LNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Mg5klTcrDNGAJ0yDClX3dMaCXJIZvXzXEHQbmtTCTYY=;
        b=PA8CIWPDdNWNgtI5EDgoUYisThhqB02aF2p3q1EoN0zikQnGcxXBV2SMpke50efAD2
         DtMUn9Yg3T8gs/2YJ6WXQJtIfLPTWALWmIinEl4JpeNfDzyd/Nqu3cBRATDS4IY+xM+M
         JJ/n97slJh4uJYipcoMszI43BtdDcX4HstFx8XVVX6Hs/m57YTnSxko7h560nrI20JAi
         idZHWXqg9gy5yEXCWB3i3sZzjZG/Or1LPGkEr6LENyoWARvrekZhN1gGlzmcgga9Et8n
         AKlyAqTxpGd8PQKur1CYkWbmIRYR3lR3souD5ORCz5Tvl5NfzLdXzhXctwM1voz/55c6
         Xrkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id t1si484103wmh.0.2019.05.06.15.11.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQ72XMQzyB7;
	Tue,  7 May 2019 00:11:11 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 0/7] Improve pci caps config structure
Date: Tue,  7 May 2019 00:11:03 +0200
Message-Id: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, SINGLE_URI_IN_BODY 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NO_MAILTO 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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

Let's use speaking names instead of hard-coded constants. This series
first adds definitions on C-side and later improves the config
generator.

The series can be found here:
  https://github.com/lfd/jailhouse/tree/pci-caps

since v1:
  - remove the ARRAY_SIZE patch, not related to this series
  - Add a ExtendedEnum helper class that allows type-safe use and
    generation of C-like enums with syntactic sugar
  - Let make create pci_cap_id.py
      This is done in Patch 6/7. If unwanted, this patch can also be
      skipped without any breakages
  - Align some hypervisor snippets, where we used alternative
    definitions of PCI cap IDs.

Ralf Ramsauer (7):
  pci, configs: unmystify magic constants
  pci, config: add more magic extended caps constants
  pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic
  pyjailhouse: implement a helper class ExtendedEnum
  pyjailhouse: let the generator produce speaking names for PCI caps
  pyjailhouse: autogenerate pci_cap_ids.py
  pci: use new PCI_CAP_ID_ definition from cell-config.h

 .gitignore                         |  1 +
 configs/x86/e1000-demo.c           |  2 +-
 configs/x86/f2a88xm-hd3.c          | 54 ++++++++++++++--------------
 configs/x86/imb-a180.c             | 52 +++++++++++++--------------
 configs/x86/linux-x86-demo.c       | 12 +++----
 configs/x86/pci-demo.c             |  2 +-
 configs/x86/qemu-x86.c             | 20 +++++------
 hypervisor/include/jailhouse/pci.h |  3 --
 hypervisor/ivshmem.c               |  2 +-
 hypervisor/pci.c                   | 26 +++++++-------
 include/jailhouse/cell-config.h    | 44 +++++++++++++++++++++++
 pyjailhouse/extendedenum.py        | 46 ++++++++++++++++++++++++
 pyjailhouse/sysfs_parser.py        | 32 +++++++++--------
 tools/Makefile                     | 14 ++++++--
 tools/gen_pci_cap_ids.sh           | 58 ++++++++++++++++++++++++++++++
 tools/root-cell-config.c.tmpl      |  6 +---
 16 files changed, 265 insertions(+), 109 deletions(-)
 create mode 100644 pyjailhouse/extendedenum.py
 create mode 100755 tools/gen_pci_cap_ids.sh

-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
