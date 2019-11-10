Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBNV2T7XAKGQE3OGJMGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc38.google.com (mail-yw1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F196F6841
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Nov 2019 10:49:44 +0100 (CET)
Received: by mail-yw1-xc38.google.com with SMTP id j3sf9127207ywg.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Nov 2019 01:49:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573379383; cv=pass;
        d=google.com; s=arc-20160816;
        b=rpdxqsEquzAb67qBOT9jhfCGxQ7mZ5orLDDjYocp6Sq+bsnkv9l1gxTkioSdK8Y0Bj
         U5qa2+MURoY2XDcpd3c4vdxMEvItyf/vaYe0WHwObtYF9cI4KEs0AkcZIgkVuGPqbVXD
         cn9QnqywCpGIrLOJ1zypczd9dpQQrH/c9JsR97y7lN0+q2HRl9Cbl3fbTVUIyHAa6nMT
         cJXAnRAPyi9WjmGwJakrUq1qzg3vGP2X7ZufYfWQmi9o9K+eLeOiVoQ2NAyvslyPXp8R
         OjcT5NhD/k5tXWzQAUHMkwbzun/oS1uJIjpSLIPtk1DoH9kFN36dESHtRHIAbpfGUdTN
         nVog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=YIcJDGjahHfdm3KrV6j+ERkh9i0VEisKmiiJ8dAmXlg=;
        b=u/IecVgfIvATC8ZgRBZ8CCeE5j18HKvqBxfSjDDW/inJl9dBLqzTW4Cjp6zk/JQnh3
         hRkNhTudLIC3z+Cv5hUz9+e1Tqd2CHb2rxtYCx29dq7GLnSWiYr/OZ7Le1FdL8TsG3vR
         EpCofewaiFqZNZ/JQHjGTQw14w+hej6wYvTa6QAibjB38qH0b+ccJl8wFiQJVCkUWTWd
         4CvnaZC7Hg0mkWUShDSBM8r/kyuh4Ie9ga2TqFD1pVekDDH8srVc31TJbNedwEZVCCWV
         jSVlkeFqaa/7zz/kS4wV1OncNe8lTgiFrsnZC05L7GIaO9SfI3YOZ0mj1Xe4S5aptaJd
         T56w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Tm24StgI;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YIcJDGjahHfdm3KrV6j+ERkh9i0VEisKmiiJ8dAmXlg=;
        b=rjvS8mkC0CrPommN6MuP0Oj0uwErZT1zDBYmPDPYSW/dUcySCR/qHzjo51yHsCgsNV
         7jMC1fG846H3gsTA8/DZq608mBlp6wD8ekIkHdOiEvf0HABtZIGOtPrWFLe93rnkItq/
         67qSwhEkS50pBOACFeXBWZP+2ZU1y4I2yxDkyWZV8Nuq6NzZ0xV3R7Fz4KHzb4jWoOJh
         qcT7nPnX+NIckSjD1QgiDrezyiizIq6XQ4p7cpy2obkmL8SXsqqhNOuX4sTJZXsiLR0N
         k/cZm7OP4wNX9Dz1VjVxVlUjngRUd5xgaCrigsnpFbeZMGq5Hw+BLMMZOxd+C/vNmvJ4
         Mq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YIcJDGjahHfdm3KrV6j+ERkh9i0VEisKmiiJ8dAmXlg=;
        b=IeedxKIjRpG9r/ONqYQpx3uo5f+quWWc1VhUwc4RUNuwpaqrttls8Pdgy6BNWAIEfS
         HEE87hxlF8OyC+IGKYwWUl4e5gawNq1AVQUVEuu2avOCzZGeonaO5ragNRINPCwhnhWi
         b0JjTGI4yqupRZo1spU3Pm4k7D+uymDqWF9WZLoiXncjcmWMEIVnceismQ7XaS26sSsM
         xsgU9g4Ee8gTKyHk0QEEWmOZ0KVvSSpZ7VHsgU/f4PHjSOTEU/itI2TkwfIgKmzLu5w+
         ZeMiwUi6ZHDJZ5M7a1IurGaz/XU6hSqBpiDrbhfkFM70Zt8ZLSjFtU5OMDWmeEQ6o3ji
         c+6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUPqJ4VA+4CdzEzzXHJF7vJ26FSBW2HJT7Fz858fn9FVQoymHJA
	uVeNPrQ6xiVPvczojiRWhCU=
X-Google-Smtp-Source: APXvYqyFkLExryYKdS+HidqTXJ6HVdDdca4olwndS+MEHmqcVw2WoIlghzMWbVQBcmsBsoODbdrtCA==
X-Received: by 2002:a81:88c4:: with SMTP id y187mr13133277ywf.250.1573379383000;
        Sun, 10 Nov 2019 01:49:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7903:: with SMTP id u3ls2799718ybc.15.gmail; Sun, 10 Nov
 2019 01:49:42 -0800 (PST)
X-Received: by 2002:a25:4258:: with SMTP id p85mr16646683yba.417.1573379382276;
        Sun, 10 Nov 2019 01:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573379382; cv=none;
        d=google.com; s=arc-20160816;
        b=TJ17smM6IaHriJP5lOubhZ19jwb/43HjwZ0LrPHOF6aUruBykcNnl4YfRbYARUSC3w
         obL/N1LFf1Hd0hY6ycg87oNl13rN71HTmMzDdmKm23h2oPMNC20l4C2t4BgMDm0WEYEJ
         B7e974rmglHaFdO7h5eCq9kJoC/0InqX+4C2OM7g4kJ7CopY5m7OQz3XweS8JakUnymL
         qAJ+GpUDlhP3NsDsV8M5xx2U76Siz88GmjX8hRXnP2My6147WTVkOLku4u13AnqDI3zs
         tz4ELhwq1ArsC1l1IoOWMKtvHKLWOVwApPSCkQwz/fo80DHb2Mnzv3eWtPwRvRJpe4yV
         s3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=XtFfqf7csqeJlPQM4Re/uEykJLqE4j5dQxoCcCqkctg=;
        b=CXoy82HS/fvm13febPa7TqG2J7YknS1rj2FlVkULMvMlBs+ekKyHgDnmJo++00cPZX
         kOnJzzgKZH0VFQEClmGvlzjPVzO9EThiyE5EIo8wr2dCJ/PbK0KHLk9lLU7VdF/i6JoC
         UcuKjpxzwdhBmMUaHzqZnOkC5I22GDt4kjzPrnqAym2qU1O8m/ZobkCRvmd8v55I6gHf
         e91LMBnlecB0ModPPKGZnWFnwJFRKou2G/9XQk4XPxdRRXaywZwBCQdDR6fzuPIutLz7
         wpvQVKSJVblO0PDDmifcRL11EwMHqvNQJwoJElfjxEdnaku1auAwRdbojoY702tiNYQK
         15Fw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Tm24StgI;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id u8si429858ybc.2.2019.11.10.01.49.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Nov 2019 01:49:42 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-2300405.va3-iad.github.net (github-lowworker-2300405.va3-iad.github.net [10.48.17.39])
	by smtp.github.com (Postfix) with ESMTP id 0B8365200AE
	for <jailhouse-dev@googlegroups.com>; Sun, 10 Nov 2019 01:49:42 -0800 (PST)
Date: Sun, 10 Nov 2019 01:49:41 -0800
From: Fabrice Fontaine <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/bac03e-45c1fe@github.com>
Subject: [siemens/jailhouse] a22a8d: README: Update x86 qemu command lines
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Tm24StgI;       spf=pass
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: a22a8d84d20ecfe506b89a7f4019acb3febf8fa3
      https://github.com/siemens/jailhouse/commit/a22a8d84d20ecfe506b89a7f4019acb3febf8fa3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-08 (Fri, 08 Nov 2019)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README: Update x86 qemu command lines

With the next QEMU release, VMX CPU features will no longer be passed
through from the host when using kvm64 as CPU. Rather use "host" as
model and ensure that incompatible PV features are off.

Use this chance to align the AMD command line, turning off some
additional PV feature.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 45c1fe05159bb2e44e962b466ab8207f0a91606e
      https://github.com/siemens/jailhouse/commit/45c1fe05159bb2e44e962b466ab8207f0a91606e
  Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  Date:   2019-11-10 (Sun, 10 Nov 2019)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools/Makefile: fix install of jailhouse-config-collect

Since commit 37bc6c12a1b365250c0dcdd82ae1ac5a869898e1,
jailhouse-config-collect is not installed anymore on target as HELPERS
is updated after install-libexec target so fix this mistake

Fixes: 37bc6c12a1b3 ("tools: Allow to build jailhouse-config-collect independent of PYTHON_PIP_USABLE")
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Jan: always initialize HELPERS]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/bac03e4d5f54...45c1fe05159b

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/bac03e-45c1fe%40github.com.
