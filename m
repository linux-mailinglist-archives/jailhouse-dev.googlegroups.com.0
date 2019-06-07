Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTFC5DTQKGQEBKR3EJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3e.google.com (mail-yw1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301D384EA
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 09:25:02 +0200 (CEST)
Received: by mail-yw1-xc3e.google.com with SMTP id 77sf1099517ywp.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 00:25:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559892301; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tca/8Zm8/mJSa5zY30PQbpZHUgKSFGH3NnAf3lf66+1VR1C/GyPUyoW8Lk8unBUT+Z
         awS2HyR7bOAogCeANZY78vL0bRtcfuyEHqQlTKKAhsTpqWckl2lBOC9n1r/rAJrb0a1Z
         BKgcfuIk8NCB4d7fczKVItqkbhg8icphIlvV2IvbKXNMazblz6GNE13CyIfk5lRThoh9
         HcnGRZ8ZcNGOVwbvdqY4aKXR8atmfQJGPPjtXIMm3NFPUH8r1QddffsXMX0LjQRjgjfD
         e9IdQt8cWQVT4SWD9GUh1pL1MnqLPww/Qg6t7Zvah+sPWP8EEL0gmkOjNhiWr5ef70TW
         qrag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=58i8Ifgpoia5nYzLC+pKjpg0CBgr3gvCJ4IvE8sdV3Q=;
        b=Cj3HsPc+EuM4LQqteWOHbG8z1kZhpmNqLHBhuDoz7qYRtmKNyDtN0m4sdIDMkpPduL
         CPijkCmq6Hcu9k0wfw3DT5Rwl6JddVcBQpW1MsGsL1tugc1Y/1focLs+vJ9gKPC7Q17o
         2yV9VP6TKQMotUfTHUk75KtBUlyzrjByIajp/PRu8+7MUkdMq70pnVP7+NAfEsc2rRKc
         5qFPGKKetW4tGGBo1z+03EjstWYodOxdu1H20DEf7DLKl43U5czrehVJE1y+jMUDmb7n
         mg/lso3me+yuGqEQnHIwDmiDqQ9HzO7zkh4Tt1lG0ct7VwXwZ5PNvWzRnuE45TNQbDDt
         ouLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pDh+zv+G;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=58i8Ifgpoia5nYzLC+pKjpg0CBgr3gvCJ4IvE8sdV3Q=;
        b=DQp2Xsdr7U7qLV/uJjh2Rfn1zffIzY4Wm1qRfKYtwxTnCaU4jeo5Wv0EAIOnydW5et
         t14xL6CnXaWaxT9w92xcIrd2CO+0H2sNH6wcnSFTiV+qmhGYfQJ5+LhGGPMYEdzzav8s
         HB45FmZma+BjeyI4BCrAF35aVA579OGdKiidmFclmbDMB/0U8qukVWziSuVBN7BWyrtd
         iqhOU56TCUaBH3/TESVgYb9JD1tLXGh0srY7yHqO9YVL5n64f+lPVGpiTUgmGxHA5Dzu
         5lfPCXmetBoCXX8DhiLjrXvGWi2iNLyzahYW3fJdV2zaPFvCkBZXgY7wHnM53PQQJrqc
         bmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=58i8Ifgpoia5nYzLC+pKjpg0CBgr3gvCJ4IvE8sdV3Q=;
        b=Zc8TgL768nEr3cVlSUNvhSjCpQZIV9WftRR5610DzxK863vwecpz5JyfXPQ2gVqXE0
         nlXj8CXbkO/HXCF+NFNmcvuop5Qlwx2/GLV3S555HI3tAmufx8vtBnewLQJ2j5KNbz0+
         kKgDcm8uP3dm9y8CSHrguzBoXmYiemCdzl3TibqF0ivZ3QK5wjqzTYQPCDYKBkfObz5/
         ORS0DF350UwS1rEmGLgtDs/yRwIJsF8VzNXZVRBMtEA046jc33JESJW3G/fOdSylOnRA
         HT8D9fWZqFa/WoVyiazLuowFobTNdGGJAJ6ruB4777gzLISBxDwOjrJW+CPgslrCVZf2
         J0Wg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/khTgQ2EzXRlraF5xEYbttqlplGTxWaAXEkMnYyr7NHSy/JR5
	NvFR/cQgZtNZZsHBxurWgBA=
X-Google-Smtp-Source: APXvYqyeH1qLw4ahJ2ai522Ix9L75wOVUtxfXTaxhKo/KHMdhnCiDJf6r1tIAjokFSGNbHCs0ak+kA==
X-Received: by 2002:a81:8357:: with SMTP id t84mr7331260ywf.109.1559892300923;
        Fri, 07 Jun 2019 00:25:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3b05:: with SMTP id i5ls374762yba.14.gmail; Fri, 07 Jun
 2019 00:25:00 -0700 (PDT)
X-Received: by 2002:a25:2688:: with SMTP id m130mr25394911ybm.370.1559892300496;
        Fri, 07 Jun 2019 00:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559892300; cv=none;
        d=google.com; s=arc-20160816;
        b=I++EKJzm/NG21bMejnynDR99fudvHpMdmQExANnAMjiZ7L1Eg+ZyLAFHnYCoH1Qj5P
         POBbeR5KdHUkV/gdXXep7mqhIexd/SrU36rTuEj1Uq1/xR698p6kDMZa7LEbgxvpUuse
         hffDtiiCavGahq+fzyX5+Q9lMRjFTYJ2lQrlmVdh3CPn6B1LQydCKJyG15SP7LLGa6gZ
         hIV/NleLItGBqs3lO3QU97uXb288oruMytaRwC5iyXM7/QchSI/2cIi0zX7t4mG7TALH
         +RaIz1Mz0RG3yAPH8SF68WIruepcQmkcxeCCHuknTupqRnW65BQ42ahIcRkfh3fySqee
         yBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=5jTar9ShvuppUT8GXApFmuuGGgVACNgbMRJfru8AYqQ=;
        b=je08s8gUUifIAWOisrHMQFW1sv/gF6oarzbsZvhQfm7juh5VbXYRPmWicRen0G7S03
         T8RXlVs+f1PyPUIyubbaGHBbj1ruQVuUB4aEWGIzJWg+VOX0C1PAiYKj+p6l0izi7wxC
         hCdnY0doF2uUlTotqiTUVT90TvcAHKHlSjt+F14xBksge5lrkvcoWpM6RPgtlMxYszZ9
         Wj6DeA/fcK4ELAK7C9K+bvPUVLBXisn2HrWfBFrIe//eIYoV/lY28QorNXfUJTh+empf
         k01/KEA6PG2lzARzKw8ctciCeHIrqlJJ8snAFL3kib9cQzZO+cLeBxSwDWGRSCHPTpsk
         h4nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pDh+zv+G;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id d16si86822ywg.5.2019.06.07.00.25.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 00:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Date: Fri, 07 Jun 2019 00:25:00 -0700
From: Andrej <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/0c3e5e-d07b0d@github.com>
Subject: [siemens/jailhouse] f7604e: x86: vtd: Use proper MMIO_ERROR instead
 of -1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=pDh+zv+G;       spf=pass
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
  Commit: f7604e0b4beda5985aceebe50228c3e14abe4d0b
      https://github.com/siemens/jailhouse/commit/f7604e0b4beda5985aceebe50228c3e14abe4d0b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-06 (Thu, 06 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Use proper MMIO_ERROR instead of -1

No functional change as the value stays the same.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d07b0dcba4837e2f5cc9799d777a32b1ab5f7936
      https://github.com/siemens/jailhouse/commit/d07b0dcba4837e2f5cc9799d777a32b1ab5f7936
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: fix IVDM memory region definition

Second parameter to MemRegion must be its end (inclusive).

Fixes: 5fe206927c05 ("tools: Implement ACPI IVRS table parser")
Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/0c3e5eb67e17...d07b0dcba483

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/0c3e5e-d07b0d%40github.com.
For more options, visit https://groups.google.com/d/optout.
