Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGOZ5KBQMGQEXVWT3GY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3b.google.com (mail-vk1-xa3b.google.com [IPv6:2607:f8b0:4864:20::a3b])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85C362EEB
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 11:38:34 +0200 (CEST)
Received: by mail-vk1-xa3b.google.com with SMTP id c62-20020a1f4e410000b02901d01fb39972sf3537790vkb.13
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 02:38:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618652314; cv=pass;
        d=google.com; s=arc-20160816;
        b=dHa74YsEfxGte6+G53pqkk7NUW1eswvwGyv9tSSbkqCv304c/XMyn8MjOZ5VdoptyY
         KxUXVSu09lnirhthWgmD+tMzwbORM/hosGZoSip2Y70NlXtUbmMqf6zdmFDxB+r5OMXe
         8NB5bSb7moAzAlLDKRYhWwa1zBr44nwUcmXZxwCYe6ucwHHM+qxNqVYsF4TI3Hzl3IE5
         uqXc459Roi6uh+5K2Oq4UfnHHjGmtTb5YM2TRu08AuTAbA6eEY5/f8UAXskW+VlRSZpB
         ueXcxTT3wcDao9wfFjFJlsQvELiTgAIuZc0aeLOvpWzs6JBQjtlO6U7xqDyy9P6VXDQ3
         wUIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=JTTvAmyGEuifmBHWlQzHJ/Ez3OgOnJLGoANK2aJGLUk=;
        b=zmi+uWmY5qgMJU67/crhpkAlCf6k9/V3ceQocPof5fr40b9smBsKNUEtWXIwQ5+1PV
         bOYxaF55Pk2vMjp37OOYyn7ZZ0Pq+5g0mAafw+guwuhBCMNSZ0FjMcPl+VbfPY+ld7TY
         puyamLkZRHNps3ahVVBhIft+dvQ81Q0DWVDp/F2BGTsSWkrFlvvq83VHTFMLdr/WFcPr
         fex2RTKpVdyfx8piqUySUxuUoKlSFYUkGoLCzIIiGttN7HJAtDp5skcNVf+HffctvGLK
         bxaQ4AjxjUGT8ugNOLM2f8jrDO+QNuKc2z4IQSHOwBNqhmzuJp9MU3nmMIGNsTh+rNbB
         B4mg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=nVXK456u;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=JTTvAmyGEuifmBHWlQzHJ/Ez3OgOnJLGoANK2aJGLUk=;
        b=JU5Z2ccqgiIqPfhGTN6dv5AwHLWvTYHDB/6+VZnwGYuRa4qNTV6GCuWlhNJJ+EPQtV
         9w68uk3cxFPckSrsvwCjinlyP9lv4BLr6QuUHTRG1gKhp7IpcuK5q9FwguYn0Yp3nto+
         fglx73O0NIgp6yt2Wd4ZxUQG1Zcvp5iyVRAi+yKqlSY0ch8VAwoHhxpCOS+XZLru7PAw
         3DtqoATQDNPJHWv7u45lex0B7MPut/jsByNiyPf6kTfNDqg0xf1g2ECkQvwKJnVh+a+J
         j8TYtK01vNIwwQBPO8gZhmoa/9gHZAO/ngTN8kuaUXuoXN2nj49ZTDmDIwIql0MPKyPY
         VRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JTTvAmyGEuifmBHWlQzHJ/Ez3OgOnJLGoANK2aJGLUk=;
        b=c3PQjwJhc+wXfStwfZA6cIFq3QwYWjr7qh3jph/WrE/qvEjZTx4cEP3eIYA93jq9wE
         SztzrDhF61W+OybdAyJ6y41u3BjLwc+XKBSKFvgzHYxIlrgUMnDj3DLMOeZvRKQhjuVQ
         e73UOiP19AmF2CqZALz+GMub04Lo2Ph/e8PzdEDg/lv9fslcpdSrvxGgpE/C6XZknUzd
         jrJW4Zl3VLj6EwiP8Qj7w6SXaz1TD0u2QKSHw+ORjiYMfGZ+XnR1ff39cefOBOszSZBx
         eRWMFJ+spO5Tjc2ltk+cKfru7JSnPcM/uKCrkmDSqMCeHJXBmndSckEqinYd+RA/u95p
         LZaA==
X-Gm-Message-State: AOAM530twAV/t5ePUbZx6CGWRnIOg9LgGx7/M8auxxtg62O1y4sFa/Eu
	G1tR5slWEZZ4N8GxNe496NM=
X-Google-Smtp-Source: ABdhPJwY/uQKuEuVVdIFv2EG7vIMvYgzBLoXdjyromSSKZPbfzCK9WUC77oIHFcqvMwrrYtYd6Jzxg==
X-Received: by 2002:a1f:1649:: with SMTP id 70mr398814vkw.4.1618652313845;
        Sat, 17 Apr 2021 02:38:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:3346:: with SMTP id z67ls1723210vsz.7.gmail; Sat, 17 Apr
 2021 02:38:33 -0700 (PDT)
X-Received: by 2002:a67:1e04:: with SMTP id e4mr9780664vse.52.1618652313195;
        Sat, 17 Apr 2021 02:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618652313; cv=none;
        d=google.com; s=arc-20160816;
        b=qQl9M+pEDl+V4ruMDLYiRqsGuM2tbkjETiyVLEhca9YCizI7XhSHxsk9j1vHJ2WjPw
         Am1MWaQdVdjl3nKzJauQUzP0TgJzrzHtLKgx5asrG/yuyqb9f/dYq72FF8pmEzYl+LJf
         GqJBcxtbS/KEG/58UnsSaUnDF1+c50s0k+JzSq9/KWgSsurCFA9LXcuH/fvYR7Kyn7uY
         QzXHFDEjIId3hilIrF65PPkrAqxLtefN3tgdhgo9BC+cfInXjSTbJ9n40P5TI2FlJSvy
         YITkuqxV1P8YAKWGmR/t7akwX7JuV5vjhEY25D1lr5e1XoSZsiNrVqDQhO1oi6XE/X2Z
         KMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=J4lU0pKO6BRz6j5MyoLA8/lYI73HLLVIQYEmw0x1Uxc=;
        b=aorDNNJZ74dReqlbQNIVN2cNnwNH0TTjLhrwVn6tu3Sz4Q0WYWdJ4ps8qjp5aiKPIm
         6gy/Tt6pWEDbgpe6Dk6rME4W3Lh2JQXjUwi7yeLEPRFgwOr+t41zz5pAl+58FXluJjhK
         Io6WowQTX8uBeWcgFFPvx5eqU2niVfJnkpx3a2u3qd5/QgRnq0vBbS1628GrMZphCwO2
         2vSsWKN6Wh1IYq7F5igGzKz632dSYuHcZ0WrW485Il8p3XyOaz8eqz48QiPwf0nhEgpN
         faOcTES3/Un0qR5uq/MjH6R8Aobh0bVrUHWczRUd0s5WVtv8b50XH38x5nse4mem33Zy
         EkbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=nVXK456u;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id w4si175529vkm.3.2021.04.17.02.38.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 02:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-d588c94.ash1-iad.github.net [10.56.113.18])
	by smtp.github.com (Postfix) with ESMTPA id 923F25E08EC
	for <jailhouse-dev@googlegroups.com>; Sat, 17 Apr 2021 02:38:32 -0700 (PDT)
Date: Sat, 17 Apr 2021 02:38:32 -0700
From: "'chacon01' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ecd3cf-87aa37@github.com>
Subject: [siemens/jailhouse] d22033: Check UART UCR1_UARTEN bit before writing
 data
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=nVXK456u;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: chacon01 <noreply@github.com>
Reply-To: chacon01 <noreply@github.com>
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
  Commit: d22033b6367bedcc2890260fc23be3d5934df95b
      https://github.com/siemens/jailhouse/commit/d22033b6367bedcc2890260fc23be3d5934df95b
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/arch/arm-common/uart-imx.c
    M inmates/lib/arm-common/uart-imx.c

  Log Message:
  -----------
  Check UART UCR1_UARTEN bit before writing data

There is frequent start/shutdown operation in kernel reboot process.
And at the end of kernel reboot, kernel will switch to use console
output,saying imx_console_write on i.MX8MM.

imx_console_write will save/restore uart configuration.
However before imx_console_write the UCR1_UARTEN already set to 0.
when restore, it is also 0. Then when we runs into jailhouse
disable, jailhouse write to uart will trigger hardware exceptions.

So let's add a check.

However to hypervisor itself, there is still risk that
kernel disable uart, whenh jailhouse is going to write
data registers even with this patch applied.

There is no good way to avoid such contention,
the best way to avoid such issue is that
use a different uart from Linux or remove
`.type = JAILHOUSE_CON_TYPE_IMX,` from configs/arm64/imx8mm.c.

Remove `.type = JAILHOUSE_CON_TYPE_IMX,` means
jailhouse hypervisor will not output to uart, but you still
could see jailhouse log by `cat /dev/jailhouse`

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8a82d38ee12c3ab64b0cc95bee35a74ac9bdd391
      https://github.com/siemens/jailhouse/commit/8a82d38ee12c3ab64b0cc95bee35a74ac9bdd391
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/control.h

  Log Message:
  -----------
  arm: gic-v3: not overwrite interrupt settings needed by EL2

SGI_INJECT, SGI_EVENT, and maint interrupt are needed by Jailhouse and
must not be controlled by the inmate. E.g., we allowed the inmate to
disabled those interrupts, stalling Jailhouse on management operations.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1423b55d303d0f27b97b0ee223a451c3e50cda91
      https://github.com/siemens/jailhouse/commit/1423b55d303d0f27b97b0ee223a451c3e50cda91
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M configs/arm64/imx8mp-linux-demo.c
    M configs/arm64/imx8mp.c

  Log Message:
  -----------
  imx8mp: support virtio console/block

Support virtio console/block, the reserved memory
has already been reserved in linux dts, we reserved 2MB when
initially support ivshmem which 1MB is not used at that time,
but now the left 1MB is well fit for virtio console/block.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b8f4aebd7ae665dc8011dc7070e8f978acb0de55
      https://github.com/siemens/jailhouse/commit/b8f4aebd7ae665dc8011dc7070e8f978acb0de55
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M configs/arm64/imx8mm-linux-demo.c
    M configs/arm64/imx8mm.c
    M configs/arm64/imx8mp-inmate-demo.c
    M configs/arm64/imx8mp-linux-demo.c
    M configs/arm64/imx8mp.c
    M configs/arm64/imx8mq-linux-demo.c
    M configs/arm64/imx8mq.c

  Log Message:
  -----------
  arm64: imx8m: correct pci domain

After linux moved to use linux,pci-domain, we update to
correct pci domain here to use a domain not used by pci hardware.

i.MX8MQ: 2
i.MX8MM: 1
i.MX8MN: 0
i.MX8MP: 2

Working with NXP vendor tree is 5.10.
Upstream tree only has i.MX8MQ pcie, since 5.11.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 87aa37d4236dedd81c1c9219ef3f5e6713d42d52
      https://github.com/siemens/jailhouse/commit/87aa37d4236dedd81c1c9219ef3f5e6713d42d52
  Author: Chase Conklin <chase.conklin@arm.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/paging.c

  Log Message:
  -----------
  core: avoid overflow in paging_destroy

It is possible for the ending address in paging_destroy to overflow to
exactly 0. For example, in a build with 32-bit addresses, a request to
unmap 512MB at 0xe0000000 will result in an overflow (0xe0000000 +
0x20000000 = 0x100000000 which exceeds 32 bits).

This overflow can be avoided by comparing the last address in the
region to be unmapped rather than the first address to not be
unmapped.

Fixes: 7cffb9b7d54d ("core: fix hugepage splitting in paging_destroy")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
[Jan: tweak comment to address also size == 0 case]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ecd3cf0ae00e...87aa37d4236d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ecd3cf-87aa37%40github.com.
