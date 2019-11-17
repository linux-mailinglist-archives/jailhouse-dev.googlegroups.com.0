Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7W7YXXAKGQES5NNFVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3a.google.com (mail-vs1-xe3a.google.com [IPv6:2607:f8b0:4864:20::e3a])
	by mail.lfdr.de (Postfix) with ESMTPS id AB545FFA9A
	for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Nov 2019 17:06:23 +0100 (CET)
Received: by mail-vs1-xe3a.google.com with SMTP id c29sf363405vsl.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Nov 2019 08:06:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574006782; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jf0yCX87Zs58VZkDPHIPHCLFwZK7fjHQD7QKnEBZagjV3AHl0ZlYEH8pKDm1zeAVj0
         ysfgVYPGanPkjvzXVmTi2JOtQ5n+4CVzmQhKDZQLHS4zzpheI1urxR6FAtTCXksX9VvS
         ha5EVigdshNO8eHdA6qGaZRgGW5dsGm5DlbyOdcmekaLN78Vr+0N1Sj2oNcEKqSlmRpN
         z0aOAEVGgUINEOgy7AR4B2yX4OmNy6Xi2slw5TU/MgKTgvzpPuAtAZtO6M0F545t3Vem
         PBduipGgpGNvX9VFM0JBj//EyPbOGC/2TsoyWf6GIWThxXKRjDtIEbv2C8u9+DNLc2Lb
         Whag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=wXoHfvfa8fp8ejdKlYtqpsMypfDiZYUR+rNSa/iUN34=;
        b=s0uBPcVe2Vpzrdnfnx+mBbCyNETrnQSb4/PiPX2kyAwXTPvAaU3x4JHRIleTx7Fi84
         WWWUfFytmIbDqAR0GpymrVRVFspmVdfNVcTaHzLZahMDieD8U+V87VTjeLjQo1RVEMH1
         c8N7wlj+7qJc0H5zKCj0jyRiHifjdK2CaoQF0ljH/ZVLKT+qnt3RMIkWbvjQkEg4XeD3
         L5dYXbIjhDhQFpA3faPoSzVsRcWh6K9sDSAqAyWjHk8zzRd1sWEAswiLIPjH68F7xUR0
         pTcvKSHQEbx4/cp9Ugd8NIxHEYiZ71y1m5IvCslZUkSmdH53HKR7xwAkgT3uzYl3mdED
         b3OQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=c1XVzeYy;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wXoHfvfa8fp8ejdKlYtqpsMypfDiZYUR+rNSa/iUN34=;
        b=eWRx7fIXwawsaO1Yz12N0np0SmqjuZJdIEvP93wzTJuBPKj12hVsSWi65AuYMwVAFd
         3TATLbcd+ncr7X6NZDwGNLw5RcPrDVGeF7qlllIx3F0NBdxwEq/ShNNOT6YjBiGeiu7Q
         lX93kaE2xgqb4hwmI2zdhxakCdSxgQDMwrAYZWavrqKllY8Vzc1LxB5D7EwoVFTqqg2c
         zDzIc6dX1/vaHsXmB0MoxySowlIU3FJJLrmTHq5jMK66y7UPvvXbCzg7mh/9tjMAe4mh
         Zgt7wz5mzV+I36+dEnPg89OSTjW1jTj9O0sMuAGgLKGINAFtXh3Ycg18aoR28qOwhhN6
         kXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wXoHfvfa8fp8ejdKlYtqpsMypfDiZYUR+rNSa/iUN34=;
        b=CuL6miH6yTHLow1UZi2I7FofW8JDHxQjfcxgwE/4g3qCjFEH3uH56jg0oXptiG1AZD
         EgG2PJ61aeNa+9HhHR5LS6aAF4SGZBJbq0rT7BISWCi35O7bUNbWFez0PO5ci0pdaqLJ
         7Rgy65HcGrkqJmUz1GecaRrplRT7vodd9ItxQ75Y+yi0V4gTmJGNV/z1bLdYBOISRYRp
         /+thgWuRv2s/Ku7KWPSEIbSBT27EwF5LO9ZfHnSGA8+p9Y1jmw1i2QNhatbQOx2/5BMZ
         YGQC7hJ6pzNNofDoOYPL9LONuKeb6nYRO7HAmX25vvzHv+R7jtMlI1QVyfFv7bnzPxRQ
         Pt8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbe60eGAzHfLB2eVXdBVq7zb8V8yo/hceNTSzefvgzL7jkss1i
	gg7JnVU44KA7u1lm2xf4+rU=
X-Google-Smtp-Source: APXvYqwHpGq3l2g4lihCbNcG1293H/kwE/eMPEZ1QYojq7jxkWZnMinc7FlSRlE4u+r3yFuO6qehow==
X-Received: by 2002:a67:d20e:: with SMTP id y14mr16749924vsi.16.1574006782416;
        Sun, 17 Nov 2019 08:06:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:fd08:: with SMTP id f8ls1501526vsr.13.gmail; Sun, 17 Nov
 2019 08:06:21 -0800 (PST)
X-Received: by 2002:a67:f84d:: with SMTP id b13mr14903752vsp.57.1574006781791;
        Sun, 17 Nov 2019 08:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574006781; cv=none;
        d=google.com; s=arc-20160816;
        b=ysTnMD7IA4+Xa0wzgYQsWZU5rxWE7Q3CN54Mi2uNAfRq0LcZOCXPQICxrPgHX/TwXH
         WOxWeT8axzDJkc//sQ328ezYMK7LMrKVjeVGcy/fO0lwKx+kEmQD+8oxhBAdq+dKCc44
         7KLFrAPOsE7sBRjCULO9nbi6p3TSIlPLo0BCW8g9Ky3SQMt4AtawuNA/TrC2yqaKioxv
         bIzD4oTPZP+oBmiJj2h9ahqbmZUjs6f/+3k8wDy8NFIl7WadjxajdZkdKeEXr2Dt25s2
         3J6fKD+QBWRzOyarcbwNzORB4G4yhSiNPUt33rCi88OgoV0AHYBkOlrbmy9ZkPgC5vkX
         1Dhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=T1VmJeRASlTUJPdcU5duu0KoeiXmOQi6TbyYIAddpjQ=;
        b=I4AxPlgXBotrBuoiuXBl8rTVRvPNo847IojGQnHhL5RYYOH762n944aI/BzXAMJUnj
         vFPfIiJT5CyH9uzBI0bgzOLa6NPGpqanaqWryp6vIe0DiMxIQ0EqZ7XgbcTgoBtwig1k
         cbbJHG94BUkae5gMYy1Ix6ToKhMy/Po6UsFows56dQHPDmsNTW6nSHUhIVqFA9Be1zJ8
         D/befhI0XBqDc9+0LZ4SWGCNmrzM6KCpeMrKoQltivjgvAazLD97EuksCPtapXR/TK/L
         02gZRILMt7NXTd2UAK80RG89SPWifsVTAadA15YEVjZF2ioNminVib2c+pj35e4q7NLC
         /IDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=c1XVzeYy;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-13.smtp.github.com (out-13.smtp.github.com. [192.30.254.196])
        by gmr-mx.google.com with ESMTPS id p21si753449vsf.2.2019.11.17.08.06.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Nov 2019 08:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) client-ip=192.30.254.196;
Date: Sun, 17 Nov 2019 08:06:20 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/45c1fe-2338c0@github.com>
Subject: [siemens/jailhouse] 6d689a: x86: efifb: Fix 1024x768 mode
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=c1XVzeYy;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.196 as
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
  Commit: 6d689ad09e57f96aae32f842e9e8bbf4c4d39a17
      https://github.com/siemens/jailhouse/commit/6d689ad09e57f96aae32f842e9e8bbf4c4d39a17
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-17 (Sun, 17 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/efifb.c

  Log Message:
  -----------
  x86: efifb: Fix 1024x768 mode

Exactly, it's *768*. This digit flip broke scrolling at best or even
hang the box when the framebuffer mapping was sized as needed.

Fixes: 790ac72a3ee5 ("x86: Add EFI framebuffer debug console")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2338c060b38df1b3dbafc81371574353db2e4093
      https://github.com/siemens/jailhouse/commit/2338c060b38df1b3dbafc81371574353db2e4093
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-17 (Sun, 17 Nov 2019)

  Changed paths:
    M Documentation/debug-output.md

  Log Message:
  -----------
  Documentation: Fix EFI framebuffer configuration help

JAILHOUSE_CON_MMIO is mandatory, or the driver won't map the
framebuffer.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/45c1fe05159b...2338c060b38d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/45c1fe-2338c0%40github.com.
