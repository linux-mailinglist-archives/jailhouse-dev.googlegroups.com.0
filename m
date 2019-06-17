Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBGUTT3UAKGQEO3U5MVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5654829A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 14:37:46 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id o13sf16260841edt.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 05:37:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560775066; cv=pass;
        d=google.com; s=arc-20160816;
        b=LMltB6cF1fYPo7G026FJo150o4G0mPhZbdj1Hjv9mr4c1tgW/i689vgPsL8R+10iNp
         tRZMEQmuEbizdmYmAdwRh0vKGQUbuNuiIVq88U6gXOheJFg4O7Ij0WyeVsiAbjfvVW9P
         Dpra6540CVXnFAkke291a15gCpu1x/iI5RzuFRBWUf3aionoiNNAaiwYE5A8WHIGQNCU
         Ev/y8oepj+kEOD/j2feeit7cqIYTSd06iELPwbgXHD7YPjJI2vbJOjPiw5IqwoD6bJQ0
         V/B6jLuQKbZgIqP/29DTYMgZdqxdV2AwLsrTHAHNPb6ZSGcyO1wKkQMpcY9E87w7OS/D
         w+bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=9SRCK7dnL6V6jLI6dg0pAaCe9HNmUmLXTFdlDbaKfH4=;
        b=ICfo8LPclxxMGwTf7plvnxsyaix+T+fj6ddq06eC48UoZzIiHVeVGPHN+kzh3cO1Qh
         3kQ6UabId4FO2Pj8t4JyOiGoCzCYv4mIFAnL/+dO5YvS7gB8lzM34B0seNHEKkirWdmn
         /JZhk/4GuNZMKs/6ZZPVStjjkkodsjdDCHeajwFdUReXeQPdX+rdvEAke4bBKvxBeJSc
         HoQVXb5SXQNJx0IkEdzNxYKDK5y5vd95LKSo/POu6aORGi5EcG1CJl+zGX1UQt4SdlcQ
         cYV7xtaCGP9GofZLKH07qGXOqQH8T4dbcBRepvYkC0WoShZJfxW1yTO6ZPD51DpqrqtW
         tZVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9SRCK7dnL6V6jLI6dg0pAaCe9HNmUmLXTFdlDbaKfH4=;
        b=l04vS6oPHXHZgzcFNOO/8rmHSjfrBzTq3qLj3uOOGoWX+EzPn69KUSXAylhxF8QLLx
         wRe726mdeyGLmJ+bvSsoYwp/ZCET0YLiOb7pZkPkU9NSP4+agpZb9jzJFaW9WVlpiaPh
         Gkx4KfOmMToGv3rLSgPf+VRKL1Z6we5CtHRrje2zfSIQhn7j+k5nmCur08PljSvodDou
         SLlnDCqjlKAqQHUWt0+Yn2ZRJZSxZV5qMtr1zBnov/Ufdgh5GCJBysZ0xyf2E6b5FWh7
         qKQgpgdKd30JwRoBhyJ7IebqdRmZ32W3DqrmYhiclIuXrOq+Txk1F+YyJs1EHKpJWkqD
         qswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9SRCK7dnL6V6jLI6dg0pAaCe9HNmUmLXTFdlDbaKfH4=;
        b=ROeoJB4SEGvLh0MIUBVnrfnWk3UiHa8dnCFJQEF+xc4ic5Ee0uDNdQoos5ogqOxzxd
         CgZXr1WsQNtmF4VFrJYkSBDsIt+fHHF6DZjROO9DuXSg7Yyc8vM8sBlzkN+JHh+71w2H
         Mygis8HxOGUMZDOz0+3waJeeX/qIyXWPtHXBUZ/P1tgHxReQloknkXhFO4PE4IhZjeTq
         CmpSGbU9c9BBLdBruYnsBp8Y7z5lYrFprVGwRQM1+mkgE2YNY4Rn27gQqwUrgGMlxSZg
         5JrmAO8GYU9WKcNZ9BmwFRxAI5i/Sazglkc4MiyvSSq+DOXSW++eSCzD2h2y+F4bxLSK
         RSUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVRRKCZJNxjZD12cVJ+Mx4qbM0g28TzVqp6oeu9pmAmO102wd49
	b/0ckjUm1HUTJp50+03+U0Y=
X-Google-Smtp-Source: APXvYqwV2sDFEprvDUu2cBqyggVlD8RpMRv0RZcizGorKyggnuiEJJHbKz/gedU1/XPZWjKX+nlgng==
X-Received: by 2002:a50:8bcc:: with SMTP id n12mr95517801edn.6.1560775066744;
        Mon, 17 Jun 2019 05:37:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:185a:: with SMTP id v26ls4795014edy.8.gmail; Mon,
 17 Jun 2019 05:37:46 -0700 (PDT)
X-Received: by 2002:a50:8dc5:: with SMTP id s5mr118503840edh.138.1560775066325;
        Mon, 17 Jun 2019 05:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560775066; cv=none;
        d=google.com; s=arc-20160816;
        b=c4p8c29702Tiz9oZRRNNdPMPTfSw8KpzTKj6pOhy1Fy7lKPR+Ux5eJGFyZhzUB4t1v
         pX0AQZl3lQcVvCi5mlOX9k5EQmQLS6xi7LiVkHyNfEse5bAepe18zSm6fvo0Xo41BWnR
         VeqwOsmuyiRVKRzAjtlrzAku8LZudoGOESJ789JqKPsTZIBgKbKBnJe9UYjJSKYgxnmr
         +qlc5RuzzyHJDqZ3ivlP8IZopL3cYAQiFYXqhgsFYE0DJ6tj+P4tbDatTTwkWvrRdE1d
         fFAQOH0fcfs/a6TMSMYZRg6xSwZyQiDDetVH6qr4VzyYjqVIonnF2I+DGDTulWevDPUA
         5APg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=RL0kIgB2oz6++fnHpNIxX1QyVl6VTJj5WY8SXSQIQVk=;
        b=xgXN+jOXXYf/rFhGjItMYu5kjxBdR7Lg9M5lC3oZUp6xBt6laI0r3lPlk3GRneau6q
         L+HKCZgGYByluWu+Fgw/zU1ZJY1LlRwcNIc1fgDi9DfnM1rN+NNxgCJUTiA2sNMorYhL
         9JR4ZzeTyQUUfpGNO+K8VPrJpEKN7LycHvL1Aa9iLZN0FEzgMtNMaoutOYpDU5/GeHRj
         qdYDqJTYGxBjG6eAv2cLbZVPsOrbDUtCOxiYMaJSgxgJdiA9n5UsWD96A+BqXVRPJc69
         GeU9fIpfqwmBAzpes3iLBbJe8XHjxHuyoodEXo20R21vl816RJZbFoqPE2efeOLtSZ1I
         7miA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id r8si330702edh.4.2019.06.17.05.37.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45S9j55CGtzxr7;
	Mon, 17 Jun 2019 14:37:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Valentine Sinitsyn <valentine.sinitsyn@gmail.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2] x86: amd: fix comment in MSR bitmap
Date: Mon, 17 Jun 2019 14:37:45 +0200
Message-Id: <20190617123745.15409-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.17.123017, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.17.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

So far, the MSR bitmap intercepted writes to 0x803 (APIC_REG_LVR). But
we need to intercept reads. We don't have a real x2apic, so we need to
forward reads to the apic.

Interestingly, APIC_REG_LVR reads via MSR never happened so far:
Root-Cell Linux won't use x2apic's MSR-based access, as, of course, it
doesn't see a x2apic in case of an AMD.

On the other hand, we emulate and use x2apic for non-root inmates. But
our inmate library won't issue REG_LVR.

The correctness of the comments of rest of the list was checked with a
short helper tool.

There's also a read-intercepted area that can be zipped.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/svm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 9c3e971b..f2db518d 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE))) msrpm[][0x2000/4] = {
 		[  0x2fc/4 ...  0x2ff/4 ] = 0x80, /* 0x2ff (w) */
 		[  0x300/4 ...  0x7ff/4 ] = 0,
 		/* x2APIC MSRs - emulated if not present */
-		[  0x800/4 ...  0x803/4 ] = 0x90, /* 0x802 (r), 0x803 (r) */
+		[  0x800/4 ...  0x803/4 ] = 0x50, /* 0x802-0x803 (r) */
 		[  0x804/4 ...  0x807/4 ] = 0,
 		[  0x808/4 ...  0x80b/4 ] = 0x93, /* 0x808 (rw), 0x80a (r), 0x80b (w) */
 		[  0x80c/4 ...  0x80f/4 ] = 0xc8, /* 0x80d (w), 0x80f (rw) */
-		[  0x810/4 ...  0x813/4 ] = 0x55, /* 0x810 - 0x813 (r) */
-		[  0x814/4 ...  0x817/4 ] = 0x55, /* 0x814 - 0x817 (r) */
-		[  0x818/4 ...  0x81b/4 ] = 0x55, /* 0x818 - 0x81b (r) */
-		[  0x81c/4 ...  0x81f/4 ] = 0x55, /* 0x81c - 0x81f (r) */
-		[  0x820/4 ...  0x823/4 ] = 0x55, /* 0x820 - 0x823 (r) */
-		[  0x824/4 ...  0x827/4 ] = 0x55, /* 0x823 - 0x827 (r) */
+		[  0x810/4 ...  0x827/4 ] = 0x55, /* 0x810 - 0x827 (r) */
 		[  0x828/4 ...  0x82b/4 ] = 0x03, /* 0x828 (rw) */
 		[  0x82c/4 ...  0x82f/4 ] = 0xc0, /* 0x82f (rw) */
 		[  0x830/4 ...  0x833/4 ] = 0xf3, /* 0x830 (rw), 0x832 (rw), 0x833 (rw) */
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190617123745.15409-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
