Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBE5AY3YQKGQENXS3D6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07614CBFB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 15:00:53 +0100 (CET)
Received: by mail-yb1-xb37.google.com with SMTP id g136sf12854838ybf.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 06:00:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580306452; cv=pass;
        d=google.com; s=arc-20160816;
        b=TsO1yBaPJvlcbF+r4KRNswx45VCDTe1ynG2HNWkhrBeb2tODeTlnG/8rXSAWJdH3oj
         gEjCFTDrvNU/z+LEKRlkabyOWr+F75y0uzHbZN+kHlPlkI0p4XHnov6XXdY+i6ak54Bo
         WpIRL/Fo+fgkRYESkeVHmoFgn3zTc6pQmVrS3OIx55KpWSgVYSLZfhb9Y/o88CIMpCRW
         KnoKZwtAC0bb7mI1Wmb4bx3hW/8O1NeWUeZC8215P/cW9DvUHnHDVzMGLOgMvfPBnO5E
         //ACV+NxOvQGF3EmfLqInPqkv8Xi8d99IUFxoJtUDNlmLfpVdnrN9xMFd6W0RUPFG5ID
         aWCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=aPwlL7rsxM4cG66TFwlL7akvNnEh48FhmUz9+HxORrg=;
        b=VAV9CpLrY89jgrX2UKo38uv3jmlpzqvoLFFkIdQ4mxJM0YHqEwwTiGKt+H357tpkd/
         jFUiEPaESXwF7WOz1cky6Nu8HrvGIVRR9fJUbBSNahLE7eQLnyraWkuuxw3r63AnxjlA
         czaApJXSGKpDBG9k56b6LwdbS90FL5/oZs9GIeiI3pla+QhmSDnkz0E+D1MkUleHxRv2
         r4x6C263QvbNfKVl5NDlAWnPKMVvPNxgtlxcMx4Rg0Q1/2KcDeSbKj6HwgFbrTg5idwR
         q9HEjV60bQ0sIZRef/ZvheCAIOU6XUVX4CP95wk86orzj/3jqRibMsiR0mcYl6qjHEN2
         kKgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=KoWvQ3xC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aPwlL7rsxM4cG66TFwlL7akvNnEh48FhmUz9+HxORrg=;
        b=he5EiHNEElSfNoMpHiTV6YyNQAuUJh2UqBXc7KJ6vucKhkbQnSwZ1TTMQLC7x7DPj8
         g9Wanvpf9/xKUF1b2HtbZ9axyv72gIRpiyMKHaZ5/IUWFxArfZPq7E+GwsOfqKBYj+9H
         iYch87FRbrxBWIhwYAklnrVM9BTwen4iZNlfor2wN+Gi8CX25AqDibH6Q0FiQZNwRboY
         679Ih3N10pPw4w7oMkaEAy3lZkG0mI82B9rvInY79weY9X5+4udChLIqoPuxw0HXPZwU
         2jqSZAuLXmNOu6v6vUKbc2i9ubezCNFj7DRCbeXIMm0dqFVE/BRCZDxOFkDJjR2CcBHZ
         8ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aPwlL7rsxM4cG66TFwlL7akvNnEh48FhmUz9+HxORrg=;
        b=IVFGkdu4mBONS3tH9TcM1lkJ/30b9fC9DNe1WUg8D7smYXwvqqyK0x7IoHUGelxCWM
         Zu6VlmBCid9X6LNO2SBBVmBauttRy0xfeUBeO2hwvMcMoKFAhsHfO1a0xVeToWiCRclz
         ifTgUP3qKrUrHFB+aE166WQTE44oumMI19ZwHUXxynC/M/eVUE/6sBbfvMueSQTJYrYs
         BnT+DfTNgjhD1viZbtDPj7xBlYIJheH1JzE2CBTfYhTtkFC0ct00KNhVy3C0MeTPOYqt
         lpqxAIUxH608MC9f/fDOrR1CNmBPNN0I6aIVjTfzn94LPFd8Xt3vZmV5hDX2aLqR9yRL
         rdEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVoXsQt6BTfOtdhKNPClWiCcZzqthcOSROxGFYoZggn1TeXYgv3
	rqEDTTURCiJPMTb/EXJgH+c=
X-Google-Smtp-Source: APXvYqxHH3q8RAtQHzcR2pfG8yBYFr4veFUZn8J7NMIgZ6DIBBaBxa/gZv/5suTvtkrgyUt6oAdsbA==
X-Received: by 2002:a81:a691:: with SMTP id d139mr18989245ywh.450.1580306451953;
        Wed, 29 Jan 2020 06:00:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d08f:: with SMTP id h137ls3653552ybg.10.gmail; Wed, 29
 Jan 2020 06:00:50 -0800 (PST)
X-Received: by 2002:a25:868d:: with SMTP id z13mr20709529ybk.265.1580306450203;
        Wed, 29 Jan 2020 06:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580306450; cv=none;
        d=google.com; s=arc-20160816;
        b=t31YJnYuwSaCGsPugExXieucM+z+/wHP3HSBLcmdhmQ7jAje5Oe/H/a/GVTvBr6ua0
         KgOPo1uwwnKr88is6lO8pRVJdHXPGLOwIGmixgTJrjZ0KmKxI2um2xpwuK0uwb9/qRZG
         DfuK/RQihCOwWLLFhDoxJ+F4z6rhekhoVlt90sW4j/J1rnXiPqu4Ep5g3f0wqXgRe8l4
         mZ9T2QqIr/3tRcQslzziyeLZTWWA5sxKxYg9lHZrYCmq1QiWWz5kLaxxLm9lJtgFr8MO
         QguJA1SizNkxtSiyPecRQbo5ZI+T3NJ/rS8BZF4hXUQMm7GIGL58JPF/grnRC7SfzhFq
         049A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=uVtK9dK3nnzHPgWuiuiJnymN2F3lSUFvR9jK8yQ9MmM=;
        b=ttSyQrVAugj7yPQ2uFTI+jcdXgXiNOFlIsNvUsXgOCjwuZ4aEn6m1+/3ZbW+FHtJQi
         DgEnL5JNbVliiuAmn9Dn1W+Tgz4WnT3R2hE0pJTWGBxmePbQu2tjVwU2BbVoq2n1eCDF
         SLu+17utmWHHs9lJJL/o7GgrVomjPisU1p6cYOEJmt/5BLYPGpPhHr9MwkDES6j7YQYm
         Q+dkco4X81UkB6dDgO8NU3EHov+F9291hkMiRTshbYo4YqmRdZ8eaQ7n7Y/1LycaHgdY
         XFdt6TEFySjKw3iB32vy66+ZIW2PvAnC5HJ8F2shkOaNWlVq+y305nX5sTRsRUdffLt6
         CvAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=KoWvQ3xC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id s131si160573ybc.0.2020.01.29.06.00.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 06:00:50 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Received: from github-lowworker-3a0df0f.ac4-iad.github.net (github-lowworker-3a0df0f.ac4-iad.github.net [10.52.25.92])
	by smtp.github.com (Postfix) with ESMTP id EA9FEC6003D
	for <jailhouse-dev@googlegroups.com>; Wed, 29 Jan 2020 06:00:49 -0800 (PST)
Date: Wed, 29 Jan 2020 06:00:49 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/77a41e-3814e3@github.com>
Subject: [siemens/jailhouse] 8c51dd: arm/arm64: Factor out more common parts
 of jailhou...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=KoWvQ3xC;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 8c51dd45ad98f71e693d98b89dd85e45ab10c069
      https://github.com/siemens/jailhouse/commit/8c51dd45ad98f71e693d98b89dd85e45ab10c069
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h
    M include/arch/arm/asm/jailhouse_hypercall.h
    M include/arch/arm64/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Factor out more common parts of jailhouse_hypercall.h

JAILHOUSE_HVC_CODE is the same, most of the JAILHOUSE_CPU_STAT_VMEXITS_*
are, and when we move struct jailhouse_comm_region, we can save
COMM_REGION_COMMON_PLATFORM_INFO.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3814e3a977987a782db3e9a152dcb707e3c82e33
      https://github.com/siemens/jailhouse/commit/3814e3a977987a782db3e9a152dcb707e3c82e33
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-29 (Wed, 29 Jan 2020)

  Changed paths:
    M configs/arm64/jetson-tx1.c
    M configs/arm64/jetson-tx2.c

  Log Message:
  -----------
  configs: arm64: Remove vmalloc from command line hint

Not needed on arm64 because it starts Jailhouse differently compared to
arm (tk1).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/77a41ea5a2cd...3814e3a97798

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/77a41e-3814e3%40github.com.
