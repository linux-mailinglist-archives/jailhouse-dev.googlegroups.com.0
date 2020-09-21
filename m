Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJGKUH5QKGQEBMINZWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6C1271E06
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 10:32:37 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id a7sf3903142ybq.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 01:32:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600677156; cv=pass;
        d=google.com; s=arc-20160816;
        b=1CWGoXR4z9r6RbWju7JjspS6m2097pVXbFPu+tNYk4A1xpyUtezeOjMFkIMRDUTM8G
         o/uO7pDKLma5LLkCELuZAhCXijHy0GlkL7IKxv6mI11HWH9vFaTM/epfqQJI3lvXQWod
         3Z9/BadsihmC9g7A2i9PVjwQHGS1CIhpnSfas4eQ2aAZQKX2AEb82hgV788c+lHdcqWO
         g8vaWHChLJVqoJmafvjqRHd3W7PUIvWux2rtZVnkqJ5k35qMoKLHM1SsTUM1b3PvQnC4
         1U3Xorc6oV6ZFtEYga0WD5VuMGeLu8nGYSmaF3uP/cadkf+EBgNYytqa0/u+JY+CAuKY
         63wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=jKzTci4Ulj9npwBPYVfZfqd/i1SrmSZgUgtdxds2SKw=;
        b=hwIReF5dwTMMdBDwJWsxUr95peDL7pqkxJiaZn2rFBrmAcRBPmkt+eEzxhxKjsYHFR
         8nxsdWYJiqjMQSMYG2P/LC4QAYxdszIqtnL73aYeIX/jzyRbLCcXm7F7cYHJVpLHUum2
         z19ABaTEYu6iSz5dtHM8FrqThzifz1y3huxhNgb0gP3c5e8cBFTCeAZSjOinmAqp7yA4
         lDvaFDKR+FsZf/ZwVkUsQIcQsxrnDdzEYMS41sVwWA0Coh2nsAgdEZchdkscn1eZLRMi
         3oPN+1oaCmq+ev8zw6zw8rnzLU/4Sfk+gb/31dSGg+zlcdEIa2bnSI1Sl9EDk3ecfK61
         d7oQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=bKFxcXEz;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=jKzTci4Ulj9npwBPYVfZfqd/i1SrmSZgUgtdxds2SKw=;
        b=dHzgAYoIo7p/1tI6vM5Pd3VP9aikmjNl1wu0qYdUBhKYe1ofMqkwQUCRHuVp22aTw+
         djdo+8RgCm9oKP20Wdu1IrNY+X8jzEtpC38GOV3V3MktLZY3OMomgBWyCvFkMF5qITVy
         GUBzrlfE+2JHLsHHddSq/i9aQG0UHvvM5g5imKb8Hb3Ckib91oewyWJGQGUzD23Rz6yu
         bujNBht0IDITTSPQ8jKMszmU1QhWHw8cDH4pMZYuiHxl0IPnTK7LUMoUrYOGuP3yWp+Y
         uHETWlLEWteA/JVdMYG89ML60MOD4yL8rHgql+Oy5LBwTyzTyk290ZC9g9kyLHqn3z4B
         vBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jKzTci4Ulj9npwBPYVfZfqd/i1SrmSZgUgtdxds2SKw=;
        b=bpDssVOJBG0YsgbNDllN0ugjXuDAWE9Q0SyCCVGbg/6anfoHR/AfX3kDbv9uw1crs0
         hEUgFV3dVnP1e8VkZgqMVMoexXROxufPv6sAA1v9KHZVwEUyFbw2F7VrwpPo7UOFZfre
         3pJdnQHD+K6WEJcxSDJhVDXnXy84mZCKywbD0oNGPC5XQYcnBjC/eaeRb/a3VqXfICJq
         zdQLAAFyq8XuvfT+8lm2BdbV3a16h5XFfC5+bdRmZl60j5LkpVrFVeEEed0gY9/lIhdI
         OWVbQTSYZ3rgq8KhHXl9jE3eU6XSemLQrNmIa0IFsqufcV0t44XWj4+98Inwx1oLP9GA
         ajyA==
X-Gm-Message-State: AOAM5309qs9PsBOWw0vP15iRVxQ5kLq/J+wvu/QE9xiEpWRVopWLnK9Q
	CSvgtqRoQB+QTcrKFUv5yoo=
X-Google-Smtp-Source: ABdhPJwqyoQ4De8uiofiIhOXha+M9vZGynMcmU3njffn/qSYaC1R0t4bUgEryKkP3P7UQSM94eNvzw==
X-Received: by 2002:a25:2bc2:: with SMTP id r185mr26761030ybr.71.1600677156718;
        Mon, 21 Sep 2020 01:32:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:9005:: with SMTP id s5ls3614673ybl.4.gmail; Mon, 21 Sep
 2020 01:32:36 -0700 (PDT)
X-Received: by 2002:a25:500c:: with SMTP id e12mr10551297ybb.125.1600677156102;
        Mon, 21 Sep 2020 01:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600677156; cv=none;
        d=google.com; s=arc-20160816;
        b=ISydtTEXqgLlNAhxfiMCDvSQ6L19e0VhWK/0G4JDZ+tuamwoUxkSEr6NQMZZ1o39QE
         +eglgJSongPbgVvSvShnuI2JdVZS2tVk0yJO4VhyZnp1wLPb/Jri+WgLSLB5G12rUBpp
         38RWd9u+y4NrPUplAxFOlTXx9gy4Cbd8U4rbtxvwr4RkqLwOaM2690g3tUBjxlpJIJIi
         skp44PNgT7R6aH0pmWGICBESLeo+h8fbwtOf823Xn/7MzzLGIIIHTbCEbAKBUO9wYVpH
         8kfXG5BZnD/JCJwq5VVt/iEUG0hH8NR8862T2bSiqrXmqZwKlz5UG1LRmR5mG/XAL2x4
         KFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=lfLu+pVOaH/DPETipdkpAh8KEywehJ9CH3lTvXqreVI=;
        b=aZsvKYeYfHO5p0CwuUQQrEqKhV8wZ2F09TFZsDPoowmR8JR+W7tnlA9/zT5h7wo6rb
         JjbvP3TNmXxvSp3EsXC7VDY0Q2Zo9ep7zsVDdT21uJ5VzyGjABW9y6BNaFLCxH/dGaUk
         SfgLNVpeH9vCIH2w1VLOsQGbuCuDq7KttEYVReS+teyLh7cfWDEzNpPxwQ3TI9xMKLJY
         63hV6QMaC03WaONam+Nb3JXh7v1MCBgHXmEhDDrepHYOBv2dKT23PvekTOFRGu/50eyE
         2vs+Jp3QEsGrvMf1xbO2P6vNLhKYCJNi/CUvznw9PJ1oZQJwNkLeeSgwHr1+13KskElS
         trSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=bKFxcXEz;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id s9si781974ybk.3.2020.09.21.01.32.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 01:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-0f78100.ash1-iad.github.net (github-lowworker-0f78100.ash1-iad.github.net [10.56.25.48])
	by smtp.github.com (Postfix) with ESMTP id D8317600E62
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 01:32:35 -0700 (PDT)
Date: Mon, 21 Sep 2020 01:32:35 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/4ae810-90684e@github.com>
Subject: [siemens/jailhouse] 90684e: arm/arm64: Factor out common hypercall
 stubs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=bKFxcXEz;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 90684e3e8551e645f68c29c062b403b0951b4d7a
      https://github.com/siemens/jailhouse/commit/90684e3e8551e645f68c29c062b403b0951b4d7a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h
    M include/arch/arm/asm/jailhouse_hypercall.h
    M include/arch/arm64/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Factor out common hypercall stubs

Just the argument types differ. Factoring that out allows to move all
stub definitions to the common header.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/4ae810-90684e%40github.com.
