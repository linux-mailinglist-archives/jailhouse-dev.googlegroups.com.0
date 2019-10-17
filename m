Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBRPSUHWQKGQEX57QOGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F7DAFF3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:23:02 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id 74sf1421766oie.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:23:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571322181; cv=pass;
        d=google.com; s=arc-20160816;
        b=lplxSdufuNA3gNFe+aMEWKoWD9gUo+MdxEuGLeNOnayez4QtNq92oIhW/NblcUJ+/V
         cfag+ZxgI4oP1kai7mRqVXzQFF3gExsRo52VwHuIkYECz5rxG9kElE6Qy5gxtuWpGbo1
         yurbwA4M4lVka3N4T5blNY3sJOxVx3VRKgnPCBjrNAlwtxMpwf5IsX3XSaqU1I8ZEbkW
         BbJnhPjLYYX/zgGn6fk5PEp9yNAOO8twWA3EjQvuVTAf2BUcPbnFoPkwi3jaX5ZYV8pV
         AfiURw72B8URbkVqj6jXPig1tfTTWoT+fvIzUjr3ivvcY8ayb9o++9zvainYQGTjPvVe
         2Oqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=9lV8oF76u5b4SbG7icrFY8NGnDF24GyOG0/TGFvTtjA=;
        b=qe+Pm8K79sYSMGJFXCt/lSOEOiVVWGb0I8S1nZEuwbS92yADNZtR7Q1D1G2l+osbAz
         ucGL5JtiLXq41DyVxvL5C06ZihiHb90FD+TDK9ny8JXM7hG+r6Yer54kNSH8XcBk5vey
         yboQIrNnuDIaaZBmFT82gMz7v00pjKVl563jr1Im/XucUde1LXGdJGqV5JTEIG/IoVOp
         gAGLS6l2MKygzEI7mpWn1BFPW4gFTOUhYVAEF0fUwjCvAIg+ZDJCl+ZL8mhYWtx8XgJx
         DXtWyzRDrxutDJiDqGw2QCTGL+jIDYIdrFxBgEHVlWU72xrzOlzVLPL99lDAp/I0im5b
         GgkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Bt5iC9aQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9lV8oF76u5b4SbG7icrFY8NGnDF24GyOG0/TGFvTtjA=;
        b=MApKEvIH6DvY5sEB2H+p1ycd/yXBzY5UAOovYSaGO3zXtflSxqvlBtZYHCLpcKEabM
         CjBl6T1OeAEZv4Wk1xqggfDeLEB1I6UXNL9tM7ocq0IVn5lOJbLn6RccutF/SPgu6vsS
         d8ocNzivwFcg+HkJjP1ZJOXkEGRSaZsFfLV5DDkQWKO9LP90C+m1ZS+1LhvTmTZxwb29
         gOW6zRVupJUaNSxSS76MPm6Nfclqc4ScbufAprj/bHXUqb+Fp/N5k4BzdLF3w1WJKHLT
         Y2fbSre9HgzExfYKrQ4nHRlWswOFP+T99ALDrEc0VAUbz6w3vJgdWoDZcNWiORvoFWt5
         PC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9lV8oF76u5b4SbG7icrFY8NGnDF24GyOG0/TGFvTtjA=;
        b=qqVJ3rx7bFoxvHU0vYo5C/XRVIEHYjVLYS4z7wpsbqJUR1cVpVhvzhVhRG/enesOlA
         A+UgtVKAxpjkPRTmfcF4tyH36G0Z+x1GRNUe4JGN3Ytq7Opb9OqnAYV6PPhC/I0CNreS
         zwYSxuqureGCKrxuIVMNB5FnOIshWsw+pgPhIBHrOcCRSgWGkcB4oInY7Sv5sUT9/fWz
         nDCvZTGL9S0yY4qVnC37jPUPAEUy+SJO3LLTdyg3S18fUaomXZ7XMY0be8Gul1+akXE7
         ES/dW2ewGQfoDR8FyClrdZPQxgSzLBVw5Efp01DymZbniVDrc7NU+yUGFZR5v8XwZlYL
         itXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWKh/2cY9R21bgUijx/vjehgbOmfFUV5aFr68+by35O8ldYI29D
	jyDb231U6ySjeKTDJzvbecA=
X-Google-Smtp-Source: APXvYqxE2kQJoDn5U5ENePQ0wWM9H6r3FQ0i0JeiDXcEblwtETnbCDUPT90irNJgyNUixeXUuzmp3A==
X-Received: by 2002:a05:6808:255:: with SMTP id m21mr3494804oie.32.1571322181255;
        Thu, 17 Oct 2019 07:23:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6acc:: with SMTP id m12ls477422otq.4.gmail; Thu, 17 Oct
 2019 07:23:00 -0700 (PDT)
X-Received: by 2002:a05:6830:1253:: with SMTP id s19mr3342385otp.111.1571322180774;
        Thu, 17 Oct 2019 07:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571322180; cv=none;
        d=google.com; s=arc-20160816;
        b=WGpyxDRAq3qzHcbLhKXwu982/lbeKdAPbMFo+oRMNNm0XCY28J6YVl+LlYwiEZCmCZ
         NfKNMsdmZtaf9FvvwxZHYcHF+0zCx6qq4BeVvPq3uyTtrZeqdxxl8y1ET+tbPW5qUnHh
         MnKin6TqUpa/sQlS6v+tXS3j4wms0Bv4jgtYfVPIg1UIFA2BX6Bomy9a/qIrswXE4Un4
         VDiyxIMufGWHtB5V+aNdco6A8Btezh7WWOb4Dd/vG3+O105xgEXW4lxHSVQTc4xH4ph+
         ZIKcOI5uRYIaEcNlAACC8/jCWo3SncMkp1mbDUXSEeZyfp4C5Zn8riTjlq5qz0BAsUiQ
         vfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=QOPuXJh44wS4YBAjFknTd+8ptRilJ6eDyO/PCoKxQbU=;
        b=EgyS4vDQzqqs4SAbYpMWJsXefyIPC9ax6m1AQokMblhYBDEl2K0YDZIgln+PJWggrI
         6DpdONCYVQ/98gMv+OFeQ96lanw9oDuW7qPt7GGgu43pjweCli0V9Uya+uy0QpRSQBaN
         3RPvUn8kA7XVwSSp0hSrs3U57T3Y6dSE0tVzRniHm0a6cHS8zpR7TxeeZHuX/3G6ka+Z
         xkIc7GdTC7xAxcq6hIbvyS0HfJcVFLKj5yizm0ppXFc0GOMufIWDY2mhSwDD9bYo0EXm
         EKJYIHeCpcQtQdI45GgyH4DpZlqraDx1+02pGXkgwdoDn/vW11mpNMLonFzxLy6/3qbm
         OTMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Bt5iC9aQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id c136si200587oib.4.2019.10.17.07.23.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:23:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Received: from github-lowworker-d93c4b6.va3-iad.github.net (github-lowworker-d93c4b6.va3-iad.github.net [10.48.17.47])
	by smtp.github.com (Postfix) with ESMTP id 5B4041C05DD
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 07:23:00 -0700 (PDT)
Date: Thu, 17 Oct 2019 07:23:00 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6feb43-a179d0@github.com>
Subject: [siemens/jailhouse] bcce37: pyjailhouse: sysfs_parser: Avoid len() ==
 0 like c...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Bt5iC9aQ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.193 as
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


Compare: https://github.com/siemens/jailhouse/compare/6feb4398b561...a179d0791797

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6feb43-a179d0%40github.com.
