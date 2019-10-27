Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIVI2XWQKGQESVDBTKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53a.google.com (mail-pg1-x53a.google.com [IPv6:2607:f8b0:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C243E619D
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:24:04 +0100 (CET)
Received: by mail-pg1-x53a.google.com with SMTP id s125sf5534665pgc.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:24:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572164643; cv=pass;
        d=google.com; s=arc-20160816;
        b=W7xWGmm/Ay+z5ady5tOcXyhelTUBXtAi+R0/z7QwL/YVy0fq8woCh/smh0MT7kxOcG
         6YnuFfmKF2vaHXB2eeaXfGbAhNQWxBzOO32em+ynRFuB40spxjCnRF2UMUkxEV4ulGeY
         e94yB9BDqeoxM00XMaZOSEwyv7lNBIrPBmNzMXJ6H2wrqbqu3FdM9PPAS+vb4+/9gssz
         zj6Zu1MIBxJQxP51efNI3wv+znS8c1WD8i+FoN3PYTUN3AuSa2Vf0t6kNp1AzfL4Wl4p
         IHiS69nmQD3M2AIFjxHjjbEdO6WXB8xvJSb9reSpsxjAjIFUzVe1VL6HuyuTavJsnIDa
         g06g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Z7fVTQoaGtZd5/WA5C6s/XCbmvopdyRtawygZutKPNs=;
        b=Ur6+fIN1MEsU+t4fzwPcpGRgdbdRSAX0etTTYb9f1YuLSdqOXDs+6m4aChyFFKWUoG
         j7RNuqR1TNPJbPw5w1CE4RkqOVn3HU3nA2qRixQRTFZcNFb1fOyyyT17E8DTp8qQ27/c
         DukZcM2HYl44lUYKxNgZLr6sgU1j8Ka0MHNr19ZrZYahC/9PNdOye4TE1SxDyVh12plw
         V73gOPndrFlzVYs5MHy9yHX4dJTTm3Z0Y3M0OQzoidRP9rJbeYqXZwtUZHEHssKYO6uk
         SDASvSgdUKY/Q8MJfwjd8OBFqcuAUj8pY8zp/+djSNSzG637dStL4LpdBPGwwQ5Pg6Om
         AdhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=j2dvsO3j;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z7fVTQoaGtZd5/WA5C6s/XCbmvopdyRtawygZutKPNs=;
        b=GWSImvIAflbKZjd3T9Gf7aFEH/fsjbgelya8+8PRS46QG0zVwZO894XQMRn3+ZIud8
         SRtLiRck98ftpIlV4Oi3WZQK6LbRU4tC6QfS2RDK41DFjfcZSDTh5s1M46uiTpxbcqzS
         Geg/YVgKeLdFn+xHuZeAkk0sQN4UZPnvf375oMVRZp9YWbCrwhqgrak/GXfk6moLeyz0
         lgZ7QqZEX0G/nYMNI8CVW7nzdLNQycIaWyt6ZvsIqzibctj1kOPVHTkPJmwaxKbCRJcf
         4zAzuyIcc6eUCmE3DnaHUvL/VhpfLBEFkdJkRrv/YciMRX7scQBPdY59ElkiuLznFSvH
         PmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z7fVTQoaGtZd5/WA5C6s/XCbmvopdyRtawygZutKPNs=;
        b=QR9whntY471HdF+M8mqUxRYaPwp/keztt5RykOklvhWrhuKQzS2H5G3E0ydCGx3rOq
         h3SgTUtBTln+yHkP6LPVM95slk6AOtC4LuyitkRryDh3CUDOCSzezJpoZ0kz6OVq4X+6
         2pwP4i5LfVj6lAqxLKaUM59kQAEIpSP+sNmYy7jER5zZ3h+c2pW4oRgRHT6bPmhkYOxC
         nGz12G4h0BULjHebmszB/R0iwB52pMguPFeKpbenR8aVpuafA7YouDRj+DB+N9X+s0k3
         XKP1c78N4DWT0tVffcw4YuOMSTvFFueUrEwfb/EnsQrrDvI7Bm1oN9umo8QljovrMSXO
         GiSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCWJ7LGf1V6oTIb5gCUlRLIw7jI6Qe8rIQacRtrfeEAtRKhj9d
	SrKI6lYkQNp37xdoKUbwgfw=
X-Google-Smtp-Source: APXvYqxw+t8q4+eISGvWbYWeRsaIC9JwIyOjlcSAkVZxLrkJ7EI0hcCBe7pWj3em0MQt+vlGMWE1GA==
X-Received: by 2002:a17:90a:234d:: with SMTP id f71mr15390648pje.134.1572164642817;
        Sun, 27 Oct 2019 01:24:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:d355:: with SMTP id i21ls1877529pjx.1.gmail; Sun, 27
 Oct 2019 01:24:02 -0700 (PDT)
X-Received: by 2002:a17:90a:d793:: with SMTP id z19mr15680896pju.17.1572164642072;
        Sun, 27 Oct 2019 01:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572164642; cv=none;
        d=google.com; s=arc-20160816;
        b=HeYEt68cL9cbbqYtLRW7pJZnuZPiGjL/oe2SvXH0Whn6Qbb0bO76Ry38mN76ZvMX62
         uNrPljmZ4UyQ82h97LViUFB3Avowe03OTUeWXrSax13GjEDn4rXUwnbty6ZiurL2+6U3
         5S/oooewadaiGxH7t8fU5ZrSwpXFK517OFWKr12h46ZohfY+EhGjzjeKjSzJeKNff/5f
         V5VddfEd+v/NlA1J2OWtq5i/VW+VaqaMkUw5H7SGJkWEPKrTvNBoLWuDUnLMVyCHCaPe
         aSTbkHpQLVt5ZdWAErCW2+AVgRGI0w1qWvBRLp0Xt7Qb5rPhsGaSN70hXybjnDHUMCYI
         o1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=nja45BsJUKzRPaTeNwwGGHTLAt+gmD4UvAbifTE4ks8=;
        b=TcDuxOB+gWHuRvmAbVsd+i6vi8Hm8NbBeBXJetrgVF9ZS9vdsQ7KpzlkDuMLFA8PZD
         a+Ib7e8/M6SJHubwB1w7kNRU/i8Pto/RVRopRWKD+PceQOGcibKL3jFDxjvrqmfHrG3Y
         dRgGwwIdclxdveXc2EDhUPXJEE51xSTXvpWkZW2RhDJTxbHy4D8CrvFvr26fRL9qQxGq
         834w9/+Xh9Va9mx14GaxnxlqoxylrRbbr4LwxrqD7uVnO16TgQ1okSIc78sXIOjt7aR2
         jrZUy6y7735RKXiOcMsa7LjT72J0xufAjLxcSDNkVXtZpsi5R1zC4UpVzJ5RViPwQN6N
         le6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=j2dvsO3j;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id h1si387482pju.1.2019.10.27.01.24.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Sun, 27 Oct 2019 01:24:01 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/90e8d6-a179d0@github.com>
Subject: [siemens/jailhouse] 8863e9: Fix typos in CONTRIBUTING.md
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=j2dvsO3j;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
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


Compare: https://github.com/siemens/jailhouse/compare/90e8d6cee27c...a179d0791797

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/90e8d6-a179d0%40github.com.
