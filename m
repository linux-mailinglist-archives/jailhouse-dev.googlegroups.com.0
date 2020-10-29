Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB4WY5H6AKGQECYVSGWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3c.google.com (mail-vk1-xa3c.google.com [IPv6:2607:f8b0:4864:20::a3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA0F29E3AC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 08:17:08 +0100 (CET)
Received: by mail-vk1-xa3c.google.com with SMTP id p199sf557193vkp.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 00:17:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603955827; cv=pass;
        d=google.com; s=arc-20160816;
        b=yHeAtaZptWqQK8EQ4WHZmchPbwYDM4x52NlzfHynjmdVccnyuszIM3G/eOFxdVTpnV
         bXkcpbS0hb74kVKwvJfWcxymnbEwfjB+DhcuFgftGqkJqrwzsBWwkoMJWPxfxvdRK9KH
         FkQ8vE2nx3PA7r1PU6uqd3ztEY9O98fmUIqvUXo7sS/HTwRFLvKgFBxMn4bCCtJzSrFq
         4CeH7SLm5I4qXa80QvJp89BY0DZFVba2fLsx05Q0VkkY1idIX7rcjfQ9muBx75LPLJew
         hIouhuzAE8HEBmD1J+Ey/9vLBCvSqODigHvknDW4Ebxi5YKbfCRUWgSPZT8YyXiVtRcJ
         +bKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=nwsg0bkUdi7cr6io779Xz8+u+aIXjiBibrjyqUA1O5s=;
        b=kME7jiMNhnml+wM+/Wu1LxJ2KkyhT/ed4dcBxU6kHgB2Q4HOZeRstukBGyKNzZpyP0
         C5Sk/+IDajQwhQJWhuCMpDxSvh2mWoYZkaajsoUyQay3xgObv+HudBBE3TYrRgeT5k1w
         8278FHFMzt0ZDCSO90drkCsu1uucOJiZwoEfNU9OcmToWcoGhdz2bhnqYcmRILKSIJ+r
         6DVMHjiFDTexUffP2hR7l2dLFkZfDvIoaJvtbjgxen3LEW0IAlcTlx+cNhGgM/fyFX5i
         UvwR89GAy2km0gTy4XmXraYVpC8YFEmn0h7qmGdQTlnweqa7N+XHZh/N3m2NNoF/7qoF
         tNvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="ylx/Fz5D";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=nwsg0bkUdi7cr6io779Xz8+u+aIXjiBibrjyqUA1O5s=;
        b=rLrTkt+tyP0kjPbrmq0HpjS2BSHVEVKXQUynGZe6Hv3+Q8puu6XbDaeONHLnAnceJ7
         qBi70qohhgYLNLs5Nro/JtUhHZG7wTGLZw1sOQYH4rP59gZNk2cL/iQ7Z/KSTYGAbc9C
         DJVwPtm1KNh++5MMKkb07BYflBQeAQbvFEzxFWV+GmBLtkaVo00I8LQrIfsXbnGyTr5+
         6DMJ2VGH+FcKyPUd0+tE3m+x97B2SdFqUXjrrsq3bEughJtJpJVh6k3Rn3AAMWiPFmnE
         uKLDTWyOljox/P7IsPC2ZRM/UG+9upg/dQaoWLipVbNxnJjRjh/rwg9RhkOE0Ng+s6/S
         id0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nwsg0bkUdi7cr6io779Xz8+u+aIXjiBibrjyqUA1O5s=;
        b=fSs0nWt4v9f9/vP1qTRRI0g1WE2IchKJOrmSuuX1+kABNnqq2Rw5lgkdzdeV/HYkKn
         f1ARPDn4MagXqB5LYSot2hw0mBmeVdaWL3Babc/ok+BejIAVekWYLLsAqwBRxvv51aN6
         RnH4L5o0Wp/Hnnn7ayBpBb1qjQj1qabwK0eFECyswK/tGc4plma47ld5fubIDZq3u5VL
         EG/l+Fs3V/AlV/sruExQedV1NOuWasN8/jPF+R/abs7zT4Ud01abgJcQX4wlgWrnmwmM
         Ed5Y7Q6gAxByxn4xOxB295/PNgkaghdTuDw4I753WLjo2q67BzukfVPPcvTQgVMKxa0i
         GE/Q==
X-Gm-Message-State: AOAM533clVALJA82UnNk9C0SmPOmcrf2hP1P/YsGPMc59mZV4NAyxU/v
	Ad9ebwFOxIvPLpi5ZNFPijY=
X-Google-Smtp-Source: ABdhPJy7aLqq3EQNNspq0C/wn8O7Mvgc9ibA64M0y0/LYFL8FMIbb2YwVmP4Cf4sfIaxqhugbReIjg==
X-Received: by 2002:a05:6102:200c:: with SMTP id p12mr1892817vsr.11.1603955827012;
        Thu, 29 Oct 2020 00:17:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:5adb:: with SMTP id x27ls141903uae.1.gmail; Thu, 29 Oct
 2020 00:17:06 -0700 (PDT)
X-Received: by 2002:ab0:7313:: with SMTP id v19mr1740655uao.87.1603955826242;
        Thu, 29 Oct 2020 00:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603955826; cv=none;
        d=google.com; s=arc-20160816;
        b=w4T54RJGWbOfJSpvU+sYF+I+nZmwpIN+p6Pa6hWB/UwQA9uAQH5XGoFHlhAhIrG173
         OZpV42DhvHXk6BWulx2oeXtz5Kjj8QJ8I1+p6fsVeLrr9OEt2BMeI0mnTGtfIdYyex9z
         IhCSY16xojogCDUx5y5CXZiYrNzjTPeR9x0/VLuK+BeceBk4VxzodMdxGZSC5h7PY+lE
         CrPS0gD3EmG0Dl3KlgV8IAvk4LTLKNI4g7xAZBZkVVR+mwxY9kjuVNaPKyIE10wBSS8+
         8WGCoP86eaiWF0+KZu8A3/uvaVW4r+FR634xtI7MJZAWm5zJVF9h23TwG5puL8Dx1Oe/
         4W9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=HBG2MYwif2wSYqHG6UgZXtWYVKvnNMj1dcqYfk2foA8=;
        b=op/JY4iHH9LymW5pkWtIYvSv1UbYllgzL9dERpc0YCuaJppOrkhuAuTf1n+/lEdMTh
         0MhI+/2qOL6YPjIyt0+gsyibtP41m9qBreN9macCXpd0X3cixmkuzKdd9znZ3aQEm8RF
         8NhqkoXz4bmwT3rDZbvOvNv6wpGVI6AoZ0ekJ+8osGzRu5+BQPiBiJ1WEV4VCk1BUech
         zpjseTpgrow0UiozRvZ4uaedV6uPUFlRpYtW831V69gCihsuhRA/MzIefBQ0QYyyZxo8
         AOdt/Xp9F2Tv1CLrm1Vvchzv1xJDV19zvRrxQ1RX2FrD5V39xh5V19mgWrpY+Ol0B+FW
         ofaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="ylx/Fz5D";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-25.smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id q192si97298vkb.2.2020.10.29.00.17.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 00:17:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github.com (hubbernetes-node-1b47257.ash1-iad.github.net [10.56.110.71])
	by smtp.github.com (Postfix) with ESMTPA id DD379840D4D
	for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 00:17:05 -0700 (PDT)
Date: Thu, 29 Oct 2020 00:17:05 -0700
From: "'Ralf Ramsauer' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f4a941-c90737@github.com>
Subject: [siemens/jailhouse] c90737: tools: Makefile: remove duplicated rules
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="ylx/Fz5D";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Ralf Ramsauer <noreply@github.com>
Reply-To: Ralf Ramsauer <noreply@github.com>
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
  Commit: c90737c12d16375fae106922482284f003e98fe6
      https://github.com/siemens/jailhouse/commit/c90737c12d16375fae106922482284f003e98fe6
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-10-29 (Thu, 29 Oct 2020)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools: Makefile: remove duplicated rules

Remove redundant rules by using wildcards.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f4a941-c90737%40github.com.
