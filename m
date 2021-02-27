Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWHN46AQMGQEPKYMDUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF2326C1E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Feb 2021 08:38:02 +0100 (CET)
Received: by mail-pj1-x1037.google.com with SMTP id t3sf8315443pjw.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Feb 2021 23:38:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614411481; cv=pass;
        d=google.com; s=arc-20160816;
        b=htQ7tE9H+SaKEIdl4sF3uXtBoVc5c43Ev6O3XIDH0uGfEKJTRporqtJ7+U4al8HioM
         SDjTy1+t6wzaLKMd8HL9ihXgd5fZ0Ig78UXgiWGLAIY4ReFxXUnomlk/y5cuwuxrXlDw
         Pomr5f8fTg3uJrjAe0OauaddGOmUD/HtXyZBEwstNCNyqH+PMRJWnqM84AkkXEb2p33c
         mH8NFKj+OrpudpupKIkVGyyKQsgj4to6zjs85Eu0wxjhjPqPJwZyI/Gr7He11qnL0h6A
         29BcFNuJ6RKse5zHnCI/kq9Nru0LQJPao7dufnpBtoQsZXxvvuZlWCaot4hve7Eoda9J
         GkBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=IpwmxfSM/zoHzlS1DaXG1w1LwRrvgMSCjJdxbphSj4Y=;
        b=plv9DZXdqvomKaQSa0DdtOcUTubixlTakRbsO75Y66l6NH1PjTOMz0MWD+x/94zH4R
         zm65j3Mxo+gYmN/Ua5860z8wO00bYSM0BMZ+ccjDzJxFQsWo138XCmTNI6SPqOvFA1uf
         Q3e3KzcnD/yWFWim6vsb16BuI160mqmy4ffCg7I//Yi49ZEmQUST5QYSuUarSKEmmI3t
         K9EWVVv1hIkjeNm3ly8kTBKFRcnlpidSlNrWdaPBnH40dQUBHpxlSLXzYVrcclA/qmq3
         fyGw7vGGJxQS/B1JmpSbLN4cMvXReiTWOXSd9i2SmkoCl8xXHBmWXEB41/aBDpItD9so
         RpIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=amvrglLi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=IpwmxfSM/zoHzlS1DaXG1w1LwRrvgMSCjJdxbphSj4Y=;
        b=LBVQlridrAc+Ms2HCacPqRxpHCMpgyDetcSGb2nWQKKmuMGsGQ+aOK/lDzUGiQEMBy
         +5OtTbqiKG3HUXo5/35sg1ohHHtgw01hIc31qENnFJUvhCAcetpkcDzHjCzL23QMq05V
         SIqXwPQCrMguwIfqHYwO9rCEKwmDNa5VLPktTZDCfDgCZOyi1xbXcuzbjgDL43fdde+A
         f9LVzf+RXNfPxKgWrjkTaVK2gBx7YFN45D7yMWXRaS/8ZYELe0Rp6sEwRAtPenUyHYyU
         RF8+zf8n6iGBW4K/d78ZEvSEZ3U4roe3WcnGCzqJU7FsWhxATk4kkQOQGi/Yblmeyde5
         w6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IpwmxfSM/zoHzlS1DaXG1w1LwRrvgMSCjJdxbphSj4Y=;
        b=UV0lVSTIMBuYYJBr85rkEaVK8Tepr/4Pn8PA/cgZ+Zgf8K4goI6vzvcUu57t9jPBJl
         XX2vtDKeb7XCkjymhK8HCg+8ChBjA0sb6HNgHiUd7FV/+jbrC2AnR3DiL6kdHrpS2aDr
         45SKIi4Ol0t07lPypEXuc7Rm706A9E23V8VRFukZ6WBzZB4zer74XWm55bvH9D5Fr071
         eh2SgYD0ebwB/dKRA4Xozwa0AHMfznqv9qXaIUtv2xytxZ1lL3wF5npjsfhtrV+WKFuZ
         faXyYZCoFiN7PcFlC/G2M3BaeJkWRSbl5Km69hStF8cwjfGmSKDBnM0GVG4fwYPs56/+
         Tang==
X-Gm-Message-State: AOAM533o0t1mMW90Z3AqSafmA5or8BYKZFo6VBUSJnbD1iqang/fO/oe
	lxmBMOXBYXRKudmor3kiCwY=
X-Google-Smtp-Source: ABdhPJw4B9fYf+g6b4hwssV1hegf6b3/szQpboGNKwdjOLljOD7MkXDqxxpSwEMu0RvEgNteO2DN6Q==
X-Received: by 2002:a62:b515:0:b029:1d6:aba1:e22 with SMTP id y21-20020a62b5150000b02901d6aba10e22mr6827258pfe.47.1614411481081;
        Fri, 26 Feb 2021 23:38:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:511a:: with SMTP id f26ls4420593pgb.9.gmail; Fri, 26 Feb
 2021 23:38:00 -0800 (PST)
X-Received: by 2002:a63:e343:: with SMTP id o3mr5921979pgj.317.1614411480434;
        Fri, 26 Feb 2021 23:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614411480; cv=none;
        d=google.com; s=arc-20160816;
        b=ZuhIu0u1+V7mnR0pQrLZNKOYDv4UHV/8PwH7IlOpG8zfqw4r7MLTYCX09pQSOC8/JS
         bCG0jiquZJ/XxcvbHZKuN0Z6lMhFCNK0WUV5l2Jxv+oEqTy/hgWf2rLumWc1aTu3exwT
         WLppxqiS1QyiVunBFa1NJDJ7KHN13K9A48tfH5GKBcCmfAuXetXP11opfpmWnTJWuj75
         1QDlZp5GHBkjWEW68EUNO/ti3DL6vZPBhV+vi+ZOJnqs7qaTG0qtve2fKY7umVBLHDTb
         jnuHHsK+OtXMmdtgrSHGYlTGxBDgVabXxOHX4RfcaqUA30/KKbuRfdVR4fhrv/UO/feC
         kS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=KDlzuWK1byaRoByuYIfSwHUvp/UTJd86I+4mGxFIeKA=;
        b=CuwEkC8TfCLOLeJKjn8gqExd8VAshvIJXmCkcC+jJvXk0Gnya7C+a+5k4a/9ew1cEC
         Ubun5LEPZFZKkg5z/Neo+TYAo11yh5UWKtO/CAWB0ovaCT9tOwt8h3tQzEBGsxS+iZTK
         BuY03hidaW1W/g5Jey8z/L3cNAWM1yZOmV+A9iN2vBcNYdNnJAC0R3AROyoLA2FaamXR
         nCJjFj5QkK9E11VMuuODrWSzlDBEEfmhcu7Iy781pQ0rhmh6FuIkGv99KbmSvl8Y4ocS
         ulvrMRstIfcAXEP/TYJBC6otqBeVVYvK0buNIDxD5ejl5u5y+Tc0UDqcpMZLKHU92Hmf
         VdGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=amvrglLi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-27.smtp.github.com (out-27.smtp.github.com. [192.30.252.210])
        by gmr-mx.google.com with ESMTPS id r7si576518pjp.3.2021.02.26.23.38.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 23:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) client-ip=192.30.252.210;
Received: from github.com (hubbernetes-node-f4f1596.ash1-iad.github.net [10.56.120.67])
	by smtp.github.com (Postfix) with ESMTPA id 9B58C900299
	for <jailhouse-dev@googlegroups.com>; Fri, 26 Feb 2021 23:37:59 -0800 (PST)
Date: Fri, 26 Feb 2021 23:37:59 -0800
From: "'whbo158' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2a5249-6c0978@github.com>
Subject: [siemens/jailhouse] 0efc2d: configs: ls1043a-rdb: add DPAA support in
 cell con...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=amvrglLi;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.210 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: whbo158 <noreply@github.com>
Reply-To: whbo158 <noreply@github.com>
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
  Commit: 0efc2dcaf48bcac2c11636ed2db41e42dc091773
      https://github.com/siemens/jailhouse/commit/0efc2dcaf48bcac2c11636ed2db41e42dc091773
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-19 (Fri, 19 Feb 2021)

  Changed paths:
    A configs/arm64/ls1043a-rdb-dpaa-linux-demo.c

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA support in cell configure file

This file is used for the case that non-root linux cell own
all DPAA1 ports, root cell don't connect ethernet via DPAA ports.

If user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, can choose this.

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 00f355b58a17fc307b73673a5f962a8c36eda574
      https://github.com/siemens/jailhouse/commit/00f355b58a17fc307b73673a5f962a8c36eda574
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-27 (Sat, 27 Feb 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA fman-ucode dtsi file

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
[Jan: add copyright header, remove trailing whitespaces]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6c09785cb079caa3852759ab59f0a5431380b200
      https://github.com/siemens/jailhouse/commit/6c09785cb079caa3852759ab59f0a5431380b200
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-27 (Sat, 27 Feb 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA support in linux inmate dts demo

If user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, should choose this dts.

This file will include inmate-ls1043a-rdb-fman-ucode.dtsi
the related config file is ls1043a-rdb-dpaa-linux-demo.c

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/2a524906c8cf...6c09785cb079

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2a5249-6c0978%40github.com.
