Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBI7B3P5QKGQEQLT4Q7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x140.google.com (mail-il1-x140.google.com [IPv6:2607:f8b0:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A6280FB5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Oct 2020 11:19:32 +0200 (CEST)
Received: by mail-il1-x140.google.com with SMTP id p10sf588809ilc.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Oct 2020 02:19:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601630371; cv=pass;
        d=google.com; s=arc-20160816;
        b=gndHWhtADYiPcKJRCjY62470HiGpvtvyQJLmziEG9LiCZ1PSQDfjfyj/1eb6InL/cG
         vQEnE7WH5Vg2SlT4GF8WIYbNMsg4P151VjvFS9Y9eRz5JllBb019wa9I3CVnWRt/4iiE
         US7+6bHp0X/A5onlo9XAFJW9rVr6GjoiF7aGjPVdw8CelcpHs5HdMPPGWQ0lSGfUGjB6
         j+pEMSVtQmZIgm+VSmPK/LB+C3zmUwKxrwHpb6hBESN342T9ppYHIKZkJxRewV7pISeH
         k+utgSMvuUcLzbZsxwmE3yeVdcFMaPBsylkLnoYNNq+i/T2MC8/4d99m9twy+/sQGgY5
         B3ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=vWYvZdB4+XjnAqktKDjvnFye8jVLp7rwNhuvSUWvzZ8=;
        b=jqeFiBrW7bRYwq2hpP+NAFfaBih4aVZGjDsBOwn8yVUdgLJlAaBimdpqCz/jNsCdCR
         lG6fbW6Y2jDksSe7cltx19CfLcWzXAXMgBI31J4tnpAZfwQe5H7YJuv270xpJJZTpM01
         L/8aKWIdg1Vn2bnljq3Ng2LgbsZoM84QbObdIvkbzIIOA+SsiwfPEI9JNdhuhJAimTkc
         v+cFA+KLRPKLMWqxEn4w9W/Zj8M3V/IdBK4rXdGLT9wqgVmtiLSNxO43kH9uH5XzDYvd
         Uqv8n7ZKCM2nD6pNe0riDJCLFu6USPDrp2BsOJcbxolPgBLWZ//BLeOUeDuxC4ZoV0Bv
         R2pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=t+GWAWZv;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=vWYvZdB4+XjnAqktKDjvnFye8jVLp7rwNhuvSUWvzZ8=;
        b=kAAaHGP024BueTfa9BpWa3N3+syma3lFbNCjh9ov6DJgmygwPuFRBoVmu9zrbkP/jk
         lk3Iw0B2/QWfYL9CqCnzrab+0ft6BwEDStJI1Yvgh9y7sAA4rH7FbzfBs/aCwSMxFwg4
         u4tHkjKCidZ6hU9ffwYdplj6gHcL1zWgoS36s73sCT4M9wg/k3PZXSKzQgAXzQ0JhR04
         Vv1Dmb192fGmGGX1mMnEld4a1rFd5SX4LslzicGipY0X4Z5xhkj7RCpOMOBq4vFZJOj2
         VIz07f6qmeAmtrh8QwFQ4MPyx42tIiMb3MQFRUz3Jpz7bMAs/Z+nQBp5kdsw8MRzyTj3
         Kx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vWYvZdB4+XjnAqktKDjvnFye8jVLp7rwNhuvSUWvzZ8=;
        b=k0Ab0mq3yZnJBXnC9AyFm0jc9IK0N0hSvcCdlT5O7WlA7yf/qRO2UMO59JQ7FR3BaM
         t4HwUozpwhT82veUQuoB6JY5snHY2nM1QAHhl8ZqWl7ifKEaE3NE8gN1XT/3YxT5FYYe
         Fp1tgWkHhUPkDnpLvmZLMgA9EFGgS71OB81AHE7R1LOjLR7WrhbAwGDzArU6PPRlfJBp
         sreFd6ME/jNg0syl0uN4vHk283tdOc2kyxp/wPAXQPd37UUAU9URLPNIuMsgkwUybtjn
         rCFTczkAQTve4cC8bRBZn6l37DmOoXSGnhCLEkL0RHcixP9uboGATh7xQKtNvo1aDusk
         X9AQ==
X-Gm-Message-State: AOAM531LDN+k2+Detr9DQdJLgDSVMINFd4jIND6ybq+lpE1+fSdCJMoD
	7M00ycaJvktOmaP1EqiHMgI=
X-Google-Smtp-Source: ABdhPJwNBWc6EDuQTLbQo7Gjv9r3kcvgD0ZJAiHou1WF8iaBEQrQmn/ldUj/ybpoKQg0e/cP7RtKdw==
X-Received: by 2002:a02:ccdb:: with SMTP id k27mr1348893jaq.103.1601630371527;
        Fri, 02 Oct 2020 02:19:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:899b:: with SMTP id w27ls198987ilk.4.gmail; Fri, 02 Oct
 2020 02:19:29 -0700 (PDT)
X-Received: by 2002:a92:b68b:: with SMTP id m11mr107463ill.26.1601630369590;
        Fri, 02 Oct 2020 02:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601630369; cv=none;
        d=google.com; s=arc-20160816;
        b=o85jxobz/i1uLeK+kgqbAIRW+17u6IFkC13qSp01HJwipJupd74zZOxKjFp7KHO8bK
         rqF+MTPQ/K2fKSieQMuGykvJXl7DMOz1jRsm4szPV6oY7Fjx7J/HL+SwvuSGkJH86B36
         uGpCRsGibWR765Om78TaNWK/WXODh2i/f/O3SNckxENP9nH8dHLIDHMWkygMXn7gOgsP
         nPg173utUwblVxaRULabgDyz0+/F6Y/EGY3RpLnE01iC1i24QVufjsZXEQbq540tOYen
         W8nmFrxrw+qenG+9Ty2Ad0lkclNnH39lbGH6WbMYDGAn5p9cgAHt1vtQtYQDnz6qn+rz
         Cl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=kXnqR9ETefyBXwhn99420zFopbMCsERI8C1xPSb87f8=;
        b=kvxzkFEfvCV1LZ7UmdlM+SGZ46+ujibuNiGel1hyMOE86/cgrrJ5wJfAxbPviLwyGD
         s0NFcZ7NNTcgNmYQJ4xHqtIX0G/4GYQw+OIluynjaUHTKxF7Glqcx4RdVfvDzTicJAS2
         c92mT0o5QtLkC0xlNyRWfh/N9KDj9SCZlr9M9caBqEa0nmI3o2A8f2mtQhZGoEPP5r+5
         5DDzfHBqCpJ1DIzJ0LbN51zOHCrLITdBX0ZmYAulLWk/eIHoPZ6Ukbehh0UmedQWiR7n
         6TLsWJHsNCEE4KtKTZNjuZuLqLsVBrXYeaXHKfdPJYi1ycnXBPBJ3hD4a9WNqj95jljH
         WVWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=t+GWAWZv;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-26.smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id c10si439iow.3.2020.10.02.02.19.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 02:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-adcf139.ash1-iad.github.net [10.56.115.51])
	by smtp.github.com (Postfix) with ESMTPA id 1BE175E042E
	for <jailhouse-dev@googlegroups.com>; Fri,  2 Oct 2020 02:19:29 -0700 (PDT)
Date: Fri, 02 Oct 2020 02:19:29 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/522ab6-9ae58f@github.com>
Subject: [siemens/jailhouse] 9ae58f: kbuild: Set -Werror in all KBUILD_CFLAGS
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=t+GWAWZv;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
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
  Commit: 9ae58f6cdb1b46cfe8a2627d84ef694cdf59fcff
      https://github.com/siemens/jailhouse/commit/9ae58f6cdb1b46cfe8a2627d84ef694cdf59fcff
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-02 (Fri, 02 Oct 2020)

  Changed paths:
    M Kbuild
    M configs/Makefile
    M hypervisor/Makefile
    M inmates/Makefile

  Log Message:
  -----------
  kbuild: Set -Werror in all KBUILD_CFLAGS

subdir-ccflags-y doesn't have the desired effect, at least with recent
kernels.

Reported-by: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/522ab6-9ae58f%40github.com.
