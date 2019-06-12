Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ7QQPUAKGQEC2MV76A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1C426E6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 15:03:35 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id y80sf1141894wmc.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560344615; cv=pass;
        d=google.com; s=arc-20160816;
        b=oEDAQ69dhtRObC9ZDsb144bLRFi2BndIvGjkxRwhultkf27tTd9mBY95uIIhgYUCOG
         jJAbAshGBnb4Jz/6ZgyCo/a54+d7LdywLFZRDLgFAe06P8hfn0qeI8aL9Q4ih6lKljaK
         6sQo69+fGsfQGTulSzryT70VYvQrBmw7FQYJrNKzg2sMSRKes/PtcbENV0LR5GMTMF3W
         kAoY2Rkw9zCWlEcAd3NG02CzH/zVwmpSoGVVp4xtKJc2JzpZ2gTYkzdrPwOo7XhSeu6B
         7jd5tLb0iGwAwrPDFdtC/eJi9H8boHp6DxOrbZpgWbfokojlcB3EkCsj4rZZ7UZ3DWjN
         Jb5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HSDCQ03ycJ25qI3LQMjn5zOS4RFIGCLkB2L95s6fJfU=;
        b=tBxJ9WOvQ+5eVWRj7vxzkzKsxH15zNkXgfO6NiOjgMK977jGLrceB1KVPBVcFCLwXd
         yedPRSo/a55S16MFW1A1I9wd/HUMFbDid2EXDb1lbPR5h+ZuduzHDVFC0vOTqBBJ4X9b
         CEddd9Ck29RqoQ7T3blf2d0D8geK2INb5exSUBjuAgz0F1VNnxSJNWpvgZTOp5xMhtgJ
         lTySH8YPe3pwAzWq0Z61b8DSAYSSK4a9UwM3MqzwZiE3gkPfHPAAwCkF+0f86mu3FsPx
         JR0RyafSXqK8NM/nyduf8LBLI9Hz717mPDYZEVv0OOQ3AaXeGREuMBKrcBvKdN9Wmk/j
         C1PA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HSDCQ03ycJ25qI3LQMjn5zOS4RFIGCLkB2L95s6fJfU=;
        b=ieYxjDG6EraIGwkAHNyOCWzwuYcZPcJL4wDhNZabR1h2SZmrKRLRN/568rQ4FVJn3c
         MyNQIxpIrRkUIzuJtxrQ3zG0zbv0O6Ep7b2GwiegZS35kRxA9aRuWWSNscU3avBj0743
         ipe4XjB95hcwb0Mu0ZbCsQA4duCdOMs0RKaTuXp6v64fnZvK5h9iiKaMnDZX5MWHJ6NA
         gIvnwmCzhMkeT61ggvZJbVqP0na2PvenKFu6Uhc728naOlONBrlujrv/O8+9Hz5Rv4tk
         //T7ZSbm6Mf8LKL3ZlIJ9VA8xrnQcgBAEcBSvmx/nVb9pm5TwQLneFIEOcnHr9xA4VCP
         4QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HSDCQ03ycJ25qI3LQMjn5zOS4RFIGCLkB2L95s6fJfU=;
        b=G30mRSCtoGdqknBQULenGsBkAsP9SOcoc8TuOapVf+ruOM5ilBD7ejrYunPt6mAefS
         ncg8tqTGOkbNqVtTJt6SJ5K7IELrck6JDxiuijl+M0fCUsuMteakPncKZbcbFYJvczH7
         bgH7kqlcp6GXk3ay7pM4hei9d3DsjZkS7OY7GjDTrpJbgcCdFQGYzWRefMWBxds7XR5/
         Ju9MHO+fmKgkOR1atLSb7MkIyTiSmmhPIWQJ5uE+Uwvd+A6i8S+Y9zYrI58aFys1/Mpv
         f20TxGRVw6qBbd91UInsSA2mEnHEqSZ5GCxLrzuns0BEARJUCbh8ZStnhrRfMwwByPnf
         ULmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWebJkcbxA7EqulzsKlPCgHqijmd+vWJpM9pliaRNY1PT47mu0y
	ZrjQgR1Bs3ESwJeQ2FV4qZA=
X-Google-Smtp-Source: APXvYqwMruyNyCcw9RX9m4tHfrF8yVIKUDGCqrEMV33mi60pZkp2TxfxwqB4V9yHSjcl79GJN0F/3g==
X-Received: by 2002:adf:ce11:: with SMTP id p17mr24759712wrn.58.1560344615298;
        Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:96cf:: with SMTP id y198ls685821wmd.5.canary-gmail; Wed,
 12 Jun 2019 06:03:34 -0700 (PDT)
X-Received: by 2002:a1c:6585:: with SMTP id z127mr23732657wmb.25.1560344614665;
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560344614; cv=none;
        d=google.com; s=arc-20160816;
        b=apdfRYPacJvYVAphg7RfsYbQqlAf/zxEO1L+W2TJfaV4llOoDqQEMx9d4i+UYBAVSn
         Hvkb4HgI7Lsmbn0xoGghUa8CcGvd17J0tUUbktithZXg9ukKpakPKs8BQUQo3/uLF84C
         4Wd5eWMWhTWWdk2rQkJeYNOkm35OhftMbdxeSZB8v6tdUL4ss200gS9S8cC+TTRKPG+O
         P66jndl3inVw+kKx0OZent0226QSjizBbwy6QbXxbeR+GXa5W8m+QfW+0NlAhfsSnDZJ
         QB6qhh01YZojKTJ3+0GoietYZVjPo1B2eocGXyDTdGPMxkB6/vTi2lBKyuF+dS2cyLf9
         t1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ZVzGXyQp41bBXw1NhUshojCxDDS7KjOnXs8ryqRYCg8=;
        b=I8mogkAJ3iCHXSRmcy8vDOqvjVFvy7adTKGJK4zb0M63upl0ymKUU671Sn5RaEJ6b0
         ndshciGZvdCeNsOs+D1xXHR1wJmTlsHiiRb4GdzV2oIbL6aKrt5enRcbm2Q/JJWgUdb/
         F372KDxvN1QPs/e3itJkpTtwRnLcBiUsmki0LQ+PZtzrkxwKQtowpFCVQlgJp8OkZTdS
         UweVQI7QqD98kYNZetEMYoLdcONqYnSiE0jPNAV8h2ZdcziAyTcuZJDooYb1uJLLepqI
         X/0nyV9UxhIlcCfET+aeoD7xrqmGTpPCTFXzzsvk/kUZCBglGhU3QDZ1Kzo0BW7YM9U8
         Nbsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id j18si709957wrc.1.2019.06.12.06.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45P6W966M8zy9x;
	Wed, 12 Jun 2019 15:03:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 1/5] inmates: lib: Use wider types for time-related constants
Date: Wed, 12 Jun 2019 15:03:28 +0200
Message-Id: <20190612130332.6175-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
References: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.125716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_900_999 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Especially when timing is involved, multiplications tend to overflow
32 bit. It's better to use 64 bit variables during the calculation. ULL
for constants ensures the correct width of intermediate results.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/include/inmate_common.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index d9f1df5f..c85f1383 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -42,9 +42,9 @@
 
 #define NULL			((void *)0)
 
-#define NS_PER_USEC		1000UL
-#define NS_PER_MSEC		1000000UL
-#define NS_PER_SEC		1000000000UL
+#define NS_PER_USEC		1000ULL
+#define NS_PER_MSEC		1000000ULL
+#define NS_PER_SEC		1000000000ULL
 
 #ifndef __ASSEMBLY__
 typedef s8 __s8;
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612130332.6175-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
