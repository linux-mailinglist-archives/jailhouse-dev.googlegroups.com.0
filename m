Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBFOBYL2AKGQEFJ5LILY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069F1A488D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Apr 2020 18:36:39 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 84sf3226449ybz.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Apr 2020 09:36:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586536598; cv=pass;
        d=google.com; s=arc-20160816;
        b=G0Dv/G/HpTQhPYUg6ynqLESobQH0EWjcxvDbv5SG9qQHQppLWswpkAxSRGqeWIMdnH
         pZda9BgMNPebqU9LT4iKWpyhTXEZd4KHp6jpyLaP5KuRcgabA7LKIdGp8ujxLdTe3u2o
         x15mWl6HcbEIyeZejL4iE/JQ9mbKbIkkkZbJ62Ib0rnPQub5dz3uKB3YmsdY7VnAFF25
         pfcOrmwU1k7gDxoHnlJsGN8bjj/C2Oi5WW/5gbvj/4a+avG4Z/LXunRZAMQI609mKj6Q
         KLYgPyCYgqVdY3jFmFUJ6bpn1RIzTqpPqAvq9P8PZLEJo2I/mplGPkh6U7Ui4+pY0AQx
         RocA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=8Slt75qaNKj7SsWOeT5aIFZGmct1P5XhRVgSVp24BKo=;
        b=ZZSkRY/Fpcrj5JvvCpRpO0+fuuPxmqKzHHLzjzFCd7TdHlsE1KwBeK72hp++qyCSGZ
         vrL9ePrhHLEemuvbl4/UfQuIxtvX0Yz+nAZZSfMx8NymaTmmMb6nA+z53GK3ljI3mVfV
         I/4egOdl3hnhmagY3bLWEMuF5wYAh4V5vFFKJ5RCwa/JvKOH8aD2DxIa/kA478VN18qm
         73eq1cytbQqPW7ADTCyRrlXajn+ADKLuvkcRy9WAF1hCYENR433zqfk61ig4mQRKVXa2
         Il0RRnHxZ/XxvVeELXgnPEFWNkuRYY1tqurYeE6GeOtLPsiU4UjvtweAVJAo3q6Z5Hx6
         8T9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ZQn1++7t;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8Slt75qaNKj7SsWOeT5aIFZGmct1P5XhRVgSVp24BKo=;
        b=KzNi3Kg/T1sqJsiVQaFHVefNdZ6mftYegE+m7Ck0udixfZjf0Fyy7n+2w4kHd1VYGj
         AbTPteuaL9XzfFOASpggMapKiXe9/g+HeP+R5HjrvCT4Mj/dHIwOZqs89KJgjq/cLcKY
         xUWv0HrYG/FvgyRKbK4F7f9J8wq0ETf2rRYfyHq6700IC6qKJQdLEK0Mcy25O5FJPXJI
         xCdLOoxo3ko0o9YF4FH/E3xzG0QJjPWiwb+PPc+98zcC+8xj7LugEuKuJnfA6gcoL2f2
         3kIpoS+kExgQljUE+SuNUIacRTwX6v2co5OgfTeUFtvr7uqUvBArHxjrPsH2ma6ATLp/
         cBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8Slt75qaNKj7SsWOeT5aIFZGmct1P5XhRVgSVp24BKo=;
        b=qEePwMi5uhpCzlzPedDth1JQPJA72LnRj4hNaSyZRrGB+4mLdIXjSEdafJpS7dUBUi
         5DkwDY3jDPz6oVVeKV8FITwpU2We88AoPMqx2DD22ur/rIuJ7bTfzNvY/E0gfMAJoqAC
         DajgqthORBFbl6HMtKPMziyAhcjLqKo2SXfqxsVmbyrbmpJWf8RJ+c4UpTJSi1EI41GY
         TaoWRCehuEjoo7foIfBwjKQvFCg+CqnFnK3rGkL/U4pJpLkGlKQ7sfLBtaVcgjYzgxNl
         5gGh2N3WQUqiPbVtksZ0klNfKU2v/h6xfmPpgsqqPYo6DAneI5ZHHdyytqo9mDKlO5Lx
         ElWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubXSoKaJs1NBguIOwp69RBwX0LPsHI5TL13XG1fCSSyh8Tkn680
	RGozRMxz1XMCqmcQEoqRag0=
X-Google-Smtp-Source: APiQypIhVMLEDjVBHobYdHHKxVFp6NmsZymlA2wnKgdXjfN4cZSFOWqOwESaye/0Wvy61DiY74uYWg==
X-Received: by 2002:a25:9783:: with SMTP id i3mr8942821ybo.227.1586536598237;
        Fri, 10 Apr 2020 09:36:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2ace:: with SMTP id q197ls5767626ybq.1.gmail; Fri, 10
 Apr 2020 09:36:37 -0700 (PDT)
X-Received: by 2002:a6b:f305:: with SMTP id m5mr5094941ioh.44.1586536597585;
        Fri, 10 Apr 2020 09:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586536597; cv=none;
        d=google.com; s=arc-20160816;
        b=jNcfby720Etj0ep8gnOml4jmuUfvT57QRh9QJ2Y1rBLPGjXrffl3e9OK+PCQvAVMv7
         2+IMjGT21sSK6BdNzyKmIL5cMxNnW6+47RiyAM2QK23hYH+I79RLmSrH/p4M+hytMaSH
         Cc9zYy4ib6EDnibC5Vu889NR9yXCsMiY8jz96q52e4WWc1vFz2Oukn9r4TQCzrjChCd5
         7Fmot8pjy36tE0cyplj0gh+Y7ffOjvxV1ihnxiGsfckiFVXLdQaKBnfv+jL/18A7QMBG
         I287ho302lwXBtGTryiVmPSIRiujpaFcHHCIqKMC0Nqf3q5JD49+5PAP1BLerSGaWjvT
         8Vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=E4cM6zcLd5lhldBzNMTaiAAKP5MiqsfAxMFfH0npIp4=;
        b=tyJ51GGBj979SeggB8Rtk6AwR35VniHzo9AwE89HamusDkzp0781/9UiD00236MPLt
         +NBDQOpahQUHN2fQvmvJN/7j16WoKxYHikivRSqzho0cVVH9PI4gBRsRKM7h5mOcFgV2
         2qy9FSAIqfu4E0jxOSB81Q43vkyHGVTfsBBa8APoU4jDyPIbocV2x4Uof59/nV2xNsQU
         sZnJjDgeEBbQuvWT806QapoYs5zmud4DhyCsw6LYrutlbPlInDYYyui4SWtpcPKLA8E5
         lSLsQz1MmgH2XISXL1eB6kSH8EC8MVHE5jau7Oqht+wq8X9yBwyYIot5znxdFj5QJx7Q
         FnVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ZQn1++7t;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id t125si263817iof.4.2020.04.10.09.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2020 09:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github-lowworker-d93c4b6.va3-iad.github.net (github-lowworker-d93c4b6.va3-iad.github.net [10.48.17.47])
	by smtp.github.com (Postfix) with ESMTP id 2465B6E043F
	for <jailhouse-dev@googlegroups.com>; Fri, 10 Apr 2020 09:36:37 -0700 (PDT)
Date: Fri, 10 Apr 2020 09:36:37 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/7fe071-ccc44a@github.com>
Subject: [siemens/jailhouse] cfe4d6: Cell configs for imx8mn EVK board.
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ZQn1++7t;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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
  Commit: cfe4d650a8560a588a2bbe29ee979f5e7e9a3c9e
      https://github.com/siemens/jailhouse/commit/cfe4d650a8560a588a2bbe29ee979f5e7e9a3c9e
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-10 (Fri, 10 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mn-inmate-demo.c
    A configs/arm64/imx8mn-linux-demo.c
    A configs/arm64/imx8mn.c

  Log Message:
  -----------
  Cell configs for imx8mn EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ccc44a81d8d8a3b56e9e22d5916cc80ca4700a28
      https://github.com/siemens/jailhouse/commit/ccc44a81d8d8a3b56e9e22d5916cc80ca4700a28
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-10 (Fri, 10 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mp-inmate-demo.c
    A configs/arm64/imx8mp-linux-demo.c
    A configs/arm64/imx8mp.c

  Log Message:
  -----------
  Cell configs for imx8mp EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/7fe071b70665...ccc44a81d8d8

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/7fe071-ccc44a%40github.com.
