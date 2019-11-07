Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBRULSHXAKGQEKTCS6NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 46408F3497
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 17:26:49 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id y65sf2395222ota.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 08:26:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573144007; cv=pass;
        d=google.com; s=arc-20160816;
        b=cGtazlFRGB/DrgBBAX54fZopHX8NsTyBCfXPaoEoSaAdpdNQEvrQFuv5FrmhZyhD4I
         foD7TfF7n9RnJ/Nes5FyeGG8MjJKiZmgJsKSJFg2JmUWYG6OSiCFjEXVeHLjXCK8lFZx
         eiKrLZuQ9MoTyNg5/nHPSP8kr5Z4/V32NhUeq2s2d5IUMqu9Q3toPzx0pOKodM//sYkZ
         0TOT3rcjbvgGw8bWPKiS7iovuLMOIW4WWEHXj5dExJ3o1lei7ma642OPuAswjlleRTOr
         rKC0pqranZ2RXR4tYikURFZ353oMTZ5WNFF0VTzZ7n+hyApczXVy/O+yTB5dSVbApPfV
         O7IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Ghhb9GLyWyx0DlFfquIORoUcW94OilryL7CxPvwSSi4=;
        b=J9N2n9Imvo0ndi41H6cmomXM81gBnzulF/4HwgoWblUtonmLR4mF+pA3ThjXs+ZLil
         XS5q+dzTH56dEbzHMx19q4UNIdt0Mfpx0QtLHUy+YbLFA07ORi32r/Ol/3mWcdAXiC19
         IxuC6ea/aLQAWj0gvrDNgRJQjz44rNJPMipARGpcnoK1+hI/wIGPJz8L0KOeAYR5WjTA
         mgqkOcvV0sAJwpu4rPHuBBSQ3t7BV2LZo37feykDYr+932Dm3aCT3CBcQK21jGL59oMr
         RukdI2EJIjRUKGF47mDErq0VyKFWKGIDTmwjsekndq44WTX0CFjIweJfa8IaDsYsBPwI
         l1Lw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Vaqyi9dC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ghhb9GLyWyx0DlFfquIORoUcW94OilryL7CxPvwSSi4=;
        b=Pu59TX+GCzyjCjqn1ssbkfWvhpGkrp0AohOmQPs5xK3Jb9ePfA7WqbZ+Z5hfjzwzXK
         jJKbvC/9rEFxB6pgJfBvQQlnej+tc9463vhm2bdnClQTAAl8aNQBneaRKrOyPPU71xuY
         B6tpanpbvyy2hVGzcIw19M9U/T8eI1d3WblHQPcOwtx0edc7oBBmjmqnCqGED59obS7e
         dFKBm3drkb86SG1fzmrapSp2zV+IAhs6GZuArYv8bJGx5x+VHgmGkOKF7Yqmi2lrfd8h
         5vUesbcLZzXjmX95H5U5amBzJwM4WoOv2HcUl5JeckIGmR5AY5sb2ec1J2PO4K1A5JfN
         QVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ghhb9GLyWyx0DlFfquIORoUcW94OilryL7CxPvwSSi4=;
        b=gpcqnCVNWeHcTYdlQGsq87IpicRe6z3mXnz4LYzcuQ7MLSupAxWcDG23vAOX7PyVZL
         Q5gDSW5MvYCdqzntJqvobxIGgLJQRZUJLmbvIDDm7lOnYuq/CCkcMhBQpv2wXi82fM3M
         4o8WLdTcTvo0MEW7YZ3avoOnWel7uikuzp4GfTpsorJWOdXHt7ncp95WkafzgPW+PRTy
         p+9DCAQ+y9LfepzTuGlGZRtotEY5d1VTcgWg5SbR3ySBdO6AZS32QQl9OttGE6DqC9Ly
         6mMeKHJAtid6cTEbIqgmvFfD6yx3jSWCSHNAYMVMoluC/ujiwywVlA/8Tsj+Hm4JlB1U
         3jag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYxVYjzt492nsIRQhArzBVIxfuFMWm3U3cTyLliQ4OFrQCzt0j
	rPoYIwPolWNEq7a3h/YSgk4=
X-Google-Smtp-Source: APXvYqxTH5jBkI8GP8O45n6/PCTNIXxpJNf/WpdnFWZGOEdnvBGDwF4MgIZz6mu2HON0NuuJmWuAXA==
X-Received: by 2002:a9d:422:: with SMTP id 31mr3583224otc.107.1573144007463;
        Thu, 07 Nov 2019 08:26:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:2c42:: with SMTP id f60ls1411158otb.8.gmail; Thu, 07 Nov
 2019 08:26:46 -0800 (PST)
X-Received: by 2002:a9d:518e:: with SMTP id y14mr3895667otg.75.1573144006516;
        Thu, 07 Nov 2019 08:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573144006; cv=none;
        d=google.com; s=arc-20160816;
        b=XyEeekdstALjqMk5EgsK1kG1yohVDdBD2yZP7XJAMQTFDLJpS57YNwPKd2A9Te2Ziv
         8FUKYaQGL3tOVP2mUOrmn6jShUGmmgjS/PNQxXp42hfpyMcFI/1a2RMpUGsK7gdbymZX
         HPYyUxmOwyBvfe+r69491qFAYPOZX6bQ0Ije7P20SNee6pIrPXuPIrRRgCbGwzaAtlSY
         71dyJyI2CxGet29nKEteyx+71roydZIz/iZbdR8vliOmeU9mmQTRjEUEoEEGzu4KmBLx
         x97reRCS6fTuV1rjWDuriOdk7dfVVl3Xu9yp6c0Ck3E01JCo/T5TtONb+gUcCp3BOGt2
         nM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=27pnpexa8lL4XS5DqMTAZfrArgzveYZIXE8+yHkHdr4=;
        b=oHYB3R5Lpg7hP2+YY11GfPKVPtR2P0Am/HBdcPfhPbz25aqxW8HzVP6/h7j48SeTmV
         W8WLE9zHbuhyj4cyfj3nuMg4q8awgXBU3Dv0/J+Z8EctsnT4X+T3qwntDqvajFHGJZxo
         iOtFTVBRKxZPZBGc9YXsHiGQi742YzfrwMrYBZ8vCEBwRP6LavgbYPjD2069qoVxmQbq
         Zle/AK2ue6pvYp0a0pceUSZ7DMccABDLrX5735bEZpR8P5zlwHnQSpCJ2S6WSA2RTna4
         N611hCHU/LwX1SXr/EuCoRZFkGotBT40oxgu35WSEIimq9VOVvA0WS5rpnX+ReuatUk6
         G3bA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Vaqyi9dC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id x65si168766oig.5.2019.11.07.08.26.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 08:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Thu, 07 Nov 2019 08:26:46 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/8ff311-bac03e@github.com>
Subject: [siemens/jailhouse] f3a34e: tools: jailhoues-cell-linux: cosmetic
 fixup
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Vaqyi9dC;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: f3a34e9773e4a64957e7dee8e99d2bfd55b08ed6
      https://github.com/siemens/jailhouse/commit/f3a34e9773e4a64957e7dee8e99d2bfd55b08ed6
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-07 (Mon, 07 Oct 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhoues-cell-linux: cosmetic fixup

Just for the sake of consistency: s/memregion/mem_region/. This is the only
spot where we still had memregion instead of mem_region.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 90e8d6cee27ce04ffa19c2203b334c4e0f319283
      https://github.com/siemens/jailhouse/commit/90e8d6cee27ce04ffa19c2203b334c4e0f319283
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-07 (Mon, 07 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: simplify statement

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8863e9d830a938e1904b8d842b29d29607ca99f4
      https://github.com/siemens/jailhouse/commit/8863e9d830a938e1904b8d842b29d29607ca99f4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M CONTRIBUTING.md

  Log Message:
  -----------
  Fix typos in CONTRIBUTING.md

Reported-by: laysan1509 <laysan1509@mail.ru>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


  Commit: bcce372d1bf9c020a0d908f614428f366c3194bf
      https://github.com/siemens/jailhouse/commit/bcce372d1bf9c020a0d908f614428f366c3194bf
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Avoid len() == 0 like checks

Complaints of pylint.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a179d0791797693b0781fb862d39ccc31be5c454
      https://github.com/siemens/jailhouse/commit/a179d0791797693b0781fb862d39ccc31be5c454
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-17 (Thu, 17 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Raise an error if get_cpu_vendor should ever find no match

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d6ea1b6078602fd2fcdf7869cf3efffad5d42427
      https://github.com/siemens/jailhouse/commit/d6ea1b6078602fd2fcdf7869cf3efffad5d42427
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools: Clear KBUILD_CPPFLAGS

Required to avoid that any settings of the kernel leak in. This breaks,
e.g., arm64 with ARM's gcc-8.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6820b515e9a71f5490a36d2a5041e21ab4ea1e4b
      https://github.com/siemens/jailhouse/commit/6820b515e9a71f5490a36d2a5041e21ab4ea1e4b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-03 (Sun, 03 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/processor.h

  Log Message:
  -----------
  x86: Permit root cell to enable CR4.UMIP

This is safe from hypervisor perspective.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570
      https://github.com/siemens/jailhouse/commit/bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-04 (Mon, 04 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Rework and fix redir entry programming

Currently, EOI of level-triggered IOAPIC interrupts may not work while
the related entry is masked - at least with QEMU as machine and
PREEMPT-RT as root cell. This is because we always overwrite trigger
mode and vector information when masking an entry.

Let's use that issue to rethink the programming pattern. The new one
works by still avoiding to map while masked but writing the entry with
an invalid remapping index. Furthermore, a redirection entry is only
updated in the IOAPIC on writes to the lower 32 bits. This is to ensure
its consistency. Writing higher bits happens first, either out of masked
state or with the identical value.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/8ff311b9a5a6...bac03e4d5f54

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/8ff311-bac03e%40github.com.
