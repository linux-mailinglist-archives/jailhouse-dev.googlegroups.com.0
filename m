Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMEM3L4AKGQEBJKO7NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C65227898
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:07:45 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id x4sf4008888qkx.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:07:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595311664; cv=pass;
        d=google.com; s=arc-20160816;
        b=eBMnFvEOX4OktETBWzwVUMKTKcON/I3vDduW7YAjQqhA+0ByFHHZaOCmSPRo6mWi+p
         j5hCgmpamsM5m5ATomzIpL4Ncm/02ddYetFnFu3leQOO8x/LedlNSQ+apcSwN6LDSykK
         928O/DzsIM0pFoZeMcGVYyoQYKBeY9r+UCb0p7UMEZVa7wM+Mm8RqyTrxZTLMmAJwcAw
         QKE8sbq2iLZ3bBQHOUBahSTQusw0V/C2qoD8JNhjcwfluucRkBhD+sADK7CE3sob5aAM
         vF4VF1RHCvWiECvl3zfT8H1KiYKziZBzols5TZvzjdcQH9rJem343xLIOII/w6LYxJxD
         dU3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=rJ671xxVlSkZOYKLEz2CjDFoLv2kgMxJFOMfAgsOUfQ=;
        b=yRCfQryU04Xban8FZmonidn6Tu8vRUl30bqToy4/8iZISDLARBDWG40scyUi/xXYwo
         xC5QCG4GXCFSE9bN8exXBcVdpxiU3yCvPsK7+xgnUTVPBcNYuVSHBW9uWvu2QmoS4Apz
         fl2nwAjlSLZfi6NJ/ZXMV3DlYWAcQJqHYgQ4J8eadcPQ3bxQqW0rg21OZw6WBl/7+CgW
         15JP+P271EPO0A4eCzMAojL5YS68kgYSr86iwiNyS1j1fqyZKTHSXMoG2tKJ/xgO3vqm
         X4KbZDAtyKSVIao+BOzleyikFQBEfEvdYi2PAXRrhMC8RYKUkU/aev5UmgnPXsrpRiQ/
         HiPA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ufye+WWx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rJ671xxVlSkZOYKLEz2CjDFoLv2kgMxJFOMfAgsOUfQ=;
        b=RqexEoIcBwyUjxajP0kDYR6o1X3VQWd7sh62PkJXQwWpHYY21TweJkfnUBQMZBsRsQ
         LbXNyeNu/VzUfYnQ1A0dCd+5/tFwDuO/YvSZuFe4fR7t70vTYc7oFJNl3YoK9zics0er
         +D+63H89M9IZTgtJtCcpbcYwsu+vaMyLDQVcNGItlcBjrkjnQU8mVSFPmNxiLCnoW/zU
         ZSwPyosXPF06pelIzwwr4MX4i/QIvVfGY9UOE/cCZBouV3ygjArSSkZDYZlOARD1e6vo
         fkaMl0396igQm959TcJB3bbk5hcW4QxEcx0Uc7ykVWdTr6vR2dX8hY43mXRqZ12s3BnG
         6uEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rJ671xxVlSkZOYKLEz2CjDFoLv2kgMxJFOMfAgsOUfQ=;
        b=qpY+OB15GF6CgH3kTNvPqKaQQ5UnH+DHCnc35Baf+/z/d5etaKUTGPCqAAonX0UTAp
         Rqkr7Wk1kR3G52s1mldj6NIrI0BvLyugNF+UGizpPMRqsGzclknYk+8JYQKljOBsnTSU
         WiqX3sxtw0V1a0rOWqi8nh/sjZ5OZVHjyG14p7nmeWdiLR6+O+tXdS04dy3MuD9Jl5L4
         iYIqEcBA7QR6TwZNpDGBXJtok8fDY90C4TQUreHLx9z5Hj91A8qJvo8X+OV2ytgEiK4H
         SIPWxBYCwwY7UC/3x8NEDWxSo5M2gJ1VXz6uj7VJm/84T+jSoOpOhQDf7ovgpMRSgILb
         DCsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Ptj5AIwN8bgQRn2htBY4q2kC3TGKRpT2ieSQJBQ3z2TOkN7RZ
	3T82MyHx/8dMqYReAiTDlxI=
X-Google-Smtp-Source: ABdhPJzIlu3JkVyLCRZ/hi8odB6cs5XjHvdarXpSM6lelaPlCafLCww4OYWzSBCghBg5+meT5HDivA==
X-Received: by 2002:a37:98d:: with SMTP id 135mr18775328qkj.296.1595311664455;
        Mon, 20 Jul 2020 23:07:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f307:: with SMTP id j7ls2226757qvl.2.gmail; Mon, 20 Jul
 2020 23:07:44 -0700 (PDT)
X-Received: by 2002:a05:6214:734:: with SMTP id c20mr25723025qvz.118.1595311663972;
        Mon, 20 Jul 2020 23:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595311663; cv=none;
        d=google.com; s=arc-20160816;
        b=NTheOOtVbiWMCgRFqY3RUkhc3w27CNSuHh7cTf8ju+tmSS8fYsVI3M7nzRYnL2Kx+4
         s3Xo28gjVdB71H7qBihXmnrYZlDS0bWrt3GnjsH7PfgeEChzCLyrlJB4jPalEXVuBMmR
         7+zfAzw8XkU1JdLJULUHnwV0YWEFXcBpu/DorslpEGpu+KQCq250yxKYvXPIrlVm2QmM
         zTIgBpC8l7k4/BmzVbmhBAIp83O8LO3USG4o+dHwRqxSkPwAZ9jpqJltl1ISr6oe7Bx7
         whaHJf9PMmZQmYcnHuUDddaXqnpJcC2AS2ePTvyWhqkWQ6F8HxyPDZIuv/orxmygjgF3
         pHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=RbihMm3UM8bHa+6O2Is15YMkwba/iVFxHZJUmp8iMX0=;
        b=CR+JbuNtL2V2pQnF0qh5IAw5P+8Ms7gPb2VYphMOlSt6YbPKSyd6uO//TVq7rtplxb
         8jhC41JMH6R0kB8oCpFQ+kUaQ5v1IA4yLhEiiy873TD04oos9HzvPjfkV8FmWmhtDPfL
         H7nb0UhyRIb3UJzh7UFsbMUCm+37zEEwjOVLid3rhrUeDY6WusxIYkbnjcG/m/1pmXF7
         yOo2NLv0HpKcTl2U+EKjCBChLh4luk2K/h/Kpoky2HfVHj0rSahQqoKKBAI4Mb5H0+W9
         zUGI+8RXL5yZ70S9ShcGGk+S1X5O5jn2ZZRa1yqgrmmzc4Z0FGJjPpVnzPQBxEutXx+j
         x/5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ufye+WWx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id d27si869004qtw.1.2020.07.20.23.07.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-cd7bc13.ac4-iad.github.net (github-lowworker-cd7bc13.ac4-iad.github.net [10.52.25.102])
	by smtp.github.com (Postfix) with ESMTP id BA7686A08B0
	for <jailhouse-dev@googlegroups.com>; Mon, 20 Jul 2020 23:07:43 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:07:43 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/9b4efc-384720@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ufye+WWx;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/9b4efc-384720%40github.com.
