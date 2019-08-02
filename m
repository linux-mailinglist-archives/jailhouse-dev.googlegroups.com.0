Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBFHCSHVAKGQEJ3CQGIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53c.google.com (mail-pg1-x53c.google.com [IPv6:2607:f8b0:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id E49447FF73
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 19:21:25 +0200 (CEST)
Received: by mail-pg1-x53c.google.com with SMTP id u1sf47847646pgr.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 10:21:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564766484; cv=pass;
        d=google.com; s=arc-20160816;
        b=C+x47RLLWD88EMIwBe774ltqitNPv97mYCPnhfgRWNP+4tgBgRVrAyktE9GQ2Fv0hK
         kBXUdpk6yEkdL+aq7/CM1p3NBwx/rUOPCY9QhWVNaBUCrEFe9bs9XyrrK1BNQGNSlWfS
         808NfNN8/7uPGhQaXDmdpt/ieVC8LXfjSZy6h0W8NKbiDwIlwBIvU+UAXX2JrY7PZmU5
         DJghGc/Zusrl4OpsVJFiRbCYeroBwQQQWdx6finS0PYWdTb2cIGE+Li4GSCe2OOq/h1S
         Z91sm2JurSyM971jrY5dz5Dy5khSSmQlneri+ZEDF8WpOF23pVFQrrsY6qCsznsZ7swT
         b+kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=PMiyg7U3wUN+a6tO0wg5/8W028prL5QZWBaEm27/yH8=;
        b=O1MaehjdLtmGZr8JwNt5MGCanLtf/t6s5ueH/JcwtRBjwp2An96GSxSWu0Hx+dtrMZ
         j150tiskW20gwL91PkDUwOP9PrR5riVpCwA/que2stRL6dLYwCvabB9MDCD1+cThXep2
         NUEVZ36mXSJQ6Si7CqIUzHjpcFFRJpLwgJDVGnR1xMzqrymEgIcVMw5tbyg0Z/p+1QcG
         Lgk2v5I1OiWjBmXGP2K330ArstVaM0lilkebL3NNQYHMPAFOFyWXWMmI8U7EGxdMJpve
         9AqhO0Ue4jbFaefgCyeadbjVr+Jp70tszZlORxRmUl8ZIMZDeW4oq/cKX7ADkVkUIdYi
         vCpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=t05UptXZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PMiyg7U3wUN+a6tO0wg5/8W028prL5QZWBaEm27/yH8=;
        b=FIoIP1OAjUhihgit/x5Xe7PiJ/GTLwrAP43Eijr1ePnN2rtVyd0det/eYWcNV3Zp0E
         F6nvRUA7o1Nxy8jIi5/ke6mF7G9XHOhOob+2F0U7mVwRDtrRmK44REdmTg4ZpuPLtOAQ
         d1iAZ/nYUXJn5lMWEMupon07iWXQ6fX0HyHmQUp7VN1bUjrjQ2RunUZZOYMevYcNdkhW
         rGRF4FHJ6bheYOnkaVfaWRS4zozJBB05pyN6Atpbei7ZmBX/n0BL5rwok1aJOSq5TGTo
         zHvr7b81kX9SgSTK4rgGql2WwIjMI5rU/1MLZRfYYeTheI8uerVDgHCTyg+ue5DC0PMu
         KBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PMiyg7U3wUN+a6tO0wg5/8W028prL5QZWBaEm27/yH8=;
        b=iqBBtXCATaAeG6svznTq7VSxa7N/ls+T7bG/9Ei8112DlaSf3f/wvWFrfYrcppZEsi
         73NRRCwS33XgDUo/DImICvKQvmB6+DY0Lb2xDgbCrM3+oooIi+ru3pkTBE7kfFH5kt1j
         +CQT4377JgsOrXFFJ7eqgnOlqOQsYmQSh1BX3ZDJ0+frsu+xEi+O/Kp2W7EEryl8x3ny
         l/X7DWBQm5QO5Bq47smrst8e/EWqpwYMe/KqtREcgST9Sjk3d0c+b0WDlUuB8MACOCRw
         fLMfWsXrCB+rT+FrnownApz7aKOAPqNx4xiT21TMMv5vH/sIl5EAVpLgu5dF55wxFKZI
         6pLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGFW7+r+sA40cx3uz5ty8Gj/CIYpR0fZNWpLdWxyQ9JCNU6nMm
	4DhtIaneFwT0GJ9Nfzswzj8=
X-Google-Smtp-Source: APXvYqwKNGDn6OrVa2XWHzLwJawNeaL3Gh5YWJciyNgIobecdod0kIcnS7p1pEZfd9AJ2IzgqWaBNw==
X-Received: by 2002:a63:c203:: with SMTP id b3mr126711872pgd.450.1564766484181;
        Fri, 02 Aug 2019 10:21:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b48c:: with SMTP id y12ls21778030plr.4.gmail; Fri,
 02 Aug 2019 10:21:23 -0700 (PDT)
X-Received: by 2002:a17:902:9a49:: with SMTP id x9mr133642434plv.282.1564766483734;
        Fri, 02 Aug 2019 10:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564766483; cv=none;
        d=google.com; s=arc-20160816;
        b=JTkA/YG6hOyO7iGRdAjG8MpxkpL2GkHPxGa8dPWNOKG1PR88r6KCHQY72KxML/AdUc
         fKhUBccTAtbDNL/6VTNF8pHdjwHK48O4JTlWYg7GvLHLobRvHZisl2fKovzOR/DEW8lk
         4ETwiSvjn+QuhGJcOyyuq9I2CDqZSRBu4/eJOZmRZH8spjIK/eblOoEc6y7Nh/1j6nCN
         x/7NusHuKwLF8tUd4+GIqb+CWT/tRi1lqfEJKR4BOcZuM3GIq/B5yC33Nnpid9+Ot31j
         UAbP9eb5KLwnIGZxX3x9LTT/W9FP5ALuN7++ZVUA6u5Gd2RG32a7Cv1/FxvenP14ZWND
         D2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ra0x90+m2YbR9CiFJI6bMTddnxQFtdbQyIws417GrjU=;
        b=rAp2dMeckD9rYkdac41iz8PXWjUmiDnPpWB0zzJ1N/++PlQ8pu21xhAj0ig5yV2C7c
         vwyNjzQBFBxTNmviBIBLdMBTO6UTv2vkqRw3JaO1VqkmuW5xWyHdNb+03B/QdGl91tc2
         loKAbmhQSaoq1YSiRqsBS/awxtgsm78gd4s7H32a4bk0svG0DQKLtaBtuPFo0doCbBQV
         3yILWsQuDgKmTo3jfKyPj3Enk9uoXK2CQkF0guk53arRUHRjahrX72ml3gk7ZV4L313c
         48nNps3pcXHteimQzjPG5huUGcM1Qcx7BqD7l9UGAkYsVCVaIbH2RFsQnLVXOMYaUTbS
         bLhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=t05UptXZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-9.smtp.github.com (out-9.smtp.github.com. [192.30.254.192])
        by gmr-mx.google.com with ESMTPS id b12si2263160pfd.4.2019.08.02.10.21.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 10:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) client-ip=192.30.254.192;
Date: Fri, 02 Aug 2019 10:21:23 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/ce661a-55de04@github.com>
Subject: [siemens/jailhouse] 6adfa0: tools: jailhouse-cell-linux: Simplify
 calculation ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=t05UptXZ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.192 as
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
  Commit: 6adfa0af9d1772a9bfa5d2d3a54bb5263a3596e0
      https://github.com/siemens/jailhouse/commit/6adfa0af9d1772a9bfa5d2d3a54bb5263a3596e0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhouse-cell-linux: Simplify calculation of setup_data

The magic constant "25" makes things hard to read. We can abandon this
constant if we let python's struct do the whole calculation.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ded106d6e583775fb8f9fc704bdfa3181351ac95
      https://github.com/siemens/jailhouse/commit/ded106d6e583775fb8f9fc704bdfa3181351ac95
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhouse-cell-linux: Add support for pio_regions

We will need to parse pio_regions in the future.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5c45b67ebc7dbdeb959a750d52f226fca48d37ae
      https://github.com/siemens/jailhouse/commit/5c45b67ebc7dbdeb959a750d52f226fca48d37ae
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M inmates/tools/x86/linux-loader.c
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  inmates: x86: linux-loader: Enrich setup_data with flags

Reserve 32 bits in the setup_data for additional flags. Soon,
jailhouse-cell-linux will use them to indicate the availability of
platform UARTs.

We extended the features of the setup_data, but didn't change the
semantics of any other field. So increase the number of the
compatibility version.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dee9b4544936cd5c18759c06967f0d52fe147b16
      https://github.com/siemens/jailhouse/commit/dee9b4544936cd5c18759c06967f0d52fe147b16
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhouse-cell-linux: fill the flags

We now have some space for additional flags. We use them to tell Linux
which platform UARTs are available. Linux can use these information to
setup only UARTs that are passed through.

Note that the PIO_RANGEs for UARTs have to be one consecutive
PIO_REGION, e.g. PIO_REGION(0x3f8, 8). Split regions, such as
{ PIO_REGION(0x3f8,4), PIO_REGION(0x3fc, 4) } won't be detected.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 55de0454d880b3094f46f2aecdd4b696a13c7fce
      https://github.com/siemens/jailhouse/commit/55de0454d880b3094f46f2aecdd4b696a13c7fce
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-gcov-extract.c

  Log Message:
  -----------
  tools: gcov: Fix hypervisor image signature check

The header signature field is not zero-terminated. Use memcmp, just like
in the driver.

Fixes: 646233947717 ("tools: new tool to get gcov data out of dirty firmware")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ce661a1b2ea6...55de0454d880

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/ce661a-55de04%40github.com.
