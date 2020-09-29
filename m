Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBAVGZP5QKGQEB3BH7RQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5B427BD14
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Sep 2020 08:24:04 +0200 (CEST)
Received: by mail-oo1-xc3b.google.com with SMTP id i1sf1555620ood.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 23:24:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601360643; cv=pass;
        d=google.com; s=arc-20160816;
        b=PCzO+Q9l+QpTX/mhZCis1FFQXJk8PMpo3tI1wWz0aN7Y0w1G8/op8vAQ626fxFolBi
         ucO3ecn1D7lV4o7dT9Ec/ZyHZZb4q6eYgUe/9LBUDX8w9oyziAP+BaBbnH4b9n+5hKWr
         df2DsP9geTMwq6I4oig8HPbQKqS1u3LYSOPwfDVne3/2Y80IUl6aBAu0flQFTZdqi9+i
         r6jgnRUrzC5jeToCoRIQxUTs4KYR7eh4AM5Br/hCZV2oanQv2ukl30y5OyIv7xurZugk
         x7TtK18R7gytZ0MDxYCYgU/SwaMCvvbeG0DZIueV1AbvnsYW/SY1vnUz6SF18mYRhKa6
         vX6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=wR2PTDDCK4IK+mNQXHGurFG3OUOCrIWAw7EAV7lID9I=;
        b=LBic7tF6wdHHmxACgLDH/Kuq+dJxc1WsbkfFUzxZMF93xwxzjGdP2kIXe9gx9zY+mI
         jDUPJtVNKrZb64uuxCOaob7ZvA+sm8umhYhWMgfGYkpRJtwPr0wIAxL9nqbBHOPoKv0P
         aVR1njulb7Ql9X4eerHLXiH5jQwvxTF54fyGxojakbJ90N8kJph42CgqQnH3sqUUpeF0
         B0Ghyyn31GFPqWtXSYH/wRwFWmSzxLNkQEjyNLWbX5WG1J52XlojlxVYY87x7dyvMsQE
         3Zo6BRd+HaLg5qZewlWmWkDzdvt7VhTuCOVmpA4v6znxlOtKYWYqalbt6NkAt0f4jzWB
         l9bA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Pv2w4o6T;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=wR2PTDDCK4IK+mNQXHGurFG3OUOCrIWAw7EAV7lID9I=;
        b=Drcm48UeSr9IRQDDquTIFOtCZeFtHcDdFP+Djyw4s/kljxNO2MkGIa5VjRtQwBcEgM
         G4bNk49fkqeinlA/RPoyKO9vd0XW6T0DGU+JZ4iRdHgPhclE1y09CCFBQhGSRrppKfuU
         52RCUR89LMZGsjQitUYX2M1p8osZtD2vY4Heh0+1y1vabIhfch4jmPGbCkBNO65d0bp0
         Xp1/WlL+76iFV0KwTk3UI2glkC5ytOgWHvjhjbrOOCX9MJ9mZbd4U8l4kKlB93x0hDfJ
         inUJwqrcd3qmnIghGWm/ukhmGkmgnl+qN3hnwZCGXxPRI64JdG0DrLYta8ygiVa9FUks
         IOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wR2PTDDCK4IK+mNQXHGurFG3OUOCrIWAw7EAV7lID9I=;
        b=cNfQm+XkFrVcMTtegRO5ULk/DsZiTuWdhgMRymPy1KxJHfmq7DwGS5PxrCFr2Wd1lU
         PQRT83D0YRUBT8AbtASq6abvHsC4ltBwe92JiqnlE/BrQl09BuEf6tYML71N8x63V58M
         IFjArWO1qZcYaCmvTD1ihkSECmLNtP93zOeRf2fahDHF8rgBdS+73wjdKwvoLfh8n9b5
         CUqsa4W3tOyuwxW/WdCRqGaLBWW+AxgfSuIOhTrWiXjKc7nwVFahFzEMycuEFIowN9Kl
         064GmwrDoMNMjeMNffx7fZSSFyt7GeK+RZtYk2FANUMVkPSqk9WEOcs20p4A5KfQEiPp
         4zVQ==
X-Gm-Message-State: AOAM530vALsTRByxCuBbdvLe9hsgyhDYh4RzdnePPWJpV8qWSjVTc7Y3
	g/XEZAAAero3NV4Oe5Ao1oY=
X-Google-Smtp-Source: ABdhPJywd4+Nziyqa+xYosCe1bSjNSNDrGLhHsdga7PKdtxdvf71tkd0pGxOvKYpfYV3MKEEmznznQ==
X-Received: by 2002:a9d:222c:: with SMTP id o41mr1653428ota.193.1601360642949;
        Mon, 28 Sep 2020 23:24:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:85:: with SMTP id a5ls854089oto.10.gmail; Mon, 28
 Sep 2020 23:24:02 -0700 (PDT)
X-Received: by 2002:a9d:23e2:: with SMTP id t89mr1834571otb.196.1601360642414;
        Mon, 28 Sep 2020 23:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601360642; cv=none;
        d=google.com; s=arc-20160816;
        b=XpfNNraaVqpkGuTOfOg++OxhrLFTEu4sDod0bIdPGrB+BCCVwyCFOM0OtP4tC+UVoh
         BcdHXbrKyLGhI8mpfHa4ztxR+PYuLAbLMEViofabwo2QDk/XXrsmC8oicMQG9KE9WMeB
         jxyJ6Nx2Hx1PHpnj0VmaU035g2dLcR4mobXsc1rAvt59Fj2lc/ZnfJ9lmKvWRcThawrN
         1XemoATfpgVVcsaXkQg6CBr+mc2TxDmPS59c3U9UiI54RdeHEQ6A7R8PlEXS4Kexli5E
         +Ico1SJjAdZE+JSZV0yXUn0E0S1SQ9PyHQwJ9UbXWjRECfOdZxnNkHVC0sAEOqJOhMbz
         U/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=bmkgSC2dSbAlCtO2RGxqL8nRVAYXh+Apoz4HlaaMD7A=;
        b=WGIGuNng4VOh1Jz1gcupTlUqN+f8mQGx5WlDZmUhaghbARRZwYoQlAXNJg1IQNVUQg
         BQZj6V1tXGct4jBTSlh0ypMWURG/xN6s6fOc+K3Z8zGCtlAvXmvXn0KwXCUQ+bqTTIZp
         fEfbt5suV+olsf6uCQC4XieTrOYjHCemqFipgTOEGTY8D+9LRrb7NnjlDImSsC8lH/NG
         Jg+OmPyNWGiJoeP+NPOWgn1M2R8ArRs0us2uadYYTuPQM6Abg5YOkvvxNPVn6q5D77vg
         9sKmC0UKdy4oxxAI3l21QMyvGzJVZMlkSxPm7QumHEUGw0XulwS9+v+zgl2QkXRGX4sz
         4v0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Pv2w4o6T;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id q10si658282oov.2.2020.09.28.23.24.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 23:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Received: from github.com (hubbernetes-node-dfca832.va3-iad.github.net [10.48.112.58])
	by smtp.github.com (Postfix) with ESMTPA id D63DA5C0E69
	for <jailhouse-dev@googlegroups.com>; Mon, 28 Sep 2020 23:24:01 -0700 (PDT)
Date: Mon, 28 Sep 2020 23:24:01 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2fb93b-42f0f9@github.com>
Subject: [siemens/jailhouse] 959515: inmates: arm, arm64: Remove dangling
 include searc...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Pv2w4o6T;       spf=pass
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 959515f0ce809642bf252cfd106d562c9c41fd85
      https://github.com/siemens/jailhouse/commit/959515f0ce809642bf252cfd106d562c9c41fd85
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-26 (Sat, 26 Sep 2020)

  Changed paths:
    M inmates/Makefile

  Log Message:
  -----------
  inmates: arm, arm64: Remove dangling include search path

This was obsoleted by splitting the inmate headers from the hypervisor
internal ones, somewhere around ce98ecaad89b.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: eb8343dfc7e3340a67d8ec735d02ded7ef5a6ead
      https://github.com/siemens/jailhouse/commit/eb8343dfc7e3340a67d8ec735d02ded7ef5a6ead
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-26 (Sat, 26 Sep 2020)

  Changed paths:
    A hypervisor/arch/arm-common/include/asm/processor.h
    M hypervisor/arch/arm/include/asm/processor.h
    M hypervisor/arch/arm64/include/asm/processor.h

  Log Message:
  -----------
  arm-common: Factor out common processor.h parts

No need to duplicate them in the arm/arm64 specific headers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 42f0f9dfff8dd09c5fa200495110c7093b9c8dfb
      https://github.com/siemens/jailhouse/commit/42f0f9dfff8dd09c5fa200495110c7093b9c8dfb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-26 (Sat, 26 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Drop return code from irqchip_send_sgi

None of the callers checks it, and all of the callers ensure that only
SGI IDs are passed.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/2fb93be68166...42f0f9dfff8d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2fb93b-42f0f9%40github.com.
