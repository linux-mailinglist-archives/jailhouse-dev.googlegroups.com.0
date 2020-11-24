Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBY6F6L6QKGQESCYKREY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05F2C1DCD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Nov 2020 07:06:28 +0100 (CET)
Received: by mail-oi1-x23a.google.com with SMTP id v5sf9990593oig.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 22:06:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606197987; cv=pass;
        d=google.com; s=arc-20160816;
        b=hDHu4W5ok7tc/ELUm5WUeReujc37CaYjaluc9tWn/efT7zj4S4zfNOpDtuVm/4GLvn
         4VOpaJapU8DBkHkS/LY4uWIT3H812eTKLZPbDvobd/q1uP3I7S2nWzMjyGCZMB+PuLKA
         Ns4RZOZ62bjEPTE7/4TfLArmF8x1EtEVYtS65VkSTgQYDBbgM+IV3bybKbO730YNbA0L
         bar9tP+ySmMG2+N7bj503i/P9bylzV5aX4qd/IPAoz+QPRzmr+4aR8GvMRX9tP2oL8gU
         bvmDHGPGg2RlnmlnAW0VpLHXQiZOqwHigwLmxgbXEVg6N6Nx1pMG0A3hcpHxN8rcdS3S
         KviA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=so30cr32k4o6I1hQ6Vx8Zc100vXxONWVWYXL45FHxG8=;
        b=uLDiBTtZOetIbYiQ0/0QCkbl9TBThlN0VZ0y8Rm1/bTgkUHYoSR+TL9nMAEAhI8dqX
         VM5hltaBiaXCOY3LdAQamP7ksZurSwOyoEsFRO36VPvYeBIED0BVtYwHTUo3K32TXuYT
         EG8abzcEjWi61gZXD+KvGT4jHOt3E4ga0Sf4BaMERD3apr3YBUwuSZKkAEwXyieBcroL
         84b/WI8712smTtskS5pOTCcaLfRJjq3Jw0eQJLVtF4twMSFjPw/e696TAGtisuUEpeF0
         Y6PgYykX5PaQkzUlcn1cwVstgA5HVt/jUROobkTkVTqow3ICpzZEis1bep/WFWXA0IIH
         bjNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ax0sLNaw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=so30cr32k4o6I1hQ6Vx8Zc100vXxONWVWYXL45FHxG8=;
        b=YUKefr0MQVumJHIuryynDm8+brNDdjHeqBbIHIMSqXYz8jRtf6RwB9Uxcos0D4AtPG
         FoFTiL00giMqFUwThHhgtTqawkNmr8sUyjP7T/y0OWAjfTMsxwmi9Au81XF4Jfq9LuSV
         MAMgOIcoYaGjiy3q5urpkaWlaR2ek7zMBV2AqvEk38TdMmxV2VZMPK25EZABo3G6HfwO
         u4TimQPMNOdesMmm1GTIsseAFem7ACPiVBWTB/TnzHnd9o2ACpwmIm+DauMBUaT75zMo
         Z8MxvYCYQ2GKxRVnwFAxsh8wW9cXbndVNdCyEL0538vT2N8gqNTrvME9WNQmKYRmNgIy
         fvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=so30cr32k4o6I1hQ6Vx8Zc100vXxONWVWYXL45FHxG8=;
        b=ED1V2x+m2329PUL5UG1Fj8Qv+DxEbYhy91HKw5E/EHHZ6ncHh3k4eclu/XCKRNCahl
         8sYjTnyEGOGWLfKghIAY3LQJ5m6hMpBZdtzRE563OxvvVPb7koEaArBY1S5fzv13Jx8s
         P0O3eE7CGdKQ1sx7YSnndTm+oh/B34Wo1gHgGFhfw9t1JfyCPDz47XFLCYjDAVquc73b
         83W2NxyodCdeFosPyatJ6jMILUbjR48IMJ1EzPvdFrxFRTHvJMsNSxOniatzdHWFwolq
         c6A9elV1VNfp6seLWz2AoI/e6dDaBjl7DorE3hDZWCAqmAGC10aAGB2J3l2tXlzdQ8If
         u6RQ==
X-Gm-Message-State: AOAM531F6Wrerhs+v9SksEHtxx98zT1fIHVEIOD/a0t2dG/PQ46+2nUz
	94StiyCrMycXFG5qF+bGYyc=
X-Google-Smtp-Source: ABdhPJwZFgWPyOYeD7HWk3pZTcPA8IkqJSnqM4crd/LZijidAl0bINxpIm6i2DuMoyYDTD/XQ/aGsA==
X-Received: by 2002:aca:fc97:: with SMTP id a145mr1762862oii.178.1606197987321;
        Mon, 23 Nov 2020 22:06:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4fd0:: with SMTP id d199ls3997349oib.5.gmail; Mon, 23
 Nov 2020 22:06:26 -0800 (PST)
X-Received: by 2002:aca:c311:: with SMTP id t17mr1850161oif.46.1606197986772;
        Mon, 23 Nov 2020 22:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606197986; cv=none;
        d=google.com; s=arc-20160816;
        b=sAoxKTDc+sgy9rBCfnIsCRxGq5EReLOEvYswd39AhmbqMawS3mgXSc2RIIOAcG+9u5
         FmSky8dGtTZHvs7v0PAhiqVrtWn8VpQWanIEcRE4uVR3d4iIU9FuaT02JDz5S9+LqcPm
         fINF601/UWe7n6O7geNBaxiYIjGYP7Y5JHgsIrIAEGQLQhTbyjDHyKGcZPRMxrRMpieR
         9/y+4I+UZ2+60NxyGqvRE7N1l6/mbAxI0Z6R1e1y/k1C/57FQ+x+//tm2n4IbaTO/BfS
         k5IIw4jPuPnwwzKKwNmYsThSz/akntJaBK2D34evA30GXOKocOYngbeUSKdlgpF0MjvU
         vlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=u5GwLNq0rTUU6Yc/UFLVzMk43jcQBcb9WaUryOoHvSw=;
        b=F+lW3le0wE1gUh/nNdEB+4qb+bb5GcOvrI3rcVFgzWrm7L5iYz1lCzFmrJehkcJ6P7
         swhwW8b+5HtWNxD653UT/+/aAZEjTeRGfWe3tmkTstx9covWuBoJn/V7n9ouW4J2stMn
         L4u7jJcOM6Ef+HqWnWeNiFhXEYdsHmp8vub6UGR+U+M/a67eUHGUr23ZADQRW/F0ssG2
         mzJVKfgkZuSXqRkgJQNrAfOqDCZ9Xtz0meXRX26w26TeADAXi3QJ0pQCzOnwY6dS9ktb
         1JORiOpZ0CkelWY5VgGAxWVjJAJiNKKKoYpsmzokwWpuZtvcHhwLS8iYu5Uz8pyA70qH
         +6Ag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ax0sLNaw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id f20si422074oov.1.2020.11.23.22.06.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 22:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Received: from github.com (hubbernetes-node-dfbf205.va3-iad.github.net [10.48.112.59])
	by smtp.github.com (Postfix) with ESMTPA id A8AE75C0041
	for <jailhouse-dev@googlegroups.com>; Mon, 23 Nov 2020 22:06:25 -0800 (PST)
Date: Mon, 23 Nov 2020 22:06:24 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/097bed-5498cf@github.com>
Subject: [siemens/jailhouse] 5498cf: configs: arm64: Fix build of k3-j7200-evm
 dts for ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Ax0sLNaw;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 5498cf9f50136ce16a661677cdc1bd3b35aa03d1
      https://github.com/siemens/jailhouse/commit/5498cf9f50136ce16a661677cdc1bd3b35aa03d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-11-24 (Tue, 24 Nov 2020)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j7200-evm.dts

  Log Message:
  -----------
  configs: arm64: Fix build of k3-j7200-evm dts for older kernels

Went in unnoticed due to a reporting breakage of Travis-CI.

Fixes: 4fbecb507cd2 ("configs: arm64: Add Linux demo for k3j7200-evm board")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/097bed-5498cf%40github.com.
