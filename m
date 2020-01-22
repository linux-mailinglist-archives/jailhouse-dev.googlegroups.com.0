Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBU4JULYQKGQE2NSQVRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2D145AB3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 18:22:29 +0100 (CET)
Received: by mail-qk1-x73a.google.com with SMTP id 24sf4320945qka.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 09:22:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579713748; cv=pass;
        d=google.com; s=arc-20160816;
        b=oZNXxdsYMmWS7BI7nZY+L9ojlbJkXDwGnbyN/5oOyuPblQFUF0/yPA11uGxLXTnKAB
         JoEZw0df7JYxdmJzVuY6R8WpjgY82fO5he6sjeCtYJtVhss1Q28E5+yDiaTYR2+TfnZA
         LQlAlALqb913z13dKdVRbPQx4LlsHwrfJpbJngXYwS8Z1uTeSs5023+WM6haHj3gKAB9
         gPUJsd0OtdvX0jHwqBQI3vRALSsVGvre8Ai2a7PJo2cGFkiuGauS3qbUOChYimQz7wzm
         tSKAzEZcP5trGHBdfkyqnHEqss7yWKkbzSAd8b4Yf9LxZ5IKtPL3KvTkwrmy55JxiFhL
         lrrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=dfdvhi4VrmlNnQUcPjEOuUyDD/VlD7aY/g6sqkdNOSM=;
        b=Q+qvMyJy2OKFNRCq9DzzrA7pXgZkizluaWX+BERRIh4R5hTXx6uV/OyELoQsF5R2UP
         J/bQL6tlMhqTmFC922FZZ+GJkeGNK3IC+C5Cgo9cldEko0V3Hg1PCVNptnIKtlzqRutH
         6xyRlvvfTtz9i/0Q9uNb3PYsZIDig7zJO6teq59LEgf68ih/xnz+nPhnxeS9vo5xUcCj
         yy7rKmO8oyEZjKwJbXoYstKJvE261psU9hxeKTooBAYhC232Wpr8KQRWjR9+Eoj89tnj
         MgsyBb9gNb0nQghodzL9xRDMeOYT3xflDq+7nuX7bCtzefq+++KB8v1/AZ2982L7LAO6
         nGcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=FsBrjtBk;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dfdvhi4VrmlNnQUcPjEOuUyDD/VlD7aY/g6sqkdNOSM=;
        b=GcHYIG6Un4Eo5IWhdhapKdHxQiKvn5MxsUmFr1Ddh+BotVyUeDYCMtEB1O0V6MezQ1
         I+BXqYq3yoNClsPGHuiwYqCl95fFjVrKHEqtN/DxPCwQ2dCP46pA1d0KOo1L7A0RrrTH
         hWgf7LZHkJaYIdmPQS9w6GFbAmvA7I4lEXNUNNwslxMJp8FuTspUID6az3IGK7RdBJz1
         i3a/DQ6Mu3oLQAFX2A3ZkmUxueEAEzWdxKScKy1SVIW8hrmObpvQ+NQmzOmXTgXmeoyZ
         zUpPmw2dU9B7lek9UoGPpJRiwxsXt8jmYrXyMMGqvDxbbUKqiX+3YZwQ77PI6GeoEv8a
         ZD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dfdvhi4VrmlNnQUcPjEOuUyDD/VlD7aY/g6sqkdNOSM=;
        b=IBluw0ScxJrYXe93x4NwF1bBrq7jM+2M9BaKVFFf8quwFBtFj8KejOsBMBVaounwIk
         CsWZ1OXqHUpX1ulC7xZw7oNGCVjUjOv1ljS1fcGP5h+OHxH1YARi1piY8XgcWQsJctpE
         OBBTTBehrdcW0R5N/+g8aNemIjYvonlizq9t5zgH60+0J2slZsosRjlvJ7Yxkvjx+LY/
         SOeiEbdRY+o7+Tsz3V3/G9j4QAb7WFieC2i7dKUl7OekzCj2uhEQt3Mz4p3PQareBNMi
         HpyxbdJsMIReIE4FJ9JgFG3UWtRf3miNcrR0tOBi6QcJ8TTnrF9mDT0Xhp9yWatxZEFn
         SC/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUhAd5cp/83/UdtzJhFu2kDVHmXD5qMHdCaLOVZ5VYcVn8yDpSl
	OYyEkRcBYh3Gs229mBBV/Wg=
X-Google-Smtp-Source: APXvYqyur9EyN7W85H7iHyxlNc4WZ0UMiznfww52uIqB1Q6C9K6WAuUldA/panZ6TgmeRFatRe/7SA==
X-Received: by 2002:a37:2f47:: with SMTP id v68mr11240693qkh.217.1579713747883;
        Wed, 22 Jan 2020 09:22:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:2746:: with SMTP id n67ls2304211qkn.8.gmail; Wed, 22 Jan
 2020 09:22:27 -0800 (PST)
X-Received: by 2002:a05:620a:cce:: with SMTP id b14mr3026142qkj.268.1579713747297;
        Wed, 22 Jan 2020 09:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579713747; cv=none;
        d=google.com; s=arc-20160816;
        b=wsygw5pWXRUc2YPwNKF/qbFlz5ar2lAyvMk2L6qoetTOd78qoRw8ix5Smox1IcKNjj
         Ut+CSA8+pZaxHxtAgyD2woyBP179gu4elXnLelT/0qAj+jdFiSvj/Q3ehDYZCRJBcUGA
         gw2hhazu23yX44FcMj1div49oNv9432I6GczyVJ82tnzxcttkaJXlodsgqjZ04V5/HnN
         oSB1lu90IOYLLnYGeS58DjmMorUv0GivedbrdlZ6ZPj3t061lAhHKz5mgAL18WeamaP6
         r5Bk/b9breGVHcr86PbeXZKFbmb6gmPuC7AKajd2pvFEiPXeWbRFODpYOTGdleWjLxCE
         PEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=mExJvvl2EdPWhzWMiW08m4vY7mJdbMUlKpJ3wAFIyes=;
        b=KxpNbNNnVaCMDoqtqrFWvfY7V826V3nsBPquEe5cfoOF9ILgThDnWmh9UQMU/vo5JL
         kkfxAmslxJIBa7noyfJzlM+0YAMPw/UbQBHqvADCSMotKNV3E6hPEKNJl3paoE9VYGt6
         lAIacfjbWmTWyQIsJketQF/V/6NC3ZVPr16TTem1hOQZRavx8uY/pW4W11o5JSP2qbKW
         uyhclGEHPQiyL07IG0HVd1O2xs0XdLrwxapfnX88MJzmjdjCJEXEcSmvN4EhyOdOHAA6
         TmcKq5R/py+JQF5eKfRqq0fi0Nkqr+oCNdwww9CiCitS45Y+xkmGlsWR4TE1QwECLoLK
         XpRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=FsBrjtBk;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id c19si183946qtk.5.2020.01.22.09.22.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jan 2020 09:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Date: Wed, 22 Jan 2020 09:22:27 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/3954ce-f64e71@github.com>
Subject: [siemens/jailhouse] f64e71: core: Introduce
 JAILHOUSE_MEM_NO_HUGEPAGES memory ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=FsBrjtBk;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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
  Commit: f64e719b01d6cd526b748742d5e7b96f6749027a
      https://github.com/siemens/jailhouse/commit/f64e719b01d6cd526b748742d5e7b96f6749027a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-22 (Wed, 22 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/paging.c
    M hypervisor/setup.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory region flag

This allows to mitigate CVE-2018-12207: On affected Intel machines, a
guest can trigger an unrecoverable machine check exception when running
a certain code pattern on an executable huge page. The suggested
mitigation pattern of Intel involves on-demand break-up of huge pages
when the guest tries to execute on them and also consolidating them into
non-executable huge pages dynamically. This pattern is not compatible
with the static and deterministic behavior of Jailhouse.

Therefore, this introduces a memory region flag to exclude huge page
mappings for a region. System configurators can use this flag for
executable regions on affected CPUs, while still allowing huge pages for
non-executable regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/3954ce-f64e71%40github.com.
