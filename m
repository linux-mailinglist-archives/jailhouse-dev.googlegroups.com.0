Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZOE7HTQKGQEYOR46JY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB883B6A0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:00:07 +0200 (CEST)
Received: by mail-pf1-x43a.google.com with SMTP id l4sf7283401pff.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 07:00:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560175205; cv=pass;
        d=google.com; s=arc-20160816;
        b=umNhESfGSq1AqRCvgiCNFI0QS0WW4+JmgQsFWzu5jBlMJkZo8n566N7RpPfgY24AYz
         e5nGxRc6asFhDUDaTTBy+m9Z1+k1AwpcSEkjOeqXfYrNKDEGcvx/sZqjY+68rBaapvG5
         eOPVFflyTLatirN5dgKf4+qxQlbLczS/4JbqPXx3bKbo+SuB+UgQkKnOOZl1rf4v0ylc
         QJkII8bAq9Eoq2EgDQIgnVxRFLfPmxJSpbU2mGLzeACOCfDhqxY+HinYFZSggS+lfZsy
         6hLbdQWYw/qSodVlC9Bt0rU5o9Bh3c02P/0oTU9b4MW0PkZm3LyodNBNDjtyQNa8wfAe
         j37g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=CYRnJDHgjbcH50w5vdR4sHPts9ozxQF2QORzsS9poH0=;
        b=PDY/E381dJOgaZD8WVMC1WAedgI6NGf4jgKUeRKJYufCZubcD5Ae+KG5AvKMPvNDD3
         w03Uk58NGocROmMToxGdRzw8G3PXaYaseOozh/2XTbOyfCNxYWWB9t8iFx/qmFWE4n/F
         P2k0bF3Qp7kAYMr2ZdAmxuB754Gq0fLjw4WfaIwtuWhgMzyBhn2WLnswdRO18HFmK+Lr
         li6CDxI5TWycZ7mjPlN48P7a/oUUypEr4+M8DG0Ka79O8GSxka5e6b/xFPYMMFDm66aQ
         v2Hi6pQ1OXc5fNGgT5Ijehs3I7Yjyc9AdZ8OhhpjoUjE3Kqo25Vlpi0wJdxIdkdJ8mSk
         TywA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=dQb+3mI2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CYRnJDHgjbcH50w5vdR4sHPts9ozxQF2QORzsS9poH0=;
        b=L6RKib669ylsmRVpIb1iAPvjIBe4QnGWIJI7D0swxfYqBKpH/C51pG1nvJKAl/PlXv
         PEumGp78YAx2E/KQJ6HIlDfeW9m2nV7qdJpfCW1Yenp4evOlfOfS2lnS8V1Uj25gjjbT
         H7trl5nrld/a+nwG0MFcH+8DSfsO8GIRcmJq4ZFsKH1I4VCl5HIdr86Pp8OPLPvWkzh/
         ifFIkV3jZLXl30R0Va6/LsO8vIsXxocoh6MkYmTpTHOvTDBsef57dMumOvB542LVaW23
         nJh6urfqSxR1J9cD9oHSCCdt0uOhggY7bFTPBg43/9acH4BcOBiZAXK2D97qub75/est
         xGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CYRnJDHgjbcH50w5vdR4sHPts9ozxQF2QORzsS9poH0=;
        b=p6/zOI8PkS7oOUiy+D6zvdbstL4rP5Yd95xvyp86ns05w8lVxPEUWZYjjgt1ux3jJd
         5x/PY5XX9uWViYSVXn8i9mwvY4i+AbxKjPRT4kbtwyvde+3YZQ4PFCRLRinOROnuJOUJ
         Oe1xzaC4ETsALDRI9ul+2rDMAxp2wsXVYVBrnAMenMCY80Ixf1Tc909p3LmaI0ABWYc+
         uRH2nX7AQwTh8yag8wMkfDD4IY6P7gN+Z5PSre49AOnUbSo2WxIT92Q9HsTOdOt0yB+/
         fB3q7pSN1nHKfnyCEJrXbSOpduFvrBsCwbghG+R0L9/BkghVjcTNUv0NbkJAozH17glR
         pd8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2MtkXonEHUnB24xZjgyMEVyRD5CTOmwxM5ibNjVUKObT8oeOJ
	dMgkgxR4Dc4MGE303iO6XJU=
X-Google-Smtp-Source: APXvYqzzw35vHnhpgShsylCUz8DhEf32lwcWL8UOenPFF4NPl6Mk1T3DxJpGezqNZSiMojDZP3W51Q==
X-Received: by 2002:a17:902:25ab:: with SMTP id y40mr14312745pla.268.1560175205337;
        Mon, 10 Jun 2019 07:00:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:4e81:: with SMTP id c123ls3687835pfb.0.gmail; Mon, 10
 Jun 2019 07:00:04 -0700 (PDT)
X-Received: by 2002:a63:1650:: with SMTP id 16mr15918842pgw.164.1560175204438;
        Mon, 10 Jun 2019 07:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560175204; cv=none;
        d=google.com; s=arc-20160816;
        b=KRKB8GTP1OdTeOUh3olwaxRQNExUDhrJnT27g5dHgyU6d0Mjtmhck3h/NdaclMPw+X
         9VkgHEXdqceBL+gyEHmMSAe+qAo0QACKNBsdJGgYJlbxDAFCtmjmTO7OadFDoXkSKHx5
         0sOJS1daC79EMqaJsd+pN04AFVekVFsl5EjVMJUS388lH/wGL7rSU+aKFDN1FHhT/ell
         y0DcAiWenWUyoWfT7yzSrvLO/7yQtPvu0PkEifRjouBefBaf6+sSehC7Osm6tGXocNmw
         8HiCIbc+qkSUZ7XoS6f59NUAO6e8oOxws2zE0ioTZsTGCK124j3UMvMthjqN6ifrT2Uh
         f9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=1rqIuDJz69BD7t+Y5nA0at9tJB5RIzm32Xt3q1fscbw=;
        b=WdMprHwYL1MvtwjtDX4N1xzj/OSrysPPMUE47N3l75n0vJr+GXyhaiYiuzH1aF8lbD
         S3aYFBTN0h2UZFaCRbEuB71RM0hBVzZtpTHN6TEsvD99nbefDWz2b7N6nih9kbDAMluS
         kbNqflBmuWmPT8rRN7ISoHiv/5RvLXhkOSzabbibO6fZXMzcMxqCHa9hWkgKI6NZkMeu
         M75dEqK01z790v88tFozAWB5qgBqQzoYSEPCZAIfwMZzreGYm3xJn55Jp5sGlGjkKc3c
         ScNx2lE2uqrFdMja6y+kX2Gg4Yosow362ZxK0l6Sb9ixza4bGZKK71EGyiFpO64kBNbN
         7e5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=dQb+3mI2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id y15si292142plr.5.2019.06.10.07.00.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 07:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Mon, 10 Jun 2019 07:00:03 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/7c0d29-6ca605@github.com>
Subject: [siemens/jailhouse] 6ca605: inmates: x86: mmio: fix data width of
 test
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=dQb+3mI2;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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
  Commit: 6ca605d1fd3d6d16cf89fed0812305f81bde8d7d
      https://github.com/siemens/jailhouse/commit/6ca605d1fd3d6d16cf89fed0812305f81bde8d7d
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-10 (Mon, 10 Jun 2019)

  Changed paths:
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: x86: mmio: fix data width of test

The sequence 67 48 a1 f8 1f 10 00 is "addr32 mov 0x101ff8, %rax".

In fact, data is accessed 64-bit wide, and not 32-bit wide as the
comment stated, and as the comparison expected.

0x67 only restricts the absolute address operand, and not the data
width.

Let's also use the mnemonic instead of the binary representation.

Cc: Henning Schild <henning.schild@siemens.com>
Fixes: 23f745cbe19089d ("x86: mmio: Skip over address size prefix found in x32 code")
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/7c0d29-6ca605%40github.com.
For more options, visit https://groups.google.com/d/optout.
