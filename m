Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBHHQUHWQKGQE5G3QYGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id C6034DAFAC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:18:05 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id j2sf676620ybm.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:18:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571321884; cv=pass;
        d=google.com; s=arc-20160816;
        b=NqvNySotFDyR0EQZLzkOzPtTlYyb0GlQGUrFJfOuDtkXddxD+xBdIhB8AmgnXkCc8V
         lPCtpefS1vARlAYxj46CC5blGkIgFIw/+t5f7q+zll1nsmIgU6TNfT2OoaTzqhVTTsdy
         tV6RF7DWW6VjmJB2GDwp4HbZB8N7ETX7wbL7IdwBsZZMU0yCLpo3sVBRA454bFskeaxv
         e9ClFC+n2QlxMSjdFtgvI064dP1Jy4LzMJHDcrZPcCEc+kTuYrnGVFFrru5BI+Oqe/WF
         fLfi8504oU6yDDhUagPnevXEQIvBbLHfJRxZae1UE2m8DbqdExmito0QIt40bQ7CdMPs
         OfEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=kUCF7OQ9kNK9uNHWBdV29YxyXJgTokzBpqf4+Rx3yiU=;
        b=hYkiHw0EEEpJMDVU/hUeyYAzEEdJR8qk6WmRW4cunFDYL0vnWi4vworYHiKmZ1lMiX
         dYP9ZI6ZspRmCCP7iFjxfADQ89YZKKssbXxUDuG6Ny3IZeC1sYunggNqGI9Nlbv4Dbhs
         tgpnp/+Fajh+PwJty+smqR8Mf3ktg08GXpCTs/QOELwsIRqiEy+pjiP3n5okSf68Fd7W
         IhFJz01xQGSjn3Uqnaa0eqw0QOIh5uzqKwwEt2yyjJPgCOSxtNGZUW5wWi5p34Opnho+
         X7Uk9a4gNIe+4ZhwBEevKNz4SZDxlafSNAbtVXR0RrTvjnP3c5dkd0aROSDbI7cvskFf
         93DA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="VT7P/2wD";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kUCF7OQ9kNK9uNHWBdV29YxyXJgTokzBpqf4+Rx3yiU=;
        b=c6pLjwhtEl2mirP/BYMhxXjFsVVJtmL8IxH8G/qh9cDdvOHRRY9woSciMFkvf6+zaU
         iFB7b0A9Ug5lapb7CJz4bIh9Vg7v7v79jCH140B7l+7BBZoDZj8BNk4zCEKBb8P1U//u
         YV3pPqPXqO8wUDb/85Yvo6uN2kVxG9QqmcsVdP/wfw874vZrLS4jhsefU76zzPY5eQ8Q
         JhgT7bUEqVTvMfmtrlMDUdZS97XgTc8JFb5zOpMlYWsu87/zjbGXo+EJUb4cxrxjQSbu
         cHCpMr5u1EOua5SPiUBdfwHUK81Khi1bUIsMBjhXSAtuT4Vlg6ZePw2M0mnPAsmoFq4n
         1ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kUCF7OQ9kNK9uNHWBdV29YxyXJgTokzBpqf4+Rx3yiU=;
        b=Slh9NuC+gN41SOYo0AgaSt5pb6+BxZdVGeMHFbPaZmx7bxmmTKmhp4fYE3HsMs75y6
         gJMk2TkyZtjNnFsc86/grRyZi7JxqM1OOWsfThfjdUQp7JbHmbhZavDYr5e9BReEzYrv
         euBnCk0dOuit2+odT3eLUpEhEqLr1g5g2s6CX0dMl+1Hq3ridQwD4iR6/mLYOVbsVHpX
         cbse06HEQmNPW6EyDGWPRk0Y7KVtZQLX0R5+zN1eceh9lytBZFxIRcwumyIC1SxJ6kiU
         3CoAtdjsv50hL669Q5XuYecyQsOb4X++2odfkirWkbxXTv7mjJGhPZJLdV63KbC4kTTK
         cy4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWD4Wudykl9fS+Z5KK1IdplLECPzQpMiAVY6qVKbtjAvIvu5xQE
	MAOZ/YkohUEVJ2L0eCcQbtU=
X-Google-Smtp-Source: APXvYqxnI5ZeFhglkmSRTpuBkR762ZV/BVaEE/2ygu2nG7ksGytHRy7ZjRL6DLaAy0AOd8eTEP6iBQ==
X-Received: by 2002:a81:996:: with SMTP id 144mr3121365ywj.57.1571321884772;
        Thu, 17 Oct 2019 07:18:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:34c5:: with SMTP id b188ls416103ywa.2.gmail; Thu, 17 Oct
 2019 07:18:04 -0700 (PDT)
X-Received: by 2002:a81:a1c3:: with SMTP id y186mr2975489ywg.178.1571321884056;
        Thu, 17 Oct 2019 07:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321884; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/dBBGsA/LLDafPdbB6uCifqwqQnXJJEuO5vLaA1AlOy7UiQ1sn64eCJjWplCU4jai
         xX4Yzxt+JlNx0elHHfBsXwUutW7wyGQhntAjjtiHJidcj0DDhfyUCVnRWxn9ejE+RNO3
         /psqvtEYBx8ZIWUJkUQutshjmSQUt4EKfZg9/4sxGX5hAP69S2qzVhXCwNed+rNtSS9J
         l7mzaaWcmFtN19PtjBjjlmFTKCsWLyX9aRwjJ8krY8xVp/2vjVExwhA7Bf/mgVndAK/U
         LYtfrQzWgN5/uF/2NMgxzdjpPHMWlRbHyQyUm8bh+GlMr4Y9YBtclzRIiHR9cw+qDnQo
         UXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=52He9tWYfj5iIE6RAPgEpcpK1aIzk9z4YqcV8ncNkUM=;
        b=NQhLTBC2HYSS4ZAVesVlB6ft8XF+/nTASfHCd1J6243XCQ7U2GvmmfDL895j+2xlBt
         Z3v7XzQX2aDuDv9XSuK7h083uSrwaF/f99R9ZJbHEM5pElNjShMxD94IPjCAqXyDN+Rp
         NRLY1aXFAtvOMc2O1mVg0hhjz43IhzCEJB/E3cPbO48UAHeMSYU9iilhRux0FMKEmX1j
         SStQSoIKA0E0h4lKMj1TGxo0okyV5dJj66LNJGVeNWM7I2hh71SM4zNR0x5B535eTK+9
         o7rQ1++78644pnq7hec7jn7d5d94VbaoBj51sRSB23z1ZdObd1iCZ/msx+EiqTkcjVKS
         bQeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="VT7P/2wD";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id g203si179961ywc.5.2019.10.17.07.18.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-3a0df0f.ac4-iad.github.net (github-lowworker-3a0df0f.ac4-iad.github.net [10.52.25.92])
	by smtp.github.com (Postfix) with ESMTP id C967A8C0925
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 07:18:03 -0700 (PDT)
Date: Thu, 17 Oct 2019 07:18:03 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/8863e9-6feb43@github.com>
Subject: [siemens/jailhouse] de49fb: tools: jailhouse-config-create: Rename
 regions to ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="VT7P/2wD";
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: de49fb638e11a2e84cb8ad7963e9a8ea4a0036b2
      https://github.com/siemens/jailhouse/commit/de49fb638e11a2e84cb8ad7963e9a8ea4a0036b2
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M tools/jailhouse-config-create
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  tools: jailhouse-config-create: Rename regions to mem_regions in preparation for port_regions

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[ralf: leave brackets]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8a8114bbfad1ff4f75fe3e9804ee5085f6b67ccc
      https://github.com/siemens/jailhouse/commit/8a8114bbfad1ff4f75fe3e9804ee5085f6b67ccc
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: remove dead code

There are no callers of __str__. Remove it. Seems to be a development
artifact of earlier versions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 550aba917a3f9c755fdad9ded1602851e7bc523e
      https://github.com/siemens/jailhouse/commit/550aba917a3f9c755fdad9ded1602851e7bc523e
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: minor stylistic fixups

The sysfs_parser is written in python and not in C. Saves some
parentheses.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9daedd4953b0ea01e0f7a426356e62c404a2501e
      https://github.com/siemens/jailhouse/commit/9daedd4953b0ea01e0f7a426356e62c404a2501e
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: introduce new class IORegionTree

Do this step by step. First of all, let's create a new routine that is able to
parse a line from /proc/iomem or /proc/ioports. Both files share the same
layout, so they can share a common parser.

Passing the destination type of the entry to the parser allows to share code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c1d02429c3528c9a2b9abe3e5239b678c6ebbc8d
      https://github.com/siemens/jailhouse/commit/c1d02429c3528c9a2b9abe3e5239b678c6ebbc8d
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: move parse_iomem_file to the new parser

Move the next part to the new class: the whole file parser.

For the moment, this leaves an ugly one-liner in parse_iomem_file, but let's
keep it for the moment -- clean that up later.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f1d8e556c6c977454bb4288e52f81d5c35890c8a
      https://github.com/siemens/jailhouse/commit/f1d8e556c6c977454bb4288e52f81d5c35890c8a
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: make regions_split_by_kernel static

No need to access our own tree, make this method static. This allows to
fully separate IORegionTree from IOMemRegionTree soon.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4609b9637e7883682ab06c17e38967494eb38431
      https://github.com/siemens/jailhouse/commit/4609b9637e7883682ab06c17e38967494eb38431
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: entirely separate IO parsers

Everything is in place, so IOMemRegionTree can be separated from IORegionTree.
Let's give IORegionTree its own constructor.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fedba23702a72162bccc7732c3558efa0ce72a91
      https://github.com/siemens/jailhouse/commit/fedba23702a72162bccc7732c3558efa0ce72a91
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: remove parse_iomem_file

No need for it any longer, call IORegionTree parser directly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5a1a3a158c718ad3b3d54f475aecac6eb19d1c7e
      https://github.com/siemens/jailhouse/commit/5a1a3a158c718ad3b3d54f475aecac6eb19d1c7e
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: move find_regions_by_name to IORegionTree

That function will be reused soon, but in the context if IORegionTree, where it
actually belongs. Move it over to IORegionTree.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 051d9dfd03e11c68afc3f961bd7a5aac92e9cfaa
      https://github.com/siemens/jailhouse/commit/051d9dfd03e11c68afc3f961bd7a5aac92e9cfaa
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: abstract parts of MemRegion into IORegion

This prepares for the refactor in following commits.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[ralf: add python2 compatibility, add comments to IORegion]
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b3cbfc305429b6eab449e096bd6047638118ba87
      https://github.com/siemens/jailhouse/commit/b3cbfc305429b6eab449e096bd6047638118ba87
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  pyjailhouse: simplify integer formatting for regions in config template

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 817ceabc8d947c41fa8e26b8a72e38ac3b6a6daf
      https://github.com/siemens/jailhouse/commit/817ceabc8d947c41fa8e26b8a72e38ac3b6a6daf
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py
    M tools/jailhouse-config-create
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  pyjailhouse: x86: implement pio_regions generator

This replaces the former static port list with actual port regions as listed in
/proc/ioports.

A whitelist selectively allows access to known ports (if present). PCI devices
above 0xcff are permitted as well.

However, not all ports that are in use are listed in ioports, so the generated
list may still need further tuning.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[ralf: s/permitted/whitelist/, autodetect VGA, whitelist serial,
       whitelist PCI devices, amend commit message, improve __str__ methods,
       ensure pep8 conformity]
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 82a52f736e75fe2c1a51d1625f98af3fc1528fbe
      https://github.com/siemens/jailhouse/commit/82a52f736e75fe2c1a51d1625f98af3fc1528fbe
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Remove IOMemRegionTree class

One last housekeeping step.

Only two staticmethods were left there. Move those methods to the top of
sysfs_parser.c and remove the empty class. Even saves some lines.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1730359dc430eeab272b84f8bcfb195c5b85401b
      https://github.com/siemens/jailhouse/commit/1730359dc430eeab272b84f8bcfb195c5b85401b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/cell.py

  Log Message:
  -----------
  pyjailhouse: cell: Avoid deprecated ctypes.c_buffer

pylint warning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2f59730eef8190816389afb1d5a60ad4155375e2
      https://github.com/siemens/jailhouse/commit/2f59730eef8190816389afb1d5a60ad4155375e2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Fix some indentions

Complaints of pylint.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8ed0aac6ed6d0248e8f955c2719b6afc26a290e4
      https://github.com/siemens/jailhouse/commit/8ed0aac6ed6d0248e8f955c2719b6afc26a290e4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Avoid len() == 0 like checks

Complaints of pylint.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6feb4398b561374baa36dabd7b1916d85e4de095
      https://github.com/siemens/jailhouse/commit/6feb4398b561374baa36dabd7b1916d85e4de095
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Raise an error if get_cpu_vendor should ever find no match

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/8863e9d830a9...6feb4398b561

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/8863e9-6feb43%40github.com.
