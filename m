Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBM6H4PXAKGQEJ42PF7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C42107D75
	for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Nov 2019 08:45:57 +0100 (CET)
Received: by mail-ot1-x33a.google.com with SMTP id 15sf5095508oti.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Nov 2019 23:45:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574495156; cv=pass;
        d=google.com; s=arc-20160816;
        b=QADdQ7fZidjZUntlGqqAuEgdDWqPnL5tDth/NsbtWS9PPvfWy8d523xctieqMQXkiz
         hCf73KlxwGunYdXa5jno89ZXZvhTeTXvjdFL/EZwUuDtSPWdESwaUA4HS5zNMzl3XG9u
         kNi+9ezyc9DfqePKdfy/uf3302E98Jc8tWIj0uPouB7ypcYjn7FVsvTNnjUxXJfqDUwk
         8PyT7DGEU+iCZYcFszIgXHpFjptyGrmLeffTKol1P0gLDY68hs36f5B0joLyccqtEHDx
         C9h0WgRrcdwU1V68L9ZY/nNGpLrDWR1JYaAOONccs6SIcfpS5hcHDJbZ9HCXqB9f17r5
         WuyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=oI6RXLA1gtjhQ+fv8ZFNnInEGP6zuO/ogoxyROL5T4U=;
        b=DWTN10lvx//LcBDErMjmCowMcgYsvY/xIOQEVB08Gs/t8Sy2/I+92tgv0IuZ2xi/5y
         MeBtEKMfJlia6SzKRcVKykQcIN5Yw9dRevPXFOske52OfMZRh+7coBxdsXcV5GYaBn4/
         VkMlgEO/c103jai09/XgQaBAfYgf+mpP9uDCayyuLBW0se47oAtDPGTMw0oRL+iNvNAk
         ocrNf8lM4nGc5KX3BnurVafn4XLo8q6yp1ifBwreL2KIzJUsz12vEK5G9KXWfCUTSmd9
         vFymG6hmKMh19PgDVKAGGpU8htlEQsIhFYUdo8gXk87QSdpvmEl5cA8xvjom+Me2tLRw
         WmqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="J/bl7y/w";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oI6RXLA1gtjhQ+fv8ZFNnInEGP6zuO/ogoxyROL5T4U=;
        b=hPtv874R9fkGddvTn5sV+FssA2gJfAhACJEYl1FnS5k9zfVDA20fXcEJ3lrPrDhxYC
         9/jucA4YVnhKDN3nHHNKcqWC05Q3bDPqCGePqngcXOseyB9RPdj1G9gZUIjJzdGm1nTg
         7I2xsV25H4C9lZE1L9Uuaa/Bjc/9qemvb1XU2cuihSQUqkxf5KPdX3wEVhInOCu1bRT4
         4YW7ChHkdtq5mN3b+VQSeNX7HLgGzJF2Gxjd/VHovsPYv+WLpgikWzBXgDKsOSj8Oifj
         p1CCfR8NJVFps3JIYpnNlKOl61jpRBtCsmcRXzQ0BL5MizuNXq0ghm2tpA6ww7iPxDWB
         1bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oI6RXLA1gtjhQ+fv8ZFNnInEGP6zuO/ogoxyROL5T4U=;
        b=TvFSjkkLDPVDRcjqinpvpNED7mNWhqyoMiz39ekFlDUWH6AbAAdMBiREZzQbcFysF+
         tgA3L+qbC/8MBbrT+JaG2Pu2ztMpjpnT7hqLIJuQT5pP/SzsgqD6hTFfue7FwLN2gKD9
         X/9w4GN+HpyMTdg3cI42ivL/Dz2T9qSrt655s8yLj6nPwGOXRygIcxl6JQrsFqKGJQZU
         xyxR2IgjDyLhkTgBiH86pTFF8APC3FaFbDqJ8SJ7sxzzAssK4Y27rmtNu+j3PNcXKvVs
         wcPBVENnKtMCtHo9HqvMPsfOo28L7OdxUmYZFHTHk3N4kk/OpZQC/7d50yctjHuMXQ0A
         u8pA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXAm5Goibm/2OFJYTIeclPQMKH9DcPoAwpKyNSOA9GCiG2jlWzh
	kCw2xMUPAAmCTiwNVAhNowc=
X-Google-Smtp-Source: APXvYqxrGsyX5yp+xKLeAIVJ1ou4xN7a00JsAmsvtQ9CbMKMXqQ5C0M0S++IOKeZ3BTZzKVS2poQlw==
X-Received: by 2002:a05:6830:1003:: with SMTP id a3mr13737267otp.16.1574495156317;
        Fri, 22 Nov 2019 23:45:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1618:: with SMTP id g24ls137035otr.13.gmail; Fri,
 22 Nov 2019 23:45:55 -0800 (PST)
X-Received: by 2002:a05:6830:1d93:: with SMTP id y19mr13632187oti.288.1574495155489;
        Fri, 22 Nov 2019 23:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574495155; cv=none;
        d=google.com; s=arc-20160816;
        b=UAhbmMtEKDUJ+idQeOo52fOsROyILVbOmJWdman+mloLGCgKu/VBUgOhj3cV0m/dqW
         KIimiWD4+HLsCTLPAtfVS15oBOSysLRwOXlICEiYpYezjL9XlIcKrd0nk37M/xgZ1kmv
         T6+v0yty6IFCtkpRVWCuh7qtWha39fwMA33ruyo14YxaKOKrT1P5ZtjqXIe1WolcSRYD
         tqX5kA9mNU6Ov+x8Dpva2C2ujdRVE+ANcqe38jEhVUOeXxx2yJrQqBHS1XgD+YJ2h6+E
         i83XkxSxx7CVd0/I6COTCYE9V7rD8Tc0I3cyJw4uv1HqSbTtiC4s1Lo5Wat6zmgm3SD0
         faPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=UqQ0/iT/v2nC8FR7L+UVAEV7dvo7TEhwbkQxdAPn3UA=;
        b=IweMHVpGa34xU0AoZ7DmrAukNR6J1di5Pe6kHpr+twWrtZJs5sWIAo6xbOaN+xdg6C
         lsey2ZOegbvyogz8+YdlrJJ0+Ziy8ciL/+N41Cgq0TW+wpiKEFZCbiRe54cgbdcpc8OQ
         P060cFq2Rd8n9w2WM+1giaf7R/ZsI0Bk0UP4HPjSuttdKIXBzRRpBR/fCs5y8aQ1q+a4
         EvpqTdbKqnlrYXud8nqw2IktDSmNwcn/OVt3Qea52sGPytnCQnv9qzHyYOJABgXdWgR1
         ClIulvg+qM4/KGNQUMiFLB0kUONQ2xtHod0Yd8UgnYsR+8hZIZmL5Xa65pS8Gg+5pLnG
         aBQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="J/bl7y/w";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id m7si26221oim.3.2019.11.22.23.45.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 23:45:55 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-fb56993.ac4-iad.github.net (github-lowworker-fb56993.ac4-iad.github.net [10.52.19.31])
	by smtp.github.com (Postfix) with ESMTP id 0EA2C8C01AE
	for <jailhouse-dev@googlegroups.com>; Fri, 22 Nov 2019 23:45:55 -0800 (PST)
Date: Fri, 22 Nov 2019 23:45:54 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/bac03e-2338c0@github.com>
Subject: [siemens/jailhouse] a22a8d: README: Update x86 qemu command lines
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="J/bl7y/w";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: a22a8d84d20ecfe506b89a7f4019acb3febf8fa3
      https://github.com/siemens/jailhouse/commit/a22a8d84d20ecfe506b89a7f4019acb3febf8fa3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-08 (Fri, 08 Nov 2019)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README: Update x86 qemu command lines

With the next QEMU release, VMX CPU features will no longer be passed
through from the host when using kvm64 as CPU. Rather use "host" as
model and ensure that incompatible PV features are off.

Use this chance to align the AMD command line, turning off some
additional PV feature.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 45c1fe05159bb2e44e962b466ab8207f0a91606e
      https://github.com/siemens/jailhouse/commit/45c1fe05159bb2e44e962b466ab8207f0a91606e
  Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  Date:   2019-11-10 (Sun, 10 Nov 2019)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools/Makefile: fix install of jailhouse-config-collect

Since commit 37bc6c12a1b365250c0dcdd82ae1ac5a869898e1,
jailhouse-config-collect is not installed anymore on target as HELPERS
is updated after install-libexec target so fix this mistake

Fixes: 37bc6c12a1b3 ("tools: Allow to build jailhouse-config-collect independent of PYTHON_PIP_USABLE")
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Jan: always initialize HELPERS]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


Compare: https://github.com/siemens/jailhouse/compare/bac03e4d5f54...2338c060b38d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/bac03e-2338c0%40github.com.
