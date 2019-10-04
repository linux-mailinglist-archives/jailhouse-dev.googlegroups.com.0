Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBVXM3PWAKGQEVRHQUXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353BCB50F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 09:35:52 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id p2sf4114066pff.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 00:35:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570174550; cv=pass;
        d=google.com; s=arc-20160816;
        b=FBxwthj/COJn1o8YamrqIOYc6DQGi+7H9KwJlYLkgqXR10yNZXD1x4IU2HhDwJo/09
         P7ooVdXIA9MEi27+XnMrDRlKp6wNjBmnfSptV7cMVF7/SCAf2vsTqmNyMgFE/RZ9GYm3
         uhpHZcReVafeH1ltmcmnLbKr2PM0HrarGs5ZyYvFbp++Q/L99LiSyTe5VE4H8Jdvf7En
         IuQMUUM6aYrZYxFjmwyq1WJBMV41wg5JX9c/q6rjTAObNQPjX8/a+KfjsxRae+/6wEOF
         jEC718aZklwglpeJiHuJPe2pAKvoebhOZUexgQ36zLtkpeZlhuL78UWsP+2Z54Zlv+Gn
         luhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=qgUYVpxf4Bc6r2YsUROrwGqsw2KDqcSl6lF3gkEnT7Y=;
        b=QjNRhNYDbcBaVD2FXxuX35l/STBx0S7ELSBGXFr+/q78XF6u2Mf1lXjIrSS2fFBnBH
         MEhPKWTdWwO1aGKpBiXrMpt/mc16uWm6hLnJMuWBzADc7PXvIBS8dTQ8S/DP2Znrkotd
         uQINhSafqmvBaVOadfu+mS+/t1mmY666PNM8Q4ReOJc0ybXEDsvbnz8X93kGFqJqrt4/
         habC+kD/UzgMvvT03Y++QFvysTkLn0Av7sOwGAYj1o057YmtyNdEEpLkW1R+iziV3u1o
         JdNizlU7u6ChbbftMumofwbPWd3hGAdriiqI0ns0HvH8m+9MF+y9DxJucyEiBfeZhV4A
         4GwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qgUYVpxf4Bc6r2YsUROrwGqsw2KDqcSl6lF3gkEnT7Y=;
        b=b4P/5wOkE6UMW7X53OQZwfwZXWtxHUVoew/omAlODMv2AgIs8roInH7iAOKnc8ULsJ
         w/IaD7cFfCRtajcC2I8dlBWGlV5grVcIBgQDbdNY47rvz7em50gj/l6vWMmOLa1ivctV
         KdRvANAShWAL8tzr3ttWkfwWz7b7cFrSpHSTSBG6Xtv0jLyyi2p5vJV5rvoX8AKDM4b2
         JQobqOm0IYMb7FPcdj7CZy90Yoqq4YFmxEZHSrdxWjY9ivpik0uf4/Dqh1aGxys1LYD8
         HjwyjnwLVhRlCQeQdxi5UoXAk6Bqw/ZEnUlyNM/pSPaIWRj+aVaE1o1jsf5LMUKp9EJQ
         B30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qgUYVpxf4Bc6r2YsUROrwGqsw2KDqcSl6lF3gkEnT7Y=;
        b=bE8ieUU47m5dczc/JN8KrXVV4IIfLfhstdHxOi+egP8uDWNseGYdIPj4h6l+04xQ59
         HZ9CccKxWPHViVF/Cjd3jt12YqpNVfnIyzrAWF6Mkb2SF6OEEcTtIeBIu/GrFXCXclYg
         RajxjvtNSgfXyW8wHCUKe9LqIi5YlJ4NrZGEPZKyqxRzgWBMcTbKzAAVT1u4kXAHvaXc
         j3uNtpIFRkk7N1SJwzD2r0B0PgNHnql9Czb4bO1kJDV6WZsEBeZnAX1XQGRj5I6dMcRm
         bCjpd67uchCvsrJvDuisEItE22Hn/z1lSzRygt/FDbqWFIw00fmXwEoia4B8HeUsL2Cm
         60yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWYrXpslbeSYu9VL+XShX+JN4ypMPCJmr2P70Aa9PbLtb2rBZJC
	EzoARa1ln4i46wn2fAZBZwo=
X-Google-Smtp-Source: APXvYqwbwnMjifZOaDB3JspLywRatsUm1Ezg2G9o99fMhIHt0vWlKXeVNeZeLFBHacjt11U7gpzoVg==
X-Received: by 2002:a17:90a:2086:: with SMTP id f6mr15267958pjg.104.1570174550843;
        Fri, 04 Oct 2019 00:35:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:80d1:: with SMTP id a17ls2212359pfn.7.gmail; Fri, 04 Oct
 2019 00:35:50 -0700 (PDT)
X-Received: by 2002:a62:a518:: with SMTP id v24mr15867792pfm.126.1570174550250;
        Fri, 04 Oct 2019 00:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570174550; cv=none;
        d=google.com; s=arc-20160816;
        b=ooZSPuRj0zUXKOoDr/8gYc88/fsFp3C60x466Hq0e4cW2pCaq0YMdBsQ033+ROfoo1
         fsIrIAoZ8FyOJLc2ObWLnECaUXHDUvxmL0BVemuKW7uX+EDLYy/a27fUBhAi+DPerqcm
         Jl4l6e5GTrOYTNtL6VddTc8i0rhJIvKmncVsl6siSK4OBTjE9itt1EDZzvDctw/2BWU6
         iSsJjvMbr2dGlGEsCUft23FrseMZ+AILRqd096USFNw3xX9E2sQVhH+dr28BAPfixs1n
         TRx57ms9HmGmWbY4laikOhnjCZmp8d6d/3e5g+N+ddUO4Hvk5KW8IjYWqYEFQzvC95j3
         lXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date;
        bh=uxv9UMo42mYcCrccYikAkVmDoRLdzvKnuhD4Z5yRR7k=;
        b=VMQwv149ZFYGwhVXTc92ZWcDUweUlHrNTuUmBIA8Obyjx+ovMz/AfGvhPHdW5nS2ik
         0NiSjHFJo3Lt3Wq8z9CDIFwspNIlqGtLcgBU18889t3A2YnCRjBaJDuzaJkBSLlIDbu1
         ZJojw6s8nmzv56wPeh0rksXcUi66zBE6vVtJ9N8FO5A6egakn6dTxz2pFf6nItKf7duj
         C5TjIFqpF941CO0Ne0e7mFyfWrM3rTs06SZW5189KMNwxRYkenAlRqQtVqn4s6gV3saW
         Nk6o+lRXMYsoxh9y8teyMjDhVFnvWGP4I77L9nI8beWZSCKqar1zqyJxM7X4M/eSF1z/
         Nxpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id m186si361046pga.4.2019.10.04.00.35.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 00:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Received: from github-lowworker-ca5950c.va3-iad.github.net (github-lowworker-ca5950c.va3-iad.github.net [10.48.17.57])
	by smtp.github.com (Postfix) with ESMTP id 74F5A96033F
	for <jailhouse-dev@googlegroups.com>; Fri,  4 Oct 2019 00:35:49 -0700 (PDT)
Date: Fri, 04 Oct 2019 00:35:49 -0700
From: Andrej <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/7cc0dc-edfe64@github.com>
Subject: [siemens/jailhouse] b66f75: tools: cell-linux: arm: Do not page align
 the ramd...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: b66f75c353cd3b0e4b3eacd786eb3ef4908ef6f9
      https://github.com/siemens/jailhouse/commit/b66f75c353cd3b0e4b3eacd786eb3ef4908ef6f9
  Author: Lokesh Vutla' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: cell-linux: arm: Do not page align the ramdisk size

When updating linux initrd size in inmate DT, the size is aligned
to page. Because of this some initrd images were not able to mount
by inmate as Linux is seeing junk at end of specified initrd.
Pass the exact initrd size to the Linux kernel.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4c72146d788461c30269aa29377c51712f6c3c57
      https://github.com/siemens/jailhouse/commit/4c72146d788461c30269aa29377c51712f6c3c57
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-30 (Mon, 30 Sep 2019)

  Changed paths:
    M inmates/lib/printk.c

  Log Message:
  -----------
  inmates: Add support for %% format

Needed for warning-free output of the "%" character.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: edfe64fd80ee568d61c759d77396fd134715ede4
      https://github.com/siemens/jailhouse/commit/edfe64fd80ee568d61c759d77396fd134715ede4
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-09-30 (Mon, 30 Sep 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: Remove superfluous definition and fix linter warnings

'vector_size' was set, but not used.

No functional change.

Fixes: f6fef92ffaba ("pyjailhouse: sysfs_parser: Add more precise length of some extended caps")
Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[Jan: drop style conversion of tuple assignment]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/7cc0dc906976...edfe64fd80ee

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/7cc0dc-edfe64%40github.com.
