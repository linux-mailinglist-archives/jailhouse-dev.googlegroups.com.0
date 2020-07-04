Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBLP6QL4AKGQETKCNKBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc38.google.com (mail-oo1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4A2147C2
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 19:41:02 +0200 (CEST)
Received: by mail-oo1-xc38.google.com with SMTP id p15sf8273069oov.17
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 10:41:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593884461; cv=pass;
        d=google.com; s=arc-20160816;
        b=nuNndxB4Ejk1tbTU+hTEV/XOePAxkCFTZFsJPrxw4cx2UUyNWFSRNa5g0Nk915Zc83
         YgG2Fvt2VI7dW/SLV6EaAVGbtlCPSMlVQv57LP9aBq9lki/V2H4VoDnERYTdS/d99UJs
         eaclzfE+hn5/AkA2CXoF87gcnI7mSWVWf6oox1jqTZ6f9jTMawfO4La3D0YZQqXaTdcy
         BQ63POm+spP+sJbnKmhzJbcsQHGdbQoRPj1p0kycOJFVraIl7iQk8Wws+kUo0vS9STrG
         JPF3oqoEZAS8rHFPDvrVUsNxicHGbb++YI5fLGc6tvgzXuV3/QKpGCRwDpjp7ZaajqDu
         ppdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=/8gOgcFPeVbNSnecPcjvGNsHCws9Exk+hKp3eII6ZvQ=;
        b=euMs/QG0o5toqXufw7e/GNFVDqD3E2ly174NxfEGcMTALGz+apUAe48LwK3QAfSx65
         LSPywr+82EZ8cJ9oZyGosU/dWdYkxV4daHlsPysiOqC7XwMTky7YlDyxNOybzRG7Ut4s
         VRa2mqFYhXCKI0A5S1aoZMvwYojWXQDJrtn2aYVrzcyPacjSDMTb4Ob9Oay91vLmV/QI
         ECmmeR/kC1kqjHDebbVAOCtXfpQaUwHwaRFcEzjQP9V8BfVIdyPmDRurT+r1egQ6C7Dr
         53n1tK7mp3fgjVWKCWZTnVfjM5nFbqu4EbE+mt3NuJ0iD7Gu73F2qTWcAck9V5+l1sTr
         zGzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ceW7088n;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/8gOgcFPeVbNSnecPcjvGNsHCws9Exk+hKp3eII6ZvQ=;
        b=OzkcTuWvIYYd2gk0w1HU5L7lQPBgiUrg7GPHD3kgerGG0AJ7QvEly7UIT81qFT3+WB
         ZEbFh5ApqECileWEPySgUE2gQ0M9soa9F+iw0EZpCQU/lKQGmYVEMGqWVfRgplCawFI9
         weDP9BgW4TElwRkq5CSSka8kR7ERysgoV1rFEqq760x+dcm4IJljcTRch3F+XXNwbnsH
         RePrdEhQL40uDZXprURh/6eS9MKuhvV4B8HqU03RY3EkKMaLMYz6KF48LNYMPnNvtrRC
         nqr8TMa/4VIEaX5kxInHWgXoyThbQy2bOpUs0FKJNBdz+GWqU8bm/ZT2vTm0t+J43fX2
         +KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/8gOgcFPeVbNSnecPcjvGNsHCws9Exk+hKp3eII6ZvQ=;
        b=Clha1Tp80YAnM8XJYomwh35l2kJ6HWp3X65XvM3vCVn6pgavqnIAfJDlLFDTmaun+p
         TLOraBKMMJlWzckIie9XCZXrGEXowkISU1vJ1WqzbJKNi9T4fXUaPvcRsttkW+zOpQ9z
         zv6so5I9xhGZAgvvs9eLRrquh7q0+yJlcAa/S9OqrIJ51tKW9Px3j1fLocewoU6XMQvu
         5YDMkZy+U2OkshkbstEYpUANqN1RD89PD/WCNM5WY/1pnPa07NbKR41ECXeXoHk7vqR0
         1Yw8nEqdiEbHr76xfGZrAtO413KPzUoO8vV2oK4FEzvUVNn3UeBLXBwRR7OfbtPIcugs
         m/3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5324o/4lAJ4e3LV81hUt8g+hfxBbKF0fgwVvfFCg62hvy85NCMzC
	rpIzsUx2D6BO/0iba8eQA/U=
X-Google-Smtp-Source: ABdhPJyf87oqQJ85KCvrMC403tH0dUXhJVZ7C1f6CcI/zs3eagx/k71UHtC6DmV6wvgwSZl2pOm/KA==
X-Received: by 2002:a05:6808:a85:: with SMTP id q5mr19936727oij.123.1593884461680;
        Sat, 04 Jul 2020 10:41:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:159:: with SMTP id j25ls2623227otp.8.gmail; Sat, 04
 Jul 2020 10:41:01 -0700 (PDT)
X-Received: by 2002:a9d:4810:: with SMTP id c16mr24111982otf.197.1593884461221;
        Sat, 04 Jul 2020 10:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593884461; cv=none;
        d=google.com; s=arc-20160816;
        b=xqiP9616eY3SaqhdSSmBWFmN3p1cHcoPvJVyNZY4u4oaidsi+97yEc5A5R4gyHi/lX
         wO9SmRN6E56Bytu3KI+BVlITyCwpE8YgyduP+mWDZC0Y2LQAG/vvy5cbioTAAi2M5vVf
         FkJ+EQlzO+0EJ77VpTji4oBkjGb9vq3U24Bqy451mxQvmyTEOljTMyALoYPp4t6RRgTd
         zfrNzQS7XzPELQ7qkzL35PxjjpCYtm3FinXHVMg8VdGf6+e+hBLJ3D4Kv/Qpjr4CfyCX
         Aqw/kQBco6euKAPuVnPeJpIAbBqgydQzNTdvUlPCjIvJ0QxncJyw4Ng3lSCl3DbNbeF/
         0Uvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=T4mrWV3DB/wfFnxUO31g/RM4oRfd0mg0niX3GTXbxTI=;
        b=wFmmOPk0K74mTGd/vmDiM1be4n3s6MHVpr+n9/w9GXKanQ1nR7hHsaJeEzejZ7J58K
         BMlEKwNxJ7vn4ZyhtHd4GHpcIHQSXalaugKkgoCCOT2UL4LBsHs6Ak85Kc38vY0zX0oD
         rHnKAXX8Okx40aQNHjrmi0gmfKSn/Z3skZsQ5Zr71vb44+WJj+DtNZhRkpbUaKIcOxZT
         vPZtDvIa7jBdNaSw9hkqIdSkWmWGbu9p8uiqL+62BCWAMzzHhXzyjpArXKKrIC5zRjBX
         QunpOT1+xTEtzkXLzyjhjdpCR5YXPL2ujWWYhx1GTO9Hhqc1y2cKVASoO3FqWC+dMTGf
         h1TQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ceW7088n;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-10.smtp.github.com (out-10.smtp.github.com. [192.30.254.193])
        by gmr-mx.google.com with ESMTPS id d65si59795oib.2.2020.07.04.10.41.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jul 2020 10:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) client-ip=192.30.254.193;
Received: from github-lowworker-0eea13f.ash1-iad.github.net (github-lowworker-0eea13f.ash1-iad.github.net [10.56.109.26])
	by smtp.github.com (Postfix) with ESMTP id 8DBE3120385
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jul 2020 10:41:00 -0700 (PDT)
Date: Sat, 04 Jul 2020 10:41:00 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/09f38b-384720@github.com>
Subject: [siemens/jailhouse] 69630e: tools: ivshmem-demo: Map memory regions
 with corre...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ceW7088n;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.193 as
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
  Commit: 69630e4e654f28ed3b67e7af67efef5be9182397
      https://github.com/siemens/jailhouse/commit/69630e4e654f28ed3b67e7af67efef5be9182397
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Map memory regions with correct sizes

ivshmem protocol does not describe a fixed size for the
rw, input and output regions. For each platform, the uio
driver will populate this information in the sysfs.

Extract the size from sysfs maps entries and use it for
mapping different regions.
This will make the demo generic such that it will work on
all platforms with different sizes for ivshmem.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: terminate on error in of uio_read_mem_size, fix return type,
      process sscanf errors, close fd]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: db3391923c0e7d58a5e628a4a30dab7cd22e9311
      https://github.com/siemens/jailhouse/commit/db3391923c0e7d58a5e628a4a30dab7cd22e9311
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Adjust selection of interrupt target

Number of peers available on a platform is different.
Ideally, any peer should be able to communicate with
any other peer. By default, all demos send interrupt to
the next peer in a ring fashion.

Add support for passing a command line parameter to specify
exact peer to send interrupt to. Furthermore, avoid using a
hard-coded max-peers value for the default target selection.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix register access, print max-peers, massage commit log]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4df06eef96d44a52a25ac57d442ed4099ba8a645
      https://github.com/siemens/jailhouse/commit/4df06eef96d44a52a25ac57d442ed4099ba8a645
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M inmates/demos/ivshmem-demo.c

  Log Message:
  -----------
  inmates: ivshmem-demo: Parse target from cmdline

Generalize the ivshmem-demo to work on different platforms
with different number of peers and ability to send interrupt
to any peer.

By default, the demo sends interrupt to next peer in a ring fashion.
Optionally, allow to specify the target peer from commandline.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix ARM targets by avoiding division]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e64eb56a78059862fc36fb00e1c900c2770bf178
      https://github.com/siemens/jailhouse/commit/e64eb56a78059862fc36fb00e1c900c2770bf178
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-inmate-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: k3-j721e-evm: Fix memory overlaps

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b6715a3731249ec09a280b2fdbf5e4385b1e6677
      https://github.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2fdbf5e4385b1e6677
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README: drop the warning

Jailhouse has been chosen by Semiconductor Companies(TI, NXP)
in regular software releases. And it has also been deployed
in real products.

So let's mark jailhouse product ready,  drop the warning that
make people scared to use Jailhouse Hypervisor.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8fbef0cfd70152968f35963201dfacba3171f877
      https://github.com/siemens/jailhouse/commit/8fbef0cfd70152968f35963201dfacba3171f877
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Strip trailing zeros from cell name

A cell name is either terminated by length or by null-byte. Avoid
picking up the latter into the python string.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 384720216c2fb0851039f07c79f327ba4a253367
      https://github.com/siemens/jailhouse/commit/384720216c2fb0851039f07c79f327ba4a253367
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Fix convert indention to tabs

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/09f38b3aca20...384720216c2f

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/09f38b-384720%40github.com.
