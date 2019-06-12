Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXE7QXUAKGQE7ZMYTDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50842FCF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 21:17:48 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id e8sf2468438wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:17:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560367068; cv=pass;
        d=google.com; s=arc-20160816;
        b=uz85zpu0q0gLN8uMbkj8lQ1XYK4Nx4yk+8bUtOVPGMQU7CzD1peBAH8BkzbrvEh70S
         1BnF0frA9czh+rT1wVXKf9/gx6TUmUIYuhdaND5W7Wc3vbta++Cgg9WuKfHi2FTLXHwk
         NJXiXOCEnlICx9FHlILlwzNkXl+63KH3ELhWTn/usJn5l59xeNMdM0ZXyISNvicU6BXz
         uBVicfaIJKA9/4g/waNG0w+X1KTztUgGpD5bDDz+JQWstPkgwLdu4UCUTKrjyfAcc2fi
         v5RJT+saQQufg2FeH1b+oBgqQfck7M5daJoi2vmnqxX/vOdcSwCmT7V8NJIVx0bY68n5
         2MLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=lcXO1zQv8COtl5y1QDWgG/QejWYC7FyZD5zObBTs024=;
        b=W8daKrDsEyYQsj1Uh/oKuN3CA/2pKr6SQW96OYFIiq/2cSlLGPzAyZ7QTDVBXwhzIL
         vJX+6BdNUAjWyJad5U/aSqBMZukIB944y55AC7+EWpz7mIU2E5V+DQp0Be4Rclms/Vey
         xU/48W2w+BpVSMvjhhqFJ5Xie6lGOgqyJ3Sio6RLCPKTnoWONbiYfGj6v/q7fZe3O3gf
         GGD02UCpsYASVa196RI+snR5mplCOMJts/aK/4bRIjYaaY4fs8dK+v4zIFKyHYRYFnPu
         xPkWt3S2sumZqGdmuYZ6lKkQJRPg+WaO8FDWCzQEtbMaiu/B6OxaGDpJqTgD0A6qTSxd
         QWYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lcXO1zQv8COtl5y1QDWgG/QejWYC7FyZD5zObBTs024=;
        b=Bq7aoW2xsR6UKBktAcZORxA8WuiA9f/0BEljJ8F3UAjEVQs2eGfgnnPsDeY+OreYxr
         Y9OYN1A6juKlTrOydG9P/xnuu/OHkeywWNMfKvxEn8ThKKX41+K+cCiyk0mPD8n0C2ta
         0weyta+cgSm5Pgmwh4Vvpv4hhCmuK9tHHrLo/mrQhViLhnS3M63Ko+ArgOdWEF411cFS
         yGyVOobmif1pZNJ9nH0/g8XjtLVcDM7QNV6girfNtixHFNzcl4StvYPWDh5LVun4+OWW
         501axKRSGoZXXyQHw7fBdkimXepwe2i88dw3piw+d+/pbykDA1zqY2ZqliL4j7uVaYZi
         4R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lcXO1zQv8COtl5y1QDWgG/QejWYC7FyZD5zObBTs024=;
        b=O1rVR0hcjKw1cTCBZvyJJxvU/GTVoteCwRg0Flmg3trDShmrX1IsHpe22KizHX2JXd
         BnuUOdwjvS7iiUN0dNrI5b05rE8u1qSMAUT8Dsdeufv3TY3Yz0g+J75EYGY8lrmD+BoJ
         D4uK9g1yP4WXqRhE6ailvyYRWDFdQ711p8fLy2xPGFbhnTR1xWfTeYYk7/Vx843ul1Ng
         KopnKrx1YSXzn+MNgaKtqHIGe9Dg1zuyavb50ku6K9ntbOmBa0iFcp8Yn8YR8Ftz+KeW
         vJ9dOLJXVQorMnsPn5jJGJXAPGGeZeSYWXQSvlYWfGpxjew//h0wLfHTTd6L5OpJdogl
         vzwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXFQNIaE7ABD5zl8cnDcfX+8pkpXmyJ3e6LScSi+3vvb79B5Y1f
	ga56fbGS4VvXrhtQsd2/eYQ=
X-Google-Smtp-Source: APXvYqwIiCBANfZ5vPZl/xJVmKr6YvCl+WAg2U5klNXRrA2YvcqIWyzm6uF6fpm7pbv/mRrRy3sFEQ==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr543674wmi.38.1560367068411;
        Wed, 12 Jun 2019 12:17:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c34f:: with SMTP id l15ls998273wmj.4.gmail; Wed, 12 Jun
 2019 12:17:47 -0700 (PDT)
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr553009wmg.48.1560367067919;
        Wed, 12 Jun 2019 12:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560367067; cv=none;
        d=google.com; s=arc-20160816;
        b=sNjb4JvwgEB9d7XRJGdNGu7SyNuQrNv+sOh89/fD+IXigw1wDMIs0bQdQU+OV3XYG+
         yOyms4IhyCKjeQwnuWTcxOvPIj8eOmHCrodKwhjGGj13i+WLI/cToK7wH9I+0w7H4PcK
         BzIIKRNpkmduxF1pKKJ3T6+lMd26r0IKhPtXiOGZJCvPIEyPAnrFXaBePLOzik2Qvq+L
         iqzpTY6YfTx1BtMSKQxBysw8ehXHeo6zoi/PJbahavEKV0SoNBEuIV8WgzajO/xQKRVl
         TQFpRKVP3Z435eXu3NfNzZw9SCTCLb86Hdlg9GyTHiQNa3D3ms6nGX558IKfnR4ZgcSO
         SqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=+Z2ZISRu/F26uIES2UaonF1ceQyElQXw5qXD8+C+WVw=;
        b=N3Hvri2k3UaOIoakdmQ7tZYt0kOWRoYp2n1PiT/1qDx17Eb+JZnerUhwQraKfX8Du8
         Kqf/xviZtZ8NJCghOfyKTtSa86vBh2QZ9j9JBTi8YfW1moXOt2Z47qeJEPTtvWzN6WJK
         SjKMsCsiRE0NOx9rVprLaRIY2qKL5n1NMBUiKwVT6oV2cHMatECnDHYFW3FfPh5jhEVp
         wVvqDBM/oZjkHgnJH639w3EYZhIEl4PxuxtLyKnJ/e5O9yoiPxRTM9h8ESkMMt5PdlgC
         xAJIVomfYs8fVbJJXnF77762nKxWTDYkB5qwO1WPZOX8t8UAOeNusE9Zjd1CA5tQ8uH/
         FJww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n10si50943wmh.0.2019.06.12.12.17.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45PGpz0Czpzy93;
	Wed, 12 Jun 2019 21:17:47 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] Kbuild: Remove the reference to the formerly supported vexpress platform
Date: Wed, 12 Jun 2019 21:17:46 +0200
Message-Id: <20190612191746.16654-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.191215, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_700_799 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Just a tiny cosmetic fixup: We don't support vexpress any longer. Remove
the hint to its unit.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/arm/Kbuild | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
index 15a318df..e1bec1b7 100644
--- a/hypervisor/arch/arm/Kbuild
+++ b/hypervisor/arch/arm/Kbuild
@@ -15,7 +15,7 @@ include $(src)/../arm-common/Kbuild
 always := lib.a
 
 # units initialization order as defined by linking order:
-# irqchip (common-objs-y), [vexpress], <generic units>
+# irqchip (common-objs-y), <generic units>
 
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o traps.o mmio.o lib.o
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612191746.16654-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
