Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBS4L42DQMGQEP6NFY5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3a.google.com (mail-oo1-xc3a.google.com [IPv6:2607:f8b0:4864:20::c3a])
	by mail.lfdr.de (Postfix) with ESMTPS id E91233D2630
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 16:50:53 +0200 (CEST)
Received: by mail-oo1-xc3a.google.com with SMTP id t24-20020a4ac8980000b029025fd0948c41sf2102907ooq.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 07:50:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626965452; cv=pass;
        d=google.com; s=arc-20160816;
        b=mlb9JgKwIRgOuYQSXJKHyaCuzXPYDqSa+tbAUbpYC97/9Kco/F/ThNjAslOwtS5fAu
         lltXGJ0fX75eLit/m/p7cNHZdLAs2Q0YU/YPTP97PMzvMUu1n0D/AeevtrpcquZ6+YC1
         fzk/Uqn5W7xDi6oWz+7gRTygcKoFTAn+uU/BQaoqVgifwh4RMjWCeHumJ6lYlKXTXlPA
         t+OdBxIi5Ud14qG3WvcwlCsN3wXryAw4NzHNTH9EcsLEtPhIOecqvATFdLV3UH5fM0PC
         bRjnwnp72yqVhE0o884oiTD/NuL2lvickhHkgEu6bNqKc84Py4Z3JRdxgsIYTKBnjpz2
         ubPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=tyXUVLhzJK7b688tLCVstz0m+aIEeaZcGFCMXO++5oc=;
        b=xKXJ82nygkkhPW+yw5JGGF+LL43D+uGAqee7NEoo8V5/EfM5O2NzzfJh9B1wkGYt2C
         DA5jBku6EXqz5rqtsH0jSbgz3hatUNSrx5QtFmDFWusUdyQJp21LuuHjhGmKreTGMKsb
         wnpWBPokfJEDbVFo4USQWUkCz4utP0f0HbQZDL8CEa5vsdX/yKGvqAZNV+RxNIAN0xaS
         9cbWDoocWnjYxX/+dwQzY58qySYWGBrAsRF+G/cO8E9QIGkhyi6Jl1LjiK5zEil+VEv2
         mRWms4pK+6IkuQH1ZREkX6p4UVyv1LBLRrhvtYW6CmtZMgLm4DvSN6amb3HYwG9/GJbp
         wiRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=BaRY5xEU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=tyXUVLhzJK7b688tLCVstz0m+aIEeaZcGFCMXO++5oc=;
        b=W5kd0AxKMjm/IEao9mC5FenE9AsmeZ5M2iLIjc8qpVvBb3E5HSDKkQ5Gtfkcqu6sXc
         eQPbQlMm5qHpN7UnYIIvWGBYMm8Uc7mj/muKe5DH8et0ma+znsRuLEin6AGfvlQw0re8
         1tJ0phMTwjBz43NN+cUOuX119xVHa1YU1BlS/z+h0GS8sAClZcIDBV+nq8Wsmnc4+vZZ
         e852jAVlnqgn5Dt8GwfWmVuLqf1BrS4nmCw2hO53lptep6dUemhjkfEUrKjJxDbeGNm7
         1Dl3qtUxO0zIvhe19nKnGGzNYW+BGTMI18KwMM0r7Q+/y2kBu58wzDUTpzM+jOYhLXgX
         fA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tyXUVLhzJK7b688tLCVstz0m+aIEeaZcGFCMXO++5oc=;
        b=HjbO5o9oMgetVAoqtfqhk9RQ5GgaN8phFOytO+5dqkJ8PE2ic7PE7PpqzdnvVyxhb3
         ZhV1SPrnahLyuyBc3AVg+DSucfxXi/l+le7N7oDy2lsrPtqERubquYEXffofjOCJCnRF
         px7SY1G89zrtyWxc4MDJhj0bIo4hy3HZXu6tPZtoGEoIQAHZFyx511mKEBKPyRS4QFVn
         VE/ziH5YdgpqBO/mDCbij2LDgCZtoIMrytvPTL++vd6QjWub95N0AeF/vaNzsdQZWVSy
         qG1Rr9hSqFfSIhVzBEzQU4OCFdf6ZCCh/1EK/AE9gcwjqwptdOv+s1Lde8VI6XiVyeDV
         EanA==
X-Gm-Message-State: AOAM5324l2DUGdFDlOT4MgYRFRj5rzQSOMdspnz+0WbFcUp/tJa1aRIj
	LqsrTANxg+5lO/R7MrC/mFw=
X-Google-Smtp-Source: ABdhPJytJyRLOH/R+MVvb1RIjodSIHZMQWwSSvGwtRbcpcGKhB3L7+OCqUIrn/xf1PTRwx8fFPExnA==
X-Received: by 2002:a05:6808:1388:: with SMTP id c8mr5920394oiw.17.1626965451631;
        Thu, 22 Jul 2021 07:50:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:49ce:: with SMTP id w197ls1982686oia.8.gmail; Thu, 22
 Jul 2021 07:50:51 -0700 (PDT)
X-Received: by 2002:a05:6808:1508:: with SMTP id u8mr282441oiw.170.1626965450935;
        Thu, 22 Jul 2021 07:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626965450; cv=none;
        d=google.com; s=arc-20160816;
        b=J2u2/E58yLKN1bwfxslRoHjCDcu/sFFW6fO2+UOMyPX7TaZMVy5uSTelr+SOnyFOzM
         CephSjQepRQcOa8ujQRCaePDpOPaAWSqG4Ft6FNW83sJJs/3aK9PamN9m3svh0GIEQ/h
         iW+CX8D1PcooC0TyPNf8s9VwdideXlyn1CaNAmDy7RbDXDB0c7+NrLGzogBFRwHIm+ni
         zHTo89IJ+A8m0fyabdpf0cWJgfZs/0h7rG31tTH7Yucs32D7DzXOTpC+wuVTxRqmbp6m
         HRjwk3PK3a3AbxrI2eZCvPSXElXxBEjL0+sAOIadXwprmfUruOANeEAzwB8Gs6FNBzQq
         Zc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=SNzsD6rDo7CELWMJZNSbpdWbeA6N2ZXtzK8rwNrGNGg=;
        b=v+8Y0WwUYAB5ZW6hAvMuL8OuLVCK9J/Y8gL/TySmt/CFpbXNw/6XJcZySy4XFpzcSD
         XA4SmheGgjlO7d4uWYC03ZxKmtF5dvXtS1xP/T/CsnjYcm7lZfCg1xNCA6SdaDb4rJWH
         Bc94twycqgcbvhgF/83n2O4WlmcZrUBKu61W2uDUbw67W/U3RHKOWHmo5ngZ8pZYSVyj
         q8QERPUcXBBOKev2rAmC+Cf/m1YqhY6ua/J24gI+rQQJkJ79dUNIrIGiosqeStNFo8oC
         Ye2i6l13r6uyyNSvbzhZMnMDuJQB9muH+i4o/c0+LAJqAUIq6bpb/ChzOibtJLDF7QD8
         GtxQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=BaRY5xEU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id j26si4283214ooj.0.2021.07.22.07.50.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 07:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github.com (hubbernetes-node-be33fe0.va3-iad.github.net [10.48.205.58])
	by smtp.github.com (Postfix) with ESMTPA id 800A7340764
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Jul 2021 07:50:50 -0700 (PDT)
Date: Thu, 22 Jul 2021 07:50:50 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/e0ba79-630001@github.com>
Subject: [siemens/jailhouse] 6d9c51: pyjailhouse: sysfs_parser: Make sure to
 include VG...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=BaRY5xEU;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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
  Commit: 6d9c51d0bd819689c00f6a3c38d3099f6eb9c657
      https://github.com/siemens/jailhouse/commit/6d9c51d0bd819689c00f6a3c38d3099f6eb9c657
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-05-21 (Fri, 21 May 2021)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Make sure to include VGA MMIO region

The VGA region may be listed under "VGA Bus 0000:00" for built-in GPUs.
That currently triggers the filtering rule "no empty buses" - which is
actually not true in this case. Make sure we add that region
nevertheless.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1fdaf40c11ebe09053b49f412f54a0a7f41de1b9
      https://github.com/siemens/jailhouse/commit/1fdaf40c11ebe09053b49f412f54a0a7f41de1b9
  Author: Dongjiu Geng <gengdongjiu1@gmail.com>
  Date:   2021-06-10 (Thu, 10 Jun 2021)

  Changed paths:
    M hypervisor/include/jailhouse/paging.h

  Log Message:
  -----------
  paging: correct a comment to bitmap of used pages

The used_bitmap member in struct page_pool is a base address,
so correct the comment to make it is easily understood.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9a493890c09c618ab21f3f8579a6dd1fd1ac086f
      https://github.com/siemens/jailhouse/commit/9a493890c09c618ab21f3f8579a6dd1fd1ac086f
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M scripts/include.mk
    M tools/Makefile

  Log Message:
  -----------
  Makefile: Update build dependency from python to python3

Some distributions are about to switch to Python 3 support only.
This means that /usr/bin/python, which is Python 2, is not available
anymore. Hence, switch scripts to use Python 3 explicitly.

Not that the PYTHON3 variable might be defined by the Makefile in
KDIR already, so depending on which make target is being called it
might be defined already.

Upstream kernel has the PYTHON3 variable for some time and is now
going to move away from pyhton2 as well.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a2aed84fe918c3c6ca5e60db29aaef6751c76772
      https://github.com/siemens/jailhouse/commit/a2aed84fe918c3c6ca5e60db29aaef6751c76772
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M scripts/arm64-parsedump.py
    M tools/jailhouse-cell-linux
    M tools/jailhouse-cell-stats
    M tools/jailhouse-config-check
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: Update shebang from python to python3

On Debian 11 systems /usr/bin/python will no longer exist due to the
deprecation of Python 2. According to [1] the unversioned python
packages must not be used as build dependencies, dependencies,
recommendations or suggestions. So moving to the versioned python3 seems
the only remaining option.

[1] https://www.debian.org/doc/packaging-manuals/python-policy/#unversioned-python-commands

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fb37d16f7f9df172877fc76631e4fccefceda29c
      https://github.com/siemens/jailhouse/commit/fb37d16f7f9df172877fc76631e4fccefceda29c
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M pyjailhouse/config_parser.py
    M pyjailhouse/extendedenum.py
    M pyjailhouse/sysfs_parser.py
    M scripts/arm64-parsedump.py
    M tools/jailhouse-cell-linux
    M tools/jailhouse-cell-stats
    M tools/jailhouse-config-check
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools/scripts: Remove python2 specific code

We are now calling python3 via shebang, so no need to care about
python2 anymore.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 85aa7b0f1755d966c953b9c2ce9e2858df6b01f9
      https://github.com/siemens/jailhouse/commit/85aa7b0f1755d966c953b9c2ce9e2858df6b01f9
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M CONTRIBUTING.md
    M Documentation/setup-on-banana-pi-arm-board.md

  Log Message:
  -----------
  doc: Migrate docs from python 2 to python 3

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 630001202caec85370fb4f956e581f51109e490c
      https://github.com/siemens/jailhouse/commit/630001202caec85370fb4f956e581f51109e490c
  Author: Dongjiu Geng <gengdongjiu1@gmail.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  irqchip: Avoid set irq target twice for root cell

When enable hypervisor, it is no need to set irq
target twice for root cell, otherwise it will waste time.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/e0ba79023af9...630001202cae

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/e0ba79-630001%40github.com.
