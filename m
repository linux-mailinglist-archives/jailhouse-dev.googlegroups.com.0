Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTOCW72AKGQELJ3UHQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id 511F71A241F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Apr 2020 16:35:59 +0200 (CEST)
Received: by mail-pj1-x1040.google.com with SMTP id o20sf89114pjs.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Apr 2020 07:35:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586356557; cv=pass;
        d=google.com; s=arc-20160816;
        b=SiBEA1PRFf6wkP8x4qRrQPJO0GovCbY8PFFXZQ1PewoYIrOuWr4aYPPCaHrdxYFFPi
         TeXKSWnQ2965In4k4s38oQc3qTsO2z1RlZJVOBTO59tqg4QoUIMcguBhw/WriCbrU5pP
         t9fTgnykEQYtPF74aIdNVBd8qWu2Ve9KnGW/vqZmyBAulTsllRnSj51xe6/VhBrhIn76
         hZVEolsfk93+x+F3PZem5m5ZRYvniGa0pX1Vh7o+0y6vUGSK2A+RDuaRmlsOdQ41Xfbg
         MvfRyiMhevgvdlUDnXeyS8CGn9wG1N//0BEl2RQfyKPqDHPh85O2UMxTBGXcPbK1q/EC
         20RQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=uDZtAxfz/jd+D57idATWh34xX3ZS1opDddNvC3rDaDw=;
        b=lxVLVBPRjwfze9otQaqV8VahIQVUWgqYYOKy0rLrgLrCvNdqXfw2DIhz5JCjeY5ZqX
         ZGEoDh1bIuG1cvQXKanGmBRZpE+dvJuDiOZjvCBYE0pIUC3Pzb62Tr/hga07gxx2/ch5
         aOBXaXHuJg6qI6S5Ab1tzTK+RzFRLJ59ZEkjDC9vwdE1pMz3ZKGbQAl4fdT1o/IyM7Ge
         hJ4ho/Tu0P5tqNYv7H7BpGixRgl8RnpEQWuDDa809Ps2Vikifw+pA0QjmWjJ+3+s6XuX
         YzxEJb8D5L60xWxpTZRxDMW/kXo8EiBVOlyGE0Uqz5lNi9u+e2WGZnf/EUt6lL289Uif
         idDw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wl5fstAU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uDZtAxfz/jd+D57idATWh34xX3ZS1opDddNvC3rDaDw=;
        b=lw6Y33jN3b5Z0INikvKUYpB+YByCg11IUSc+pDA3sE7vdujK54QmZukH7il7ba+99s
         yP7xhKJJWoaD3vwv41QwZ5PEHZBy8n6VhVVZoMS6JRFmEcoT3k4t7jppBNDdZC5M7Ifs
         fjzbKnf7yHGf6cZQWFHWNi+adaKaL0RbnO8LKt8r33Pu3F6TNNj80Hf/n/rjGqlH5Nql
         AP4q1bJpn7iPBDxKmTxDTDDPqsBGLFFZoyBKzweSSZH1MjQGIye7SJD25F+OOfq+ssGB
         UdeFbT3qS/GihSy5vx5nJBmT85WBEQ68PrVPaWiHPiv8aS1AxQ98HJNkVcx+XcFs8Ilm
         LBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uDZtAxfz/jd+D57idATWh34xX3ZS1opDddNvC3rDaDw=;
        b=io21EoEA67KfXnZDefJSbu7HW3bJtlKkOsn6jbijEJ/C8q/N3AMaT7tnfzUoVc3cyF
         VygVqUZuSxyK1+WCTP3kkUS5wNQf4qfQVY1CJ6VYOQd3dSNAdlEB1Jw5BPxPaZSYqfBJ
         J4VRIv/lhAuV/WC+EoXGxKRbADDBZ8WnpE695wrWa6Nt2SyPOczlLXTTdhIl+B+0Qmk8
         NTUqSusMdGhZRZyu/I56hifN1e2pzsTrfXvZ6f+/O/v7eh+gqKmId2X9H7EWOfTdgqkz
         FEOqDWme+ZtoBPkeH3Bc8bT4rOGlAWlwhLouBObtSODXExBM15mbmheStQBudCdT7Wrm
         Zmvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubtwCjcz5h35dWgnrDlBeAOQ3zX7l0I7pnTB8EOSyK7FDved/Y5
	ouQOUbxzos5DiL3HO4FccSc=
X-Google-Smtp-Source: APiQypIpp74yG5iSu46xNWb5jc9cGEVN/l+VJRz9rmZG8W1ljzDED/OksDTCw14NxTpfaukrniagoA==
X-Received: by 2002:a63:b256:: with SMTP id t22mr1607563pgo.92.1586356557481;
        Wed, 08 Apr 2020 07:35:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:1853:: with SMTP id 80ls4307158pfy.11.gmail; Wed, 08 Apr
 2020 07:35:56 -0700 (PDT)
X-Received: by 2002:a65:5a4f:: with SMTP id z15mr7366202pgs.103.1586356556154;
        Wed, 08 Apr 2020 07:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586356556; cv=none;
        d=google.com; s=arc-20160816;
        b=ANeSIPKmIpzHrsINodP1WC/V5VE5CwpcfQjoH4+D2izthMFe8l3jzYHsvUSwAlYWz9
         lhJnfkkHPNhJCOhE4SwjFfduaYP4rPPbVorEmGmtVnWSvbeelWMrOsupYQSGwJtAFYu0
         smGQWS6ZsVNSerOuN+UuZoAPPBF98+HBWSQ5t4YDA1K/UkJDb1rRvaOHrQwHwYq6DiQA
         KgvJBKt6F0cWXX8lRTpJFzTMay0xFamI4DMfnvdp+3e2RRYlFeFw+Dr1D/wLm2dk1b2o
         u8k6RLU9nADeieBKcyEBvSAv7XwGGcpRV96sLZtF5scMzfJOHbytJSIU+dcOVwU/zzpC
         ZXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=hxrDW69JmjGnS8MTxHGr04vs1SVh6KPk+4jHQ0UuQVg=;
        b=y1A6IN8cB28IgDyddRG3HkUWzaMS1lhQfv72++B7ZaxncTMEuFzliOPdyLifLW53us
         do/LTj+s1io46ng4GqN0qUvVk/1Zv5spkw0SbXIJ/He+V+s5bw/XgCPrIv3nhm8jTA7V
         CLq7u9dPIlS4H4+Xo0KpItlkthsSQ/8gRYircaMEQk6LDU//iJcDTyujHaWkAV7YyF8m
         d0L/1ECw2TewwPc9aJFEeIPU1AJEZGSKOMjTii+BC7zzwtksaF2gP4s9VnFuBSJze99u
         PekpIObSoGZg9jkA44mYc3fAshKVEg0cqF7QaK7vYuadXZM8gFIEZtJMyHuJUt74QNYu
         S1aQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wl5fstAU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-26.smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id c207si376069pfc.3.2020.04.08.07.35.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 07:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Date: Wed, 08 Apr 2020 07:35:55 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2e4d71-7fe071@github.com>
Subject: [siemens/jailhouse] 01934e: Cell configs for imx8mq EVK board.
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=wl5fstAU;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
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
  Commit: 01934ec692271c35527819f081de4a33005ece42
      https://github.com/siemens/jailhouse/commit/01934ec692271c35527819f081de4a33005ece42
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-08 (Wed, 08 Apr 2020)

  Changed paths:
    M configs/arm64/imx8mq-inmate-demo.c
    A configs/arm64/imx8mq-linux-demo.c
    M configs/arm64/imx8mq.c

  Log Message:
  -----------
  Cell configs for imx8mq EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: updated copyright dates]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7fe071b70665dff0cdeaccdefb8a3e4d926e0f12
      https://github.com/siemens/jailhouse/commit/7fe071b70665dff0cdeaccdefb8a3e4d926e0f12
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-08 (Wed, 08 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mm-inmate-demo.c
    A configs/arm64/imx8mm-linux-demo.c
    A configs/arm64/imx8mm.c

  Log Message:
  -----------
  Cell configs for imx8mm EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/2e4d71f66439...7fe071b70665

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2e4d71-7fe071%40github.com.
