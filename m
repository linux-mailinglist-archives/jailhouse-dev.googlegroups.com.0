Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7NYZ74QKGQESKYDEVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13a.google.com (mail-il1-x13a.google.com [IPv6:2607:f8b0:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D32242923
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 14:11:43 +0200 (CEST)
Received: by mail-il1-x13a.google.com with SMTP id t20sf1569720ill.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 05:11:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597234301; cv=pass;
        d=google.com; s=arc-20160816;
        b=EL/UmguUQzpOIomVfOKfP3XOl/d8Dw284UpJojVbfhB91n+e19OREDDX1if7w9tncq
         +Gid5i/kC0T4jRZORVX1djagiUlRx7k6EHcU91mpB808Z0+OUf4jzxMFk/G5aPlRGb9I
         OWaz20AbjN1dvojhYXhE+saFkxoCecADNG2/RIN+oMSqaNYuhJ1N55XUhs1wpszovN7D
         Z8cOLCQCdbxepdcaRCuVRmfs8e8DB2CyC7huZ1V0Ckb9E+iykf/jAis7oytKcroGaKpw
         WaN+YLVGhdjudDWZbDhYP0Ma4ZOMEfSfm4yfgVJCWnz9zt1Kukt3GnL2Fyj5wgEFJLqc
         B5uA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=vBuMj3PyI0yPPhDhtU8SVsYlIH9eI2FJhCNWdEtCVHQ=;
        b=c6elwqt/VNPgNU4giB6I+DQcd6vx1dxm+My0kYmCt6Ktg1TOC5phBKXNcdlrxbBhR7
         NVG8OS3+XLAy+OsbuVyUieNwsZVCiNvzqMqTPVykGKkSYZXNhxqz9jsz9KWnmyMepapt
         l1N022ZEtyE6mcmfhKas5K1WydBYSiG1rNZ9lOhErjy0kq1RB9bv1m8a4WARMymDeU0l
         hHw0+irmMZNuvZ6uhqkvAMejDpA/7dQPhtJDdZ7V4/ZHe4whRPozTMPxnUKWMzATvlmK
         wCJd2srKT6snyynJkYQfZVe9+SYenoa6bSLWrD0fimk0ClDxChwg2PMpAZa/yHyax+ke
         UqyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jstrvgyx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vBuMj3PyI0yPPhDhtU8SVsYlIH9eI2FJhCNWdEtCVHQ=;
        b=UM7mO5uuqbvZNSemhaF+Fx+J66pcv2UbgFFBQXM+g6Z9957HINnevf7r1yunDT5gTH
         GVOi+DpDlTLIi2CQDL9jtyMVPC/zCRucCs8uooEfg3NVb8cJPOB6dWHo1/WYFg53bQmF
         DhmR9aTww1C8o5ILnuacBNSzH+ayCTbmmdcytf5G1JorehkCkFl+4KdCVbfdh2OB5toU
         obktSCp2b2+WWL4qUuX6dUb9EYnJjHC/Wo8GSFG/Er9gYc9C/4cXohDGsC6ve98NF7dM
         iovQd0NAnfdi8eLOk8QXO3Alopyd1mrqYAPJeXIzmwECPPfkCwdk6b0Vc6X709rY7fwN
         8f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vBuMj3PyI0yPPhDhtU8SVsYlIH9eI2FJhCNWdEtCVHQ=;
        b=caw/x9c23iiDwu4icqftOxSuuIoi/suK3bXrmZZYftomjzFlNx+BaK5QTA0eLkZO89
         XLI4Z8qryPJgJdtYNq76kwn0WeneZWiCUeUK3dUY36jO4rDdty814JPVifVSxWB2k3ss
         Jn6PiSD3KePJnOTSq8qBmgsKe7Pq+yp7wHBfwbtN36Pdxn03wJHj4xSU18XHJSAOktpN
         Nd1pzdIoHAMmN+mJIV80EahzgFqVWPzq/TQGxs73/gm+EN/xWqwLP3u3EqOgDiSKwt5Z
         kTqTwS1/6uevNCnSwZSpLV1MkveXoILFo7pL0tJwJGYpCWmnnGH4fTbj8kfzpXu8TuMF
         G7yQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ZacoLUGPCYqTH/yk38o2LzzhXRIg/Q4e338ZlF0vD2MiVp0U0
	olfDSpyBVCOwUVwiKZTy7uY=
X-Google-Smtp-Source: ABdhPJy8eQLdamoDfxCKEHNHPy58zTgLcCbiCcPjgq6cO52kTTxgLC10TusGyToTztxsSU4RlIkvQw==
X-Received: by 2002:a05:6638:1685:: with SMTP id f5mr31775141jat.48.1597234301757;
        Wed, 12 Aug 2020 05:11:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:9a0c:: with SMTP id b12ls289704jal.10.gmail; Wed, 12 Aug
 2020 05:11:41 -0700 (PDT)
X-Received: by 2002:a02:b610:: with SMTP id h16mr32094263jam.74.1597234301196;
        Wed, 12 Aug 2020 05:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597234301; cv=none;
        d=google.com; s=arc-20160816;
        b=tuG189zAvTyEMhQ7xKRBh4waYo6pQTSbZ4OX/1RA/XBYAIng3q5aXh/gK+8k3gOfxC
         0QyVAiEax+/BSYr7y5TF0zgqQ1olbT10OXBGUhDUi2NggSkOm4AWVne9OOdpKhfmirlB
         js/NLZUh32cTjKi4WQhCnFuDS2XQkRvBezzW6YoGOxLyCPHuzZBk87kyxnA7+ddYVC6P
         RTPifQQ9FuBfgDqhgofU+zD5nrveTtJZaC9DNLwPzV4ckYhd/J/ExbHIQNm9cEIhSPzx
         oALYc2rIZ36vN2m6mMiOJzYtsXLNKEyBgO8NOX5PZNhJY7ypt8F/+/kntykzG9FjDTIE
         tmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=sqsTY89VGxrq/fet8LsZSnEzbDPtqpi+wnKgpvf9pwg=;
        b=DtraznvlBflOHPmzM9cEAHXXRpYdBmrJY+UJdQHdOkwEZiY3Etm3gDe05wfx1s6fSu
         f+C5d5qezv/gW0QrGKkSNAOK9eRKcBcp58r0cjSsQlxcdHPEZQHA+PVB+AiJdTqCga81
         ntJx4O+H2ToJ/TIp+m6ZZLxkvEQeRhYparWgD2JSu3shqPhzZLubVUzKk1xTmwbiX/M7
         LqIGKjesA5PR+3COrooCcMNVPdw4O6itITjdX9AZZe0CzBGtuSYUEQTT00arzltSjHiE
         PtxqGrSBqWvcFxu2WJuZ5ESSHBFyHNexC4teFQ0ea/ZVkZ/66YMeNS7GgWAYiXzU0+eu
         /cJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jstrvgyx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-14.smtp.github.com (out-14.smtp.github.com. [192.30.254.197])
        by gmr-mx.google.com with ESMTPS id s189si164038ios.3.2020.08.12.05.11.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 05:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.197 as permitted sender) client-ip=192.30.254.197;
Received: from github-lowworker-1dbcc59.ash1-iad.github.net (github-lowworker-1dbcc59.ash1-iad.github.net [10.56.105.54])
	by smtp.github.com (Postfix) with ESMTP id A3E5B7A0D6B
	for <jailhouse-dev@googlegroups.com>; Wed, 12 Aug 2020 05:11:40 -0700 (PDT)
Date: Wed, 12 Aug 2020 05:11:40 -0700
From: Peng Fan <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/9b4efc-42b1f5@github.com>
Subject: [siemens/jailhouse] 42b1f5: imx8: add lpuart support
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=jstrvgyx;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.197 as
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
  Commit: 42b1f5a55e4e4c3ccce3eb915bc9c8c82c394860
      https://github.com/siemens/jailhouse/commit/42b1f5a55e4e4c3ccce3eb915bc9c8c82c394860
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-12 (Wed, 12 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm-common/dbg-write.c
    M hypervisor/arch/arm-common/include/asm/uart.h
    A hypervisor/arch/arm-common/uart-imx-lpuart.c
    M include/jailhouse/console.h
    M inmates/lib/arm-common/Makefile.lib
    A inmates/lib/arm-common/uart-imx-lpuart.c
    M inmates/lib/arm-common/uart.c

  Log Message:
  -----------
  imx8: add lpuart support

On i.MX8/8X family, there is only LPUART. So introduce lpuart support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/9b4efc-42b1f5%40github.com.
