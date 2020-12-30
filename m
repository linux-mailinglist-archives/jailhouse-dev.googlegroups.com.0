Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGUJWT7QKGQEM7S6KKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFC2E7D06
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Dec 2020 23:52:11 +0100 (CET)
Received: by mail-io1-xd3c.google.com with SMTP id w26sf7666215iox.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Dec 2020 14:52:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609368730; cv=pass;
        d=google.com; s=arc-20160816;
        b=OZOXposDHqa0HnO/NfJt1tZrOuXjNQsdCa4E73M7L5v4zbgC/ChUSlznPY/xIeZDnD
         nubS4kJU3lFjJ6cFBXMSNbGZYxG4hNX+QRLzXHuqJYMrqZ9JlvHjjTc2qMr11gtt6k7S
         AeN8jGjpna7FBwfOpNCsN37NR15d51qKKMXHK2/XU/8ctmxanSgS+kBlQ0eHjG3ucz81
         YYGwpXHMqaltBaSY1pRcuQtg8N9I/Fa7ATyt2uMWLOqYmzfY0y1lq4exE7dZH2LErISQ
         6WIaQMBLK+d18/ZHtidWTvqkwZLk4KEIKOW4R9fhgjFDWqyWBkkO66Hiudww/nXO41lt
         eH+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=lKKTTgsBukUBfywXIBi2WIr4w1Nt9rYWg/EwewH5CM0=;
        b=JbbhKkGUFTOe8xzPmjSY6k7zRBwXcdQ2xzgG94/+Xs3aTgFE2I5zSO1aQZNMKrELGm
         zkRgvOGpXn4XPiScM3N9GRppEFUE5TwXaMIf6wm6mUgUi0haj7hrmuAlSzfRo81rCSLp
         aEKOktAlZ71aBZvb3et4cqKBC3q8U0IYHxhDMusmhtVfgUs8+ZVWd3cm5QqUokrHaFwo
         gHv1SueqtKFlgxI6vv5k4FZjjZLNyQh4vjuzacK1dxnfQdzMUehBxhOMqNCPN3akHvBz
         QsY+QJQNMiaQei+BFVTvoBV8TVBzRxxGSGdMGvRCEk5SSnxVqx81VwbzyIjzAXgQs1wE
         Qekw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YFD5BCmG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=lKKTTgsBukUBfywXIBi2WIr4w1Nt9rYWg/EwewH5CM0=;
        b=TdVFHNliVcslyf5Bh1pVCXnSarxnbeuDFOG7Jy5gTJMU9JS3QM39zGqXJNMpqZUZNK
         3AV6VdXvNo6YyxRT2gbWgrt4FeBZ6l3ZgK9EDyd4BQ2cKwfshoEqvs1kv3TBYkOLtgc3
         a9VqZn/OTiGZJPxS0HPrvCRmA7J+rMTmNT052EpitJZ9FWwRrvP3pTyOl4goBDASGD94
         5hTkm4e7xJ5ZibnIu9lPggA81BDdOMxqOmC40FaCt1xoIbOI9hY+Jqurpu8PcPswyICs
         Yv5IQAYwujwH9pGVUjz3WCFvKgEl7XdpiSEXMGuaPj++5ftihzZ8FY7FofwyMpqEvun9
         Ktrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lKKTTgsBukUBfywXIBi2WIr4w1Nt9rYWg/EwewH5CM0=;
        b=tGSIW1+2et+OOctEWoWpdGMm87RFH2R8nxm/6c5kc85blylJJ0phfbQuotwekTcTMd
         TqUfkgX33vFK1kJeWPt1m/mMN3sxAqCo+IGx+/5AC3BcinshJl1p0rRJ6F8o7D7st97W
         3mBNb8DTt1OAMiWvmmOAHTN28oF7qOBr0SqOoeZmXOXYPg4PjpWD3lAyiaDqfCQOyXVo
         +7gfzfy6IyZFj0pVpHJUV53idu7nQujVWR/x4zQ43jZ8VywSLKQXrn1uyMyLnAPBypNA
         GK4h0Ff95pnJbHEXBE5ZyMhFPRkenfo5yhc5v4R6PkOd2frYDu1KHlNIBY/0CL7N4HtQ
         OYVw==
X-Gm-Message-State: AOAM531gMM3OGvOpA+gOeRkgyByadcrRxSTylLdOnTIMGUjuIpd40mvY
	x0N+M1BaSNTniGolObVeKr4=
X-Google-Smtp-Source: ABdhPJy9wtdf2720Y30HLYAz1xCO5JHr3YJUZaW56um59Ay1nzAPcY5pz1okpHadxUPI3gUxSB4C0A==
X-Received: by 2002:a6b:f401:: with SMTP id i1mr44695387iog.142.1609368730517;
        Wed, 30 Dec 2020 14:52:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:fb06:: with SMTP id h6ls9766269iog.9.gmail; Wed, 30 Dec
 2020 14:52:09 -0800 (PST)
X-Received: by 2002:a6b:6016:: with SMTP id r22mr44849717iog.93.1609368729932;
        Wed, 30 Dec 2020 14:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609368729; cv=none;
        d=google.com; s=arc-20160816;
        b=RhBODhFJ/Wyx5UMVrOBgfe7FojCMCN/t3WtxOayFrlyEHM5O8UZLxyTLZyYnbEI71c
         wk55nkzi0J35by+bsy4BNZSwoQmWXZCtoqiBhGjXa9NP17SeF4QgMF5VRqOMiu/BSrer
         XB/g3QVKhb9UxC5UL8U4LSREVsdGD67A+1+XRvXbZ5R67EBfPmFDLcrqhuFJeKJ9e0Bu
         S/OupYOYqN3nZzdzDS4Umzlcmr3yA/Gh/a2fZK22cGmwcyRUdgGxz8dWpfKieG9W11cQ
         TX7lq5fxuQlC8Z4l6mIWbWmWbkg9eu3Kkh7drHWXhvMRavh57gAI2L2nm230h3ik5nx3
         zxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=DGwM1kWEg1oMF6+i0A6iC7P8k4gF/F/Cdp3ZUtt0z/o=;
        b=UlXgXuxUbdYxrezgyjYD/Q6Od4IqAU0u5lSwLHyNl5nVi3U9UErbGuWSAHxwnnHSs1
         jHcBkSEHVkSovMScGU6YVkq9q1+4hWtIn5/GZ+blyEqm0FHN6lPYxVS78yv3yUY5s5E4
         OS9mmw5Ybb7z80iK3fxksjJ6cK9I0RqZLjSzDjn1DNy5bic1pCsELwDr/RQyXjbHMC1E
         2Wp8IcGONxzK+4VW90FVy+2mWcXB5ZqIitdVopkACzMTiv5KvmhLQDFazMhLldTJ9jdY
         oNQD493kv0FpQwbWvVge8rM1Gcy7BqrqvvxtVZmVSCR0YASgb7sWqHhzJkRdk6vEK0Zw
         tDtw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YFD5BCmG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id j18si2320424iow.0.2020.12.30.14.52.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 14:52:09 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github.com (hubbernetes-node-667df83.ac4-iad.github.net [10.52.103.35])
	by smtp.github.com (Postfix) with ESMTPA id 8DE4A52010E
	for <jailhouse-dev@googlegroups.com>; Wed, 30 Dec 2020 14:52:09 -0800 (PST)
Date: Wed, 30 Dec 2020 14:52:09 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/5c5cde-b93e97@github.com>
Subject: [siemens/jailhouse] 4d759c: arm-common: Add handling of
 SMCCC_ARCH_WORKAROUND_...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=YFD5BCmG;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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
  Commit: 4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a
      https://github.com/siemens/jailhouse/commit/4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-30 (Wed, 30 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/percpu.h
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Add handling of SMCCC_ARCH_WORKAROUND_2 requests

Jailhouse does not need this workaround as it isolates secrets via
CPU and, thus, cell-private mappings. However, guests may request
control over the workaround. As it is per CPU, we can grant access.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b93e9798b6475bd75ba7ddbfad2f58905cbe0090
      https://github.com/siemens/jailhouse/commit/b93e9798b6475bd75ba7ddbfad2f58905cbe0090
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-30 (Wed, 30 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Forward all SMCCC_ARCH_WORKAROUND_* feature queries

This adds full support for SMCCC_ARCH_WORKAROUND_2 and ensures that
there is no deviation between features reported before and after
enabling Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/5c5cde20c9a8...b93e9798b647

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/5c5cde-b93e97%40github.com.
