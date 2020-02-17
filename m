Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHFRVHZAKGQEH7GK3DA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317E160E20
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:53 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id c24sf12566052edy.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:10:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930653; cv=pass;
        d=google.com; s=arc-20160816;
        b=LoQt0HbQG6d53pKnIEIuOyqjt6eKq04tK5XDNUYw3as4lXIxQmDoaihhAaGF1qjqkC
         /PuHMwWzlkd3xaRL0yGY7fTkgg8LpQSB4gq+y3jhkfodvPWqFc+/Two9OiH7c7CDqz6d
         3r1vzLjRSy1XHx60M+gnJ4WAJsHiUUWprE+50/BbRJLIUHNIBG4fKYhUOdnoOk2sNRKs
         ocQuVzz1c8nCRZqbIINXIEOy6yL/UJzlT2JCHQrG7Wd+8d9nPbmKO+2kwEgJ8E1JUz6u
         oINI3YK9bdDdeVELZGPOpP/erMs8TkRUC290eMxClzJhssZWq7Vu8CeaRBuYosTXdr23
         7Uow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=JrrQwvH/ka2yh9UT/ONi3Gnro1E3fU2jREcJ8zoIF0g=;
        b=tnVJ4mV27hqsvGNLvX4tspqsHT1mGDwBZxO/MgTzvkTXYAhuOcEHUcIMt7zgCsddaH
         Djy0lJt0yUwhYmPaq1XcP/m6ZB0uSgT+X3euQ2n3oMzuOjKEQKMaEJUERWB386/04RT3
         ihRW4xNHXejWoJoTHUHJg3yswss7efpvl/H6EQlVUZXWUCo/LCp0/5pQ1TLl1cpRFg9N
         MHVQEmPufWiq8+/9ktR5HoF2bjWDwLACs13dTocsSrlAudun7zF0oBEre+LREZHRvYiA
         LEeDoX6KAFfoC4YehrcNUPjs1VN/s0CmGC3UmbZJhhWURP4oTqyrpQnMZS4UnuUAZqer
         kTQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JrrQwvH/ka2yh9UT/ONi3Gnro1E3fU2jREcJ8zoIF0g=;
        b=PKeuq33kQbmAGfKOG5pLde2piS9BNGbZEeA/x3qR/zGw0kYHNCQhTmphG7jj1RxbpW
         vnW3ZwmH4PN7hj/hFyXC0f0HqbaDWfbpQWo3RTAax66nlTqBCbBaeETiIiAYt0Qmjf3w
         usE+ufO0dbf+CqK+0hhxYOQV3KgvY3kKXPc/k+FciZTYhEZC2EEVj9a9CqYl8H5bg/iO
         5xFunx+v2Ke47y5Y1HDJg4i35SsITwSU5hz7NNjRYzilFGEaA74iDEoz84/WhUzq5+dr
         K44943uL7c9zdhRb70+ED6tdK5bczvL1ncbdeDPF+2jnvRzIgZKzo1IfUwLK7PgJwACX
         +C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JrrQwvH/ka2yh9UT/ONi3Gnro1E3fU2jREcJ8zoIF0g=;
        b=nuxpx5jOIPVrnJyrdbZKZS7fREh0jusWlOvMi0XIOfDO5KhR8V3/N1KEMBOMddsG/b
         ULfEQkMRM1sxCUp5iUIMks31NE4I7U94ZmcwaHuXTDiDlZmGAik6+uJK+m4/7t5UY6ow
         HYDWKHv0zos54nEoNQ94FosKPvvjA6uaVgFFdSMvVrgX1sdJBPOceX9GRynZAf8E5m9+
         /2Qz58twodiMXa3nKSQ/UmglVAKHg5tprZS+GOtUnXtrCfa/tjBNAyIorXIC1R6vLB2V
         NlEvRCwbaOTPusBs/27stj1nwUv7x2NCyiGB7RGegfVVpgGkY1VC7Kx5KulqJuqZ116G
         0RXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKbrEJr+9ZGUzJEFaLNUTUc2t5O9taTdK4lXoJTY7IQhuGENnh
	ZggoZFEhC+4vKtFWw8FKMxI=
X-Google-Smtp-Source: APXvYqwB4n9Sro46Y22mVKggUyLU+5bRoYrZeIOxJymMsBXQ389NECRhvyH0C7bhK07fWDUgi6+LUA==
X-Received: by 2002:a17:906:19d0:: with SMTP id h16mr14337680ejd.70.1581930653186;
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9558:: with SMTP id v24ls4618483eda.2.gmail; Mon, 17 Feb
 2020 01:10:52 -0800 (PST)
X-Received: by 2002:aa7:c5d0:: with SMTP id h16mr13651855eds.116.1581930652375;
        Mon, 17 Feb 2020 01:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930652; cv=none;
        d=google.com; s=arc-20160816;
        b=aVVMKAsMAFlMjqWua2vz7AMBPZWLWSODdQKdgJLs6647VteANBGlsSsfFaUz4Xjgcr
         kQ7xPe7ms3CXHZ27dCo1zLeG/Fjv6e49x6hDpkOlCf69NKcno5s7/B9cbeBCGO6Zglws
         LP4mr/upwdcNSg6OXdmVtZQ8dEZwymDmAsUiG1UEtRySz7QSj8BzdLyDc1IlOUbuc7Iv
         ZplOaWUwD8k3/7jEfHtbTyWy4BkFX9bSC7qWPMy6kEW6Rxm/BWwEJNODM5MIRoJndhdj
         P8Kl6dAtRJYiMDox7yRAyotxELWaLXVbJt15Doijk5a+JS/F/V3ZouBudL2DMHKf2oO4
         4XQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=Ev33WM6hrLHa2Pp11WYJCsD0P7i6Lr0ya+XByGCV81Q=;
        b=rAeFCUM1WuqH4lSWU5KMJTTo5pHc8jrOZM7824cjWs3MM9hpaUYip5udhoTJSv6tIX
         OdwWGwBowNHaA95uCf/sn+V9F4zJKR+WTmcU9EpbpO9ukhKh8f6t9FKf59Ylk0Fn/uFy
         FyppxmCfHI5mp2aIqUjcf8vfYCmlUgfcyJeqi7Dk7F0JXR48yrNaZhGpqY72bgBxbnEj
         6RPUnkbs64y8ObdFU/WadSMlbm3X8bq/rpZ7E6QM1HTqwehlJM6o1qZt4+WAJTixjAhF
         UNFLFAGzpwHWpN1+fnuEmGf09Fi4GwSP/5Gd/JPfCoPgmByhbI+Jj0FyVaJITMs7UFaE
         qeew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d29si501119edj.0.2020.02.17.01.10.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 01H9Ap2m027746
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:52 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.42.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01H9Ap3Z020534
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:51 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/6] bitops cleanup
Date: Mon, 17 Feb 2020 10:10:45 +0100
Message-Id: <cover.1581930651.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

I've noticed that we carry to much atomicity and share too little. This
is the result.

Jan

Jan Kiszka (6):
  core, x86: Remove unneeded bitops.h inclusions
  arm, arm64: Move sign_extend out of bitops.h
  core: Introduce jailhouse/bitops.h
  core: Make set/clear_bit generic and non-atomic
  core: Rename test_and_set_bit to mark it atomic
  arm, arm64: Factor out common bitops.h

 hypervisor/arch/arm-common/include/asm/bitops.h |  43 +++++++++
 hypervisor/arch/arm/include/asm/bitops.h        | 121 +++---------------------
 hypervisor/arch/arm/mmio.c                      |  14 ++-
 hypervisor/arch/arm64/include/asm/bitops.h      | 110 ++-------------------
 hypervisor/arch/arm64/mmio.c                    |  15 ++-
 hypervisor/arch/x86/apic.c                      |   1 -
 hypervisor/arch/x86/include/asm/bitops.h        |  40 +-------
 hypervisor/arch/x86/setup.c                     |   1 -
 hypervisor/arch/x86/vtd.c                       |   1 -
 hypervisor/control.c                            |   1 -
 hypervisor/include/jailhouse/bitops.h           |  31 ++++++
 hypervisor/include/jailhouse/control.h          |   2 +-
 hypervisor/paging.c                             |   1 -
 hypervisor/printk.c                             |   4 +-
 scripts/header_check                            |   6 ++
 15 files changed, 128 insertions(+), 263 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/bitops.h
 create mode 100644 hypervisor/include/jailhouse/bitops.h

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1581930651.git.jan.kiszka%40siemens.com.
