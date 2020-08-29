Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMXGU75AKGQEX6HI4UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id A746C2564FF
	for <lists+jailhouse-dev@lfdr.de>; Sat, 29 Aug 2020 08:18:27 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id e14sf1269480qtm.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 23:18:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598681906; cv=pass;
        d=google.com; s=arc-20160816;
        b=ry4VJo8HFIrOsDmG2iJzcwPy6WQFEe4weTt50IhjUrin285bwqiniwOr26mN9MVk3u
         eA9/6VFuIL6DeXTu7wRJpEkQ6kqMrWXjHG1sAv6jU+IEKvOPRcSUAGeToIAfOnCX3RPk
         TjL2nxWvyKZIZhFi0o+YaPi0QoFr5XJtkbdOF8ZZ/d2BBSCCsDX8/AdiIcU0EgZtkVBK
         1dS7zb0lt9kEKqQ8qjme7FWM0XqflS1T1jYhsaKftsSfS51uGA6yfYO7WN4i3IO4V7Or
         kVfjpSFIv4HXYWI/2V5ekkHq/E18B+wyOiV2RtLUEVY6n0vMCbOFq7QoELEia5+pmnP3
         Wp3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=KRpA3n7w+MQvNO1x170aNYYQpvzY4/9ESMDpGIWbaX0=;
        b=gzUMB3+SDjsgQDfmLV28fLf32+1KxwgmXmqYb7VK6+pc+m7jAc8irP+gpilDDkF+7s
         zBJmKoqumbTWrElMYkUG4JUKPbdtl+apW2R8D7gmx+OLI5CgSS8KMAKWrOr5pIm3CyPj
         RuVP3lZrO08ItKaqJO+Pq64RltlLahiT0u5woKykaoyNSx/zk0e9cCn4SfrvDcuaxz2z
         /shTHb4cRTce1A8wDzjt7B78Czecwk+HP0d2ZWKZ81KYwLAdHAIzjNW2wfHXhY5Wxbrc
         tgskS93up+sKd9H8Rmk335K+QRMFGGkoyiuJW/GmfWNNoFRQrOd+5ozeBzg8SNAc05oQ
         L35A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Y4+4D106;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KRpA3n7w+MQvNO1x170aNYYQpvzY4/9ESMDpGIWbaX0=;
        b=iKnTktPDbFiTXaqDXq0o/WuYanp5V1VHSb/SQQLOIEZofpVReAGLXbd1bDOgBzwiW6
         R9Qgz2xksqn4TQ/1CeZg3CoqEQS5WSFXc7JvAmuAjDjJC9Qn/xePN+l/z4Z4K6X00URr
         aTANI7xpLQiLkc4FBa0Sw4AMAhEODCzIre5g0YwWUyzEMhmD9TbGtnjz7xtpDarczone
         w4lIfWXlq4Wll+q4XY9Gy1akF15IIV62vg3TvXhb0fgzZu1F1R7J35Njl1i6rM3Qz//s
         hEyo1HCqd5jrPU1hGnHQlCJfwxL8CmWOGbvHwRLYrRGWTZJxRcyQKga01nD/0pNfe/q+
         zZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KRpA3n7w+MQvNO1x170aNYYQpvzY4/9ESMDpGIWbaX0=;
        b=HZcHhNtbjfm6lnVSq+gankt8cXc6OTn7RvGJdtePT0FgpiK+mNMngClQ8cCCDTkSI+
         N5Y/5/akLl4JJymTQPfFrEwTPOZ8o5qAPqc4Lyf+LwwKmcDL44FplhprUnJpM2TjZ5mR
         UpJYTgggmpJUFr403Ad1qs9McAj8l2xVNfezjT92AsHTeOORVXxZMuBPIHpqCLmrfq7m
         +RlMMKGLHwxLTLbLHFs6puklyW3bUbrsjmzS7HWCt6KZAEQ+7ukyI4j310OVenL+Y6dN
         ptD356X9UhDhqhxoGwtJkPycEssEt0vi5PYX2Sj6XBooAXwSrVQND9tdbNN/7tJRY8tt
         inqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328CWDsH3wV1odszvj8+3ESqbeXaDiB1KJfC57uzQiY1580Fz7v
	yAW9efeskkWxkpm1Fh0mLII=
X-Google-Smtp-Source: ABdhPJwYQRc7bR/VNEc2r5YqIWTfwSJDmydO/mNDEBdRja1XxcGjKo/uH7yAweJD/aGxvk+UP1URBA==
X-Received: by 2002:ac8:7383:: with SMTP id t3mr4597014qtp.160.1598681906286;
        Fri, 28 Aug 2020 23:18:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:e409:: with SMTP id y9ls641891qkf.11.gmail; Fri, 28 Aug
 2020 23:18:25 -0700 (PDT)
X-Received: by 2002:a37:5646:: with SMTP id k67mr2330826qkb.476.1598681905767;
        Fri, 28 Aug 2020 23:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598681905; cv=none;
        d=google.com; s=arc-20160816;
        b=FXpeK8Z5p5rYa8Am6fasv+tkf7orAWRjLmkiTyHeK4BLtbIibu6gbVy1lvlGrP/cnZ
         nF9wPebaU8/CcnBGl03+RTFpNrmh/eG1LlPV0Z3mn4TIs28xyXfMnd3Jehr5STwTLkjs
         GYiZ9OUA8U2BwlGw7mL/FgDpl7xp8nZmXEep6sDDYhv9OK6fV6pnrJYNAg3/fK2zwpm8
         Mryc5OiAdUcbAjpKy+J6Ndi16Q+vh8Q9fT/fXlaEO9oLYyM13W0ZGPg8WOeyn9/Z0+eO
         PqVcJHCl5Wd5hceiLQPNbn4G6vUeLkSr2ewUG2cifNHfuc4phK+WQaeQeAChAzfdnEhA
         FNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=MMgJ+6IOw9pVO9HndfebxpKjZQKiW4t7S54s6IRExu4=;
        b=YRmYtVkxGBT6e7aB/3o1Ua2Kh+g2X+xn1E8VJGcvhRAPqY6fPdanb0JL6MAZ2fiIHk
         ZbwstJJ8Y2Xik9Ai1Y1sSd3bKimN3VuqHyl82q6Q2xOkEPUHj8etGyx4W5Gvi4gzZqVA
         67RGe5V6IhSFW0MEZ2KahGGZO9W9U6pcAMVaW3uqtTVVZ6ts9BaTHPwxrz7McA5APYrE
         /fo0mEsZBSbw0OYCSZJ7NjZ/9GQjAZ/lBOlghOmYiOAgnLfOwxenyzf7FXLtaxS/lVUr
         b4kKn4WyXRp8gloSlpytH8noZ4WVIimaEuZdn00KSoitRUhifsb5dB28UukGwQg2Kwl+
         vAcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Y4+4D106;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id o24si99308qki.7.2020.08.28.23.18.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 23:18:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-2300405.va3-iad.github.net (github-lowworker-2300405.va3-iad.github.net [10.48.17.39])
	by smtp.github.com (Postfix) with ESMTP id 91B8BE0404
	for <jailhouse-dev@googlegroups.com>; Fri, 28 Aug 2020 23:18:25 -0700 (PDT)
Date: Fri, 28 Aug 2020 23:18:25 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/7bcab7-8e1aea@github.com>
Subject: [siemens/jailhouse] 8e1aea: arm-common: gicv2: Fix byte access to
 ITARGETR
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Y4+4D106;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 8e1aea00f77d1c1a4b2313255966b741c2f1fd93
      https://github.com/siemens/jailhouse/commit/8e1aea00f77d1c1a4b2313255966b741c2f1fd93
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-08-29 (Sat, 29 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c

  Log Message:
  -----------
  arm-common: gicv2: Fix byte access to ITARGETR

Byte-size write accesses overwrote all fields the issuing cell owned,
not only the target byte. And byte-size read accesses may have returned
the wrong value. This was broken since the beginning, just wasn't
stressed properly so far. Latest jailhouse-enabling/5.4-rpi revealed it
finally.

Fixes: ee6b35ba9037 ("arm: GICv2: handle SPI routing")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/7bcab7-8e1aea%40github.com.
