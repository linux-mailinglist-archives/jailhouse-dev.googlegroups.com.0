Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBTMQYXVAKGQEBICGOPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6089C59
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 13:06:54 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id x19sf20350589ljh.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 04:06:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565608013; cv=pass;
        d=google.com; s=arc-20160816;
        b=hq4lJKmr6PqnPVCK3kYLJ/c2kx9IXy2/kWTkWkJcW36aiUYMhefYWP/1vLJZ8GH2AD
         QrjnRH9x5JWWjkFK+Gf3JHOhe0Fj7BdtGQcdw8iI2UBOa9lHkSap/lKboYH3IKwJ+d9v
         9cYcF1ru1V0crrbA7CCwyuW/8FVVxjH3XJ7ulVNjJfoW7Qeh3xcGtzxW1yntJcIM6gzH
         W0yFPi3+ZJn8mOdsGVNd7nKnfrS+4WXT0vwnm66Z/5aWndkkKR6hEg4a6XscrF7qq2ip
         gXr5of/aNhXkobQrc9K2hOzdfjNDpB3aWOjcAqXedUYlmIKvwlJkIqL6OJuG8Ag2ivrE
         0+2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=5SPguUHRxrJn7Rxf8VeJBZW0cg3895UMq1SGMFhwtpA=;
        b=NVfQ5ObbHsjw4kZeBrsaRknvYGOW9cvENkaLT+dVNwhavvx6VWYd5BxTb8k5xo/fpL
         tGnyPWCChAbUCs8IaU/1Oj4/KxkYOoqecmZMkpEls0e7YqfzlC+/MKjMRM5m6uBaznUQ
         rrMD98s+7mEFXhI+Psz9tVc/eqCDViBhhneCpVzUzyX9JJb2M4Q2npSYidlbm33UObqA
         9KB6WPaYVN0BZqtcgJBlS/62AKXMRJ/2SjsF4ARlF+cf73+VI9w7WeBd1MlzxlDi4+Sb
         slrOg3yBtWedMZOQlb16i1xhJX5W10Nu+AFPFxnnAjLXbCyWhIejWei6FoXWGL8R/xxL
         NXqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5SPguUHRxrJn7Rxf8VeJBZW0cg3895UMq1SGMFhwtpA=;
        b=ZmypcFz35A18Pno6aVZ/DJ13fkLPSkJKB72X8NwbZbTVU5eIG8ZAl0bDkFS+FdnD2p
         AU31h2zwoh1WYO9Z7hUa021stk7kn+wZVATo/Sfnevtg0j8fAdFxc5tSt6WBu0c72kPT
         8KgYSzwyEavOm1n0+x5TSYYnyYxNhk0OEjoCrj4yhiTFTp2pPoraL5ILsr6UWxw+NLdi
         IxQiBYKG7zfWCtK4co2rTWAzVl1DHdi8kjJivgWuGkRdjCWYvKTSdEdmp0D5N68QRyVE
         aIpeLH5Mz03AnXBc/TqmX4uyKjJynuHjGVRtQzyBagBB4eIpGWBlofWcfe6srn9muaTy
         lM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5SPguUHRxrJn7Rxf8VeJBZW0cg3895UMq1SGMFhwtpA=;
        b=Q8eIcSAc4AdYyh3MEs0BuYoWRJ5T1xsiQIjBOuN4Bx3WvL1lJEh1WrKeKUIeGLU7c4
         UBPewlKFPUj6TJQFPNgEizfZTmwH6+qLSeafnB7YiVHzEeAPTuykpyzv2huQM6WH7SNt
         JNs74uWF1LkEZJfbwuBURplzarrXGSMHtiDBWs9+I0xa1qniMAppMa5rFRxYseEnRLJb
         UVYoDg18UW+AFAE4bcLKzNAc/imDRb6F3GBjcZ+ZKHTYJAtM1hF9m+tNXdHxg8LmSuuA
         uwYDYnHbKbq2OcywEQQQjy3L73XUdAZsyLRCTFaDrLFAbOA6vFGmnl8NOAv9HDs1wm9k
         0AeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVyVxZ7gzIyT8PFXKJlbH0+T+slYGC5Gr+ASwIJPP7FZi1dEtib
	G3xzHsqnQlWLX7lLEYevgxo=
X-Google-Smtp-Source: APXvYqwP6fd8WYYx/DTuSjS6GH1Wd+UEygZPndVuE9VAqxSgILC6ZHUQwxV3lAorn8xDni/tA12xVw==
X-Received: by 2002:a19:6557:: with SMTP id c23mr19238881lfj.12.1565608013572;
        Mon, 12 Aug 2019 04:06:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d0c:: with SMTP id t12ls11703652lji.12.gmail; Mon, 12
 Aug 2019 04:06:52 -0700 (PDT)
X-Received: by 2002:a2e:87d0:: with SMTP id v16mr18911510ljj.24.1565608012786;
        Mon, 12 Aug 2019 04:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565608012; cv=none;
        d=google.com; s=arc-20160816;
        b=1C3PkblMzqD348cHC+4HV112opLUTP115QBiGdlf5p+B8nzu3F1QbRhy+cEct2JShK
         9XOXu2T+gJp8a9fO/MRbAdbBCNJaz/j3X0z+VO6QanEBweOMMJU1NxhgxN+FJ1vA+xaE
         V/W/UxoJKItTW8vjSnqB+PQ3HNGfcjV/Zp01e08/+tX4gKTRQz0p6v3AtwSkDhFzVsdq
         dYvqxSwEBk6jgHAwJjPUPzGfeGnAPJUwAcEZKUFJJEzSsSgHelv1mF6aJOkRoK5Vjyk9
         zpIGcPw3GMi6Vz31Uxag6BB1PkRvrq7wdFg7HzpQeBGFO9RWINy+bSKKCdBVR/SJYT1Z
         rhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=jh5TKEU5iikTdT7mJQiVHqwIdglXA8i9HW+2OFk0Vhg=;
        b=u0PbmSULaDB7FSzeVMRnbUjtRYfL34WrMoWztijpvjM6bf37jabT2aRvZ2mRZ8YLAn
         /1ccqeBSw4ga3Nf90ZcLsQSryYFpKUccVgdpbf5vQwBL1ahnscqgELLmgsCEoiH9CkVL
         UQoIqgfmkdMjeSxXV3XsvlDuXzehomHeVUvL+NyGI/fs0oGHGhC4C6eTAATJ+K1ohjQ3
         AoKyEuP6gSITTTgOg1G6DXrRBRdzPmq5YGaXJzw3a7uCsFBIdRo5z+MbPGdrmL9y8y0V
         evZGu/LQAJLf5aw02q0Kb4ju4EcBqXYx4kkB04VKu/ftkBXcT3EnEJp0gsA2eI0+vuA0
         tF+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q25si1259001lfm.4.2019.08.12.04.06.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 04:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 466Y2M4tVyzy5p;
	Mon, 12 Aug 2019 13:06:51 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 0/2] x86/jailhouse: improve probing of platform UARTs
Date: Mon, 12 Aug 2019 13:06:48 +0200
Message-Id: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.12.105717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.8.12.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
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

UARTs are a kind of a problem for x86 jailhouse non-root cells: Linux
doesn't know which UARTs belong to the cell and will probe for all
platform UARTs. This crashes the guest if access isn't permitted.
Current workarounds (tuning via 8250.nr_uarts) are hacky and limited.

But we do have some flags inside setup_data that indicate availability
of UARTs, so simply use it.

  Ralf

since v1:
  - setup data version check wasn't really prepared for extensions of
    the structure. Add a patch that improves the checks.


Ralf Ramsauer (2):
  x86/jailhouse: improve setup data version comparison
  x86/jailhouse: Only enable platform UARTs if available

 arch/x86/include/uapi/asm/bootparam.h |  25 ++++--
 arch/x86/kernel/jailhouse.c           | 122 +++++++++++++++++++++-----
 2 files changed, 114 insertions(+), 33 deletions(-)

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190812110650.631305-1-ralf.ramsauer%40oth-regensburg.de.
