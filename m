Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBAVHZL3AKGQEAB2KLSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id F22381E92C2
	for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 19:10:29 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id be7sf4309586plb.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 10:10:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590858628; cv=pass;
        d=google.com; s=arc-20160816;
        b=DUZmZ1CCmxOR5uzrkZq6N57EXicNOxbKpFJCjPqujt+9Ip5NkzneDdmwDSjoCptkGu
         YIvG+i3DE6+ST/peFudOzh5dPDAn62vaF+ZpQtTWIMxccHHtsvjdtQCqEwseBnJ5sgYz
         Pzl7vcWAAqPWepfPOJFt8BQ8JTPxT1ey5S/c1uE0z8UxGaLOHNwdJLAjeVHDkrPhlKVg
         6lI0A9A+qBqQIphI0i72hzPr6Skxoa7mkb9HW/D5WBjoJPHag6VYktdK+g5PdBC/dKYu
         RMSMUaJtXOa5ZLkg277Fv58+DagobDiOq0O0HFcU5eBB1GqEsvQic8N+1DtH7CoSaTN8
         CdSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=6FCV+ax1BQNlslNcfpY7GpMWmtCykmWtNqonfVFfN6c=;
        b=ioemvvavKONd5wQUqd3y/frllRzWaADo21ogWoKMzmBaJrKomTePcDYPvMDOCttM0W
         EXLQ65F1UgZl+S/9HxxWi4tHFH4gGEIeMLWVqe3etUN857m6sc193r0WzqqwIujfJZxG
         fHG0Iyl4eOTpvQaJoDE8ldsCpLF0TZ801woFYBZh0K7hlzmz94yod/q+wbohcsqMwKbs
         giTPnYxzsNtaaDxteVBX9b0uUOJ4MhBg9syKLAmXd1KBlAZ3iLEoJxNvzxgybFx3e+In
         +JUuqZfPvsdpjSOu+qLvmyMbNRk8YBU7Hr/2z1BV5B2uiDJgrQZn74DN5p46UurFlkOV
         vX9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=yLz+a+i2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6FCV+ax1BQNlslNcfpY7GpMWmtCykmWtNqonfVFfN6c=;
        b=EMDPnOtJ3oVb3IDY337osD0Ii91QmBVjiz5rm/OaxynPu6kfzhFF1QIIB9yKjGDZWt
         /BIWJvHlZyiSIljC3NsbCCOKV6UBWaZonGs0e0qFhrm5mryD8+u4eXLlqgjufO1ZF/qc
         J7EMa1Noft2/eJ0TTYL5E2d2uFb1YV9g9TVsV9uJxEi7N/99Ca1LpKtO7iMxwiQgRujI
         +DM24auJc9PIbRWOnEr0NH8GsoLjd8yyQdMYgPwImbMarA0OZX67lPrF35asaU748CTr
         jbY1E/XM34fAOK3LKP1XmizgrFAmIWOC4zKUcuwC7RHLaXkQlgN7Ha+8QawCGzHsY8Wt
         eEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6FCV+ax1BQNlslNcfpY7GpMWmtCykmWtNqonfVFfN6c=;
        b=YaLds+hk2Mkfgg1+i0KL7k2YNg9T5IgzN75wu4SbFiTH3ANm4YF1A6rPpvcKYXK2s5
         sTX9ewGwlT1xiLXGJ0u7ej0N+43M8MwuYhgN3qONtOq5Tuqe7TKBf46KTIg4ZUrbhi1T
         ECY+du7NH7NEBjLJ903CLNlhesuDfTxNLYvJGgfXkKqebHfOdAYbh5Fj4ZJoD9UPyeDM
         73WoxFGhTyf3Ti3K42YS6VJ2v75dCR3+BDK266dLuD7Isu2nq2dF6JaEVYfu/eJvQ2xW
         KY8n0rv2je7xIac8Fx3OtLiAvv8rfAwnME7MXk8ggg9Me44xumcsNC2Pzn/9fRpr1ui3
         TesA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531inbX5Rz+j0+Z1hSyUfZUrg5wFuzrpzPSkJLl+JqigkV7d7vgs
	fX/kRqRCjpiO2v5bOAzGRNk=
X-Google-Smtp-Source: ABdhPJxsAtpwPDawUg8al9FRlZSHIZYfoYUKjqGA+zMJeEQdMLSgUZ6gKlG4ANCmY45lsjH7VXQ+sA==
X-Received: by 2002:a17:902:9345:: with SMTP id g5mr7826265plp.202.1590858626854;
        Sat, 30 May 2020 10:10:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8f8f:: with SMTP id z15ls4046063plo.8.gmail; Sat, 30
 May 2020 10:10:26 -0700 (PDT)
X-Received: by 2002:a17:90a:6b08:: with SMTP id v8mr14344190pjj.151.1590858626178;
        Sat, 30 May 2020 10:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590858626; cv=none;
        d=google.com; s=arc-20160816;
        b=AgCFKyJlA2t6V4akH6xZPpktVZWgobLx6t/orS8y2g9sWfIVHAtkbhSFSDY8D6z5dj
         ghUxooA+WNHEhfSl6qGh8pWo9XeVzPDG1ox9wWmGQOZ1cKk4W6JXTiqi+pjPd3E+sNED
         ompqvBThu2aOaU8EVniPFvhG1YTrjAF8Y5C7HtzKe6E/ytFsu8xvPk0QfU9FIe9Pjqz5
         zxoM69bRFo6COTBI6+y0wtO3hNNWAkGsPj6/KTikCvaSY3JBGh5k3D/x5mxbYF96XX+B
         XX6/rTEFCKef6BWJklpM+cL+b/Hs8xv03YaSpIRNZX9Att0J1u9wgJsVJvy4OsNE2V0z
         BIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=TD5imM3FzqCL2LGZi5MiHAD0S5ZfU4HlKR5NsyHs9Bs=;
        b=Q0q8GpGwp4KpylO69Ohr5WagBjyhB0OVY92jUvBqyvncmiv6C1I3A5Mv35Q3S19AFz
         u2CpuIWbBTwTdh4rLqEBgtItrKhcxSAKTdLvEOWjJ/VPlsEKetDkWaajLJd5SPvkQU5P
         Cf8zNqMRLz151oNU2iH/G3pFlkaRZV0igwMdxOy6dCh2WFrd1NgGDyNZlarKMcXmnUXz
         QMPLzrHmN+oqh/sEkwKycK0f2YHN/DTKDCa9zFgTc7YUozfosqyM9vgVGcej28Edmp6u
         cbDkGfzf8whOKzkAMa6IHobyU5nMuK4U+HLbRMJHE9Jgz3HmyY8ozX/7+w/ZROmuFnX5
         vnYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=yLz+a+i2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id q12si462220pfu.4.2020.05.30.10.10.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 May 2020 10:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-bb778fb.ash1-iad.github.net (github-lowworker-bb778fb.ash1-iad.github.net [10.56.102.56])
	by smtp.github.com (Postfix) with ESMTP id 716C65203AC
	for <jailhouse-dev@googlegroups.com>; Sat, 30 May 2020 10:10:25 -0700 (PDT)
Date: Sat, 30 May 2020 10:10:25 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/2e4d71-80e81e@github.com>
Subject: [siemens/jailhouse] 01934e: Cell configs for imx8mq EVK board.
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=yLz+a+i2;       spf=pass
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

  Branch: refs/heads/master
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


  Commit: cfe4d650a8560a588a2bbe29ee979f5e7e9a3c9e
      https://github.com/siemens/jailhouse/commit/cfe4d650a8560a588a2bbe29ee979f5e7e9a3c9e
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-10 (Fri, 10 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mn-inmate-demo.c
    A configs/arm64/imx8mn-linux-demo.c
    A configs/arm64/imx8mn.c

  Log Message:
  -----------
  Cell configs for imx8mn EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ccc44a81d8d8a3b56e9e22d5916cc80ca4700a28
      https://github.com/siemens/jailhouse/commit/ccc44a81d8d8a3b56e9e22d5916cc80ca4700a28
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-10 (Fri, 10 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mp-inmate-demo.c
    A configs/arm64/imx8mp-linux-demo.c
    A configs/arm64/imx8mp.c

  Log Message:
  -----------
  Cell configs for imx8mp EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1aa19ea3076e2b4df1d39b1b9c2f0ea490f81c42
      https://github.com/siemens/jailhouse/commit/1aa19ea3076e2b4df1d39b1b9c2f0ea490f81c42
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-04-12 (Sun, 12 Apr 2020)

  Changed paths:
    M hypervisor/arch/x86/vcpu.c

  Log Message:
  -----------
  x86: Reformat for_each_pio_region

No functional change, just the for-statement more compact.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 72ca0d21973add5f3192922b034f1aaaf2746cf2
      https://github.com/siemens/jailhouse/commit/72ca0d21973add5f3192922b034f1aaaf2746cf2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-04-12 (Sun, 12 Apr 2020)

  Changed paths:
    M inmates/demos/x86/apic-demo.c

  Log Message:
  -----------
  inmates: x86: Add LED blinking support to apic-demo

This is analogous to gic-demo on the ARM side: Grab led-reg and led-pin
from the command line and toggle the specified bit in that memory-mapped
register at the pace of the print-outs to make an LED behind it blink.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 80e81e7edcfa1648a7488ca2405ee9f1d2c1523f
      https://github.com/siemens/jailhouse/commit/80e81e7edcfa1648a7488ca2405ee9f1d2c1523f
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-21 (Tue, 21 Apr 2020)

  Changed paths:
    A configs/arm64/dts/inmate-imx8mm-evk.dts
    A configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
    A configs/arm64/dts/inmate-imx8mp-evk.dts
    A configs/arm64/dts/inmate-imx8mq-evk.dts

  Log Message:
  -----------
  configs: arm64: Add inmate device trees for all the i.MX8M family

These device trees are used to boot Linux kernel in the inmate cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/2e4d71f66439...80e81e7edcfa

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/2e4d71-80e81e%40github.com.
