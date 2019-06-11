Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTPM77TQKGQEF7UTGDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id D36CB3D5A8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 20:43:26 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id r142sf13513189ybc.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 11:43:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560278605; cv=pass;
        d=google.com; s=arc-20160816;
        b=I5HC0iA86N7dZeNP1hdBdpOfCe8Lntw1S8XNNyKCW+Z8kzVYESxt7Ai+MaYF3lKckI
         jOnp0fXBm4uy/E2L4kb1T6pY7dHbuPvK0fJHGAdJyXkKXIGpiJhpEPab+Zooyf1cE7nM
         nLDzitoK8SxsU/BaeM+/Rd6ei+ejOe4KPeVJbV3K5NI9rRUu7bF3Bxcjo//W6Ds3Y9Tm
         7TOcdEd0jbPUhamG7PywyI1Sr5Fd7uiQVWWDTSISrpWieQwWGwtKedh+mxR4hfU3YZVZ
         6cyP05u2fbQpISe3oxZkUNv56U/yNU1K5+KS7VB/t/4tCf7ouC/xFSkPiY+CYUPowfFZ
         JvUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=eleWttBqENjYtae/WSWf9XpPQp7m6NSOgFeUyv0+QLg=;
        b=SSs5zZRX1NJO/SoxLcFyU4LGBqmUikfvXYSeHEJ7G2zSeLHhb4qx2h7Inexlea2Jua
         tbgGOmHXbSBsyq6trlCjTckT+h/pkXoW25TTbLsuJm5Po9uQOutqap76RnZGb0j3URiS
         ADrWvBYVq5l2aMPCz706aeBU7s7g7jblljW3939TaoUIQN6Zu1XI/86JC11giEautr6w
         4djorE0hQVM8HLw7WkXcHsyc0BDe5cx7KI9zdDPtf2jRoVUOYf0DLbxDxW+EHoeJUzqR
         jmEaz8PBrcnjy6SMoKHdzxtllGSHWW2NDziKB3ji9lzzvTqYIlC5OenV41I3qqDE3bJ/
         DMCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=s790fB6A;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eleWttBqENjYtae/WSWf9XpPQp7m6NSOgFeUyv0+QLg=;
        b=nDnSvA/gMFxts8lXto8oYKnthZVyY7ohfG3fli2g2Hk8uJqtuCROK5hWwErB1BdVfs
         OoY23sqLYUrrKhNRvYPTlt4SUqdj67h1viD/zdtZTQns7IxE5/dQ6woecdUbJraScKbm
         TP2XcnsaJJ7yZR/BqrfI3i/MBZKUMe7TikLmkTNLKGndhI0Gj2/w6OOTNGDwKwBnUbD3
         Pix4OIFTckoV+wtYD0lBVZk84pftA6TGC3F67nbA/lpgMRpRf0TW7P5pJbo4KfeMEu8n
         Ageky+hiCD3bL2oGwjM/Iz0G72aLxJF08QYCEUaeIEHA9Gb03NYbEOtJBtF7Tc2Rci6s
         gwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eleWttBqENjYtae/WSWf9XpPQp7m6NSOgFeUyv0+QLg=;
        b=MvzKZX3jN67JOuF0GjmEhtSqS7/gZa4pcL+G7zmnmtXmKqXnG4MY6ozihDe63tS5lX
         7M1AhtSNub9gWzYrXyqw3//ITelTxV31TWf7zdQUEW8L2PkeHbqjHriJ9yeftJJjqeIw
         FUnK3qU6Qf/8b4Ixr5Om860TOPBWABH8d8q1YJlb9UCJFVbjkUjhOARZ12eNA0BuquqG
         krIlIAHqdTOxBxmZ4EROq2+iuZxE4+g2JQkrmblsV6MWvwHFNuDfnUNoljV5ApSvYfuH
         oXhQuxmbZ6dPyaXY11Yh8ehXyffHCAfhkoirOJKFnwZWwt02McjQISWP2Pe+8ctR247T
         v6mA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUruY837hSSORF+YxaoqP/9f3XJjYw9FuGONq6AmvhrROZ6d+Al
	irj3ZtFn/LVHqcaUGHb0FHI=
X-Google-Smtp-Source: APXvYqwCUJ0VtrSQ0OCDMx+2BaEeMaQhQrq8eKBktTbYh6DICG9R95RfJmj7TkVVSd2LbfoyXwFEtA==
X-Received: by 2002:a25:3442:: with SMTP id b63mr9671785yba.228.1560278605744;
        Tue, 11 Jun 2019 11:43:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:4c82:: with SMTP id z124ls1201784yba.13.gmail; Tue, 11
 Jun 2019 11:43:25 -0700 (PDT)
X-Received: by 2002:a25:4097:: with SMTP id n145mr37971139yba.8.1560278605169;
        Tue, 11 Jun 2019 11:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560278605; cv=none;
        d=google.com; s=arc-20160816;
        b=BuEQUNppnxwdSwqDU3LjF8vrliKLq2HSCp/C2bZCZnnpBkghiCKkZQ7C8yoEy9AJE6
         c7EmEqWXW1EAJeU6i7XAVL5B/t+SQzLvP7xZPrI1CCkxBWfNjB7sN8HR876fQ5kqCjMh
         Yz7mj+V58rtYiNIK6hPo2CqdFYTkZHoEg6qaPqC/glwq6YWwFM/QZn21Gm9X8NUktIob
         IKFPLpvlWcnEjaP1+57RXJRORi2c+przOElgqJTtvfQDgrBK8PuBQggXjIfMM0WdO8dw
         +6Diqdi/TCyQPwjF26n/ihHdxbmofh79JQdg7yNP4+vqYGMKc1UDNWw3mmWBzJW0LO6w
         7MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=/vTaCVFr8UzMr8ES/8LG3+mU3iAdCDOjT9E1N9/dAxs=;
        b=HTg0aTpiXmUEt0q3eQaf4Xef4yFdaeMuhLmEIXlbF2uAg748Xgaz/a1/vypT6YuFq6
         clQA9TrNAG4EEN6lP197lhou2jpkUV59IfeqIWuPxldYu7B9ZZtrSd1cxrbUXm+IMWic
         /129Wq/B1w2ZgMwXcqePWgeelAQbYXkxmj1EKpBz3769YN2Mwd1sBrfB7kvsU5eDMf3C
         B1TGz7T8cdxz0RtcKmnLUI1c79I50pWWKgWkBtq1UG4oM6fT6Yr4tuFinYsvpEEXQ+M7
         /HyXUXoZFjH4nKuRCFY70xe4f9KktIvvpymkKZSM2n6HoZr9zsLe+r29XpoSDQ81kxI4
         q0/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=s790fB6A;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id o62si591820yba.0.2019.06.11.11.43.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 11:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Date: Tue, 11 Jun 2019 11:43:24 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6ca605-e0de70@github.com>
Subject: [siemens/jailhouse] 9c6331: core: Reset PCI devices on
 CELL_SET_LOADABLE
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=s790fB6A;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
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
  Commit: 9c633193fd583e884a0e3e4af9c16b4e469d7806
      https://github.com/siemens/jailhouse/commit/9c633193fd583e884a0e3e4af9c16b4e469d7806
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-11 (Tue, 11 Jun 2019)

  Changed paths:
    M hypervisor/control.c

  Log Message:
  -----------
  core: Reset PCI devices on CELL_SET_LOADABLE

This ensures two things: Physical devices active prior to
CELL_SET_LOADABLE will be silenced (no more DMA) and cannot conflict
with the load operation anymore. And ivshmem devices can send the
information about the reset to their peer earlier than during a later
CELL_START-reset.

This comes at the price of resetting the devices again on CELL_START.
Could be optimized, but not worth it at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e0de703fa9f3f0f5dd50f00b8484778ec0c9c158
      https://github.com/siemens/jailhouse/commit/e0de703fa9f3f0f5dd50f00b8484778ec0c9c158
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-11 (Tue, 11 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: Clarify why we call arch_ivshmem_update_msix on vtd_emulate_inv_int

No functional change, just documenting the possibly non-obvious.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6ca605d1fd3d...e0de703fa9f3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6ca605-e0de70%40github.com.
For more options, visit https://groups.google.com/d/optout.
