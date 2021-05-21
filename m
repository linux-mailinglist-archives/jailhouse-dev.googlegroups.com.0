Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGNVTWCQMGQE2DOE44Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63e.google.com (mail-pl1-x63e.google.com [IPv6:2607:f8b0:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3C38C029
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 09:00:42 +0200 (CEST)
Received: by mail-pl1-x63e.google.com with SMTP id t2-20020a170902b202b02900ec9b8c34b6sf9824781plr.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 00:00:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621580441; cv=pass;
        d=google.com; s=arc-20160816;
        b=lb5gxrgF3uXYsTaO5ZWXPj051UFmXP3FBSoR33bpHgS+B0nVqhgn8KkVFqFn13DptL
         SX0fEZ6kkob4WwhfLT1is7PTp03vMw4GXERaR+RvQIAcIEt5QaICt+/V9PIt2NHwwyFi
         etw1WhePjbgIXrR1nINxwWUA/9P6DQEJUQ/6TfHkhcAYD8DOMenHIxYSWPiK9NpDXMeJ
         fG1gkwFeCrsF0me/KzBx+RBGd1R6l/D4GGPwOYnV4i5xDl0nvANaMk363F7d6iYY2F4b
         hHlCingXEvMBsKKN5MlPnBLg0dOsJcyZ80XUrb+a6S+r4ievvgloDKuxj4ElqwKC07Tw
         pv4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=XKfkncYi34cZQAU5cL4r5K8APsDXjqO7dC1u+34co+Y=;
        b=XB7fHrmEMXCYP+Bwkg3xvcGo4t1mDeeG6GclFtCuZNRmI1Z+PK1GB6GxaZGzfrelKe
         dV466RX7sHV9eLNXKBKiFeaD3XJdvmxDhpXaTMNiy8Uk34kxiE+EN1SGPmL8t2eUcOR8
         1Kl3Lm7xyefFxr89BWD1ixtpt0iacIDwPFFXm3IkLRI1IE7pbmljlZINJcmwyx4aI9QW
         2cO7Lfjkcaoy8qW6xrNUJafWoP2ryFIOdbqZsrfUPd9J2XNgdE5YYJSC+DIzRuwTEqyZ
         GG5fsKVZgwpofgynplGkox7Eb/f/HgFG4sc/IlCCw2RlusCV5mBkOO8EhjzdRQfVZmRP
         cL5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b="zu/2s/rh";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=XKfkncYi34cZQAU5cL4r5K8APsDXjqO7dC1u+34co+Y=;
        b=FJGXsgBfb44jHToZ1B03r29N/mxzK0IRDWlIxfcwZtFd1pA/5F0LV4TMfXmJbDcPMj
         dKAYQphnPwB3O2+4o+fy24IuziAzLKebQ+tqREbSt2YRls30g7r754S2aFxA8fHLeI1q
         0jNLz3u3vX0fTbbVO+UYO+GJcZq9TU7uIHpaqhpg+CuXXjkuNWBdw0DF6+4njsWIgpwF
         ZEDeMRSLbQ89HyH3QXiKEm15+vycigBoPvbDGrwqRZ3SI6vCWqGJNu0IDjslAnQa+5+Q
         XKN7OVElg48OFe84VxPsfMpPQaPSd47X2VW0lf5e9DJIuVYGXrfMKKOQdab4NIEvIm3F
         QI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XKfkncYi34cZQAU5cL4r5K8APsDXjqO7dC1u+34co+Y=;
        b=OUwAb2NQ8Im0Gre6tUy5OBzIhUJQjiGTeRe7EVcuB1k0agN6Mje5wEEUpj7wRJpj/d
         yqRvwwR5aToLBonHY//plJTOYQVXonOWyBU0ZvRUz/rY2hxM7eDP6BdxQF4jdcB+6wpZ
         bIZmgBuPk42D1CkQj3IvmrGZrrkYIM6y/GGTIu8AsA4+zDxG+fey/gKWF64DLi2eg3UE
         OQXtdo0xGrUIVLxIntID8UnmTGAzgW2lWXHVyaZhIRUG614qXoQVLyu0U+d8o+qwgBFW
         p3FJ/TxkIlGF59XRPr7CPx9Sk4c9dfK/ppuZOWLGWty0d63/AW1UysDu0JG19wnHubVh
         7Fqw==
X-Gm-Message-State: AOAM532dqoqu08ZlfhxbnRWBf2+ce8nHixU5RmMPu2BRxHIcb3hCw6UT
	A9eZRgDxiqtZJx+/Mj4kx5c=
X-Google-Smtp-Source: ABdhPJzfY80EhNPElI7VuWpzE9enfHFMVgAHrzpUT/zmrprky12mizigj4DAEsYb/0p7BXA8cn8imw==
X-Received: by 2002:a17:90a:da06:: with SMTP id e6mr9560031pjv.183.1621580441708;
        Fri, 21 May 2021 00:00:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:ce14:: with SMTP id f20ls2984395pju.3.gmail; Fri, 21
 May 2021 00:00:41 -0700 (PDT)
X-Received: by 2002:a17:90a:8911:: with SMTP id u17mr9213952pjn.165.1621580441038;
        Fri, 21 May 2021 00:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621580441; cv=none;
        d=google.com; s=arc-20160816;
        b=iu8Dsek9/CH/vfhSk3qDKvqWPKJm5MlsRqWdbL7o2FdIYW1BKZkwRbe5jr13D+jI4n
         qf7OK6d+mT4UDucdLvOsVu0KTaTDnDBpHYf8PDR4yAl5H2lFSUV4/tf1Y+9wFrhwdBTV
         Z8Xgx2ilXGjRppsXNN1dDxP9Y5BkCDrlWPDhn0uR/QyaMcA/xWOnvDa6M5eqgYkDtwy8
         JyN3NqdFEWtthrUoTwlnxQDn0nJ2zBa26QKHwDOV5odnJ6GiobxDHea3OijXyjo54UXQ
         Q/vi4myKys9bAqR4mXZF6sW5rVMQhtOyeA1A0iCyj7wToChgboV98w+Kyl6FXwMS3PZJ
         kmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=phjtzJt7xFG6dVP1VdollFY7zrrGuDpLIbm2jX+vgkI=;
        b=BgDh3u2A9hQ+TY2bzmTvux+umbG8YmCa2RcnZ79fkpEppSNJHR6RaN/C+Xk9m41ivn
         Sq8LjHT1Fl6f587oKcgNFt5BNZsfwnty7JBKXYjgdjUYE7IhK7/2vVR9FLZuCitKbYNa
         TNc8V7CbTigVi9/KVmn417O7Ka00NntZhH67R/WK4fkvyWSAwppPXmv6zuEBdDFuCneZ
         MXFVEshFME5CFAFwT/rcudkkph2K+nCifwUdaHNzOgFsl8oEFl+6BeSWpqySeJbecfnW
         rXTnc+zGgG5LeSYoFu/4PhnZrl88fP/MZPTRzkNVAcBTtH6Phrr5sSv8KSP/y+2+ksjm
         V25A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b="zu/2s/rh";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id i2si645896pju.2.2021.05.21.00.00.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 May 2021 00:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github.com (hubbernetes-node-032c37e.va3-iad.github.net [10.48.124.23])
	by smtp.github.com (Postfix) with ESMTPA id 3FF66E0AA1
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 00:00:40 -0700 (PDT)
Date: Fri, 21 May 2021 00:00:40 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/e0ba79-6d9c51@github.com>
Subject: [siemens/jailhouse] 6d9c51: pyjailhouse: sysfs_parser: Make sure to
 include VG...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b="zu/2s/rh";       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
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
  Commit: 6d9c51d0bd819689c00f6a3c38d3099f6eb9c657
      https://github.com/siemens/jailhouse/commit/6d9c51d0bd819689c00f6a3c38d3099f6eb9c657
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-05-21 (Fri, 21 May 2021)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Make sure to include VGA MMIO region

The VGA region may be listed under "VGA Bus 0000:00" for built-in GPUs.
That currently triggers the filtering rule "no empty buses" - which is
actually not true in this case. Make sure we add that region
nevertheless.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/e0ba79-6d9c51%40github.com.
