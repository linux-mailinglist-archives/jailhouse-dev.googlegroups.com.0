Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ7QQPUAKGQEC2MV76A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1D426E8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 15:03:35 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id b13sf2653415lfa.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560344615; cv=pass;
        d=google.com; s=arc-20160816;
        b=paHwmPbDV2CtPBBxkfVuMhcwa8jws1SHTon3QIUPP7b5yPm8+kwwQ5C9z4F3InQvFa
         pFF80jUfHO0WpnWLog1odk8daSNGlj/zMBlW+KJi5Rl1oCQv2i/R+UCJZGg5pkYwg2zp
         8+4wSfOsHa3iituVwtKlFB5wfbLx7Nv7itOG61pFPdKXFwWAxEXeJG8BOJLPUZTYExj3
         1iHIJnJTgZjMF+Pun2lNyrXMiyrX3WzNllTpfhHGQPRO11u5lS3GUylwspxX3SM9S9zi
         5YXRnIgkHI6OIXdNXJpeduIQHWYcoABGlo4rTqwoPxrWyboppyEYWiOOm43b2Ms5J6+j
         f3kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Ha5xxMMZt6Aa5H25D0jBxW3iRVXUS7V/GYEDzUp7+h4=;
        b=gxkc4+5KDjgCRuxmadnP5MUcBmOpO3cFU61+NoZzIVL2Vp3D03pwy7IPY6VqZKu9sW
         88cWQCBExeuXhzhic/Q38AcbBJm9eOWdKYb1mx7TUyUF13791YCwWFyVxQieTDsUulL7
         /JyQRiKUqQ07+2OZLJ4oNPm5VmQUQZTitk8Cj6kC14uO3PofM4Zl3ctWAMalUxRcDfwv
         xlbpSL/TZG8vuH/N5ZYO7PObPDrpYfXNZaYBu1M3LzF7o/h/U/goq0d/759/Hje916Vr
         Oh+Xs5zoMhOBNHjHxknXdA87v15HoAzlCM75IyoIZy5h8XU5jhv8T1xow11/aMFwWkCx
         u/pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ha5xxMMZt6Aa5H25D0jBxW3iRVXUS7V/GYEDzUp7+h4=;
        b=BYfbSAPkBpyM1QNAuPo/QTNSsuSdSnCBJyk81Na1ouQaqh2Ygdyp8wLkl/riCUmM20
         3DohT7FI730DeN1Us194HN7hgezmkLL+zkbQC3ZZL6WNWn+PdJOjDZfjYPfYB02r3cIA
         EdhpzxUzIElKlOgGFRLMEYyKwVJHSBO9PNc5DM8EIvDAKXDrvsz4wWnT1lurOQF/Cz6w
         oMsWQwnRy2g3qsJUl+Qi8sjatEUiADoL4ncgzS2epOpD3IPl4EgLF9C6/SNuRIBg9oKh
         ic1/z6e1kdr0b1HXRIau0ACN1ac/Is9lgcWtnK22Nj2gf8OgCvpDAukGFwmQzjx+kkZ3
         lf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ha5xxMMZt6Aa5H25D0jBxW3iRVXUS7V/GYEDzUp7+h4=;
        b=c+mlojUKm+jbsKLLngwhWETZ7HbfPH0cBYjjccdblz+3sOMWvLE+nLQLM1MO4k7AFI
         0v1cpW4vdFdSjqyacUfH+COWGC/se4ueDzedgOdb3opu2XHO6tfckpsrF/tOI5w5qApJ
         NneWGBSfTwnZ62GqmaeIvnlmKmuxog4HgZfX15sgEowpRPTUfCP0MlDsWkEpdSZkhQ+s
         d3yAvCuyQVrA8TkWXCSqGXmr7iCDsGtG2QgVBOGCDerHyRD6C/hBz2njVSWk9yw5jYG9
         2XO1kKQrwazXwHP7qL/lSXDPPEyrGytz3krmYf4LkM9bCvPQnsbagDzjOss5uzDXeHk4
         UXog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWmx922DZzwcomVPFeweB+uprRMbciiXAGeReEGVQqIEfjYoIpj
	lqeoNeB8lBHMeyWqmjLgk6o=
X-Google-Smtp-Source: APXvYqwN5lkYZK1kndzdxCE1xBSTARgnuBQjcwdP/5FWnAQ0HL56q7CRd+fXAg5Jd/+tL3+L+U4dOA==
X-Received: by 2002:ac2:54a6:: with SMTP id w6mr1593072lfk.108.1560344615388;
        Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:281:: with SMTP id j1ls209677lfp.12.gmail; Wed, 12
 Jun 2019 06:03:34 -0700 (PDT)
X-Received: by 2002:a19:5218:: with SMTP id m24mr28974018lfb.109.1560344614874;
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560344614; cv=none;
        d=google.com; s=arc-20160816;
        b=Ax9TvikbgjUjeNwgIARZhncZAjpuC7lcM17uCBlLfvSikPgBbmVISE0+u7vsf0Sspp
         ow0Nnkm/upEUe2Nud1/KJIrQPqS619J4E43T7r2XaXbgp5QezsPGDtJYY2BP4+HRj/r4
         Nk/mjrHewsJS4ssIbMwDEA6AtpIKzrk2X1cxgQozFyH13Z5/lYK0w9kCmLGrwdIjoEte
         kQ0m7XWEA8nKLrYPWPKKKBQ+Ok84YE11of6XtyJsuEMQiwPahp7TLfWMVIXG6IG9Upk4
         0BojabYxx6u18JAS9nP+G4RP4vWeeCkpovhO7xAvzbfWlqB2joQJtKlTXrum3sLcVYYi
         e16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=3zLZRj5ahtvoYTIx3p1MQ04cbOYlNZykxztkRoCSaow=;
        b=NccI2hKclf+CwKlh0wYdfI9JzU9C13XX4WrCrdYrsPK6vDYhfzwSOw0FuV6kF9PbAW
         kPMYtpSOWmsyvnXVNHKw7Mo/11VLi6D0zxAqSUmSfGdEiMzb0qb7FwRIAsvve53s02eD
         /gnokxILTIflC6upysus+OkoBl/JM/o4TzuQ1cCPcelbSQnB0DBSrFiri7xJW2MKWMxl
         94ViT130xSgNUX4fVoIOBgXfhpHNw/39TWYmW1rpWot399ZE1GeSD2I6M2R/zH2E7HPn
         ttfxcqnQKpWP1+mVhPRPH86jGc4tAsg5nKVo9jcKGnQUUFw61dZPA9syLsF/opCU1MTc
         LfjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id z18si456497lfh.1.2019.06.12.06.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45P6WB0SKCzyB7;
	Wed, 12 Jun 2019 15:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 2/5] inmates: x86: timing: use a wider type for delay_us
Date: Wed, 12 Jun 2019 15:03:29 +0200
Message-Id: <20190612130332.6175-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
References: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.125716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

As pm_timer_read() + microsecs * NS_PER_USEC may overflow on 32 bit
systems. Use a 64 bit type.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/timing.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/inmates/lib/x86/timing.c b/inmates/lib/x86/timing.c
index de41fc35..1b28ae48 100644
--- a/inmates/lib/x86/timing.c
+++ b/inmates/lib/x86/timing.c
@@ -107,9 +107,9 @@ unsigned long pm_timer_read(void)
 
 void delay_us(unsigned long microsecs)
 {
-	unsigned long timeout = pm_timer_read() + microsecs * NS_PER_USEC;
+	unsigned long long timeout = pm_timer_read() + microsecs * NS_PER_USEC;
 
-	while ((long)(timeout - pm_timer_read()) > 0)
+	while ((long long)(timeout - pm_timer_read()) > 0)
 		cpu_relax();
 }
 
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612130332.6175-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
