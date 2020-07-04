Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBBXZQL4AKGQEKQNU2EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 802662147BA
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 19:29:43 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id 73sf9949944oti.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 10:29:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593883782; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kg8QlYzvtmONkjz4u39oBaqWTb9Rx7bsODT0rWNb69nYP49UjYW/506hpM+jSm4Gup
         OyLVTfhpyD1zQHs4CXteNooKodebKR0fhsDVX3zfUOGOCKJxuYoPnHV07PK+fYmozM6s
         ROeB1XOZ/awtVG6glTFmuGry0tnUywwKOxVEo/pNZk4Qg2P322ls/S7lFmZq0SufADfN
         DVJQ0lSK7CmHszYnZk+TWw2ra/QvybXnmhKXRGHLwsx21LwhjbBrpgnmGGFnvTyAbhTt
         z2hMZMyMsCepBtlXFE835vm6PhK6mSnNzTa1fuCMfuxRC5YVNFi4AU+IcUBjZnAQJbRA
         qjKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Uwv0oCMbaXd2Vnf4A4e2WpN0avZBzTehDo4UTI9KiT8=;
        b=XZId8JfOywb0Djr9pYyhF4MPrOM96U5Fuucz3GN4PaPnNLfzNCP/8p4Bw9TMFBvOu3
         70gleGej1vE4dkqwJ3WVhmF8PlOYXCYnegXzeasq/sEnUfvcpsWPF27z1w3czMIBgX9d
         mDluXKrJ2JHuc8Shf06wcRc6RSkTINMoOeK/iWoUlaCng8cx/ioWbOCrssYmfp15FkLR
         5apJvxzaOUOQnB9efhdXY+kQKxoP1i3K08czdS8FxvJXMHWyfiV/Rgx5zrUzqcPI+oSR
         SV5U1u5V9NRK+wT1LBbu8/6k/7wujOAGwurQn0bqe7c6SZt75DTijJbXA6COCIjHQNn1
         X+hQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="kJfZzp/y";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Uwv0oCMbaXd2Vnf4A4e2WpN0avZBzTehDo4UTI9KiT8=;
        b=QQcQsDNW0cQcXKuoBroGNuC3pDwLUr9c59oL8lFs/fdhXEBcSYpqnNOAnlQCMZ6D/F
         Zdz0PJCM74xXO5ePsQ9XTe1Q3kLzOWYnk/neJki3PJfr6kE6UYsUMgnZM/WEYcPHbxQm
         h5BhLK6uBUmOCu79GI3dKDQgRBsMKrN0nmKA64tBVgdlLB5Tc6zwM6MDwSUsh1t7QpEv
         eY5nRqtx7EaRO5NyJTlQv0j2UmMTtt4IfRNrwmlcAo7oLsYq44oQROXzHRBG3hVGJXUf
         4EFkGCiXB2CkalWXzcIkaChx4UeessIcHahGkIJoHCgb2iaj0MpsqDVfhBdi4R9WJ4vj
         qQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Uwv0oCMbaXd2Vnf4A4e2WpN0avZBzTehDo4UTI9KiT8=;
        b=JXzu36tvWn5q+RDJGdZt9F7NSmmiUjP+tfnmXuQ6ZC55sZj9Jag5SOpCiFB4nPfEDm
         N8FFoFLgzhqVXAATq+Wmyu0tKWdXxWsGh6hZQ8xvRXWEYzXdrM3p5XxhTca7dnlKVEOE
         bQzcWQWHtu0+cg7QofdmIzFpKFbP3WGGsLNVTD3Njo2NHiA4vX0fZztl/NvNbQCq9ylu
         zA7fzLdidwPTjyOi40wUb3PNuQFp5BaSbfOZ7XSwvGwjjzadxTkBvkx/fFobSd2mnFkR
         G9/TtIkwjUlscDOhVU6cjQPPRDes7sMTOdetZ1w7etTjnIDvqsaZEIkPzaXsgnIJWReg
         tf7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xa18Oy/ZPRoDdEiUdeBIN2AuuSPMurSfT018oVKfTft8SgogM
	sU/A8EH4b1NYAB2I56wMRUY=
X-Google-Smtp-Source: ABdhPJwwOMEGTRWiaSOYv27+iT/cbXGQziluAiSsbMh+5vR27R6G6UOCKyWO/frSjvadIeaBM3BNyA==
X-Received: by 2002:aca:48d8:: with SMTP id v207mr32404148oia.81.1593883782430;
        Sat, 04 Jul 2020 10:29:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:31ae:: with SMTP id q14ls171429ots.2.gmail; Sat, 04
 Jul 2020 10:29:42 -0700 (PDT)
X-Received: by 2002:a9d:20c9:: with SMTP id x67mr23133984ota.295.1593883781998;
        Sat, 04 Jul 2020 10:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593883781; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ac/bkvgyliAbRvKZAajRAPRjPQMfZ+vdUU3w68DBbSCsdfqsz0LvBzvLjfW3Yz/ke
         WJClkluDMrZsnGc3eHi80MBAtk3xY8e/2sS4HnXPAob21775q2JU488kpYxDQtUeLBlY
         pr1wnKUW5Xv8ToMMWD9qcD1BQWLjzRqvyPXKZKPtgsZSHrCYap8RbsHg8U/hV7cjMpxH
         7xo9xMe/Ug3vk9FNXowbaeychRsKJb8kMF9qMRT7Xa29CPdr+DMuJT7x6P0n1kpVCRr3
         LWkZBuwUOmU+CxZjr1Q8iMeqjh8Q9/+Gp+iA87wkR+/rGTgTTfF+r9NIEmiIHGMHor8Y
         eJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=8rWM7NYs51hqaTnblp8LpUWoqsi723/kIrgz0TRwwjY=;
        b=hKvowhc1BDOB04bF0TEVvjME8UhcJVeS8Xu+dj3XLgPmAIZMIzN+R4/Qg4r/9V9PWY
         fSguRxEQpJaD7bbdLVNDWOB5ljFE7oucSzl7iMZLLd2ZIWkaWtT+tgXik3EWZCuEhzQe
         9pLQtOdoCEF5BX5XNvMlBEHr5LghzVbMEQhcyTkwBF+wnxQgXU7GyXSvuaj9sKhC6yVR
         TnqUByntp2R+nZuIvU0KukBqaxcapHsxcobVbgVgXZ6KmEjAIsrAMalzrrh1MJWKLk6K
         P8UWlRS4xzWL3amCg/4YLlZ8fZ1TGg0DLnvIplO7zj76laXpVZzDoixsKDf0eXb54f+S
         2/AQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="kJfZzp/y";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id m23si1234599ooe.0.2020.07.04.10.29.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jul 2020 10:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-9bcb4a1.ac4-iad.github.net (github-lowworker-9bcb4a1.ac4-iad.github.net [10.52.25.84])
	by smtp.github.com (Postfix) with ESMTP id 9226B8C0F33
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jul 2020 10:29:41 -0700 (PDT)
Date: Sat, 04 Jul 2020 10:29:41 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/9c9457-09f38b@github.com>
Subject: [siemens/jailhouse] ef132a: tools: ivshmem-demo: Map memory regions
 with corre...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="kJfZzp/y";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: ef132ac39dd2e5bec971ea1ce77fce49e20cbe15
      https://github.com/siemens/jailhouse/commit/ef132ac39dd2e5bec971ea1ce77fce49e20cbe15
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
[Jan: terminate on error in of uio_read_mem_size, fix return type, close fd]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0da6d67db7f0e74988740a82a46b8f2255cb58ff
      https://github.com/siemens/jailhouse/commit/0da6d67db7f0e74988740a82a46b8f2255cb58ff
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


  Commit: 7a90d00602f3955a41a47177b15b960119b73d72
      https://github.com/siemens/jailhouse/commit/7a90d00602f3955a41a47177b15b960119b73d72
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


  Commit: 189a60b7b05a3450fca52afd1285f79c4ae057fb
      https://github.com/siemens/jailhouse/commit/189a60b7b05a3450fca52afd1285f79c4ae057fb
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


  Commit: 55d7f4463d5c0bbde951a1d5ebba3e5e6381b34a
      https://github.com/siemens/jailhouse/commit/55d7f4463d5c0bbde951a1d5ebba3e5e6381b34a
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


  Commit: aaac921f30256c30746d5d84205a4e8653245760
      https://github.com/siemens/jailhouse/commit/aaac921f30256c30746d5d84205a4e8653245760
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


  Commit: 09f38b3aca20e4a8742afea0b2642b3b5ab0e9a7
      https://github.com/siemens/jailhouse/commit/09f38b3aca20e4a8742afea0b2642b3b5ab0e9a7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Fix convert indention to tabs

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/9c945739d90c...09f38b3aca20

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/9c9457-09f38b%40github.com.
